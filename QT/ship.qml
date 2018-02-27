import QtQuick 2.0

Item {
    id: root
    property int shipWidth
    property int shipHeight
    property var nameD: []
    property int prevX: 0
    property int prevY: 0
    property QtObject model: backend
    width: shipWidth; height: shipHeight
    x: 0
    y: 0
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
            if(tile.y > 300-mouseArea.height){
                tile.y = 300-mouseArea.height
            }
            if(tile.x > 300-mouseArea.width){
                tile.x = 300-mouseArea.width
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
            if(backend.moveShip(x,y)==false){
                x = prevX;
                y = prevY;
            }
        }
        onClicked: {
            if(Qt.RightButton){
                var hold = root.width;
                root.width = root.height;
                root.height = hold;
                tile.width = parent.width;
                tile.height = parent.height;
                mouseArea.width = parent.width;
                mouseArea.height = parent.height;
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
