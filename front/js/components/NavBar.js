import React, { Component } from 'react';
import { Navbar, Nav, NavItem } from 'react-bootstrap';
import { Link } from 'react-router-dom';


export default class NavBar extends Component {
render() {
return (
  <Navbar default collapseOnSelect>
  <Navbar.Header>
    <Navbar.Brand>
    <Link to="/">Canna Store</Link>
      </Navbar.Brand>
      <Navbar.Toggle />
    </Navbar.Header>
    <Navbar.Collapse>
    <Nav pullRight>
      <NavItem eventKey={1} componentClass={Link} href="/" to="/">
      Home
      </NavItem>
      <NavItem eventKey={2} componentClass={Link} href="/strains" to="/strains">
      Strains
      </NavItem>
      <NavItem eventKey={3} componentClass={Link} href="/strains/:strain_id/batches" to="/strains/:strain_id/batches">
      Batches
      </NavItem>
      <NavItem eventKey={4} componentClass={Link} href="/strain/new" to="/strains/new">
      New Strain
      </NavItem>
      <NavItem eventKey={5} componentClass={Link} href="/batches/new" to="/strains/:strain_id/batches/new">
      New Batch
      </NavItem>


      </Nav>
    </Navbar.Collapse>
  </Navbar>
    )
  }
}
