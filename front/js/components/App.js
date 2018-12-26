import React, { Component } from 'react';
import { BrowserRouter as Router, Route } from 'react-router-dom';
import TimestampProvider from './TimestampProvider';
import Timestamp from './Timestamp';
import ModelProvider from './DataProvider';
import Data from './data';
import EnhancedTable from './Grid';
import NavBar from './NavBar';
import Strains from './Strains';
import Batches from './Batches';
import NewComp from './newComp';
import NewStrain from './NewStrain';
import NewBatch from './NewBatch'

class App extends Component {

  constructor(){
    super();
    this.state = {
      data:[]
    }
  }

  handleResponse(response) {
    let legend = document.getElementById("ed")
    let item;
    for(let i = 0; i < response.length; i++) {
      let node;
      item = response[i];
      node = document.CreatElement("LI")
      node.appendChild(item)
      legend.appendChild(node)
    }
    return legend;
  }

  fetchModels() {
    const list = [];
    fetch('http://localhost:3000/api/strains')
      .then(response => response.json())
      .then(response => {return this.handleResponse(response)})
  };

  render(){
  return (
    <div className="app">
    <div>
    <Router>
    <div>
    <NavBar />
    <Route exact path="/" />
    <Route exact path="/strains" component= {Strains} />
    <Route exact path="/batches" component= {Batches} />
    <Route exact path='/strains/create'component={NewStrain}/>
    <Route exact path='/batches/create'component={NewBatch}/>
    </div>
    </Router>
    </div>
    <div className="starter">
      <h1>Hello Ghost!</h1>
      </div>
      <div className="starter">
        <h1>Hello Ghost!</h1>
        <a href="/strains/1/batches">click for Batches</a>
        <button onClick={this.fetchModels} type="submit">Click Me</button>
        </div>
      <div className="ed-div">
      <ul id="ed">
      </ul>
      </div>
    </div>
      );
    };
  }

export default App;
