import QtQuick 2.12
import QtQuick.Window 2.12
import Qt.labs.platform 1.1
import QtMultimedia 5.15

Item {


    Image {
        id: logo
        x: 190
        y: 51
        visible: true
        width: 260
        height: 175
        fillMode: Image.PreserveAspectFit
        source: "Resources/logo.png"
        MouseArea {
            anchors.fill: parent
            cursorShape: Qt.PointingHandCursor
            onPressed:  {
                Qt.openUrlExternally("http://radiotangra.com")
            }
        }
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
        font.family: mainfont.name
        color: "#f9c620"
        MouseArea {
            anchors.fill: parent
            onClicked: aboutDialog.open()
        }
    }
}
