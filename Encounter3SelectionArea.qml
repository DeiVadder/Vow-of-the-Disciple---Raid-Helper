import QtQuick 2.12
import QtQuick.Controls 2.12

Rectangle{
    id:selectionArea1
    color: "#77FFFFFF"
    border.color: "black"

    property alias image: img
    property alias text: txt.text
    property var glyphArray: []
    property int selection: -1
    signal clicked()

    Text{
        id:txt
        anchors.fill: parent
        horizontalAlignment: Text.AlignHCenter
        verticalAlignment: Text.AlignTop

        text: "Select\nmatching\nglyph"

        fontSizeMode: Text.Fit
        padding: 2

        minimumPixelSize: 2; font.pixelSize: 72
    }

    Image {
        id:img
        anchors.fill: parent
        fillMode: Image.PreserveAspectFit
        source: selection < 0 ? "" : glyphArray[selection]
    }

    MouseArea{
        anchors.fill: parent

        onClicked:{
            selectionArea1.clicked()

        }
    }
}
