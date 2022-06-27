import QtQuick 2.12
import QtQuick.Controls 2.12

import Qt.labs.settings 1.0

Rectangle {
    id:root

    property var indexArrayOFGlyps: [18, 9, 4, 23, 26, 15, 21, 11, 13]

    property int selection1: settings.resonanceCodeSelection1
    property int selection2: settings.resonanceCodeSelection2
    property int selection3: settings.resonanceCodeSelection3

    Component.onDestruction: {
        settings.resonanceCodeSelection1 = root.selection1
        settings.resonanceCodeSelection2 = root.selection2
        settings.resonanceCodeSelection3 = root.selection3
    }

    Settings{
        id:settings
        property int resonanceCodeSelection1: -1
        property int resonanceCodeSelection2: -1
        property int resonanceCodeSelection3: -1
    }

    ScrollView{
        anchors.fill: parent
        contentWidth: root.width
        Image {
            id: background
            width: root.width
            source: "qrc:/images/ResonanceCode-SecretRooms/ShortGuide.jpeg"

            fillMode: Image.PreserveAspectFit

            Rectangle{
                id:customSelection
                border.width: 1
                border.color: "black"
                color: "transparent"

                Text {
                    id:textItem
                    text: qsTr("Select here")
                    wrapMode: Text.WordWrap
                    width: parent.width
                    horizontalAlignment: Text.AlignHCenter
                    height: background.height *0.033
                    fontSizeMode: Text.Fit
                    padding: 2

                    minimumPixelSize: 2; font.pixelSize: 72
                }

                x: background.width * 0.032 // 83 by 2550
                y: background.height * 0.0358 //118 by 3300
                width: background.width * 0.1067//272 by 2550
                height: background.height * 0.2055 //678 by 3300

                property int itemHeight: ((customSelection.height - textItem.height)/ 3) -4
                Rectangle{
                    id:btn1
                    anchors.top: textItem.bottom
                    anchors.topMargin: 2
                    x: 2
                    width: parent.width - 4
                    height: parent.itemHeight
                    color: selection1 < 0 ? "#A9AAAAAA" : "transparent"

                    Image {
                        anchors.fill: parent
                        fillMode: Image.PreserveAspectFit
                        source: selection1 < 0 ? undefined : gSelection.glyphArray[selection1]
                        visible: selection1 >= 0
                    }

                    MouseArea{
                        anchors.fill: parent
                        onClicked: {
                            gSelection.selectionFor = 1
                            gSelection.visible = true
                        }
                    }
                }

                Rectangle{
                    id:btn2
                    anchors.top: btn1.bottom
                    anchors.topMargin: 2
                    x: 2
                    width: parent.width -4
                    height: parent.itemHeight
                    color: selection2 < 0 ? "#A9AAAAAA" : "transparent"

                    Image {
                        anchors.fill: parent
                        fillMode: Image.PreserveAspectFit
                        source: selection2 < 0 ? undefined : gSelection.glyphArray[selection2]
                        visible: selection2 >= 0
                    }

                    MouseArea{
                        anchors.fill: parent
                        onClicked: {
                            gSelection.selectionFor = 2
                            gSelection.visible = true
                        }
                    }
                }

                Rectangle{
                    id:btn3
                    anchors.top: btn2.bottom
                    anchors.topMargin: 2
                    x: 2
                    width: parent.width - 4
                    height: parent.itemHeight
                    color: selection3 < 0 ? "#A9AAAAAA" : "transparent"

                    Image {
                        anchors.fill: parent
                        fillMode: Image.PreserveAspectFit
                        source: selection3 < 0 ? undefined : gSelection.glyphArray[selection3]
                        visible: selection3 >= 0
                    }

                    MouseArea{
                        anchors.fill: parent
                        onClicked: {
                            gSelection.selectionFor = 3
                            gSelection.visible = true
                        }
                    }
                }
            }

            Rectangle{
                id:pyramid
                color: selection1 == 18 || selection2 == 18 || selection3 == 18 ? "transparent" : "#A9AAAAAA"
                y: background.height * 0.2903
                width: parent.width
                height: background.height * 0.0582
            }

            Rectangle{
                id:give
                color: selection1 == 9 || selection2 == 9 || selection3 == 9 ? "transparent" : "#A9AAAAAA"
                anchors.top: pyramid.bottom
                width: parent.width
                height: background.height * 0.055
            }
            Rectangle{
                id:darkness
                color: selection1 == 4 || selection2 == 4 || selection3 == 4 ? "transparent" : "#A9AAAAAA"
                anchors.top: give.bottom
                width: parent.width
                height: background.height * 0.0582
            }

            Rectangle{
                id:traveler
                color: selection1 == 23 || selection2 == 23 || selection3 == 23 ? "transparent" : "#A9AAAAAA"
                y: background.height * 0.5033
                width: parent.width
                height: background.height * 0.0521
            }

            Rectangle{
                id:worship
                color: selection1 == 26 || selection2 == 26 || selection3 == 26 ? "transparent" : "#A9AAAAAA"
                y: background.height * 0.5897
                width: parent.width
                height: background.height * 0.0606
            }

            Rectangle{
                id:light
                color: selection1 == 15 || selection2 == 15 || selection3 == 15 ? "transparent" : "#A9AAAAAA"
                anchors.top: worship.bottom
                width: parent.width
                height: background.height * 0.065
            }

            Rectangle{
                id:stop
                color: selection1 == 21 || selection2 == 21 || selection3 == 21 ? "transparent" : "#A9AAAAAA"
                anchors.top: light.bottom
                width: parent.width
                height: background.height * 0.0675
            }

            //Before Boss Encounter
            Rectangle{
                id:guardian
                color: selection1 == 11 || selection2 == 11 || selection3 == 11 ? "transparent" : "#A9AAAAAA"
                y: background.height * 0.8145
                width: parent.width
                height: background.height * 0.0721
            }

            Rectangle{
                id:kill
                color: selection1 == 13 || selection2 == 13 || selection3 == 13 ? "transparent" : "#A9AAAAAA"
                anchors.top: guardian.bottom
                width: parent.width
                height: background.height * 0.0721
            }
        }
    }

    GlyphSelection{
        id:gSelection
        property int selectionFor: -1

        visible: false

        anchors.fill: parent

        onGlypSelected:{
            gSelection.visible = false
            switch(selectionFor){
                case 1: selection1 = glyp; break;
                case 2: selection2 = glyp; break;
                case 3: selection3 = glyp; break;
            }
        }
        onAbort: {
            gSelection.visible = false
        }
    }
}
