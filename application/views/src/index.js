/**
 * Created by Arthur on 01/09/2017.
 */
import React from 'react';
import ReactDOM from 'react-dom';
import './index.css';
import Board from './board.js';
import Map from './mapContainer.js';

class Game extends React.Component {
    render() {
        return (
            <div className="game">
                <div className="map">
                    <Map/>
                </div>
                <div className="game-info">
                    <div>{/* status */}</div>
                    <ol>{/* TODO */}</ol>
                </div>
            </div>
        );
    }
}

// ========================================

ReactDOM.render(
    <Game />,
    document.getElementById('container')
);
