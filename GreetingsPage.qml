import QtQuick 2.12
import QtQuick.Controls 2.12

Rectangle {
    id:root

    Text {
        id: title
        anchors{
            left: parent.left
            leftMargin: icon.width
            right: icon.left

        }
        height: icon.height

        verticalAlignment: Text.AlignVCenter
        horizontalAlignment: Text.AlignHCenter

        fontSizeMode: Text.Fit
        padding: 2

        minimumPixelSize: 2; font.pixelSize: 72

        text: qsTr("Vow of the Disciple - Raid Helper")
    }

    Image {
        id: icon
        anchors.right: parent.right
        anchors.top: parent.top
        width: Math.min(root.width, root.height) / 7
        height: width
        source: "qrc:/images/JhIcon.png"
    }

    Text {
        anchors{
            left: parent.left
            right: parent.right
            top: title.bottom
            bottom: parent.bottom
        }

        padding: icon.width / 2

        font.pixelSize: 20
        wrapMode: Text.WordWrap
        text: qsTr("Special thanks to these reddit users and their maps:\n
\tu/DependentLocation136\n
\tu/WiseButterscotch\n
\tu/Wolf_Antarctic\n
\t@SquirrelyDan_ Loottable")
    }
}
