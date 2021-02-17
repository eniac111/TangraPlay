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
    flags: Qt.FramelessWindowHint

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
                    font.pixelSize: 20
                    font.bold: true
                    color: "#f9c620"
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

//        Text {
//            id: element
//            x: 17
//            y: 68
//            text: qsTr("Качество:")
//            font.bold: true
//            color: "#f9c620"
//            styleColor: "#f9c620"
//            horizontalAlignment: Text.AlignHCenter
//            font.pixelSize: 20
//        }

//        Rectangle {
//            id: buttonHighQuality
//            color: "#f9c620"
//            x: 17
//            y: 102
//            width: 100
//            height: 34
//            Text {
//                anchors.centerIn: parent
//                id: element1
//                text: qsTr("ВИСОКО")
//                color: "#000000"
//                font.pixelSize: 20
//                horizontalAlignment: Text.AlignHCenter
//                font.bold: true
//            }
//        }

//        Rectangle {
//            id: buttonLowQuality
//            color: "transparent"
//            x: 24
//            y: 146
//            width: 100
//            height: 34
//            Text {
//                text: qsTr("НИСКО")
//                color: "#f9c620"
//                horizontalAlignment: Text.AlignHCenter
//                font.pixelSize: 20
//                font.bold: true
//            }
//        }

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
            }
        }

        Text {
            id: aboutLink
            x: 509
            y: 455
            text: qsTr("Относно програмата")
            font.pixelSize: 12
            color: "#f9c620"
            MouseArea {
                anchors.fill: parent
                onClicked: aboutDialog.open()
            }
        }
    }
}
