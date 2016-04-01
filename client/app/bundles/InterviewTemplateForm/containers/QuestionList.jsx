import React, {PropTypes} from 'react';
import _ from 'lodash';
import {Table} from 'react-bootstrap';
import QuestionRow from '../components/QuestionRow'

// Simple example of a React "dumb" component
export default class QuestionList extends React.Component {
    static propTypes = {
        url: PropTypes.string.isRequired,
        selectQuestion: PropTypes.func.isRequired,
    };

    constructor(props, context) {
        super(props, context);

        this.state = {loading: true, questions: []};

        // Uses lodash to bind all methods to the context of the object instance, otherwise
        // the methods defined here would not refer to the component's class, not the component
        // instance itself.
        _.bindAll(this, 'loadQuestionsFromServer', 'componentDidMount');
    }

    loadQuestionsFromServer() {
        $.ajax({
            url: this.props.url,
            dataType: 'json',
            success: (data) => {
                this.setState({loading: false, questions: data.questions})
            },
            error: (xhr, status, err) => {
                console.error(this.props.url, status, err.toString());
            }
        })
    }

    componentDidMount() {
        this.loadQuestionsFromServer();
    }

    render() {
        if (this.state.loading) {
            return (<div>Loading...</div>);
        } else {
            var rows = [];
            const selectQuestion = this.props.selectQuestion;
            this.state.questions.forEach(function (question) {
                rows.push(<QuestionRow key={question.id} question={question} click={selectQuestion}/>)
            });

            return (
                <Table>
                    <thead>
                        <tr>
                            <th>Name</th>
                            <th>Category</th>
                            <th>Difficulty</th>
                        </tr>
                    </thead>
                    <tbody>
                        { rows }
                    </tbody>
                </Table>
            );
        }
    }
}
