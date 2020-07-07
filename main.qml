import QtQuick 2.12
import QtQuick.Window 2.12
import Qt.labs.platform 1.1
import QtMultimedia 5.15

Window {
    title: qsTr("Tangra Mega Rock")
    id: mainWindow
    visible: true
    width: 640
    height: 480

    onVisibilityChanged: {
        if ( visibility === isMinimized ) {
            hide()
        }
    }

    SystemTrayIcon {
        visible: true
        icon.source: "qrc:/images/tray-icon.png"

        menu: Menu {
            MenuItem {
                text: qsTr("Quit")
                onTriggered: Qt.quit()
            }
            MenuItem {
                text: qsTr("Show")
                onTriggered: {
                    mainWindow.show()
                    mainWindow.raise()
                    mainWindow.requestActivate()
                }
            }
        }

        onActivated: {
            mainWindow.show()
            mainWindow.raise()
            mainWindow.requestActivate()
        }

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

            MenuButton {
               id: buttonExit
               caption: "[X]"
               onClicked: Qt.quit()
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
            }
        }

        Image {
            id: logo
            x: 190
            y: 51
            visible: true
            width: 260
            height: 175
            fillMode: Image.PreserveAspectFit
            source: "Resources/logo.png"
        }


        MediaButton {
            id: playPause
            width: 359
            height: 85
            MouseArea {
                anchors.fill: parent
                onClicked: {
                    mediaControl();
                    playPause.isClicked = !playPause.isClicked;
                }
//                onReleased: playPause.isClicked = false;
            }
        }
    }
}
