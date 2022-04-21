import QtQuick 2.0
import QtQuick.Controls

Item{
Rectangle {
        id: rect
        anchors.fill: parent

        Column {
            id: column
            width: 468
            height: 272
            anchors.verticalCenter: parent.verticalCenter
            spacing: 20
            anchors.horizontalCenter: parent.horizontalCenter

            Label {
                id: label
                color: "#2237ce"
                text: qsTr("WELCOME TO THE VOCAB CHALLENGE 1.0")
                font.family: "Courier"
                font.bold: true
                font.pointSize: 20
                anchors.horizontalCenter: parent.horizontalCenter
            }

            Button {
                id: button
                text: qsTr("NEW GAME")
                font.family: "Courier"
                font.styleName: "Bold Italic"
                font.bold: true
                font.pointSize: 30
                highlighted: true
                anchors.horizontalCenter: parent.horizontalCenter

            }
        }
}
}
