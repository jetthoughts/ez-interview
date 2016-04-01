import React, { PropTypes } from 'react';
import _ from 'lodash';
import { Modal, Button } from 'react-bootstrap';
import QuestionList from '../containers/QuestionList';

export default class AddQuestionModal extends React.Component {
    static propTypes = {
        showModal: PropTypes.bool.isRequired,
        close: PropTypes.func.isRequired,
        addQuestion: PropTypes.func.isRequired
    };

    constructor(props, context) {
        super(props, context);
    }

    render() {
        return (
            <Modal show={this.props.showModal} onHide={this.props.close}>
                <Modal.Header closeButton>
                    <Modal.Title>Add Question</Modal.Title>
                </Modal.Header>
                <Modal.Body>
                    <QuestionList url="/questions"
                                  selectQuestion={this.props.addQuestion}/>
                </Modal.Body>
                <Modal.Footer>
                    <Button onClick={this.props.close}>Close</Button>
                </Modal.Footer>
            </Modal>
        );
    }
}
