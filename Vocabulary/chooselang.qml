import QtQuick 2.0
import QtQuick.Controls 2.3

Item {
    Rectangle{
        id: rect
        color: "#24d3d5"
        anchors.fill: parent


        Column {
            id: column
            x: 158
            y: 111
            width: 438
            height: 406
            anchors.verticalCenter: parent.verticalCenter
            spacing: 30
            anchors.horizontalCenter: parent.horizontalCenter

            Label {
                id: label
                text: qsTr("CHOOSE LANGUAGE")
                font.family: "Courier"
                font.pointSize: 30
                font.bold: true
                anchors.horizontalCenter: parent.horizontalCenter
            }

            ComboBox {
                id: comboBox
                anchors.horizontalCenter: parent.horizontalCenter
                anchors.top: label.bottom
                anchors.topMargin: 20
            }
            Label {
                id: label2
                text: qsTr("NUMBER OF WORDS")
                font.family: "Courier"
                font.pointSize: 30
                font.bold: true
                anchors.horizontalCenter: parent.horizontalCenter
                anchors.top: comboBox.bottom
                 anchors.topMargin: 40
            }

            SpinBox {
                id: spinBox
                anchors.horizontalCenter: parent.horizontalCenter
                anchors.top: label2.bottom
                anchors.topMargin: 30
            }
        }
}
}

/*##^##
Designer {
    D{i:0;autoSize:true;height:480;width:640}
}
##^##*/
