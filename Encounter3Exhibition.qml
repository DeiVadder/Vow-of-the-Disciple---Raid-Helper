import QtQuick 2.15
import QtQuick.Controls 2.15

import Qt.labs.settings 1.0

Rectangle {
    id:root

    Settings{
        id:settings

        property int page0Selection1: -1
        property int page0Selection2: -1
        property int page1Selection1: -1
        property int page1Selection2: -1
        property int page2Selection1: -1
        property int page2Selection2: -1
        property int page3Selection1: -1
        property int page3Selection2: -1
        property int page4Selection1: -1
        property int page4Selection2: -1
    }

    Component.onDestruction: {
        settings.page0Selection1 = page0.selection1
        settings.page0Selection2 = page0.selection2
        settings.page1Selection1 = page1.selection1
        settings.page1Selection2 = page1.selection2
        settings.page2Selection1 = page2.selection1
        settings.page2Selection2 = page2.selection2
        settings.page3Selection1 = page3.selection1
        settings.page3Selection2 = page3.selection2
        settings.page4Selection1 = page4.selection1
        settings.page4Selection2 = page4.selection2
    }

    Rectangle {
        id: header
        anchors{
            left: parent.left
            right: parent.right
            top: parent.top
            margins: -1
        }
        border.color: "black"

        height: nextBtn.height

        ToolButton{
            id:nextBtn
            anchors.right: parent.right
            text: ">"
            onClicked: sView.incrementCurrentIndex()
        }
        ToolButton{
            id:previousBtn
            anchors.right: nextBtn.left
            text: "<"
            onClicked: sView.decrementCurrentIndex()
        }

        Text {
            id: roomId
            anchors{
                left: seperator.right
                top: parent.top
                bottom: parent.bottom
            }
            verticalAlignment: Text.AlignVCenter
            font: resetBtn.font
            text: sView.currentIndex == 0 ? qsTr("Map legend") : qsTr("Room %1").arg(sView.currentIndex)
        }

        Item{
            anchors.centerIn: parent
            width: parent.width - resetBtn.width * 2
            height: parent.height
            Image {
                id: glyph1
                anchors.right: glyph2.left
                anchors.rightMargin: 5
                visible: selection >= 0
                height: header.height
                width: height
                property int selection: sView.currentItem ? sView.currentItem.selection1 : -1
                source: selection >= 0 ? gSelection.glyphArray[selection] : ""

            }

            Image {
                id: glyph2
                anchors.horizontalCenter: parent.horizontalCenter
                visible: selection >= 0
                height: header.height
                width: height
                property int selection: sView.currentItem ? sView.currentItem.selection2 : -1
                source: selection >= 0 ? gSelection.glyphArray[selection] : ""
            }
        }

        ToolButton{
            id:resetBtn
            anchors.left: parent.left
            text: "Reset"
            onClicked: {
                sView.setCurrentIndex(1)
                page0.selection1 = -1
                page0.selection2 = -1
                page1.selection1 = -1
                page1.selection2 = -1
                page2.selection1 = -1
                page2.selection2 = -1
                page3.selection1 = -1
                page3.selection2 = -1
                page4.selection1 = -1
                page4.selection2 = -1
            }
        }
        ToolSeparator{
            id: seperator
            anchors{
                left: resetBtn.right
                top: parent.top
                bottom: parent.bottom
            }
        }
    }
    SwipeView{
        id:sView
        anchors{
            left: parent.left
            right: parent.right
            top: header.bottom
            bottom: parent.bottom
        }

        currentIndex: 0

        onCurrentIndexChanged: console.log("CurrentIndex changed", sView.currentItem, sView.currentItem.selection1)
        onCurrentItemChanged:{
            console.log("CurrentItem changed", sView.currentItem, sView.currentItem.selection1)
        }

        Rectangle{
            id:page0

            property int selection1: settings.page0Selection1
            property int selection2: settings.page0Selection2
            Image {
                anchors.fill: parent
                fillMode: Image.PreserveAspectFit
                source: "qrc:/images/Encounter3Exhibition/Legend.png"
            }
        }

        Rectangle {
            id:page1

            property int selection1: settings.page1Selection1
            property int selection2: settings.page1Selection2

            Image {
                id: page1RoomImg
                anchors.fill: parent
                source: "qrc:/images/Encounter3Exhibition/Room1.png"

                fillMode: Image.PreserveAspectFit

                Encounter3SelectionArea {
                    id: selectionArea11

                    x: parent.paintedWidth * 11 / 24 + (parent.width - parent.paintedWidth) / 2
                    y: (parent.height - parent.paintedHeight) / 2
                    height: parent.paintedHeight
                    width: parent.paintedWidth /5

                    selection: page1.selection1
                    glyphArray: gSelection.glyphArray

                    onClicked:{
                        gSelection.isSection1 = true
                        gSelection.visible = true
                    }
                }
            }
        }

        Rectangle {
            id:page2

            property int selection1: settings.page2Selection1
            property int selection2: settings.page2Selection2

            Image {
                id: page2RoomImg
                anchors.fill: parent
                source: "qrc:/images/Encounter3Exhibition/Room2.png"

                fillMode: Image.PreserveAspectFit

                Encounter3SelectionArea {
                    id: selectionArea21

                    x: parent.paintedWidth * 6 / 24 + (parent.width - parent.paintedWidth) / 2
                    y: (parent.height - parent.paintedHeight) / 2
                    height: parent.paintedHeight
                    width: parent.paintedWidth /5

                    selection: page2.selection1
                    glyphArray: gSelection.glyphArray

                    onClicked:{
                        gSelection.isSection1 = true
                        gSelection.visible = true
                    }
                }

                Encounter3SelectionArea {
                    id: selectionArea22

                    x: parent.paintedWidth * 25 / 48 + (parent.width - parent.paintedWidth) / 2
                    y: (parent.height - parent.paintedHeight) / 2
                    height: parent.paintedHeight
                    width: parent.paintedWidth /5

                    selection: page2.selection2
                    glyphArray: gSelection.glyphArray

                    onClicked:{
                        gSelection.isSection1 = false
                        gSelection.visible = true
                    }
                }
            }
        }

        Rectangle {
            id:page3

            property int selection1: settings.page3Selection1
            property int selection2: settings.page3Selection2

            Image {
                id: page3RoomImg
                anchors.fill: parent
                source: "qrc:/images/Encounter3Exhibition/Room3.png"

                fillMode: Image.PreserveAspectFit

                Encounter3SelectionArea {
                    id: selectionArea31

                    x: (parent.width - parent.paintedWidth) / 2
                    y: parent.paintedWidth * 10 / 24 +  (parent.height - parent.paintedHeight) / 2
                    height: parent.paintedHeight / 4.5
                    width: parent.paintedWidth

                    selection: page3.selection1
                    glyphArray: gSelection.glyphArray

                    onClicked:{
                        gSelection.isSection1 = true
                        gSelection.visible = true
                    }
                }

                Encounter3SelectionArea {
                    id: selectionArea32

                    x: (parent.width - parent.paintedWidth) / 2
                    y: parent.paintedWidth * 3.5 / 24 +  (parent.height - parent.paintedHeight) / 2
                    height: parent.paintedHeight / 5
                    width: parent.paintedWidth

                    selection: page3.selection2
                    glyphArray: gSelection.glyphArray

                    onClicked:{
                        gSelection.isSection1 = false
                        gSelection.visible = true
                    }
                }
            }
        }

        Rectangle {
            id:page4

            property int selection1: settings.page4Selection1
            property int selection2: settings.page4Selection2

            Image {
                id: page4RoomImg
                anchors.fill: parent
                source: "qrc:/images/Encounter3Exhibition/Room4.png"

                fillMode: Image.PreserveAspectFit

                Encounter3SelectionArea {
                    id: selectionArea41

                    x: (parent.width - parent.paintedWidth) / 2
                    y: parent.paintedWidth * 4.5 / 24 +  (parent.height - parent.paintedHeight) / 2
                    height: parent.paintedHeight / 6
                    width: parent.paintedWidth

                    selection: page4.selection1
                    glyphArray: gSelection.glyphArray

                    onClicked:{
                        gSelection.isSection1 = true
                        gSelection.visible = true
                    }
                }

                Encounter3SelectionArea {
                    id: selectionArea42

                    x: (parent.width - parent.paintedWidth) / 2
                    y:  parent.paintedWidth * 16.5 / 24 +  (parent.height - parent.paintedHeight) / 2
                    height: parent.paintedHeight / 5
                    width: parent.paintedWidth

                    selection: page4.selection2
                    glyphArray: gSelection.glyphArray

                    onClicked:{
                        gSelection.isSection1 = false
                        gSelection.visible = true
                    }
                }
            }
        }
    }

    GlyphSelection{
        id:gSelection
        anchors.fill: parent
        visible: false
        property bool isSection1: false
        onGlypSelected: {
            if(isSection1)
                sView.currentItem.selection1 = glyp
            else
                sView.currentItem.selection2 = glyp
            visible = false
        }
        onAbort: visible = false
    }
}
