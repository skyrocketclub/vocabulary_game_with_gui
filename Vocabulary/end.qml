import QtQuick 2.0
import QtQuick.Controls

Item {
    id: endScreen
    property int points: 0

    Rectangle{
        id: rectangle
        anchors.fill: parent
        color: "#a19595"

        Column {
            id: column
            width: 402
            height: 168
            anchors.verticalCenter: parent.verticalCenter
            anchors.horizontalCenter: parent.horizontalCenter

            Item{
                id: item2
                width: parent.width
                height: parent.height/2
                anchors{
                    top: column.top
                }

                Label {
                    id: scores
                    text: "YOUR SCORE: " + root.percentage + " %"
                    font.family: "Courier"
                    font.pointSize: 40
                    anchors{
                        top: parent.top
                        topMargin: 10
                        horizontalCenter: parent.horizontalCenter

                   }
                }

            }


            Row {
                id: row
                width: column.width /1.5
                height: column.height/2
                spacing: 30
                anchors{
                     horizontalCenter: parent.horizontalCenter
                     bottom: column.bottom
                }

                Button {
                    id: retry
                    width: row.width/4
                    height: row.height/1.5
                    text: qsTr("RETRY")
                    anchors.left: row.left
                    font.family: "Courier"
                    font.pointSize: 13
                    onClicked:{
                        stackview.push("home.qml")
                    }
                }

                Button {
                    id: button1
                    width: row.width/4
                    height: row.height/1.5
                    text: qsTr("QUIT")
                    anchors.right: row.right
                    font.family: "Courier"
                    font.pointSize: 13
                    onClicked: {
                        Qt.quit()
                    }
                }
            }
        }
    }
}

/*##^##
Designer {
    D{i:0;autoSize:true;height:480;width:640}D{i:2}
}
##^##*/
