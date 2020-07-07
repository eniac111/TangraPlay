import QtQuick 2.0

Rectangle {
    id: container
    width: 30
    height: 30
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
    }

    MouseArea {
        id: mouseArea
        anchors.fill: parent
        onClicked: container.clicked();
    }

}
