/**
 * @file Timestamp component.
 */

import React from 'react';

import { ModelContext } from './DataProvider';

export default class Data extends React.Component {

  constructor(){
  super();
  this.state = {
    data: []
    }
}

  componentDidMount() {
    this.fetchModels();
  }

  fetchModels() {
      fetch('http://localhost:3000/api/strains')
      .then(response => response.json())
      .then(response => {
        this.setState({data:response})
      })
  };


  render() {
    return (
      <>
        <p>Models: {this.state.data}</p>
        <button type="submit" onClick={this.fetchModels}>
          Reload Timestamp
        </button>
      </>
    );
  }
}
