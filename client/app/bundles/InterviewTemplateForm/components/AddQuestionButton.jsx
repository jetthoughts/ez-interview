// HelloWorldWidget is an arbitrary name for any "dumb" component. We do not recommend suffixing
// all your dump component names with Widget.

import React, {PropTypes} from 'react';
import _ from 'lodash';
import {DropdownButton, MenuItem} from 'react-bootstrap';
import AddQuestionModal from './AddQuestionModal';


// Simple example of a React "dumb" component
export default class AddQuestionButton extends React.Component {
    static propTypes = {
        // If you have lots of data or action properties, you should consider grouping them by
        // passing two properties: "data" and "actions".
    };

    constructor(props, context) {
        super(props, context);

        this.state = {modalShown: 'None'};
        // Uses lodash to bind all methods to the context of the object instance, otherwise
        // the methods defined here would not refer to the component's class, not the component
        // instance itself.
        _.bindAll(this, 'handleAddSelected', 'handleAddQuestion', 'handleCloseModal');
    }

    handleAddSelected(e, eventKey) {
        this.setState({modalShown: eventKey});
    }
    
    handleAddQuestion() {
    }
    
    handleCloseModal () {
        this.setState({modalShown: 'None'});
    }

    render() {
        const showAddQuestionModal = this.state.modalShown == 'Question';
        return (
            <div>
                <DropdownButton title="Add" onSelect={this.handleAddSelected}>
                    <MenuItem eventKey="Question">Add question</MenuItem>
                    <MenuItem eventKey="Placeholder">Add placeholder</MenuItem>
                </DropdownButton>
                <AddQuestionModal showModal={showAddQuestionModal} 
                                  addQuestion={ this.handleAddQuestion } 
                                  close={ this.handleCloseModal } />
            </div>
        );
    }
}
