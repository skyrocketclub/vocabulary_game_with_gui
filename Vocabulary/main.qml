import QtQuick 2.15
import QtQuick.Window 2.15
import QtQuick.Controls 2.3

import com.company.backend 1.0
import "Code.js" as Code


/*

  The aim is to download the following pictures for the following game pages
      There is a timer, the timer emits a signal after every three seconds
      if the signal is emmitted, the source is changed... and this is implemented in all the pages

  1. home game ( three pictures tagged 1 , 2 , 3 )... That change every 3 seconds
  2. spanish --- 3 pictures
  3. Igbo --- 3 pictures



  */
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
