import QtQuick
import QtQuick.Controls

Text {
    height: 25
    width: newsList.width
    id: titleText
    textFormat: Text.RichText
    text: "<style>a:link { color: \"#f9be30\"; font-size: 12px; }</style> <a href=\""
          + link + "\">" + title + "</a>"
    wrapMode: Text.WordWrap
    font.pixelSize: 12
    font.bold: true
    onLinkActivated: openLink => Qt.openUrlExternally(link)
    MouseArea {
        id: mouseArea
        anchors.fill: parent
        cursorShape: Qt.PointingHandCursor
        acceptedButtons: Qt.NoButton
    }
}
