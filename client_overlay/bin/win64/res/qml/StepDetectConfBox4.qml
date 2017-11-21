import QtQuick 2.7
import QtQuick.Controls 2.0
import QtQuick.Layouts 1.3

GroupBox {
    property string boxTitle: "Step Touch Pad Conf"

    property double walkTouch : 0.6
    property double jogTouch : 0.9
    property double runTouch : 1.0

    property double thresholdStep: 0.01

    property int keyboardUIDBase: 200

    property var setWalkTouch: function(w) {}
    property var setJogTouch: function(j) {}
    property var setRunTouch: function(r) {}
    property var updateValues: function() {}

    function updateGUI() {
        walkTouchInputField.text = walkTouch.toFixed(2)
        jogTouchInputField.text = jogTouch.toFixed(2)
        runTouchInputField.text = runTouch.toFixed(2)
    }

    Layout.fillWidth: true

    label: MyText {
        leftPadding: 10
        text: parent.boxTitle
        bottomPadding: -10
    }

    background: Rectangle {
        color: "transparent"
        border.color: "#ffffff"
        radius: 8
    }


    ColumnLayout {
        anchors.fill: parent

        Rectangle {
            color: "#ffffff"
            height: 1
            Layout.fillWidth: true
            Layout.bottomMargin: 5
        }

        GridLayout {
            columns: 6

            MyText {
                text: "Walk Touch:"
                Layout.fillWidth: true
                horizontalAlignment: Text.AlignHCenter
                Layout.preferredWidth: 240
            }

            MyText {
                text: " "
                Layout.preferredWidth: 100
            }

            MyText {
                text: "Jog Touch:"
                Layout.fillWidth: true
                horizontalAlignment: Text.AlignHCenter
                Layout.preferredWidth: 240
            }

            MyText {
                text: " "
                Layout.preferredWidth: 100
            }

            MyText {
                text: "Run Touch:"
                Layout.fillWidth: true
                horizontalAlignment: Text.AlignHCenter
                Layout.preferredWidth: 240
            }

            MyText {
                text: " "
                Layout.preferredWidth: 100
            }
        }

        GridLayout {
            columns: 12

            MyPushButton2 {
                id: walkTouchMinusButton
                Layout.preferredWidth: 40
                text: "-"
                onClicked: {
                    var value = walkTouch - thresholdStep
                    if (value < -1) {
                        value = -1
                    }
                    walkTouch = value
                    setWalkTouch(value)
                }
            }

            MyTextField {
                id: walkTouchInputField
                text: "0.6"
                keyBoardUID: keyboardUIDBase
                Layout.preferredWidth: 140
                Layout.leftMargin: 10
                Layout.rightMargin: 10
                horizontalAlignment: Text.AlignHCenter
                function onInputEvent(input) {
                    var val = parseFloat(input)
                    if (!isNaN(val)) {
                        if (val < -1) {
                            val = -1
                        } else if (val > 1.0) {
                            val = 1.0
                        }
                        walkTouch = val
                        setWalkTouch(value)
                    } 
                }
            }

            MyPushButton2 {
                id: walkTouchPlusButton
                Layout.preferredWidth: 40
                text: "+"
                onClicked: {
                    var value = walkTouch + thresholdStep
                    if (value > 1.0) {
                        value = 1.0
                    }
                    walkTouch = value  
                    setWalkTouch(value)                  
                }
            }

            MyText {
                text: " "
                Layout.preferredWidth: 100
            }

            MyPushButton2 {
                id: jogTouchMinusButton
                Layout.preferredWidth: 40
                text: "-"
                onClicked: {
                    var value = jogTouch - thresholdStep
                    if (value < -1) {
                        value = -1
                    }
                    jogTouch = value
                    setJogTouch(value)
                }
            }

            MyTextField {
                id: jogTouchInputField
                text: "0.9"
                keyBoardUID: keyboardUIDBase
                Layout.preferredWidth: 140
                Layout.leftMargin: 10
                Layout.rightMargin: 10
                horizontalAlignment: Text.AlignHCenter
                function onInputEvent(input) {
                    var val = parseFloat(input)
                    if (!isNaN(val)) {
                        if (val < -1) {
                            val = -1
                        } else if (val > 1.0) {
                            val = 1.0
                        }
                        jogTouch = val
                        setJogTouch(val)
                    } 
                }
            }

            MyPushButton2 {
                id: jogTouchPlusButton
                Layout.preferredWidth: 40
                text: "+"
                onClicked: {
                    var value = jogTouch + thresholdStep
                    if (value > 1.0) {
                        value = 1.0
                    }
                    jogTouch = value
                    setJogTouch(value)
                }
            }

            MyText {
                text: " "
                Layout.preferredWidth: 100
            }

            MyPushButton2 {
                id: runTouchMinusButton
                Layout.preferredWidth: 40
                text: "-"
                onClicked: {
                    var value = runTouch - thresholdStep
                    if (value < -1) {
                        value = -1
                    }
                    runTouch = value
                    setRunTouch(value)
                }
            }

            MyTextField {
                id: runTouchInputField
                text: "1.0"
                keyBoardUID: keyboardUIDBase
                Layout.preferredWidth: 140
                Layout.leftMargin: 10
                Layout.rightMargin: 10
                horizontalAlignment: Text.AlignHCenter
                function onInputEvent(input) {
                    var val = parseFloat(input)
                    if (!isNaN(val)) {
                        if (val < -1) {
                            val = -1
                        } else if (val > 1.0) {
                            val = 1.0
                        }
                        runTouch = val
                        setRunTouch(val)
                    } 
                }
            }

            MyPushButton2 {
                id: runTouchPlusButton
                Layout.preferredWidth: 40
                text: "+"
                onClicked: {
                    var value = runTouch + thresholdStep
                    if (value > 1.0) {
                        value = 1.0
                    }
                    runTouch = value
                    setRunTouch(value)
                }
            }

            MyText {
                text: " "
                Layout.preferredWidth: 100
            }

        }
    }
}