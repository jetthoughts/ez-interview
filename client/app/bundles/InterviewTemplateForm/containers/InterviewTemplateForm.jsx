import React, {PropTypes} from 'react';
import {Table} from 'react-bootstrap';
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

        // How to set initial state in ES6 class syntax
        // https://facebook.github.io/react/docs/reusable-components.html#es6-classes
        this.state = {name: '', templateQuestions: []};

        // Uses lodash to bind all methods to the context of the object instance, otherwise
        // the methods defined here would not refer to the component's class, not the component
        // instance itself.
        _.bindAll(this, 'updateName', 'handleAddQuestion');
    }

    updateName(name) {
        this.setState({name});
    }

    handleAddQuestion(question) {
        this.setState((state) => {
            templateQuestions: state.templateQuestions.push(question)
        });
    }

    render() {
        var questionRows = [];
        this.state.templateQuestions.forEach(function (question) {
            if (question.id) {
                questionRows.push(
                    <tr>
                        <td>{question.title}</td>
                        <td>{question.category}</td>
                        <td>{question.difficulty}</td>
                    </tr>
                )
            } else {
                questionRows.push(
                    <tr>
                        <td>Any question</td>
                        <td>{question.category}</td>
                        <td>{question.difficulty}</td>
                    </tr>
                )
            }
        });
        var questionsTable = null;

        if (questionRows.length > 0) {
            questionsTable = (
                <Table>
                    <thead>
                    <tr>
                        <th>Name</th>
                        <th>Category</th>
                        <th>Difficulty</th>
                    </tr>
                    </thead>
                    <tbody>
                    {questionRows}
                    </tbody>
                </Table>
            )
        }

        return (
            <div>
                <div className="container">
                    <form className="form">
                        <NameField name={this.state.name}
                                   updateName={this.updateName}/>
                        {questionsTable}
                        <AddQuestionButton addQuestion={this.handleAddQuestion}/>
                    </form>
                </div>
            </div>
        );
    }
}
