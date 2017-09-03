/**
 * Created by Arthur on 01/09/2017.
 */
import React from 'react';

class Square extends React.Component {
    constructor() {
        super();
        this.state = {
            value: null,
        };
    }
    testState() {
        if(this.state.value === 'X'){
            this.setState({value:null});
        }
    }
    render() {
        return (
            <button className="square" onClick={() => this.props.onClick()}>
                {this.props.value}
            </button>
        );
    }
}

export default Square;