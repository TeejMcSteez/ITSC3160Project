#!/usr/bin/env python3
"""
Generate a relational‐schema diagram (in BCNF) for the OAuth Database
using graphviz.
"""

from graphviz import Digraph

def make_relational_schema(output_filename='oauth_relational_schema', fmt='png'):
    dot = Digraph('RelSchema', filename=output_filename, format=fmt)
    dot.attr(rankdir='LR', splines='ortho', concentrate='true')
    dot.attr('node', shape='record', fontsize='10')

    # ADMIN table in BCNF
    dot.node('ADMIN',
        '''<
        <TABLE BORDER="0" CELLBORDER="1" CELLSPACING="0">
          <TR><TD BGCOLOR="lightgray" COLSPAN="2"><B>ADMIN</B> (BCNF)</TD></TR>
          <TR><TD ALIGN="left"><U>ID</U> : INT (PK)</TD></TR>
          <TR><TD ALIGN="left">ENTITY_ID : VARCHAR(255) [UNIQUE]</TD></TR>
          <TR><TD ALIGN="left">MASTER_TOKEN : VARCHAR(255) [UNIQUE]</TD></TR>
        </TABLE>
        >''')

    # USERS table in BCNF
    dot.node('USERS',
        '''<
        <TABLE BORDER="0" CELLBORDER="1" CELLSPACING="0">
          <TR><TD BGCOLOR="lightgray" COLSPAN="2"><B>USERS</B> (BCNF)</TD></TR>
          <TR><TD ALIGN="left"><U>CLIENT_ID</U> : VARCHAR(255) (PK)</TD></TR>
          <TR><TD ALIGN="left">ACCESS_TOKEN : VARCHAR(255)</TD></TR>
          <TR><TD ALIGN="left">ROLE : TEXT</TD></TR>
          <TR><TD ALIGN="left">EXPIRY : TIMESTAMP</TD></TR>
          <TR><TD ALIGN="left">CREATED_AT : TIMESTAMP DEFAULT NOW()</TD></TR>
          <TR><TD ALIGN="left">ADMIN_ID : INT (FK → ADMIN.ID)</TD></TR>
        </TABLE>
        >''')

    # Draw the one-to-many relationship
    dot.edge('ADMIN', 'USERS',
             label='1 — n',
             arrowhead='crow',   # crow's foot at USERS end
             arrowtail='none',
             dir='both')         # line at ADMIN end

    dot.render(cleanup=True)
    print(f"Relational schema diagram written to {output_filename}.{fmt}")

if __name__ == '__main__':
    make_relational_schema()
