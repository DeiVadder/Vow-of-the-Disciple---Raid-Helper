import QtQuick 2.12
import QtQuick.Controls 2.12

ApplicationWindow {
    id: window
    width: 800
    height: 600
    visible: true
    title: qsTr("VOW OF THE DISCIPLE Helper App")

    header: ToolBar {
        id:mainHeader
        contentHeight: toolButton.implicitHeight

        ToolButton {
            id: toolButton
            text: /*stackView.depth > 1 ? "\u25C0" :*/ "\u2630"
            font.pixelSize: Qt.application.font.pixelSize * 1.6
            onClicked: {
                drawer.open()
            }
        }

        Label {

            anchors.centerIn: parent
        }

        Image {
            id: glyphNaming
            anchors{
                right: parent.right
                top: parent.top
                bottom: parent.bottom
                margins: parent.height / 8
            }
            width: height


            source: "qrc:/images/glyphs/neutral.png"
            MouseArea{
                anchors.fill: parent
                onClicked: drawerGlyphNaming.position != 0 ? drawerGlyphNaming.close() : drawerGlyphNaming.open()
            }
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
                text: qsTr("Glyphs")
                width: parent.width
                onClicked: {
                    drawer.close()
                    drawerGlyphNaming.open()
//                    stackView.pop(null)
//                    stackView.push("qrc:/GlyphNaming.qml")
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

    Drawer{
        id:drawerGlyphNaming
        width: window.width
        height: window.height - mainHeader.height
        y: mainHeader.height

        edge: Qt.RightEdge

        GlyphNaming{
            anchors.fill:parent

        }
    }

    StackView {
        id: stackView
//        initialItem: "qrc:/ResonanceCodePage.qml"
        initialItem: "qrc:/GreetingsPage.qml"
        anchors.fill: parent
    }
}
