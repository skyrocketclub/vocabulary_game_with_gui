import QtQuick 2.0
import QtQuick.Controls 2.3
import "Code.js" as Code
import com.company.backend 1.0



/*
  1b - make a property called counter, reflect the counter in the box
  2 - add a label saying . enter the translation and press enter
  4 - Upon reaching the total number of words, go to a new page and show the  score and ask
        Play again? or Quit?
  3 - Make the counter label to be centered in the rectangleee

  5 - Add pictures for each of the screens
  6 - Add words for the Igbo Version, Add Igbo pictures
  */
Item {
    id:gameon
    property string language: ""
    property int trials: 0
    property int numberOfTrials: 0
    property int points: 0
    property int tried:0
    property string gameword: ""
    property string english: ""
    property string spanish: "WORD"
    property int loadstatus: 0
    property string attempt: ""
    property string correction: ""



    Rectangle{
        id: rectangle
        color: "#e6f0f0"
        anchors.fill: parent
        anchors.rightMargin: 0
        anchors.bottomMargin: 0
        anchors.leftMargin: 0
        anchors.topMargin: 0

        Backend{
            id:backend
        }

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
                        text: spanish
                        anchors.verticalCenter: parent.verticalCenter
                        font.family: "Courier"
                        font.pointSize: 30
                        anchors.horizontalCenter: parent.horizontalCenter
                    }
                }

                Column {
                    id: column1
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

                        onTextChanged: attempt = textField.text

                        onEditingFinished: {
                            button1.clicked = true
//                            button2.enabled= true
//                            button1.enabled=false


//                            attempt = attempt.toUpperCase()
//                            console.log("IS "+ attempt + " = " + english)
//                            var results = attempt.localeCompare(english)
//                            if(results == 0){
//                                points++;
//                                label.text = "CORRECT";
//                                rectangle2.color = "green";
//                            }else{
//                                console.log("Trials: "+ trials + "Points: "+ points)
//                                label.text = "WRONG";
//                                rectangle2.color = "red";
//                                correct.visible = true
//                            }
                        }
                    }

                    Button {
                        id: button1
                        text: qsTr("Enter")
                        height: textField.height
                        width:textField.width
                        anchors{
                            left: textField.left
                            top: parent.top
                            topMargin: 10
                            bottom: textField.top
                            bottomMargin: 5
                        }
                        onClicked:{
                            button2.enabled= true
                            button1.enabled=false


                            attempt = attempt.toUpperCase()
                            console.log("IS "+ attempt + " = " + english)
                            var results = attempt.localeCompare(english)
                            if(results == 0){
                                points++
//                                trials--
                                label.text = "CORRECT";
                                rectangle2.color = "green";
                            }else{
                                console.log("Trials: "+ trials)
                                label.text = "WRONG";
                                rectangle2.color = "red";
                                correct.visible = true
                            }
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

                    Label {
                        id: correct
                        text: "( " + english + " )"
                        font.family: "Courier"
                        font.pointSize: 12
                        visible: false
                        anchors{
                            bottom: rectangle2.bottom
                            bottomMargin: 10
                            horizontalCenter: parent.horizontalCenter
                        }
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

                Rectangle{
                    id:labelshow
                    width: button.width
                    height: row1.height
                    color: "lightgrey"
                    anchors.left: row1.left

                    Label {
                        id: label2
                        anchors.centerIn: labelshow
                        width: row1.width /3
                        height: row1.height
                        text: tried + " / "+ numberOfTrials
                        font.family: "Courier"
                        font.pointSize: 30
                    }
                }



                Button {
                    id: button2
                    text: qsTr("Next")
                    font.pointSize: 30
                    font.family: "Courier"
                    width: button.width
                    height: row1.height
                    anchors{
                        horizontalCenter: row1.horizontalCenter
                        left: label2.right
                    }
                    onClicked: {
                        button2.enabled= false
                        button1.enabled=true
                        correct.visible = false


                        if(trials == 0){
                            console.log("Points: "+points+" trials "+ numberOfTrials)
                            root.percentage = Code.finalScore(points,numberOfTrials)
                            stackview.push("end.qml")
                        }
                        else{
                            textField.focus= true
                            tried++
                            trials--
                            gameword = backend.language
                            spanish = Code.spanishget(gameword)
                            english = Code.englishget(gameword)



                            textField.text = ""
                            label.text=""
                            rectangle2.color = "white"
                        }

                    }
                }

                Button {
                    id: button
                    width: rectangle2.width
                    height: row1.height
                    text: qsTr("QUIT")
                    font.family: "Courier"
                    font.pointSize: 30
                    anchors{
                        left: button2.right
                    }
                    onClicked: Qt.quit()
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
                    text:gameon.trials + " Words left"
                    font.family: "Courier"
                    font.pointSize: 20
                    anchors{
                        right:row2.right
                        rightMargin: 50
                    }
                }

                Label {
                    id: label4
                    text: gameon.language
                    font.family: "Courier"
                    font.pointSize: 20
                    anchors{
                        left:row2.left
                        leftMargin: 50
                    }
                }
                Component.onCompleted: {
                    button1.enabled=false
                    gameon.language = root.language
                    gameon.trials = root.trials
                    numberOfTrials = gameon.trials
                    loadstatus = backend.load
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
