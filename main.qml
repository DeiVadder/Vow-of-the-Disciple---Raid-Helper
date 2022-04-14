import QtQuick 2.15
import QtQuick.Controls 2.15

ApplicationWindow {
    id: window
    width: 800
    height: 600
    visible: true
    title: qsTr("VOW OF THE DISCIPLE Helper App")

    header: ToolBar {
        contentHeight: toolButton.implicitHeight

        ToolButton {
            id: toolButton
            text: /*stackView.depth > 1 ? "\u25C0" :*/ "\u2630"
            font.pixelSize: Qt.application.font.pixelSize * 1.6
            onClicked: {
                drawer.open()
//                if (stackView.depth > 1) {
//                    stackView.pop()
//                } else {
//                    drawer.open()
//                }
            }
        }

        Label {
//            text: stackView.currentItem.title
            anchors.centerIn: parent
        }
    }

    Drawer {
        id: drawer
        width: window.width * 0.66
        height: window.height

        Column {
            anchors.fill: parent

            ItemDelegate {
                text: qsTr("Disciple's Bog")
                width: parent.width
                enabled: false
                onClicked: {
                    drawer.close()
                }
            }
            ItemDelegate {
                text: qsTr("Encounter 1 - Acquisitions")
                width: parent.width
                onClicked: {
                    drawer.close()
                    stackView.pop(null)
                    stackView.push("qrc:/Encounter1Acquisitions.qml")
                }
            }

            ItemDelegate{
                text: qsTr("Encounter 2 - Caretaker")

                width: parent.width
                enabled: false
                onClicked: {
                    drawer.close()
                }
            }

            ItemDelegate{
                text: qsTr("Encounter 3 - Exhibition")

                width: parent.width
                onClicked: {
                    drawer.close()
                    stackView.pop(null)
                    stackView.push("qrc:/Encounter3Exhibition.qml")
                }
            }

            ItemDelegate{
                text: qsTr("Encounter 4 - Rhulk")
                width: parent.width
                onClicked: {
                    drawer.close()
                    stackView.pop(null)
                    stackView.push("qrc:/Encounter4Rhulk.qml")
                }
            }

            ItemDelegate{
                text: qsTr("Resonance code - Secret rooms")
                width: parent.width
                onClicked: {
                    drawer.close()
                    stackView.pop(null)
                    stackView.push("qrc:/ResonanceCodePage.qml")
                }
            }

            ItemDelegate{
                text: qsTr("Settings")
                width: parent.width
                enabled: false
                onClicked: {
                    drawer.close()
                }
            }
        }
    }

    StackView {
        id: stackView
//        initialItem: "qrc:/ResonanceCodePage.qml"
        initialItem: "qrc:/GreetingsPage.qml"
        anchors.fill: parent
    }
}
