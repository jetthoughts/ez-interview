import React, {PropTypes} from 'react';
import _ from 'lodash';
import {DropdownButton, MenuItem} from 'react-bootstrap';
import AddQuestionModal from './AddQuestionModal';
import AddPlaceholderModal from './AddPlaceholderModal';

export default class AddQuestionButton extends React.Component {
    static propTypes = {
        addQuestion: PropTypes.func.isRequired
    };

    constructor(props, context) {
        super(props, context);

        this.state = {modalShown: 'None'};

        _.bindAll(this, 'handleAddSelected', 'handleAddQuestion', 'handleAddPlaceholder', 'handleCloseModal');
    }

    handleAddSelected(e, eventKey) {
        this.setState({modalShown: eventKey});
    }
    
    handleAddQuestion(e, question) {
        this.handleCloseModal();
        this.props.addQuestion(question);
    }

    handleAddPlaceholder(e, placeholder) {
        this.handleCloseModal();
        this.props.addQuestion(placeholder);
    }
    
    handleCloseModal () {
        this.setState({modalShown: 'None'});
    }

    render() {
        const showAddQuestionModal = this.state.modalShown == 'Question';
        const showAddPlaceholderModal = this.state.modalShown == 'Placeholder';
        return (
            <div>
                <DropdownButton title="Add" onSelect={this.handleAddSelected}>
                    <MenuItem eventKey="Question">Add question</MenuItem>
                    <MenuItem eventKey="Placeholder">Add placeholder</MenuItem>
                </DropdownButton>
                <AddQuestionModal showModal={showAddQuestionModal}
                                  addQuestion={ this.handleAddQuestion }
                                  close={ this.handleCloseModal } />
                <AddPlaceholderModal showModal={showAddPlaceholderModal}
                                     addPlaceholder={ this.handleAddPlaceholder }
                                     close={ this.handleCloseModal } />
            </div>
        );
    }
}
