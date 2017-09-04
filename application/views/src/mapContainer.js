import React from "react";
import {
    withGoogleMap,
    GoogleMap,
    Marker,
    InfoWindow,
} from "react-google-maps";
import Helmet from "react-helmet";

const MapInit = withGoogleMap(props => (
    <GoogleMap
        ref={props.onMapLoad}
        defaultZoom={13}
        defaultCenter={{ lat: -7.12289, lng: -34.8390452 }}
        onClick={props.onMapClick}
    >
    </GoogleMap>
));

class MapContainer extends React.Component {
    constructor(props) {
        super(props);
        this.state = {
            markers: [{}],
        };
    }
    handleMapLoad = this.handleMapLoad.bind(this);
    handleMapClick = this.handleMapClick.bind(this);
    handleMapLoad(map) {
        this._mapComponent = map;
        if (map) {
            console.log(map.getZoom());
        }
    }
    handleMapClick(event) {
        const nextMarkers = [
                ...this.state.markers,
            {
                position: {
                    lat: [event.latLng.lat()],
                    lng: [event.latLng.lng()],
                },
                defaultAnimation: 2,
                key: 'aaa',
            },
        ];
        this.setState({
            markers: nextMarkers,
        });
    }
    render() {
        return (
            <div style={{height: `100%`}}>
                <MapInit
                    containerElement={
                        <div style={{ height: `100%` }} />
                    }
                    mapElement={
                        <div style={{ height: `100%` }} />
                    }
                    onMapLoad={this.handleMapLoad}
                    onMapClick={this.handleMapClick}
                    markers={this.state.markers}
                    onMarkerRightClick={this.handleMarkerRightClick}
                />
            </div>
        );
    }
}

export default MapContainer;