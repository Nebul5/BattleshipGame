import QtQuick 2.10
import QtQuick.Window 2.10
import QtQuick.Templates 2.3
import QtQuick.Controls 2.3
import QtQuick.Controls.Universal 2.0
import QtQuick.Extras 1.4
import QtQuick.Layouts 1.3
import io.qt.examples.backend 1.0


Window {

    id: mainDisplay
    visible: true
    width: 640
    height: 480
    color: "#000000"
    title: qsTr("Battleship")
    property variant playerShips: []
    property variant playerOneShipIDs: []
    property variant playerTwoShipIDs: []
    property variant holding: []
    property variant throwaway: []
    property variant holding2: []
    property variant throwaway2: []
    property int idL: 0
    property int idL2: 0
    property variant xpos: []
    property variant ypos: []
    property variant xpos2: []
    property variant ypos2: []
    BackEnd {
        id: backend
    }

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
            shipSelectionPlayer.visible = true;
        }
    }
    Connections {
        target: quitButton
        onClicked: Qt.quit()
    }

    Item {
        id: shipSelectionPlayer
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
            value: battleshipSpinBox.value*20+destroyerSpinBox.value*10+cruiserSpinBox.value*15+subSpinBox.value*15+carrierSpinBox.value*30
            maximumValue: 100
        }

        Row {
            id: rowBounds
            x: 41
            y: 66
            width: 492
            height: 340
            visible: true
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
                        id: battleshipCost
                        x: 8
                        y: 10
                        text: qsTr("20")
                        font.pixelSize: 20
                    }
                }

                Rectangle {
                    id: rectangle8
                    width: 40
                    height: 42
                    color: "#ffffff"
                    Text {
                        id: destroyerCost
                        x: 8
                        y: 10
                        text: qsTr("10")
                        font.pixelSize: 20
                    }
                }

                Rectangle {
                    id: rectangle7
                    width: 40
                    height: 42
                    color: "#ffffff"
                    Text {
                        id: cruiserCost
                        x: 8
                        y: 10
                        text: qsTr("15")
                        font.pixelSize: 20
                    }
                }

                Rectangle {
                    id: rectangle6
                    width: 40
                    height: 42
                    color: "#ffffff"
                    Text {
                        id: subCost
                        x: 13
                        y: 10
                        width: 14
                        height: 24
                        text: qsTr("18")
                        font.pixelSize: 20
                    }
                }

                Rectangle {
                    id: rectangle5
                    width: 40
                    height: 42
                    color: "#ffffff"

                    Text {
                        id: carrierCost
                        x: 8
                        y: 10
                        text: qsTr("30")
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
                    to: 10
                    font.pointSize: 17
                }

                SpinBox {
                    id: destroyerSpinBox
                    width: 140
                    height: 42
                    font.pointSize: 17
                    to: 20
                }

                SpinBox {
                    id: cruiserSpinBox
                    width: 140
                    height: 42
                    font.pointSize: 17
                    editable: false
                    to: 40
                }

                SpinBox {
                    id: subSpinBox
                    width: 140
                    height: 42
                    to: 50
                    font.pointSize: 17
                }

                SpinBox {
                    id: carrierSpinBox
                    width: 140
                    height: 42
                    font.pointSize: 17
                    to: 15
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
            x: 251
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
            if((battleshipSpinBox.value*20+destroyerSpinBox.value*10+cruiserSpinBox.value*15+subSpinBox.value*15+carrierSpinBox.value*30) > pointsUsed.maximumValue)
                battleshipSpinBox.decrease();
        }
    }
    Connections {
        target: destroyerSpinBox
        onValueModified: {
            if((battleshipSpinBox.value*20+destroyerSpinBox.value*10+cruiserSpinBox.value*15+subSpinBox.value*15+carrierSpinBox.value*30) > pointsUsed.maximumValue)
                destroyerSpinBox.decrease();
        }
    }
    Connections {
        target: cruiserSpinBox
        onValueModified: {
            if((battleshipSpinBox.value*20+destroyerSpinBox.value*10+cruiserSpinBox.value*15+subSpinBox.value*15+carrierSpinBox.value*30) > pointsUsed.maximumValue)
                cruiserSpinBox.decrease();
        }
    }
    Connections {
        target: subSpinBox
        onValueModified: {
            if((battleshipSpinBox.value*20+destroyerSpinBox.value*10+cruiserSpinBox.value*15+subSpinBox.value*15+carrierSpinBox.value*30) > pointsUsed.maximumValue)
                subSpinBox.decrease();
        }
    }
    Connections {
        target: carrierSpinBox
        onValueModified: {
            if((battleshipSpinBox.value*20+destroyerSpinBox.value*10+cruiserSpinBox.value*15+subSpinBox.value*15+carrierSpinBox.value*30) > pointsUsed.maximumValue)
                carrierSpinBox.decrease();
        }

    }
    Connections {
        target: finishedButton
        onClicked: {
            if(stateName.text == "Ship Selection Player 2"){
                for(var i=0;i<battleshipSpinBox.value;i++){
                    playerShips.push("Battleship");
                }
                for(var i=0;i<carrierSpinBox.value;i++){
                    playerShips.push("Carrier");
                }
                for(var i=0;i<destroyerSpinBox.value;i++){
                    playerShips.push("Destroyer");
                }
                for(var i=0;i<cruiserSpinBox.value;i++){
                    playerShips.push("Cruiser");
                }
                for(var i=0;i<subSpinBox.value;i++){
                    playerShips.push("Sub");
                }
                backend.initializeShips(playerShips);
                playerTwoShipIDs = backend.getShipsIDs();
                backend.switchPlayer();
                throwaway = playerOneShipIDs;
                for(var i = 0;i<playerOneShipIDs.length;i++){
                    holding.push(backend.getShipLength(playerOneShipIDs[i]));
                }
                idL = holding.length;
                shipSelectionPlayer.visible = false;
                shipPlacmentPlayer1.visible = true;
            }
            else
            {

                stateName.text = "Ship Selection Player 2";
                for(var i=0;i<battleshipSpinBox.value;i++){
                    playerShips.push("Battleship");
                }
                for(var i=0;i<carrierSpinBox.value;i++){
                    playerShips.push("Carrier");
                }
                for(var i=0;i<destroyerSpinBox.value;i++){
                    playerShips.push("Destroyer");
                }
                for(var i=0;i<cruiserSpinBox.value;i++){
                    playerShips.push("Cruiser");
                }
                for(var i=0;i<subSpinBox.value;i++){
                    playerShips.push("Sub");
                }
                backend.initializeShips(playerShips);
                playerShips = [];
                playerOneShipIDs = backend.getShipsIDs();
                backend.switchPlayer();
                subSpinBox.value = 0;
                carrierSpinBox.value = 0;
                destroyerSpinBox.value = 0;
                cruiserSpinBox.value = 0;
                battleshipSpinBox.value = 0;
            }
        }
    }

    Item {

        id: shipPlacmentPlayer1
        x: 0
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
            anchors.horizontalCenterOffset: 0
            property int tablesize: 10
            y: 75

            Grid {
                x: 0
                y: 0
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
                    id: placementPlayer1
                    model: idL
                    Ship {                      
                        shipWidth: 30*holding[index]
                        shipHeight: 30
                        shipID: throwaway[index]
                        length: holding[index]
                    }
                }
            }
        }

        Button {
            id: shipPlacementFinish
            x: 270
            y: 403
            text: qsTr("Done")
        }

        Text {
            id: shipPlacementText
            x: 174
            y: 19
            color: "#f6f2f2"
            text: qsTr("Ship Placement Player 1")
            font.pixelSize: 24
        }
    }
    Connections {
        target: shipPlacementFinish
        onClicked: {
            backend.switchPlayer();
            throwaway2 = playerTwoShipIDs;
            for(var i = 0;i<playerTwoShipIDs.length;i++){
                holding2.push(backend.getShipLength(playerTwoShipIDs[i]));
            }
            idL2 = playerTwoShipIDs.length;
            shipPlacmentPlayer1.visible = false;
            shipPlacmentPlayer2.visible = true;
        }
    }

    Item {

        id: shipPlacmentPlayer2
        x: 0
        y: 0
        width: 639
        height: 480
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.verticalCenter: parent.verticalCenter
        visible: false

        Rectangle {
            id: boundsRec2
            anchors.horizontalCenter: parent.horizontalCenter
            anchors.verticalCenter: parent.TopRight
            width: 300; height: 300
            color: "#505050"
            anchors.horizontalCenterOffset: 0
            property int tablesize: 10
            y: 75

            Grid {
                x: 0
                y: 0
                columns: parent.tablesize
                rows: parent.tablesize
                spacing: 0
                z: 0

                Repeater {
                    model: parent.columns * parent.rows

                    Rectangle {
                        id: dropRectangle2
                        color: "white"
                        width: 30
                        height: 30
                        border.color: "#dddddd"
                    }
                }
                Repeater {
                    model: idL2
                    Ship {
                        shipWidth: 30*holding2[index]
                        shipHeight: 30
                        shipID: throwaway[index]
                        length: holding[index]
                    }
                }
            }
        }

        Button {
            id: shipPlacementFinish2
            x: 270
            y: 403
            text: qsTr("Done")
        }

        Text {
            id: shipPlacementText2
            x: 174
            y: 19
            color: "#f6f2f2"
            text: qsTr("Ship Placement Player 2")
            font.pixelSize: 24
        }
    }
    Connections{
        target: shipPlacementFinish2
        onClicked:  {
            for(var i = 0;i<playerTwoShipIDs.length;i++){
                xpos2.push(backend.getX(playerTwoShipIDs[i]));
                ypos2.push(backend.getY(playerTwoShipIDs[i]));
            }
            backend.switchPlayer();
            for(var i = 0;i<playerOneShipIDs.length;i++){
                xpos.push(backend.getX(playerOneShipIDs[i]));
                ypos.push(backend.getY(playerOneShipIDs[i]));
            }
            shipPlacmentPlayer2.visible = false;
            gameState.visible = true;
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
                x: 0
                y: 0
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
                Repeater {
                    id: shipsPlayer
                    model: idL
                    Ship {
                        shipWidth: 30*holding[index]
                        shipHeight: 30
                        shipID: throwaway[index]
                        length: holding[index]
                    }
                }
            }
        }

        Rectangle {
            id: boundsRecEnemy
            anchors.horizontalCenter: parent.horizontalCenter
            anchors.verticalCenter: parent.verticalCenter
            width: 300; height: 300
            color: "#505050"
            anchors.verticalCenterOffset: 0*backend.switchPlayer()
            anchors.horizontalCenterOffset: 170
            property int tablesize: 10

            Grid {
                x: 0
                y: 0
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
                Repeater {
                    model: idL2
                    Ship {
                        shipWidth: 30*holding2[index]
                        shipHeight: 30
                        shipID: throwaway[index]
                        length: holding[index]
                        x: 30*xpos2[index]
                        y: 30*ypos2[index]

                    }
                }
            }
        }
    }
}

