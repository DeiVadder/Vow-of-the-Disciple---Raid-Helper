import QtQuick 2.12
import QtQuick.Controls 2.12

import Qt.labs.settings 1.0

Rectangle {
    id:root

    property int selection1: -1
    property int selection2: -1
    property int selection3: -1

    Component.onCompleted:{ /*updateSelection()*/
        selection1 = settings.acquisitionSelection1
        selection2 = settings.acquisitionSelection2
        selection3 = settings.acquisitionSelection3
    }

    Component.onDestruction: {
        settings.acquisitionSelection1 = selection1
        settings.acquisitionSelection2 = selection2
        settings.acquisitionSelection3 = selection3
    }

    Settings{
        id:settings
        property int acquisitionSelection1: -1
        property int acquisitionSelection2: -1
        property int acquisitionSelection3: -1
    }


    function setFirstSelection(glyph){
        if(selection1 < 0)
            selection1 = glyph
        else if(selection2 < 0)
            selection2 = glyph
        else if (selection3 <0)
            selection3 = glyph
    }

    function findFirstUnused() {
        if(selection1 < 0)
            return 1;
        if(selection2 < 0)
            return 2;
        if(selection3 < 0)
            return 3;
        return 0;
    }

    Rectangle{
        id:header
        x:-1
        y:-1
        width: parent.width +2
        height: tButton.height +1

        border.color: "black"

        ToolButton{
            id:tButton
            anchors.right: parent.right
            font.pixelSize: Qt.application.font.pixelSize * 1.6
            text: "Reset"
            onClicked: {
                selection1 = -1
                selection2 = -1
                selection3 = -1
            }
        }

        Item{
            anchors.centerIn: parent
            width: parent.width - tButton.width * 2
            height: parent.height
            Image {
                id: glyph1
                anchors.right: glyph2.left
                anchors.rightMargin: 5
                opacity: selection1 >= 0 ? 1 : 0.5
                height: header.height
                width: height
                source: selection1 >= 0 ? gSelection.glyphArray[selection1] : gSelection.glyphArray[17]

                MouseArea{
                    anchors.fill: parent
                    onClicked: {
                        gSelection.visible = true
                        gSelection.selectedItem = 1
                    }
                }
            }

            Image {
                id: glyph2
                anchors.horizontalCenter: parent.horizontalCenter
                opacity: selection2 >= 0 ? 1 : 0.5
                height: header.height
                width: height
                source: selection2 >= 0 ? gSelection.glyphArray[selection2] : gSelection.glyphArray[17]

                MouseArea{
                    anchors.fill: parent
                    onClicked: {
                        gSelection.visible = true
                        gSelection.selectedItem = 2
                    }
                }
            }

            Image {
                id: glyph3
                anchors.left: glyph2.right
                anchors.leftMargin: 5
                opacity: selection3 >= 0 ? 1 : 0.5

                height: header.height
                width: height
                source: selection3 >= 0 ? gSelection.glyphArray[selection3] : gSelection.glyphArray[17]

                MouseArea{
                    anchors.fill: parent
                    onClicked: {
                        gSelection.visible = true
                        gSelection.selectedItem = 3
                    }
                }
            }

            Text {
                anchors.fill: parent
                text: qsTr("Select glyphs by clicking on one of the symbols")
                wrapMode: Text.WordWrap
                font.pixelSize: 18
                horizontalAlignment: Text.AlignHCenter
                verticalAlignment: Text.AlignVCenter
                visible: glyph1.opacity != 1 && glyph2.opacity != 1 && glyph3.opacity != 1
            }
        }

    }

    ScrollView{
        anchors{
            left: parent.left
            right: parent.right
            top: header.bottom
            bottom: parent.bottom
        }

        contentHeight: root.height - header.height

        Image {
            id: mainImage
            height: root.height - header.height
            fillMode: Image.PreserveAspectFit
            source: "qrc:/images/Encounter1Acquisitions/Encounter1Acquisitions.png"

            //RoomGlyps to click
            Encounter1AcquisitionItem {
                id: enter
                x: parent.width * 0.2664
                y: parent.height * 0.0222

                originalSource: 7
                selectionArray: gSelection.glyphArray
                onClicked: {
                    gSelection.visible = true
                    gSelection.selectedItem = findFirstUnused()
                }
            }

            Encounter1AcquisitionItem {
                id: give
                x: parent.width * 0.5016
                y: parent.height * 0.0222

                originalSource: 9
                selectionArray: gSelection.glyphArray
                onClicked: {
                    gSelection.visible = true
                    gSelection.selectedItem = findFirstUnused()
                }
            }

            Encounter1AcquisitionItem {
                id: grief
                x: parent.width * 0.7361
                y: parent.height * 0.0222

                originalSource: 10
                selectionArray: gSelection.glyphArray
                onClicked: {
                    gSelection.visible = true
                    gSelection.selectedItem = findFirstUnused()
                }
            }

            Encounter1AcquisitionItem {
                id: stop
                x: parent.width * 0.8821
                y: parent.height * 0.3148

                originalSource: 21
                selectionArray: gSelection.glyphArray
                onClicked: {
                    gSelection.visible = true
                    gSelection.selectedItem = findFirstUnused()
                }
            }

            Encounter1AcquisitionItem {
                id: knowledge
                x: parent.width * 0.8808
                y: parent.height * 0.5444

                originalSource: 14
                selectionArray: gSelection.glyphArray
                onClicked: {
                    gSelection.visible = true
                    gSelection.selectedItem = findFirstUnused()
                }
            }

            Encounter1AcquisitionItem {
                id: drink
                x: parent.width * 0.8808
                y: parent.height * 0.7296

                originalSource: 5
                selectionArray: gSelection.glyphArray
                onClicked: {
                    gSelection.visible = true
                    gSelection.selectedItem = findFirstUnused()
                }
            }

            Encounter1AcquisitionItem {
                id: commune
                x: parent.width * 0.5602
                y: parent.height * 0.8352

                originalSource: 3
                selectionArray: gSelection.glyphArray
                onClicked: {
                    gSelection.visible = true
                    gSelection.selectedItem = findFirstUnused()
                }
            }

            Encounter1AcquisitionItem {
                id: kill
                x: parent.width * 0.2658
                y: parent.height * 0.7296

                originalSource: 13
                selectionArray: gSelection.glyphArray
                onClicked: {
                    gSelection.visible = true
                    gSelection.selectedItem = findFirstUnused()
                }
            }

            Encounter1AcquisitionItem {
                id: worship
                x: parent.width * 0.1603
                y: parent.height * 0.3139

                originalSource: 26
                selectionArray: gSelection.glyphArray
                onClicked: {
                    gSelection.visible = true
                    gSelection.selectedItem = findFirstUnused()
                }
            }

        }
    }

    GlyphSelection{
        id:gSelection
        anchors.fill:parent
        visible: false

        property int selectedItem: -1

        onGlypSelected: {
            switch(selectedItem){
            case 1: selection1 = glyp; break;
            case 2: selection2 = glyp; break;
            case 3: selection3 = glyp; break;
            }

            gSelection.visible = false
        }
    }
}
