import QtQuick 2.0
import QtQuick.Controls 2.15

Item {
    id: container
    x: 64
    y: 64
    property bool isClicked : false

    Image {
        id: buttonIcon
        width: 64
        anchors.centerIn: parent
        fillMode: Image.PreserveAspectFit
        source: isClicked ? "Resources/buuf-pause.png" : "Resources/buuf-play.png"

    }
}
