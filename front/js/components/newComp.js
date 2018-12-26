import React, { PureComponent } from 'react';
import PropTypes from 'prop-types';
import axios from 'axios';

import getLogger from '../utils/logger';

const log = getLogger('NewCompContext');

export const NewCompContext = React.createContext({
  timestamp: null,
  data: () => {},
});

export default class NewComp extends PureComponent {
  static propTypes = {
    children: PropTypes.node,
  };

  state = {
    // eslint-disable-next-line react/no-unused-state
    timestamp: null,
    // eslint-disable-next-line react/no-unused-state
    data: () => this.data(),
  };

  data = async () => {
    try {
      const res = await axios.get('/strains');

      this.setState(() => ({
        data: res.data,
      }));
    } catch (error) {
      log.error(error);
    }
  };

  render() {
    const { children } = this.props;

    return (
      <NewCompContext.Provider value={this.state}>
        {children}
      </NewCompContext.Provider>
    );
  }
}
