import QtQuick 2.10
import QtQuick.Window 2.10
import QtQuick.Templates 2.3
import QtQuick.Controls 2.3
import Qt3D.Input 2.1

Window {
    id: window
    visible: true
    width: 640
    height: 480
    color: "#000000"
    title: qsTr("Hello World")





    Item {
        id: startMenu
        x: 0
        y: 0
        width: 640
        height: 480

        Button {
            id: quitButton
            x: 270
            y: 275
            text: qsTr("Quit")
            z: 3
        }

        Button {
            id: startButton
            x: 270
            y: 176
            text: qsTr("Start Game")
            z: 3
            highlighted: false
        }
    }

    Item {
        id: shipSelection
        width: 200
        height: 200
    }

    Item {
        id: shipPlacment
        width: 200
        height: 200
    }

    Connections {
        target: startButton
        onClicked: print("Start")
    }

    Connections {
        target: quitButton
        onClicked: print("clicked")
    }




}
