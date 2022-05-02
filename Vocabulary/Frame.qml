import QtQuick 2.0



    Rectangle{
        property string imagesource: "qrc:/images/1.jpg"
        property int imagecount: 1
//        anchors.fill: parent

        Image{
            anchors.fill: parent
            source: "qrc:/images/1.jpg"
            fillMode: Image.PreserveAspectFit
            opacity: 0.5
            visible: true
        }
    }

