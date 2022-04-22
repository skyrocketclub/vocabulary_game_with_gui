import QtQuick 2.0
import QtQuick.Controls 2.3
import "Code.js" as Code

Item {
    Rectangle{
        id: rectangle
        color: "#e6f0f0"
        anchors.fill: parent
        anchors.rightMargin: 0
        anchors.bottomMargin: 0
        anchors.leftMargin: 0
        anchors.topMargin: 0

//        property string language: ""
//        property int trials: 0

        Column {
            id: column
            anchors.fill: parent

            Row {
                id: row
                width: 596
                height: 108
                anchors.verticalCenter: parent.verticalCenter
                spacing: 10
                anchors.horizontalCenter: parent.horizontalCenter

                Rectangle {
                    id: rectangle1
                    width: 200
                    height: row.height
                    color: "#20e2df"

                    Label {
                        id: label1
                        text: qsTr("Word")
                        anchors.verticalCenter: parent.verticalCenter
                        font.family: "Courier"
                        font.pointSize: 30
                        anchors.horizontalCenter: parent.horizontalCenter
                    }
                }

                Column {
                    id: column1
//                    width: 200
                    height: row.height
                    spacing: 30

                    anchors{
                        left: rectangle1.right
                        leftMargin: 15
                        right: rectangle2.left
                    }

                    TextField {
                        id: textField
                        placeholderText: qsTr("Text Field")
                        anchors{
                            left: column1.left
                            leftMargin: 15
                            verticalCenter: column1.verticalCenter
                        }
                    }

                    Button {
                        id: button1
                        text: qsTr("Enter")
                        height: textField.height
                        width:textField.width
                        anchors{
                            left: textField.left
//                            leftMargin: 60
//                            verticalCenter: column1.verticalCenter
                            top: parent.top
                            topMargin: 10
                            bottom: textField.top
                            bottomMargin: 5
                        }
                    }
                }

                Rectangle {
                    id: rectangle2
                    width: 200
                    height: row.height
                    color: "#ffffff"
                    anchors.right: parent.right
                    Label {
                        id: label
                        text: qsTr("Status")
                        anchors.verticalCenter: parent.verticalCenter
                        font.family: "Courier"
                        font.pointSize: 30
                        anchors.horizontalCenter: parent.horizontalCenter

                    }
                }


            }

            Row {
                id: row1
                width: row.width
                height: row.height
                anchors.top: row.bottom
                spacing: 200
                anchors.topMargin: 10
                anchors.left: row.left

                Label {
                    id: label2
                    width: row1.width /3
                    height: row1.height
                    text: qsTr("0 / 0")
                    font.pointSize: 30
                }

                Button {
                    id: button
                    width: rectangle2.width
                    height: row1.height
                    text: qsTr("QUIT")
                    font.family: "Courier"
                    font.pointSize: 30
                    //               anchors{
                    //                   left:rectangle2.left
                    //                   right: rectangle2.right
                    //               }
                }

            }

            Row {
                id: row2
                width: 200
                height: row.height
                spacing: 200
                anchors{
                    bottom: row.top
                    left:column.left
                    right: column.right
                }

                Label {
                    id: label3
                    text:Code.trials + " Words"
                    font.family: "Courier"
                    font.pointSize: 20
                    anchors{
                        right:row2.right
                        rightMargin: 50
                    }
                }

                Label {
                    id: label4
                    text: Code.language
                    font.family: "Courier"
                    font.pointSize: 20
                    anchors{
                        left:row2.left
                        leftMargin: 50
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
