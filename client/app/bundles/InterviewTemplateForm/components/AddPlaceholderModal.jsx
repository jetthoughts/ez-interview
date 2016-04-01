import React, { PropTypes } from 'react';
import _ from 'lodash';
import { Modal, Input, Button } from 'react-bootstrap';

export default class AddPlaceholderModal extends React.Component {
    static difficulties = ['low', 'medium', 'high']
    static categoriesUrl = '/categories'
    
    static propTypes = {
        showModal: PropTypes.bool.isRequired,
        close: PropTypes.func.isRequired,
        addPlaceholder: PropTypes.func.isRequired
    };

    constructor(props, context) {
        super(props, context);

        this.state = {loading: true, selectedCategory: null, selectedDifficulty: null,  categories: []};

        _.bindAll(this,
            'loadCategoriesFromServer', 
            'componentDidMount', 
            'handleCategoryChange',
            'handleDifficultyChange', 
            'handleAdd');
    }

    loadCategoriesFromServer() {
        $.ajax({
            url: AddPlaceholderModal.categoriesUrl,
            dataType: 'json',
            success: (data) => {
                this.setState({loading: false, categories: data.categories})
            },
            error: (xhr, status, err) => {
                console.error(AddPlaceholderModal.categoriesUrl, status, err.toString());
            }
        })
    }

    componentDidMount() {
        this.loadCategoriesFromServer();
    }

    handleCategoryChange (e){
        const id = e.target.value;
        const category = this.state.categories.find((category) => category.id == id)

        this.setState({selectedCategory: category.name});
    }

    handleDifficultyChange(e){
        const value = e.target.value;
        this.setState({selectedDifficulty: value});
    }
    
    handleAdd(e) {
        this.props.addPlaceholder(e, {category: this.state.selectedCategory, 
                                      difficulty: this.state.selectedDifficulty})
    }

    render() {
        var modalContent = null;
        
        if(this.state.loading) {
            modalContent = (
                <div>Loading...</div>
            )
        } else {
            var categoryOptions = [(<option></option>)];
            this.state.categories.forEach(function (category) {
                categoryOptions.push(<option value={category.id}>{category.name}</option>);
            });
            
            var difficultyOptions = [(<option></option>)];
            AddPlaceholderModal.difficulties.forEach(function (difficulty) {
               difficultyOptions.push(<option value={difficulty}>{difficulty}</option>) 
            });
            modalContent = (
                <div>
                    <Input onChange={this.handleCategoryChange}
                           type="select"
                           label="Category"
                           placeholder="Select Category">
                        {categoryOptions}
                    </Input>
                    <Input onChange={this.handleDifficultyChange}
                           type="select"
                           label="Difficulty"
                           placeholder="Select Difficulty">
                        {difficultyOptions}
                    </Input>
                </div>
            )
        }

        const buttonEnabled = this.state.selectedCategory != null && this.state.selectedDifficulty != null;
        return (
            <Modal show={this.props.showModal} onHide={this.props.close}>
                <Modal.Header closeButton>
                    <Modal.Title>Add Placeholder</Modal.Title>
                </Modal.Header>
                <Modal.Body>
                    {modalContent}
                </Modal.Body>
                <Modal.Footer>
                    <Button disabled={!buttonEnabled} onClick={this.handleAdd}>Add</Button>
                </Modal.Footer>
            </Modal>
        );
    }
}
