import React, { PropTypes } from 'react';
import NameField from '../components/NameField';
import AddQuestionButton from '../components/AddQuestionButton';
import _ from 'lodash';

export default class InterviewTemplateForm extends React.Component {
  static propTypes = {
    name: PropTypes.string.isRequired, // this is passed from the Rails view
    templateQuestions: PropTypes.array.isRequired, // this is passed from the Rails view
  };

  constructor(props, context) {
    super(props, context);

    this.state = { name: '', templateQuestions: [] };

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
