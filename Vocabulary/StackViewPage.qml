import QtQuick 2.0
import QtQuick.Controls 2.3

Item {
    anchors.fill: parent
    StackView{
        id:stackview
        anchors.fill: parent
        initialItem: "home.qml"
    }
}
