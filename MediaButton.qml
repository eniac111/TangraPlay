import QtQuick 2.0
import QtQuick.Controls 2.15

Rectangle {
    id: container
    x: 141
    y: 367
    property bool isClicked : false
    color: isClicked ? "#a98415" : "#f9c620"


    Image {
        id: buttonIcon
        width: 64
        anchors.centerIn: parent
        fillMode: Image.PreserveAspectFit
        source: isClicked ? "Resources/pause-button.svg" : "Resources/play-button.svg"

    }
}
