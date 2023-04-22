import QtQuick 2.0
import QtQuick.Window 2.12

Item {
    Rectangle {
        id: menu
        width: mainWindow.width
        height: 32

        Image {
            source: "qrc:/bpetrov.tangraplay/imports/TangraPlay/Assets/menu-background.png"
            fillMode: Image.Tile
            anchors.fill: parent

        }


        MouseArea {
            anchors.fill: parent;
            property variant clickPos: "1,1"

            onPressed: (mouse)=> {
                clickPos = Qt.point(mouse.x, mouse.y)
            }

            onPositionChanged: (mouse)=> {
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
               onClicked: Qt.quit();

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

            Image {
                id: buttonLive
                source: "qrc:/bpetrov.tangraplay/imports/TangraPlay/Assets/live.png"
                anchors.left: appTitle.left
                anchors.leftMargin: 128
                width: 32
                height: 32

                MouseArea {
                    anchors.fill: parent
                    hoverEnabled: true
                    onClicked: {
                        mainStack.push(stackLive)
                    }
                }
            }
            Image {
                id: buttonNews
                source: "qrc:/bpetrov.tangraplay/imports/TangraPlay/Assets/news.png"
                anchors.left: buttonLive.left
                anchors.leftMargin: 128
                width: 32
                height: 32

                MouseArea {
                    anchors.fill: parent
                    hoverEnabled: true
                    onClicked: {
                        mainStack.push(stackNews)
                    }
                }
            }
        }
    }
}

