import QtQuick 2.0
import QtQuick.Controls 2.3
import "Code.js" as Code
import com.company.backend 1.0

Item {
    id:choose
    property string language: comboBox.currentText
    property int trials: spinBox.value

    Rectangle{
        id: rect
        color: "#24d3d5"
        anchors.fill: parent

        Column {
            id: column
            width: 450
            height: parent.height/2

            anchors.verticalCenter: parent.verticalCenter
            anchors.horizontalCenter: parent.horizontalCenter
            spacing: 50

            Label {
                id: label
                text: qsTr("CHOOSE LANGUAGE")
                font.family: "Courier"
                font.pointSize: 30
                font.bold: true
                anchors{
                    horizontalCenter: parent.horizontalCenter
                }
            }

            ComboBox {
                id: comboBox
                model:['Spanish','Igbo']
                editable: false
                //comboBox.currentText
                anchors.horizontalCenter: parent.horizontalCenter
                anchors.top: label.bottom
                anchors.topMargin: 50
                onCurrentTextChanged:{

                    Code.language = comboBox.currentText;
                }
            }

            Label {
                id: label2
                text: qsTr("NUMBER OF WORDS")
                font.family: "Courier"
                font.pointSize: 30
                font.bold: true
                anchors.horizontalCenter: parent.horizontalCenter
                anchors.top:comboBox.bottom
                anchors.topMargin: 50
            }

            SpinBox {
                id: spinBox
                //spinBox.value
                anchors.horizontalCenter: parent.horizontalCenter
                anchors.top: label2.bottom
                 anchors.topMargin: 50
                font.pointSize: 12
                focusPolicy: Qt.ClickFocus
                wheelEnabled: true
                editable: true
                onValueChanged:{
                    Code.trials = spinBox.value;
                }

            }

            Row {
                id: row
                width: 200
                height: 100
                anchors{
                    top: spinBox.bottom
                    topMargin: 50
                    bottom: column.bottom
                    right: column.right
                    left: column.left
                }

                Button {
                    id: button2
                    opacity: 1
                    text: qsTr("PLAY")
                    visible: true
                    font.family: "Courier"
                    font.pointSize: 30
                    anchors{
                        right: row.right
                        rightMargin: 20
                        top: row.top
                    }

                    onClicked:{
                        root.language = comboBox.currentText
                        root.trials = spinBox.value

                        if(root.trials === 0){
                            stackview.push("qrc:/end.qml")
                        }else{
                            stackview.push("game.qml")
                        }
                    }
                }
                Button {
                    id: button3
                    opacity: 1
                    text: qsTr("PREVIOUS")
                    visible: true
                    font.family: "Courier"
                    font.pointSize: 30
                    anchors{
                        left: row.left
                        leftMargin: 20
                        top: row.top
                    }

                    onClicked: stackview.pop()
                }
            }
        }
    }
}

/*##^##
Designer {
    D{i:0;autoSize:true;height:480;width:640}
}
##^##*/
