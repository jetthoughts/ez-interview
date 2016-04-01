import React, { PropTypes } from 'react';
import _ from 'lodash';
import { Input } from 'react-bootstrap';

export default class NameField extends React.Component {
  static propTypes = {
    name: PropTypes.string.isRequired,
    updateName: PropTypes.func.isRequired,
  };

  constructor(props, context) {
    super(props, context);

    _.bindAll(this, 'handleNameChange');
  }

  handleNameChange(e) {
    const name = e.target.value;
    this.props.updateName(name);
  }

  render() {
    const { name } = this.props;
    return (
            <Input
              type="text"
              labelClassName=""
              wrapperClassName=""
              label="Name"
              value={name}
              onChange={this.handleNameChange}
            />
    );
  }
}
