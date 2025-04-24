#!/usr/bin/env python3
"""
Generate an ER diagram for the OAuth Database Project
using the graphviz Python package.
"""

from graphviz import Digraph

def make_er_diagram(output_filename='oauth_er_diagram', fmt='png'):
    # Create a new directed graph; use 'ER' rankdir for left-to-right layout
    er = Digraph('ER', filename=output_filename, format=fmt)
    er.attr(rankdir='LR', splines='ortho', concentrate='true')

    # Define styles for entities and relationships
    er.attr('node', shape='record', fontsize='10')

    # ADMIN entity
    er.node('ADMIN', 
            '''<
            <TABLE BORDER="0" CELLBORDER="1" CELLSPACING="0">
              <TR><TD BGCOLOR="lightgray" COLSPAN="2"><B>ADMIN</B></TD></TR>
              <TR><TD ALIGN="left">ID (PK, INT)</TD></TR>
              <TR><TD ALIGN="left">ENTITY_ID (VARCHAR, UNIQUE)</TD></TR>
              <TR><TD ALIGN="left">MASTER_TOKEN (VARCHAR, UNIQUE)</TD></TR>
            </TABLE>
            >''')

    # USERS entity
    er.node('USERS',
            '''<
            <TABLE BORDER="0" CELLBORDER="1" CELLSPACING="0">
              <TR><TD BGCOLOR="lightgray" COLSPAN="2"><B>USERS</B></TD></TR>
              <TR><TD ALIGN="left">CLIENT_ID (PK, VARCHAR)</TD></TR>
              <TR><TD ALIGN="left">ACCESS_TOKEN (VARCHAR)</TD></TR>
              <TR><TD ALIGN="left">ROLE (TEXT)</TD></TR>
              <TR><TD ALIGN="left">EXPIRY (TIMESTAMP)</TD></TR>
              <TR><TD ALIGN="left">CREATED_AT (TIMESTAMP)</TD></TR>
              <TR><TD ALIGN="left">ADMIN_ID (FK → ADMIN.ID)</TD></TR>
            </TABLE>
            >''')

    # Relationship: ADMIN 1—* USERS
    er.edge('ADMIN', 'USERS', 
            label='manages', 
            arrowhead='crow',  # crow’s foot for many
            arrowtail='none',  # simple line at the one end
            dir='both')        # bidirectional arrow for ER notation

    # Render the diagram to file
    er.render(cleanup=True)
    print(f"ER diagram written to {output_filename}.{fmt}")

if __name__ == '__main__':
    make_er_diagram()
