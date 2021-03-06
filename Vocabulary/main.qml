import QtQuick 2.15
import QtQuick.Window 2.15
import QtQuick.Controls 2.3

import com.company.backend 1.0

ApplicationWindow {
    id: root
    width: 640
    height: 480
    visible: true
    title: qsTr("VOCABULARY GAME")

    property string language: ""
    property int trials: 0
    property string gameword: ""
    property int percentage: 0


    Backend{
        id:backend
    }



    Loader{
        id: mainloader
        anchors.fill: parent
            StackView{
                id:stackview
                anchors.fill: parent
                initialItem: "home.qml"
            }
    }
}
