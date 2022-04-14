import QtQuick 2.15
import QtQuick.Controls 2.15

import Qt.labs.settings 1.0

Rectangle {
    id:root

    property int selection1: -1
    property int selection2: -1
    property int selection3: -1

    Component.onCompleted: updateSelection()

    Component.onDestruction: {
        settings.enterSelectedGlyph = enter.selectedGlyph
        settings.giveSelectedGlyph = give.selectedGlyph
        settings.griefSelectedGlyph = grief.selectedGlyph
        settings.stopSelectedGlyph =  stop.selectedGlyph
        settings.knowledgeSelectedGlyph = knowledge.selectedGlyph
        settings.drinkSelectedGlyph =  drink.selectedGlyph
        settings.communeSelectedGlyph = commune.selectedGlyph
        settings.killSelectedGlyph = kill.selectedGlyph
        settings.worshipSelectedGlyph =  worship.selectedGlyph

    }

    Settings{
        id:settings
        property int enterSelectedGlyph: -1
        property int giveSelectedGlyph: -1
        property int griefSelectedGlyph: -1
        property int stopSelectedGlyph: -1
        property int knowledgeSelectedGlyph: -1
        property int drinkSelectedGlyph: -1
        property int communeSelectedGlyph: -1
        property int killSelectedGlyph: -1
        property int worshipSelectedGlyph: -1
    }


    function setFirstSelection(glyph){
        if(selection1 < 0)
            selection1 = glyph
        else if(selection2 < 0)
            selection2 = glyph
        else if (selection3 <0)
            selection3 = glyph
    }

    function updateSelection(){
        selection1 = -1
        selection2 = -1
        selection3 = -1

        if(enter.selectedGlyph >= 0)
            setFirstSelection(enter.selectedGlyph)
        if(give.selectedGlyph >= 0){
            setFirstSelection(give.selectedGlyph)
        }
         if(grief.selectedGlyph >= 0){
            setFirstSelection(grief.selectedGlyph)
        }
        if(stop.selectedGlyph >= 0){
            setFirstSelection(stop.selectedGlyph)
        }
        if(knowledge.selectedGlyph >= 0){
            setFirstSelection(knowledge.selectedGlyph)
        }
        if(drink.selectedGlyph >= 0){
            setFirstSelection(drink.selectedGlyph)
        }
        if(commune.selectedGlyph >= 0){
            setFirstSelection(commune.selectedGlyph)
        }
        if(kill.selectedGlyph >= 0){
            setFirstSelection(kill.selectedGlyph)
        }
        if(worship.selectedGlyph >= 0){
            setFirstSelection(worship.selectedGlyph)
        }
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
                enter.selectedGlyph = -1
                give.selectedGlyph = -1
                grief.selectedGlyph = -1
                stop.selectedGlyph = -1
                knowledge.selectedGlyph = -1
                drink.selectedGlyph = -1
                commune.selectedGlyph = -1
                kill.selectedGlyph = -1
                worship.selectedGlyph = -1

                updateSelection()
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
                visible: selection1 >= 0
                height: header.height
                width: height
                source: selection1 >= 0 ? gSelection.glyphArray[selection1] : ""
            }

            Image {
                id: glyph2
                anchors.horizontalCenter: parent.horizontalCenter
                visible: selection1 >= 0
                height: header.height
                width: height
                source: selection2 >= 0 ? gSelection.glyphArray[selection2] : ""
            }

            Image {
                id: glyph3
                anchors.left: glyph2.right
                anchors.leftMargin: 5
                visible: selection1 >= 0
                height: header.height
                width: height
                source: selection3 >= 0 ? gSelection.glyphArray[selection3] : ""
            }

            Text {
                anchors.fill: parent
                text: qsTr("Select glyphs by clicking on their room")
                wrapMode: Text.WordWrap
                font.pixelSize: 18
                horizontalAlignment: Text.AlignHCenter
                verticalAlignment: Text.AlignVCenter

                visible: !glyph1.visible && !glyph2.visible && !glyph3.visible
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
                selectedGlyph: settings.enterSelectedGlyph
                onClicked: {
                    gSelection.visible = true
                    gSelection.selectedItem = 0
                }
            }

            Encounter1AcquisitionItem {
                id: give
                x: parent.width * 0.5016
                y: parent.height * 0.0222

                originalSource: 9
                selectionArray: gSelection.glyphArray
                selectedGlyph: settings.giveSelectedGlyph
                onClicked: {
                    gSelection.visible = true
                    gSelection.selectedItem = 1
                }
            }

            Encounter1AcquisitionItem {
                id: grief
                x: parent.width * 0.7361
                y: parent.height * 0.0222

                originalSource: 10
                selectionArray: gSelection.glyphArray
                selectedGlyph: settings.griefSelectedGlyph
                onClicked: {
                    gSelection.visible = true
                    gSelection.selectedItem = 2
                }
            }

            Encounter1AcquisitionItem {
                id: stop
                x: parent.width * 0.8821
                y: parent.height * 0.3148

                originalSource: 21
                selectionArray: gSelection.glyphArray
                selectedGlyph: settings.stopSelectedGlyph
                onClicked: {
                    gSelection.visible = true
                    gSelection.selectedItem = 3
                }
            }

            Encounter1AcquisitionItem {
                id: knowledge
                x: parent.width * 0.8808
                y: parent.height * 0.5444

                originalSource: 14
                selectionArray: gSelection.glyphArray
                selectedGlyph: settings.knowledgeSelectedGlyph
                onClicked: {
                    gSelection.visible = true
                    gSelection.selectedItem = 4
                }
            }

            Encounter1AcquisitionItem {
                id: drink
                x: parent.width * 0.8808
                y: parent.height * 0.7296

                originalSource: 5
                selectionArray: gSelection.glyphArray
                selectedGlyph: settings.drinkSelectedGlyph
                onClicked: {
                    gSelection.visible = true
                    gSelection.selectedItem = 5
                }
            }

            Encounter1AcquisitionItem {
                id: commune
                x: parent.width * 0.5602
                y: parent.height * 0.8352

                originalSource: 3
                selectionArray: gSelection.glyphArray
                selectedGlyph: settings.communeSelectedGlyph
                onClicked: {
                    gSelection.visible = true
                    gSelection.selectedItem = 6
                }
            }

            Encounter1AcquisitionItem {
                id: kill
                x: parent.width * 0.2658
                y: parent.height * 0.7296

                originalSource: 13
                selectionArray: gSelection.glyphArray
                selectedGlyph: settings.killSelectedGlyph
                onClicked: {
                    gSelection.visible = true
                    gSelection.selectedItem = 7
                }
            }

            Encounter1AcquisitionItem {
                id: worship
                x: parent.width * 0.1603
                y: parent.height * 0.3139

                originalSource: 26
                selectionArray: gSelection.glyphArray
                selectedGlyph: settings.worshipSelectedGlyph
                onClicked: {
                    gSelection.visible = true
                    gSelection.selectedItem = 8
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
            case 0: enter.selectedGlyph = glyp; break;
            case 1: give.selectedGlyph = glyp; break;
            case 2: grief.selectedGlyph = glyp; break;
            case 3: stop.selectedGlyph = glyp; break;
            case 4: knowledge.selectedGlyph = glyp; break;
            case 5: drink.selectedGlyph = glyp; break;
            case 6: commune.selectedGlyph = glyp; break;
            case 7: kill.selectedGlyph = glyp; break;
            case 8: worship.selectedGlyph = glyp; break;
            }
            gSelection.visible = false

            updateSelection()
        }
    }
}
