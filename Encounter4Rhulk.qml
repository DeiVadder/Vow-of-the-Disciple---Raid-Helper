import QtQuick 2.12
import QtQuick.Controls 2.12

import Qt.labs.settings 1.0

Rectangle {
    id: root

    property int selection: settings.encounter4Selection

    Component.onDestruction: settings.encounter4Selection = selection

    Settings{
        id:settings
        property int encounter4Selection: -1
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

        height: resetBtn.height

        Image {
            id: glyph1
            anchors.horizontalCenter: parent.horizontalCenter
            anchors.verticalCenter: parent.verticalCenter
            visible: selection >= 0
            height: header.height
            width: height
            source: selection >= 0 ? gSelection.glyphArray[selection] : ""
        }

        ToolButton{
            id:resetBtn
            anchors{
                right: parent.right
                top: parent.top

            }

            text: qsTr("Reset")
            onClicked: selection = -1
        }
    }

    Image {
        anchors{
            left: parent.left
            right: parent.right
            top: header.bottom
            bottom: parent.bottom
        }

        fillMode: Image.PreserveAspectFit
        source: "qrc:/images/Encounter4Rhulk/sS35NXv.png"

        Encounter3SelectionArea{

            x: (parent.width - parent.paintedWidth) / 2
            y: parent.paintedWidth * 17 / 24 +  (parent.height - parent.paintedHeight) / 2
            height: parent.paintedHeight / 6
            width: parent.paintedWidth

            image.horizontalAlignment: Image.AlignRight

            selection: root.selection
            glyphArray: gSelection.glyphArray

            color: selection < 0 ? "#77FFFFFF" : "#40FFFFFF"
            text: selection < 0 ? "Select\nmatching\nglyph" : ""

            onClicked:{
                gSelection.visible = true
            }

        }
    }

    GlyphSelection{
        id:gSelection
        visible: false
        anchors.fill: parent

        onGlypSelected: {
            root.selection = glyp
            visible = false
        }
        onAbort: visible = false
    }
}
