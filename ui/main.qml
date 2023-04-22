import QtQuick 2.12
import QtQuick.Window 2.12
import Qt.labs.platform 1.1
import QtMultimedia 5.15
//import TangraPlay

Window {
    title: qsTr("Tangra Mega Rock")
    id: mainWindow
    visible: true
    width: 640
    maximumWidth: 640
    height: 480
    maximumHeight: 480
    flags: Qt.FramelessWindowHint

//    FontLoader { id: mainfont; source: "../Resources/KellySlab-Regular.ttf" }
    FontLoader { id: mainfont; source: "qrc:/bpetrov.tangraplay/imports/TangraPlay/Assets/KellySlab-Regular.ttf" }

    Connections {
        target: tangraTray

        function onSignalIconActivated() {
            mainWindow.show()
            mainWindow.raise()
            mainWindow.requestActivate()
        }

        function onSignalQuit(){
            Qt.quit()
        }
    }

    AboutProgram {
        id: aboutDialog
    }

    AudioPlayer {
        id: thePlayer
    }

    function mediaControl() {
        if (thePlayer.playbackState != thePlayer.PlayingState) {
            thePlayer.play();
        }
        else {
            thePlayer.stop();
        }
        return 0;
    }

    Image {
        id: background
        anchors.fill: parent
        visible: true
        fillMode: Image.Tile
        source: "qrc:/bpetrov.tangraplay/imports/TangraPlay/Assets/dark_leather.png"

        MenuToolbar {}

        PgLive {
            id: pgLive1
        }
//        PgNews {
//            id: pgNews1
//            visible: false
//        }

//        Item {
//            Component {
//                id: myComp
//            }

//            Loader { id: contentLoader }

//        }

    }
}

