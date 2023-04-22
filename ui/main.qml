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

    FontLoader { id: mainfont; source: "../Resources/KellySlab-Regular.ttf" }

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
        source: "../Resources/dark_leather.png"

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
