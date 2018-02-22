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
        }
    }
    Connections {
        target: destroyerSpinBox
        onValueModified: {
            if((battleshipSpinBox.value*5+destroyerSpinBox.value*3+crusierSpinBox.value*2+subSpinBox.value*5+carrierSpinBox.value*4) > pointsUsed.maximumValue){
                destroyerSpinBox.decrease();
            }
        }
    }
    Connections {
        target: crusierSpinBox
        onValueModified: {
            if((battleshipSpinBox.value*5+destroyerSpinBox.value*3+crusierSpinBox.value*2+subSpinBox.value*5+carrierSpinBox.value*4) > pointsUsed.maximumValue){
                crusierSpinBox.decrease();
            }
        }
    }
    Connections {
        target: subSpinBox
        onValueModified: {
            if((battleshipSpinBox.value*5+destroyerSpinBox.value*3+crusierSpinBox.value*2+subSpinBox.value*5+carrierSpinBox.value*4) > pointsUsed.maximumValue){
                subSpinBox.decrease();
            }
        }
    }
    Connections {
        target: carrierSpinBox
        onValueModified: {
            if((battleshipSpinBox.value*5+destroyerSpinBox.value*3+crusierSpinBox.value*2+subSpinBox.value*5+carrierSpinBox.value*4) > pointsUsed.maximumValue){
                carrierSpinBox.decrease();
            }
        }
    }
    Connections {
        target: finishedButton
        onClicked: {
            if(stateName.text == "Ship Selection Player 2"){
                //pass info call c++
                shipSelectionPlayer1.visible = false;
                shipPlacmentPlayer1.visible = true;
            }
            else
            {
                //pass info call c++
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

        Grid {
            id: grid
            x: 216
            y: 40
            width: 210
            height: 207
            spacing: 1
            rows: 10
            columns: 10

            Button {
                id: button
                width: 20
                height: 20
                text: qsTr("")
            }

            Button {
                id: button1
                width: 20
                height: 20
                text: qsTr("")
            }

            Button {
                id: button2
                width: 20
                height: 20
                text: qsTr("")
            }

            Button {
                id: button3
                width: 20
                height: 20
                text: qsTr("")
            }

            Button {
                id: button4
                width: 20
                height: 20
                text: qsTr("")
            }

            Button {
                id: button5
                width: 20
                height: 20
                text: qsTr("")
            }

            Button {
                id: button6
                width: 20
                height: 20
                text: qsTr("")
            }

            Button {
                id: button7
                width: 20
                height: 20
                text: qsTr("")
            }

            Button {
                id: button8
                width: 20
                height: 20
                text: qsTr("")
            }

            Button {
                id: button9
                width: 20
                height: 20
                text: qsTr("")
            }

            Button {
                id: button10
                width: 20
                height: 20
                text: qsTr("")
            }

            Button {
                id: button11
                width: 20
                height: 20
                text: qsTr("")
            }

            Button {
                id: button12
                width: 20
                height: 20
                text: qsTr("")
            }

            Button {
                id: button13
                width: 20
                height: 20
                text: qsTr("")
            }

            Button {
                id: button14
                width: 20
                height: 20
                text: qsTr("")
            }

            Button {
                id: button15
                width: 20
                height: 20
                text: qsTr("")
            }

            Button {
                id: button16
                width: 20
                height: 20
                text: qsTr("")
            }

            Button {
                id: button17
                width: 20
                height: 20
                text: qsTr("")
            }

            Button {
                id: button18
                width: 20
                height: 20
                text: qsTr("")
            }

            Button {
                id: button19
                width: 20
                height: 20
                text: qsTr("")
            }

            Button {
                id: button20
                width: 20
                height: 20
                text: qsTr("")
            }

            Button {
                id: button21
                width: 20
                height: 20
                text: qsTr("")
            }

            Button {
                id: button22
                width: 20
                height: 20
                text: qsTr("")
            }

            Button {
                id: button23
                width: 20
                height: 20
                text: qsTr("")
            }

            Button {
                id: button24
                width: 20
                height: 20
                text: qsTr("")
            }

            Button {
                id: button25
                width: 20
                height: 20
                text: qsTr("")
            }

            Button {
                id: button26
                width: 20
                height: 20
                text: qsTr("")
            }

            Button {
                id: button27
                width: 20
                height: 20
                text: qsTr("")
            }

            Button {
                id: button28
                width: 20
                height: 20
                text: qsTr("")
            }

            Button {
                id: button29
                width: 20
                height: 20
                text: qsTr("")
            }

            Button {
                id: button30
                width: 20
                height: 20
                text: qsTr("")
            }

            Button {
                id: button31
                width: 20
                height: 20
                text: qsTr("")
            }

            Button {
                id: button32
                width: 20
                height: 20
                text: qsTr("")
            }

            Button {
                id: button33
                width: 20
                height: 20
                text: qsTr("")
            }

            Button {
                id: button34
                width: 20
                height: 20
                text: qsTr("")
            }

            Button {
                id: button35
                width: 20
                height: 20
                text: qsTr("")
            }

            Button {
                id: button36
                width: 20
                height: 20
                text: qsTr("")
            }

            Button {
                id: button37
                width: 20
                height: 20
                text: qsTr("")
            }

            Button {
                id: button38
                width: 20
                height: 20
                text: qsTr("")
            }

            Button {
                id: button39
                width: 20
                height: 20
                text: qsTr("")
            }

            Button {
                id: button40
                width: 20
                height: 20
                text: qsTr("")
            }

            Button {
                id: button41
                width: 20
                height: 20
                text: qsTr("")
            }

            Button {
                id: button42
                width: 20
                height: 20
                text: qsTr("")
            }

            Button {
                id: button43
                width: 20
                height: 20
                text: qsTr("")
            }

            Button {
                id: button44
                width: 20
                height: 20
                text: qsTr("")
            }

            Button {
                id: button45
                width: 20
                height: 20
                text: qsTr("")
            }

            Button {
                id: button46
                width: 20
                height: 20
                text: qsTr("")
            }

            Button {
                id: button47
                width: 20
                height: 20
                text: qsTr("")
            }

            Button {
                id: button48
                width: 20
                height: 20
                text: qsTr("")
            }

            Button {
                id: button49
                width: 20
                height: 20
                text: qsTr("")
            }

            Button {
                id: button50
                width: 20
                height: 20
                text: qsTr("")
            }

            Button {
                id: button51
                width: 20
                height: 20
                text: qsTr("")
            }

            Button {
                id: button52
                width: 20
                height: 20
                text: qsTr("")
            }

            Button {
                id: button53
                width: 20
                height: 20
                text: qsTr("")
            }

            Button {
                id: button54
                width: 20
                height: 20
                text: qsTr("")
            }

            Button {
                id: button55
                width: 20
                height: 20
                text: qsTr("")
            }

            Button {
                id: button56
                width: 20
                height: 20
                text: qsTr("")
            }

            Button {
                id: button57
                width: 20
                height: 20
                text: qsTr("")
            }

            Button {
                id: button58
                width: 20
                height: 20
                text: qsTr("")
            }

            Button {
                id: button59
                width: 20
                height: 20
                text: qsTr("")
            }

            Button {
                id: button60
                width: 20
                height: 20
                text: qsTr("")
            }

            Button {
                id: button61
                width: 20
                height: 20
                text: qsTr("")
            }

            Button {
                id: button62
                width: 20
                height: 20
                text: qsTr("")
            }

            Button {
                id: button63
                width: 20
                height: 20
                text: qsTr("")
            }

            Button {
                id: button64
                width: 20
                height: 20
                text: qsTr("")
            }

            Button {
                id: button65
                width: 20
                height: 20
                text: qsTr("")
            }

            Button {
                id: button66
                width: 20
                height: 20
                text: qsTr("")
            }

            Button {
                id: button67
                width: 20
                height: 20
                text: qsTr("")
            }

            Button {
                id: button68
                width: 20
                height: 20
                text: qsTr("")
            }

            Button {
                id: button69
                width: 20
                height: 20
                text: qsTr("")
            }

            Button {
                id: button70
                width: 20
                height: 20
                text: qsTr("")
            }

            Button {
                id: button71
                width: 20
                height: 20
                text: qsTr("")
            }

            Button {
                id: button72
                width: 20
                height: 20
                text: qsTr("")
            }

            Button {
                id: button73
                width: 20
                height: 20
                text: qsTr("")
            }

            Button {
                id: button74
                width: 20
                height: 20
                text: qsTr("")
            }

            Button {
                id: button75
                width: 20
                height: 20
                text: qsTr("")
            }

            Button {
                id: button76
                width: 20
                height: 20
                text: qsTr("")
            }

            Button {
                id: button77
                width: 20
                height: 20
                text: qsTr("")
            }

            Button {
                id: button78
                width: 20
                height: 20
                text: qsTr("")
            }

            Button {
                id: button79
                width: 20
                height: 20
                text: qsTr("")
            }

            Button {
                id: button80
                width: 20
                height: 20
                text: qsTr("")
            }

            Button {
                id: button81
                width: 20
                height: 20
                text: qsTr("")
            }

            Button {
                id: button82
                width: 20
                height: 20
                text: qsTr("")
            }

            Button {
                id: button83
                width: 20
                height: 20
                text: qsTr("")
            }

            Button {
                id: button84
                width: 20
                height: 20
                text: qsTr("")
            }

            Button {
                id: button85
                width: 20
                height: 20
                text: qsTr("")
            }

            Button {
                id: button86
                width: 20
                height: 20
                text: qsTr("")
            }

            Button {
                id: button87
                width: 20
                height: 20
                text: qsTr("")
            }

            Button {
                id: button88
                width: 20
                height: 20
                text: qsTr("")
            }

            Button {
                id: button89
                width: 20
                height: 20
                text: qsTr("")
            }

            Button {
                id: button90
                width: 20
                height: 20
                text: qsTr("")
            }

            Button {
                id: button91
                width: 20
                height: 20
                text: qsTr("")
            }

            Button {
                id: button92
                width: 20
                height: 20
                text: qsTr("")
            }

            Button {
                id: button93
                width: 20
                height: 20
                text: qsTr("")
            }

            Button {
                id: button94
                width: 20
                height: 20
                text: qsTr("")
            }

            Button {
                id: button95
                width: 20
                height: 20
                text: qsTr("")
            }

            Button {
                id: button96
                width: 20
                height: 20
                text: qsTr("")
            }

            Button {
                id: button97
                width: 20
                height: 20
                text: qsTr("")
            }

            Button {
                id: button98
                width: 20
                height: 20
                text: qsTr("")
            }

            Button {
                id: button99
                width: 20
                height: 20
                text: qsTr("")
            }
        }

        Column {
            id: column3
            x: 10
            y: 40
            width: 200
            height: 400
        }
    }

    Item {
        id: gameState
        width: 640
        height: 480
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.verticalCenter: parent.verticalCenter
        visible: false

        Grid {
            id: playerGrid
            x: 26
            y: 134
            width: 210
            height: 207
            columns: 10
            Button {
                id: button100
                width: 20
                height: 20
                text: qsTr("")
            }

            Button {
                id: button101
                width: 20
                height: 20
                text: qsTr("")
            }

            Button {
                id: button102
                width: 20
                height: 20
                text: qsTr("")
            }

            Button {
                id: button103
                width: 20
                height: 20
                text: qsTr("")
            }

            Button {
                id: button104
                width: 20
                height: 20
                text: qsTr("")
            }

            Button {
                id: button105
                width: 20
                height: 20
                text: qsTr("")
            }

            Button {
                id: button106
                width: 20
                height: 20
                text: qsTr("")
            }

            Button {
                id: button107
                width: 20
                height: 20
                text: qsTr("")
            }

            Button {
                id: button108
                width: 20
                height: 20
                text: qsTr("")
            }

            Button {
                id: button109
                width: 20
                height: 20
                text: qsTr("")
            }

            Button {
                id: button110
                width: 20
                height: 20
                text: qsTr("")
            }

            Button {
                id: button111
                width: 20
                height: 20
                text: qsTr("")
            }

            Button {
                id: button112
                width: 20
                height: 20
                text: qsTr("")
            }

            Button {
                id: button113
                width: 20
                height: 20
                text: qsTr("")
            }

            Button {
                id: button114
                width: 20
                height: 20
                text: qsTr("")
            }

            Button {
                id: button115
                width: 20
                height: 20
                text: qsTr("")
            }

            Button {
                id: button116
                width: 20
                height: 20
                text: qsTr("")
            }

            Button {
                id: button117
                width: 20
                height: 20
                text: qsTr("")
            }

            Button {
                id: button118
                width: 20
                height: 20
                text: qsTr("")
            }

            Button {
                id: button119
                width: 20
                height: 20
                text: qsTr("")
            }

            Button {
                id: button120
                width: 20
                height: 20
                text: qsTr("")
            }

            Button {
                id: button121
                width: 20
                height: 20
                text: qsTr("")
            }

            Button {
                id: button122
                width: 20
                height: 20
                text: qsTr("")
            }

            Button {
                id: button123
                width: 20
                height: 20
                text: qsTr("")
            }

            Button {
                id: button124
                width: 20
                height: 20
                text: qsTr("")
            }

            Button {
                id: button125
                width: 20
                height: 20
                text: qsTr("")
            }

            Button {
                id: button126
                width: 20
                height: 20
                text: qsTr("")
            }

            Button {
                id: button127
                width: 20
                height: 20
                text: qsTr("")
            }

            Button {
                id: button128
                width: 20
                height: 20
                text: qsTr("")
            }

            Button {
                id: button129
                width: 20
                height: 20
                text: qsTr("")
            }

            Button {
                id: button130
                width: 20
                height: 20
                text: qsTr("")
            }

            Button {
                id: button131
                width: 20
                height: 20
                text: qsTr("")
            }

            Button {
                id: button132
                width: 20
                height: 20
                text: qsTr("")
            }

            Button {
                id: button133
                width: 20
                height: 20
                text: qsTr("")
            }

            Button {
                id: button134
                width: 20
                height: 20
                text: qsTr("")
            }

            Button {
                id: button135
                width: 20
                height: 20
                text: qsTr("")
            }

            Button {
                id: button136
                width: 20
                height: 20
                text: qsTr("")
            }

            Button {
                id: button137
                width: 20
                height: 20
                text: qsTr("")
            }

            Button {
                id: button138
                width: 20
                height: 20
                text: qsTr("")
            }

            Button {
                id: button139
                width: 20
                height: 20
                text: qsTr("")
            }

            Button {
                id: button140
                width: 20
                height: 20
                text: qsTr("")
            }

            Button {
                id: button141
                width: 20
                height: 20
                text: qsTr("")
            }

            Button {
                id: button142
                width: 20
                height: 20
                text: qsTr("")
            }

            Button {
                id: button143
                width: 20
                height: 20
                text: qsTr("")
            }

            Button {
                id: button144
                width: 20
                height: 20
                text: qsTr("")
            }

            Button {
                id: button145
                width: 20
                height: 20
                text: qsTr("")
            }

            Button {
                id: button146
                width: 20
                height: 20
                text: qsTr("")
            }

            Button {
                id: button147
                width: 20
                height: 20
                text: qsTr("")
            }

            Button {
                id: button148
                width: 20
                height: 20
                text: qsTr("")
            }

            Button {
                id: button149
                width: 20
                height: 20
                text: qsTr("")
            }

            Button {
                id: button150
                width: 20
                height: 20
                text: qsTr("")
            }

            Button {
                id: button151
                width: 20
                height: 20
                text: qsTr("")
            }

            Button {
                id: button152
                width: 20
                height: 20
                text: qsTr("")
            }

            Button {
                id: button153
                width: 20
                height: 20
                text: qsTr("")
            }

            Button {
                id: button154
                width: 20
                height: 20
                text: qsTr("")
            }

            Button {
                id: button155
                width: 20
                height: 20
                text: qsTr("")
            }

            Button {
                id: button156
                width: 20
                height: 20
                text: qsTr("")
            }

            Button {
                id: button157
                width: 20
                height: 20
                text: qsTr("")
            }

            Button {
                id: button158
                width: 20
                height: 20
                text: qsTr("")
            }

            Button {
                id: button159
                width: 20
                height: 20
                text: qsTr("")
            }

            Button {
                id: button160
                width: 20
                height: 20
                text: qsTr("")
            }

            Button {
                id: button161
                width: 20
                height: 20
                text: qsTr("")
            }

            Button {
                id: button162
                width: 20
                height: 20
                text: qsTr("")
            }

            Button {
                id: button163
                width: 20
                height: 20
                text: qsTr("")
            }

            Button {
                id: button164
                width: 20
                height: 20
                text: qsTr("")
            }

            Button {
                id: button165
                width: 20
                height: 20
                text: qsTr("")
            }

            Button {
                id: button166
                width: 20
                height: 20
                text: qsTr("")
            }

            Button {
                id: button167
                width: 20
                height: 20
                text: qsTr("")
            }

            Button {
                id: button168
                width: 20
                height: 20
                text: qsTr("")
            }

            Button {
                id: button169
                width: 20
                height: 20
                text: qsTr("")
            }

            Button {
                id: button170
                width: 20
                height: 20
                text: qsTr("")
            }

            Button {
                id: button171
                width: 20
                height: 20
                text: qsTr("")
            }

            Button {
                id: button172
                width: 20
                height: 20
                text: qsTr("")
            }

            Button {
                id: button173
                width: 20
                height: 20
                text: qsTr("")
            }

            Button {
                id: button174
                width: 20
                height: 20
                text: qsTr("")
            }

            Button {
                id: button175
                width: 20
                height: 20
                text: qsTr("")
            }

            Button {
                id: button176
                width: 20
                height: 20
                text: qsTr("")
            }

            Button {
                id: button177
                width: 20
                height: 20
                text: qsTr("")
            }

            Button {
                id: button178
                width: 20
                height: 20
                text: qsTr("")
            }

            Button {
                id: button179
                width: 20
                height: 20
                text: qsTr("")
            }

            Button {
                id: button180
                width: 20
                height: 20
                text: qsTr("")
            }

            Button {
                id: button181
                width: 20
                height: 20
                text: qsTr("")
            }

            Button {
                id: button182
                width: 20
                height: 20
                text: qsTr("")
            }

            Button {
                id: button183
                width: 20
                height: 20
                text: qsTr("")
            }

            Button {
                id: button184
                width: 20
                height: 20
                text: qsTr("")
            }

            Button {
                id: button185
                width: 20
                height: 20
                text: qsTr("")
            }

            Button {
                id: button186
                width: 20
                height: 20
                text: qsTr("")
            }

            Button {
                id: button187
                width: 20
                height: 20
                text: qsTr("")
            }

            Button {
                id: button188
                width: 20
                height: 20
                text: qsTr("")
            }

            Button {
                id: button189
                width: 20
                height: 20
                text: qsTr("")
            }

            Button {
                id: button190
                width: 20
                height: 20
                text: qsTr("")
            }

            Button {
                id: button191
                width: 20
                height: 20
                text: qsTr("")
            }

            Button {
                id: button192
                width: 20
                height: 20
                text: qsTr("")
            }

            Button {
                id: button193
                width: 20
                height: 20
                text: qsTr("")
            }

            Button {
                id: button194
                width: 20
                height: 20
                text: qsTr("")
            }

            Button {
                id: button195
                width: 20
                height: 20
                text: qsTr("")
            }

            Button {
                id: button196
                width: 20
                height: 20
                text: qsTr("")
            }

            Button {
                id: button197
                width: 20
                height: 20
                text: qsTr("")
            }

            Button {
                id: button198
                width: 20
                height: 20
                text: qsTr("")
            }

            Button {
                id: button199
                width: 20
                height: 20
                text: qsTr("")
            }
            spacing: 1
            rows: 10
        }

        Grid {
            id: enemyGrid
            x: 403
            y: 134
            width: 210
            height: 207
            columns: 10
            Button {
                id: button200
                width: 20
                height: 20
                text: qsTr("")
            }

            Button {
                id: button201
                width: 20
                height: 20
                text: qsTr("")
            }

            Button {
                id: button202
                width: 20
                height: 20
                text: qsTr("")
            }

            Button {
                id: button203
                width: 20
                height: 20
                text: qsTr("")
            }

            Button {
                id: button204
                width: 20
                height: 20
                text: qsTr("")
            }

            Button {
                id: button205
                width: 20
                height: 20
                text: qsTr("")
            }

            Button {
                id: button206
                width: 20
                height: 20
                text: qsTr("")
            }

            Button {
                id: button207
                width: 20
                height: 20
                text: qsTr("")
            }

            Button {
                id: button208
                width: 20
                height: 20
                text: qsTr("")
            }

            Button {
                id: button209
                width: 20
                height: 20
                text: qsTr("")
            }

            Button {
                id: button210
                width: 20
                height: 20
                text: qsTr("")
            }

            Button {
                id: button211
                width: 20
                height: 20
                text: qsTr("")
            }

            Button {
                id: button212
                width: 20
                height: 20
                text: qsTr("")
            }

            Button {
                id: button213
                width: 20
                height: 20
                text: qsTr("")
            }

            Button {
                id: button214
                width: 20
                height: 20
                text: qsTr("")
            }

            Button {
                id: button215
                width: 20
                height: 20
                text: qsTr("")
            }

            Button {
                id: button216
                width: 20
                height: 20
                text: qsTr("")
            }

            Button {
                id: button217
                width: 20
                height: 20
                text: qsTr("")
            }

            Button {
                id: button218
                width: 20
                height: 20
                text: qsTr("")
            }

            Button {
                id: button219
                width: 20
                height: 20
                text: qsTr("")
            }

            Button {
                id: button220
                width: 20
                height: 20
                text: qsTr("")
            }

            Button {
                id: button221
                width: 20
                height: 20
                text: qsTr("")
            }

            Button {
                id: button222
                width: 20
                height: 20
                text: qsTr("")
            }

            Button {
                id: button223
                width: 20
                height: 20
                text: qsTr("")
            }

            Button {
                id: button224
                width: 20
                height: 20
                text: qsTr("")
            }

            Button {
                id: button225
                width: 20
                height: 20
                text: qsTr("")
            }

            Button {
                id: button226
                width: 20
                height: 20
                text: qsTr("")
            }

            Button {
                id: button227
                width: 20
                height: 20
                text: qsTr("")
            }

            Button {
                id: button228
                width: 20
                height: 20
                text: qsTr("")
            }

            Button {
                id: button229
                width: 20
                height: 20
                text: qsTr("")
            }

            Button {
                id: button230
                width: 20
                height: 20
                text: qsTr("")
            }

            Button {
                id: button231
                width: 20
                height: 20
                text: qsTr("")
            }

            Button {
                id: button232
                width: 20
                height: 20
                text: qsTr("")
            }

            Button {
                id: button233
                width: 20
                height: 20
                text: qsTr("")
            }

            Button {
                id: button234
                width: 20
                height: 20
                text: qsTr("")
            }

            Button {
                id: button235
                width: 20
                height: 20
                text: qsTr("")
            }

            Button {
                id: button236
                width: 20
                height: 20
                text: qsTr("")
            }

            Button {
                id: button237
                width: 20
                height: 20
                text: qsTr("")
            }

            Button {
                id: button238
                width: 20
                height: 20
                text: qsTr("")
            }

            Button {
                id: button239
                width: 20
                height: 20
                text: qsTr("")
            }

            Button {
                id: button240
                width: 20
                height: 20
                text: qsTr("")
            }

            Button {
                id: button241
                width: 20
                height: 20
                text: qsTr("")
            }

            Button {
                id: button242
                width: 20
                height: 20
                text: qsTr("")
            }

            Button {
                id: button243
                width: 20
                height: 20
                text: qsTr("")
            }

            Button {
                id: button244
                width: 20
                height: 20
                text: qsTr("")
            }

            Button {
                id: button245
                width: 20
                height: 20
                text: qsTr("")
            }

            Button {
                id: button246
                width: 20
                height: 20
                text: qsTr("")
            }

            Button {
                id: button247
                width: 20
                height: 20
                text: qsTr("")
            }

            Button {
                id: button248
                width: 20
                height: 20
                text: qsTr("")
            }

            Button {
                id: button249
                width: 20
                height: 20
                text: qsTr("")
            }

            Button {
                id: button250
                width: 20
                height: 20
                text: qsTr("")
            }

            Button {
                id: button251
                width: 20
                height: 20
                text: qsTr("")
            }

            Button {
                id: button252
                width: 20
                height: 20
                text: qsTr("")
            }

            Button {
                id: button253
                width: 20
                height: 20
                text: qsTr("")
            }

            Button {
                id: button254
                width: 20
                height: 20
                text: qsTr("")
            }

            Button {
                id: button255
                width: 20
                height: 20
                text: qsTr("")
            }

            Button {
                id: button256
                width: 20
                height: 20
                text: qsTr("")
            }

            Button {
                id: button257
                width: 20
                height: 20
                text: qsTr("")
            }

            Button {
                id: button258
                width: 20
                height: 20
                text: qsTr("")
            }

            Button {
                id: button259
                width: 20
                height: 20
                text: qsTr("")
            }

            Button {
                id: button260
                width: 20
                height: 20
                text: qsTr("")
            }

            Button {
                id: button261
                width: 20
                height: 20
                text: qsTr("")
            }

            Button {
                id: button262
                width: 20
                height: 20
                text: qsTr("")
            }

            Button {
                id: button263
                width: 20
                height: 20
                text: qsTr("")
            }

            Button {
                id: button264
                width: 20
                height: 20
                text: qsTr("")
            }

            Button {
                id: button265
                width: 20
                height: 20
                text: qsTr("")
            }

            Button {
                id: button266
                width: 20
                height: 20
                text: qsTr("")
            }

            Button {
                id: button267
                width: 20
                height: 20
                text: qsTr("")
            }

            Button {
                id: button268
                width: 20
                height: 20
                text: qsTr("")
            }

            Button {
                id: button269
                width: 20
                height: 20
                text: qsTr("")
            }

            Button {
                id: button270
                width: 20
                height: 20
                text: qsTr("")
            }

            Button {
                id: button271
                width: 20
                height: 20
                text: qsTr("")
            }

            Button {
                id: button272
                width: 20
                height: 20
                text: qsTr("")
            }

            Button {
                id: button273
                width: 20
                height: 20
                text: qsTr("")
            }

            Button {
                id: button274
                width: 20
                height: 20
                text: qsTr("")
            }

            Button {
                id: button275
                width: 20
                height: 20
                text: qsTr("")
            }

            Button {
                id: button276
                width: 20
                height: 20
                text: qsTr("")
            }

            Button {
                id: button277
                width: 20
                height: 20
                text: qsTr("")
            }

            Button {
                id: button278
                width: 20
                height: 20
                text: qsTr("")
            }

            Button {
                id: button279
                width: 20
                height: 20
                text: qsTr("")
            }

            Button {
                id: button280
                width: 20
                height: 20
                text: qsTr("")
            }

            Button {
                id: button281
                width: 20
                height: 20
                text: qsTr("")
            }

            Button {
                id: button282
                width: 20
                height: 20
                text: qsTr("")
            }

            Button {
                id: button283
                width: 20
                height: 20
                text: qsTr("")
            }

            Button {
                id: button284
                width: 20
                height: 20
                text: qsTr("")
            }

            Button {
                id: button285
                width: 20
                height: 20
                text: qsTr("")
            }

            Button {
                id: button286
                width: 20
                height: 20
                text: qsTr("")
            }

            Button {
                id: button287
                width: 20
                height: 20
                text: qsTr("")
            }

            Button {
                id: button288
                width: 20
                height: 20
                text: qsTr("")
            }

            Button {
                id: button289
                width: 20
                height: 20
                text: qsTr("")
            }

            Button {
                id: button290
                width: 20
                height: 20
                text: qsTr("")
            }

            Button {
                id: button291
                width: 20
                height: 20
                text: qsTr("")
            }

            Button {
                id: button292
                width: 20
                height: 20
                text: qsTr("")
            }

            Button {
                id: button293
                width: 20
                height: 20
                text: qsTr("")
            }

            Button {
                id: button294
                width: 20
                height: 20
                text: qsTr("")
            }

            Button {
                id: button295
                width: 20
                height: 20
                text: qsTr("")
            }

            Button {
                id: button296
                width: 20
                height: 20
                text: qsTr("")
            }

            Button {
                id: button297
                width: 20
                height: 20
                text: qsTr("")
            }

            Button {
                id: button298
                width: 20
                height: 20
                text: qsTr("")
            }

            Button {
                id: button299
                width: 20
                height: 20
                text: qsTr("")
            }
            spacing: 1
            rows: 10
        }
    }


}
