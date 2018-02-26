import QtQuick 2.0

Item {
    id: root
    property int shipWidth
    property int shipHeight
    property var nameD: []
    width: shipWidth; height: shipHeight

    MouseArea {
        id: mouseArea
        width: shipWidth; height: shipHeight
        drag.target: tile
        acceptedButtons: Qt.LeftButton | Qt.RightButton
        onReleased: {
            if(tile.x < 0){
                tile.x = 0
            }
            if(tile.y < 0){
                tile.y = 0
            }
            if(tile.y > 300-shipHeight){
                tile.y = 300-shipHeight
            }
            if(tile.x > 300-shipWidth){
                tile.x = 300-shipWidth
            }
            if(tile.x % 30 < 15){
                x = tile.x = tile.x - tile.x % 30
            }
            else{
                x = tile.x = tile.x - tile.x % 30 + 30
            }
            if(tile.y % 30 < 15){
                y = tile.y = tile.y - tile.y % 30
            }
            else{
                y = tile.y = tile.y - tile.y % 30 + 30
            }
        }
        onClicked: {
            if(Qt.RightButton){
                print("cake")
                //rotate
            }
        }
        Rectangle {
            id: tile
            width: parent.width; height: parent.height;
            color: "blue"

            Drag.keys: [ "shipTile" ]
            Drag.active: mouseArea.drag.active
            Drag.hotSpot.x: 15
            Drag.hotSpot.y: 15

            states: State {
                when: mouseArea.drag.active
                ParentChange { target: tile; parent: root }
            }
        }
    }
}
