import QtQuick 2.3
import QtQuick.Controls 1.2
import "utils" as Utils
import st.app 1.0 as AppStreet
// http://localhost/vg/test.json

Utils.BaseWindow {
    id: superRoot
    property int screenWidth : 750
    property int screenHeight : 1334
    visible: true
    width: screenWidth / 2
    height: screenHeight / 2


    AppStreet.Location {
        id: _Location
    }

    Utils.Platform {
        id: __Platform
        Connections {
            target: __Platform.item ?
                        __Platform.item
                      : null
            ignoreUnknownSignals: true
        }
        Component.onCompleted: {
            call('setStatusBarStyleDefault')
        }
    }

    Loader {
        id: _Loader
        width: parent.width*2
        height: parent.height*2
        anchors.left: parent.left;
        anchors.top: parent.top
        Scale {
            id: _Scale_iOS
            xScale: 0.5; yScale: 0.5
            origin.x: 0; origin.y: 0
        }
        state: "scaled"
        states: [
            State {
                name: "scaled"
                PropertyChanges {
                    target: _Loader
                    transform: _Scale_iOS
                }
            }
        ]
        source: "home.qml"
    }
}
