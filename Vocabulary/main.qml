import QtQuick 2.15
import QtQuick.Window 2.15
import QtQuick.Controls 2.3

import com.company.backend 1.0




ApplicationWindow {
    id: window
    width: 640
    height: 480
    visible: true
    title: qsTr("VOCABULARY GAME")

    property string language: ""
    property int trials: 0

    Loader{
        id: mainloader
        anchors.fill: parent
        source:"StackViewPage.qml"
    }



}
