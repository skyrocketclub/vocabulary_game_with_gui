import QtQuick 2.0
import QtQuick.Controls
import com.company.backend 1.0

Item{
    property string imagesource: "qrc:/images/"+imagecount
    property int imagecount: 1

    Component.onCompleted: {
        backend.timeoutStart
    }

    Rectangle{
        anchors.fill: parent

        Image{
            anchors.fill: parent
            source: imagesource
            fillMode: Image.PreserveAspectFit
            opacity: 0.1
            visible: true
        }

        Backend{
             id: backend
             onChangePicture: {
                 if(imagecount === 9){
                     imagecount = 1
                 }
                 else{
                     imagecount++
                 }
             }
        }

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
                anchors.horizontalCenter: parent.horizontalCenter
                onClicked:{
                    backend.timeoutStop
                    stackview.push("chooselang.qml")
                }
            }
        }
}
}
