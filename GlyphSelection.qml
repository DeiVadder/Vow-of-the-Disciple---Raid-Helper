import QtQuick 2.12
import QtQuick.Controls 2.12

Rectangle {
    id:root

    signal glypSelected(var glyp)
    signal abort()

    property var glyphArray: [
        "qrc:/images/glyphs/ascendant_plane.png",
        "qrc:/images/glyphs/black_garden.png",
        "qrc:/images/glyphs/black_heart.png",
        "qrc:/images/glyphs/commune.png", //3
        "qrc:/images/glyphs/darkness.png",
        "qrc:/images/glyphs/drink.png", //5
        "qrc:/images/glyphs/earth.png",
        "qrc:/images/glyphs/enter.png",
        "qrc:/images/glyphs/fleet.png",
        "qrc:/images/glyphs/give.png",
        "qrc:/images/glyphs/grief.png", //10
        "qrc:/images/glyphs/guardian.png",
        "qrc:/images/glyphs/hive.png",
        "qrc:/images/glyphs/kill.png", //13
        "qrc:/images/glyphs/knowledge.png", //14
        "qrc:/images/glyphs/light.png",
        "qrc:/images/glyphs/love.png",
        "qrc:/images/glyphs/neutral.png",
        "qrc:/images/glyphs/pyramid.png",
        "qrc:/images/glyphs/savathun.png",
        "qrc:/images/glyphs/scorn.png",
        "qrc:/images/glyphs/stop.png", //21
        "qrc:/images/glyphs/tower.png",
        "qrc:/images/glyphs/traveler.png",
        "qrc:/images/glyphs/witness.png",
        "qrc:/images/glyphs/worm.png",
        "qrc:/images/glyphs/worship.png"//26
    ]

    ToolButton {
        id: toolButton
        text: "\u25C0"
        font.pixelSize: Qt.application.font.pixelSize * 1.6
        onClicked: {
            root.abort()
            root.visible = false
        }
    }

    Text {
        anchors{
            left: toolButton.right
            right: parent.right
            rightMargin: toolButton.width
            top: parent.top
            bottom: toolButton.bottom
        }
        fontSizeMode: Text.Fit
        padding: 2


        horizontalAlignment: Text.AlignHCenter

        minimumPixelSize: 2; font.pixelSize: 72
        text: qsTr("Select your glyph")
    }

    ToolButton {
        id: toolButtonCancel
        anchors.right: parent.right
        text: "x"
        font.pixelSize: Qt.application.font.pixelSize * 1.6
        onClicked: {
            root.glypSelected(-1)
        }
    }

    GridView{
        id:view
        model: glyphArray
        anchors{
            top: toolButton.bottom
            bottom: parent.bottom
            left: parent.left
            right: parent.right
        }

        clip: true

        property bool showMoreGlyphs: root.width > height

        cellWidth: width / ( showMoreGlyphs ? 8 : 5)
        cellHeight: cellWidth

        delegate: Item {
            width: view.cellWidth
            height: width
            Image {
                anchors.fill: parent
                anchors.margins: 2
                source: modelData
            }

            Rectangle{
                id:overlay
                anchors.fill: parent
                color: marea.pressed ? "#A9FFFFFF" : "transparent"
            }

            MouseArea{
                id:marea
                anchors.fill: parent
                onClicked: {
                    root.glypSelected(index)
                }
            }
        }
    }

}
