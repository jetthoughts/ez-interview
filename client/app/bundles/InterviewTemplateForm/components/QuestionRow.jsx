import React, {PropTypes} from 'react';

export default class QuestionRow extends React.Component {
    static propTypes = {
        question: PropTypes.object.isRequired,
        click: PropTypes.func.isRequired,
    };

    constructor(props, context) {
        super(props, context);

        _.bindAll(this, 'wrapClickHandler');
    }
    
    wrapClickHandler(question) {
        return (e) => {
            this.props.click(e, question)
        }
    }

    render() {
        const question = this.props.question;
        return (
            <tr onClick={this.wrapClickHandler(question)}>
                <td>{question.title}</td>
                <td>{question.category}</td>
                <td>{question.difficulty}</td>
            </tr>
        )
    }
}
