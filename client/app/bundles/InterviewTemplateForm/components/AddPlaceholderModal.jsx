import React, { PropTypes } from 'react';
import _ from 'lodash';
import { Modal, Button } from 'react-bootstrap';

export default class AddPlaceholderModal extends React.Component {
    static propTypes = {
        showModal: PropTypes.bool.isRequired,
        close: PropTypes.func.isRequired,
        addPlaceholder: PropTypes.func.isRequired
    };

    constructor(props, context) {
        super(props, context);
    }

    render() {
        return (
            <Modal show={this.props.showModal} onHide={this.props.close}>
                <Modal.Header closeButton>
                    <Modal.Title>Add Placeholder</Modal.Title>
                </Modal.Header>
                <Modal.Body>


                </Modal.Body>
                <Modal.Footer>
                    <Button onClick={this.props.close}>Close</Button>
                </Modal.Footer>
            </Modal>
        );
    }
}
