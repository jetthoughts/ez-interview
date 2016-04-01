import React, { PropTypes } from 'react';
import NameField from '../components/NameField';
import AddQuestionButton from '../components/AddQuestionButton';
import _ from 'lodash';

// Simple example of a React "smart" component
export default class InterviewTemplateForm extends React.Component {
  static propTypes = {
    name: PropTypes.string.isRequired, // this is passed from the Rails view
    templateQuestions: PropTypes.array.isRequired, // this is passed from the Rails view
  };

  constructor(props, context) {
    super(props, context);

    // How to set initial state in ES6 class syntax
    // https://facebook.github.io/react/docs/reusable-components.html#es6-classes
    this.state = { name: '', templateQuestions: [] };

    // Uses lodash to bind all methods to the context of the object instance, otherwise
    // the methods defined here would not refer to the component's class, not the component
    // instance itself.
    _.bindAll(this, 'updateName');
  }

  updateName(name) {
    this.setState({ name });
  }

  render() {
    return (
      <div>
        <div className="container">
          <form className="form">
            <NameField name={this.state.name}
                       updateName={this.updateName} />
            <AddQuestionButton />
          </form>
        </div>
      </div>
    );
  }
}
