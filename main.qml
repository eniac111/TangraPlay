import QtQuick 2.12
import QtQuick.Window 2.12
import Qt.labs.platform 1.1
import QtMultimedia 5.15

Window {
    title: qsTr("Tangra Mega Rock")
    id: mainWindow
    visible: true
    width: 640
    maximumWidth: 640
    height: 480
    maximumHeight: 480
    flags: Qt.FramelessWindowHint

    FontLoader { id: mainfont; source: "Resources/KellySlab-Regular.ttf" }

    SystemTrayIcon {
        visible: true
        icon.source: "Resources/tangra.ico"

        menu: Menu {
            MenuItem {
                text: qsTr("Показване")
                onTriggered: {
                    mainWindow.show()
                    mainWindow.raise()
                    mainWindow.requestActivate()
                }
            }
            MenuItem {
                text: qsTr("Изключване")
                onTriggered: Qt.quit()
            }
        }

        onActivated: {
            mainWindow.show()
            mainWindow.raise()
            mainWindow.requestActivate()
        }

    }

    AboutProgram {
        id: aboutDialog
    }

    AudioPlayer {
        id: tangraplay
    }

    function mediaControl() {
        if (tangraplay.playbackState != Audio.PlayingState) {
            tangraplay.play();
        }
        else {
            tangraplay.stop();
        }
        return 0;
    }

    Image {
        id: background
        anchors.fill: parent
        visible: true
        fillMode: Image.Tile
        source: "Resources/dark_leather.png"

        Rectangle {
            id: menu
            width: mainWindow.width
            height: 32

            Image {
                source: "Resources/menu-background.png"
                fillMode: Image.Tile
                anchors.fill: parent

            }


            MouseArea {
                anchors.fill: parent;
                property variant clickPos: "1,1"

                onPressed: {
                    clickPos = Qt.point(mouse.x,mouse.y)
                }

                onPositionChanged: {
                    var delta = Qt.point(mouse.x-clickPos.x, mouse.y-clickPos.y)
                    var new_x = mainWindow.x + delta.x
                    var new_y = mainWindow.y + delta.y
                    if (new_y <= 0)
                        mainWindow.visibility = Window.Maximized
                    else
                    {
                        if (mainWindow.visibility === Window.Maximized)
                            mainWindow.visibility = Window.Windowed
                        mainWindow.x = new_x
                        mainWindow.y = new_y
                    }
                }

                MenuButton {
                   id: buttonExit
                   caption: "X"
                   onClicked: Qt.quit()

                }

                MenuButton {
                    id: buttonMinimize
                    anchors.left: buttonExit.right
                    caption: "_"
                    onClicked: mainWindow.hide()

                }

                Text {
                    id: appTitle
                    anchors.left: buttonMinimize.right
                    text: qsTr("TangraPlay")
                    font.family: mainfont.name
                    font.pixelSize: 20
                    font.bold: true
                    color: "#f9c620"
                }
            }
        }
    }

    PgLive {}
}
