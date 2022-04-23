import QtQuick 2.0
import QtQuick.Controls 2.3



Item {
    anchors.fill: parent
    StackView{
        property string language: ""
        property int trials: 0


        id:stackview
        anchors.fill: parent
        initialItem: "home.qml"

    }
}
