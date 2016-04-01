import React, { PropTypes } from 'react';
import _ from 'lodash';
import { Modal, Button } from 'react-bootstrap';

// Simple example of a React "dumb" component
export default class QuestionList extends React.Component {
    static propTypes = {
        url: PropTypes.string.isRequired,
        selectQuestion: PropTypes.func.isRequired,
    };

    constructor(props, context) {
        super(props, context);
        
        this.state = { loading: true, questions: [] };

        // Uses lodash to bind all methods to the context of the object instance, otherwise
        // the methods defined here would not refer to the component's class, not the component
        // instance itself.
        _.bindAll(this, 'loadQuestionsFromServer', 'componentDidMount');
    }
    
    loadQuestionsFromServer() {
        $.ajax({
            this.props.url,
            
        })
    }

    componentDidMount() {
        this.loadQuestionsFromServer();
    }
    
    render() {
        return (
            <Modal show={this.props.showModal} onHide={this.props.close}>
                <Modal.Header closeButton>
                    <Modal.Title>Add Question</Modal.Title>
                </Modal.Header>
                <Modal.Body>
                    <h4>Text in a modal</h4>
                    <p>Duis mollis, est non commodo luctus, nisi erat porttitor ligula.</p>
                </Modal.Body>
                <Modal.Footer>
                    <Button onClick={this.props.close}>Close</Button>
                </Modal.Footer>
            </Modal>
        );
    }
}
