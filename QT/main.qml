import QtQuick 2.10
import QtQuick.Window 2.10
import QtQuick.Templates 2.3
import QtQuick.Controls 2.3
import QtQuick.Controls.Universal 2.0
import QtQuick.Extras 1.4
import QtQuick.Layouts 1.3


Window {

    id: mainDisplay
    visible: true
    width: 640
    height: 480
    color: "#000000"
    title: qsTr("Battleship")
    property variant playerOneShips: []
    property variant playerTwoShips: []
    property int playerOneShipsLength: 0
    property int playerTwoShipsLength: 0

    Item {
        id: startMenu
        x: 0
        y: 0
        width: 640
        height: 480
        visible: true
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.verticalCenter: parent.verticalCenter
        Column {
            id: column
            x: 270
            y: 175
            width: 100
            height: 130
            anchors.horizontalCenter: parent.horizontalCenter
            anchors.verticalCenter: parent.verticalCenter
            spacing: 50

            Button {
                id: startButton
                text: qsTr("Start Game")
                z: 3
                highlighted: false
            }

            Button {
                id: quitButton
                text: qsTr("Quit")
                z: 3
            }
        }
    }
    //StartMenu Button Events
    Connections {
        target: startButton
        onClicked: {
            startMenu.visible = false;
            shipSelectionPlayer1.visible = true;
        }
    }
    Connections {
        target: quitButton
        onClicked: Qt.quit()
    }

    Item {
        id: shipSelectionPlayer1
        x: 27
        y: 37
        width: 587
        height: 406
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.verticalCenter: parent.verticalCenter
        visible: false

        Rectangle {
            id: shipTypeBounds
            x: 31
            y: 20
            width: 218
            height: 352
            color: "#0b4711"
            z: -1
        }

        Text {
            id: shipTypeT
            x: 82
            y: 21
            color: "#ffffff"
            text: qsTr("Ship Type")
            font.pixelSize: 27
        }

        Gauge {
            id: pointsUsed
            x: 494
            y: 20
            width: 39
            height: 352
            value: battleshipSpinBox.value*5+destroyerSpinBox.value*3+crusierSpinBox.value*2+subSpinBox.value*5+carrierSpinBox.value*4
            maximumValue: 25
        }

        Row {
            id: rowBounds
            x: 41
            y: 66
            width: 492
            height: 340
            spacing: 20

            Column {
                id: shipTypeColBounds
                width: 200
                height: 400
                spacing: 20

                Rectangle {
                    id: rectangle
                    width: 200
                    height: 42
                    color: "#ffffff"

                    Text {
                        id: text1
                        x: 50
                        y: 7
                        text: qsTr("Battleship")
                        horizontalAlignment: Text.AlignHCenter
                        font.pixelSize: 23
                    }
                }

                Rectangle {
                    id: rectangle1
                    width: 200
                    height: 42
                    color: "#ffffff"
                    Text {
                        id: text2
                        x: 50
                        y: 7
                        text: qsTr("Destroyer")
                        horizontalAlignment: Text.AlignHCenter
                        font.pixelSize: 23
                    }
                }

                Rectangle {
                    id: rectangle2
                    width: 200
                    height: 42
                    color: "#ffffff"
                    Text {
                        id: text3
                        x: 65
                        y: 7
                        text: qsTr("Crusier")
                        horizontalAlignment: Text.AlignHCenter
                        font.pixelSize: 23
                    }
                }

                Rectangle {
                    id: rectangle3
                    width: 200
                    height: 42
                    color: "#ffffff"
                    Text {
                        id: text4
                        x: 81
                        y: 8
                        text: qsTr("Sub")
                        horizontalAlignment: Text.AlignHCenter
                        font.pixelSize: 23
                    }
                }

                Rectangle {
                    id: rectangle4
                    width: 200
                    height: 42
                    color: "#ffffff"
                    Text {
                        id: text5
                        x: 67
                        y: 7
                        text: qsTr("Carrier")
                        font.pixelSize: 23
                    }
                }
            }

            Column {
                id: costShipColBounds
                width: 40
                height: 400
                scale: 1
                spacing: 20

                Rectangle {
                    id: rectangle9
                    width: 40
                    height: 42
                    color: "#ffffff"
                    Text {
                        id: text11
                        x: 15
                        y: 9
                        text: qsTr("5")
                        font.pixelSize: 20
                    }
                }

                Rectangle {
                    id: rectangle8
                    width: 40
                    height: 42
                    color: "#ffffff"
                    Text {
                        id: text10
                        x: 15
                        y: 9
                        text: qsTr("3")
                        font.pixelSize: 20
                    }
                }

                Rectangle {
                    id: rectangle7
                    width: 40
                    height: 42
                    color: "#ffffff"
                    Text {
                        id: text9
                        x: 15
                        y: 9
                        text: qsTr("2")
                        font.pixelSize: 20
                    }
                }

                Rectangle {
                    id: rectangle6
                    width: 40
                    height: 42
                    color: "#ffffff"
                    Text {
                        id: text8
                        x: 15
                        y: 9
                        text: qsTr("5")
                        font.pixelSize: 20
                    }
                }

                Rectangle {
                    id: rectangle5
                    width: 40
                    height: 42
                    color: "#ffffff"

                    Text {
                        id: text7
                        x: 15
                        y: 9
                        text: qsTr("4")
                        font.pixelSize: 20
                    }
                }




            }

            Column {
                id: shipAmountColBounds
                width: 200
                height: 400
                spacing: 20

                SpinBox {
                    id: battleshipSpinBox
                    width: 140
                    height: 42
                    to: 7
                    font.pointSize: 17
                }

                SpinBox {
                    id: destroyerSpinBox
                    width: 140
                    height: 42
                    font.pointSize: 17
                    to: 5
                }

                SpinBox {
                    id: crusierSpinBox
                    width: 140
                    height: 42
                    font.pointSize: 17
                    editable: false
                    to: 13
                }

                SpinBox {
                    id: subSpinBox
                    width: 140
                    height: 42
                    to: 5
                    font.pointSize: 17
                }

                SpinBox {
                    id: carrierSpinBox
                    width: 140
                    height: 42
                    font.pointSize: 17
                    to: 13
                }


            }
        }

        Rectangle {
            id: shipRecBackground
            x: 310
            y: 20
            width: 162
            height: 352
            color: "#1b325b"
            z: -1
        }

        Text {
            id: shipAmountText
            x: 360
            y: 21
            color: "#ffffff"
            text: qsTr("Ships")
            font.pixelSize: 27
        }

        Rectangle {
            id: costRecBackground
            x: 250
            y: 20
            width: 61
            height: 352
            color: "#612915"
            z: -1
        }

        Text {
            id: costText
            x: 255
            y: 21
            color: "#ffffff"
            text: qsTr("Cost")
            font.pixelSize: 27
        }

        Button {
            id: finishedButton
            x: 433
            y: 378
            text: qsTr("Done")
        }

        Text {
            id: stateName
            x: 206
            y: -38
            width: 176
            height: 36
            color: "#fbfbfb"
            text: qsTr("Ship Selection Player 1")
            horizontalAlignment: Text.AlignHCenter
            wrapMode: Text.WordWrap
            font.pixelSize: 23
        }





    }

    Connections {
        target: battleshipSpinBox
        onValueModified: {
            if((battleshipSpinBox.value*5+destroyerSpinBox.value*3+crusierSpinBox.value*2+subSpinBox.value*5+carrierSpinBox.value*4) > pointsUsed.maximumValue){
                battleshipSpinBox.decrease();
            }
            else{
                if(stateName.text == "Ship Selection Player 1"){
                    playerOneShips.push(4);
                }
                else
                {
                    playerTwoShips.push(4);
                }
            }
        }
    }
    Connections {
        target: destroyerSpinBox
        onValueModified: {
            if((battleshipSpinBox.value*5+destroyerSpinBox.value*3+crusierSpinBox.value*2+subSpinBox.value*5+carrierSpinBox.value*4) > pointsUsed.maximumValue){
                destroyerSpinBox.decrease();
            }
            else{
                if(stateName.text == "Ship Selection Player 1"){
                    playerOneShips.push(3);
                }
                else
                {
                    playerTwoShips.push(3);
                }
            }
        }
    }
    Connections {
        target: crusierSpinBox
        onValueModified: {
            if((battleshipSpinBox.value*5+destroyerSpinBox.value*3+crusierSpinBox.value*2+subSpinBox.value*5+carrierSpinBox.value*4) > pointsUsed.maximumValue){
                crusierSpinBox.decrease();
            }
            else
            {
                if(stateName.text == "Ship Selection Player 1"){
                    playerOneShips.push(2);
                }
                else
                {
                    playerTwoShips.push(2);
                }
            }
        }
    }
    Connections {
        target: subSpinBox
        onValueModified: {
            if((battleshipSpinBox.value*5+destroyerSpinBox.value*3+crusierSpinBox.value*2+subSpinBox.value*5+carrierSpinBox.value*4) > pointsUsed.maximumValue){
                subSpinBox.decrease();
            }
            else{
                if(stateName.text == "Ship Selection Player 1"){
                    playerOneShips.push(3);
                }
                else
                {
                    playerTwoShips.push(3);
                }
            }
        }
    }
    Connections {
        target: carrierSpinBox
        onValueModified: {
            if((battleshipSpinBox.value*5+destroyerSpinBox.value*3+crusierSpinBox.value*2+subSpinBox.value*5+carrierSpinBox.value*4) > pointsUsed.maximumValue){
                carrierSpinBox.decrease();
            }
            else
            {
                if(stateName.text == "Ship Selection Player 1"){
                    playerOneShips.push(5);
                }
                else
                {
                    playerTwoShips.push(5);
                }
            }
        }

    }
    Connections {
        target: finishedButton
        onClicked: {
            if(stateName.text == "Ship Selection Player 2"){
                playerTwoShipsLength = playerTwoShips.length
                shipSelectionPlayer1.visible = false;
                shipPlacmentPlayer1.visible = true;
            }
            else
            {
                playerOneShipsLength = playerOneShips.length
                stateName.text = "Ship Selection Player 2";
                subSpinBox.value = 0;
                carrierSpinBox.value = 0;
                destroyerSpinBox.value = 0;
                crusierSpinBox.value = 0;
                battleshipSpinBox.value = 0;
            }
        }
    }

    Item {
        id: shipPlacmentPlayer1
        x: 1
        y: 0
        width: 639
        height: 480
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.verticalCenter: parent.verticalCenter
        visible: false

        Rectangle {
            id: boundsRec
            anchors.horizontalCenter: parent.horizontalCenter
            anchors.verticalCenter: parent.TopRight
            width: 300; height: 300
            color: "#505050"
            property int tablesize: 10

            Grid {
                columns: parent.tablesize
                rows: parent.tablesize
                spacing: 0
                z: 0

                Repeater {
                    model: parent.columns * parent.rows

                    Rectangle {
                        id: dropRectangle
                        color: "white"
                        width: 30
                        height: 30
                        border.color: "#dddddd"
                    }
                }
                Repeater {
                    model: playerOneShipsLength

                    Ship {
                        shipWidth: 30*playerOneShips.pop()
                        shipHeight: 30
                    }
                }
            }
        }

        Button {
            id: button
            x: 270
            y: 403
            text: qsTr("Done")
        }
    }

    Item {
        id: gameState
        width: 640
        height: 480
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.verticalCenter: parent.verticalCenter
        visible: false

        Rectangle {
            id: boundsRecPlayer
            anchors.horizontalCenter: parent.horizontalCenter
            anchors.verticalCenter: parent.verticalCenter
            width: 300; height: 300
            color: "#505050"
            anchors.verticalCenterOffset: 0
            anchors.horizontalCenterOffset: -170
            property int tablesize: 10

            Grid {
                columns: parent.tablesize
                rows: parent.tablesize
                spacing: 0
                z: 0

                Repeater {
                    model: parent.columns * parent.rows

                    Rectangle {
                        id: dropRectanglePlayer
                        color: "white"
                        width: 30
                        height: 30
                        border.color: "#dddddd"
                    }
                }
            }

            Ship {
                shipWidth: 30*2 // ship size
                shipHeight: 30
            }
        }

        Rectangle {
            id: boundsRecEnemy
            anchors.horizontalCenter: parent.horizontalCenter
            anchors.verticalCenter: parent.verticalCenter
            width: 300; height: 300
            color: "#505050"
            anchors.verticalCenterOffset: 0
            anchors.horizontalCenterOffset: 170
            property int tablesize: 10

            Grid {
                columns: parent.tablesize
                rows: parent.tablesize
                spacing: 0
                z: 0

                Repeater {
                    model: parent.columns * parent.rows

                    Rectangle {
                        id: dropRectangleEnemy
                        color: "white"
                        width: 30
                        height: 30
                        border.color: "#dddddd"
                    }
                }
            }

            Ship {
                shipWidth: 30*2 // ship size
                shipHeight: 30
            }
        }
    }
}
