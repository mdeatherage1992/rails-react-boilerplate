/**
 * @file TimestampProvider component.
 */

import React, { PureComponent } from 'react';
import PropTypes from 'prop-types';
import axios from 'axios';

import getLogger from '../utils/logger';

const log = getLogger('ModelContext');

export const ModelContext = React.createContext({
  model: null,
  fetchModels: () => {},
});

export default class ModelProvider extends PureComponent {
  static propTypes = {
    children: PropTypes.node,
  };

  state = {
    // eslint-disable-next-line react/no-unused-state
    model: null,
    // eslint-disable-next-line react/no-unused-state
    fetchModels: () => this.fetchModels(),
  };

  fetchModels = async () => {
    try {
      const res = await axios.get('http://www.localhost:3000/api/strains');

      this.setState(() => ({
        models: res,
      }));
    } catch (error) {
      log.error(error);
    }
  };

  render() {
    const { children } = this.props;

    return (
      <ModelContext.Provider value={this.state}>
        {children}
      </ModelContext.Provider>
    );
  }
}
