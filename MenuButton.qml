import QtQuick 2.0

Rectangle {
    id: container
    width: 32
    height: 32
    property string caption: "Button"

    signal clicked

    Image {
        id: menuButtonBackground
        source: "Resources/menubtn-background.png"
        anchors.fill: parent
    }

    Text {
        id: menuButtonLabel
        anchors.centerIn: container
        color: "White"
        text: container.caption
        font.pointSize: 16
        font.bold: true
        horizontalAlignment: Text.AlignHCenter
    }

    MouseArea {
        id: mouseArea
        anchors.fill: parent
        onClicked: container.clicked();
    }

}
