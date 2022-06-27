import QtQuick 2.12
import QtQuick.Controls 2.12
import Qt.labs.settings 1.0

Item {
    id:root

    Settings{
        id:settings

        property var aliase: [
        "","","","","","","","","","","","","","","","","","","","","","","","","","",""
        ]
    }

    property int itemHeight: width / 7

    property var aliasNames: settings.aliase
    Component.onDestruction: {settings.aliase = aliasNames}
    property var officialNames: [
        "ascendant plane",
        "black garden",
        "black heart",
        "commune",
        "darkness",
        "drink",
        "earth",
        "enter",
        "fleet",
        "give",
        "grief",
        "guardian",
        "hive",
        "kill",
        "knowledge",
        "light",
        "love",
        "neutral",
        "pyramid",
        "savathun",
        "scorn",
        "stop",
        "tower",
        "traveler",
        "witness",
        "worm",
        "worship"
    ]
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

    GridView{
        id:view
        anchors.fill: parent

        model: glyphArray

        cellWidth: width / 2
        cellHeight: itemHeight

        delegate: Item{
            id:del
            property int indexOfThisDelegate: index
            height: view.cellHeight
            width: view.cellWidth
            Image {
                id: icon
                anchors.verticalCenter: parent.verticalCenter
                x: parent.height / 8
                source: modelData
                height: parent.height *7/8
                width: height
            }
            Rectangle{
                id:background
                color: "lightgray"
                anchors.fill: colDesc
            }

            Rectangle{
                anchors{
                    left: icon.right
                    leftMargin: parent.height/8
                    right: parent.right
                    bottom: parent.bottom
                }
                height: 1
                color: "black"
            }


            Column{
                id:colDesc
                anchors{
                    left: icon.right
                    leftMargin: parent.height/8
                    top: parent.top
                    bottom: parent.bottom
                }
                width: Math.max(t1.contentWidth, t2.contentWidth) + 4
                Text {
                    id:t1
                    height: del.height / 2
                    text: qsTr("Officially:")
                    font.pixelSize: 16
                    verticalAlignment: Text.AlignVCenter
                    padding: 2

                }
                Text {
                    id:t2
                    height: del.height / 2
                    text: qsTr("Alias:")
                    font.pixelSize: 16
                    verticalAlignment: Text.AlignVCenter
                    padding: 2
                }

            }
            Column{
                id:colInfo
                anchors{
                    left: colDesc.right
                    right: parent.right
                    top: parent.top
                    bottom: parent.bottom
                }

                Text {
                    height: colInfo.height / 2
                    width: colInfo.width
                    verticalAlignment: Text.AlignVCenter
                    horizontalAlignment: Text.AlignHCenter
                    text: officialNames[del.indexOfThisDelegate]
                    padding: 2
                    font.pixelSize: 16
                }

                Rectangle{
                    width: colInfo.width
                    height: 1
                    color: "lightgrey"
                }

                TextInput{
                    id:tInput
                    height: colInfo.height / 2
                    width: colInfo.width
                    verticalAlignment: Text.AlignVCenter
                    horizontalAlignment: Text.AlignHCenter
                    text: aliasNames[del.indexOfThisDelegate]
                    padding: 2

                    font.pixelSize: 16

                    onActiveFocusChanged: if(activeFocus) selectAll()

                    onEditingFinished: {
                        console.log(aliasNames[del.indexOfThisDelegate], "#####")
                        parent.forceActiveFocus()
                        aliasNames[del.indexOfThisDelegate] = tInput.text
                        console.log(aliasNames[del.indexOfThisDelegate], tInput.text)
                    }
                }
            }



            MouseArea{
                anchors.fill: parent
                onClicked: tInput.forceActiveFocus()
            }
        }
    }
}
