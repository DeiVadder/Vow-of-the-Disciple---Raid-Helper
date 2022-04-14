import QtQuick 2.15
import QtQuick.Controls 2.15

Rectangle {
    id: enter

    width: parent.width * 0.0761
    height: parent.height * 0.1148

    signal clicked()

    property int originalSource: 7
    property int selectedGlyph: -1
    property var selectionArray: undefined
    color: selectedGlyph < 0 ? "transparent" : "darkgreen"
    border.width: selectedGlyph < 0 ? 0 : 1


    Image {
        id: enterImg
        anchors.fill: parent
        source:  selectionArray[parent.selectedGlyph < 0 ? parent.originalSource : parent.selectedGlyph]
    }

    MouseArea{
        anchors.fill: parent
        onClicked: {
            enter.clicked()

        }
    }
}
