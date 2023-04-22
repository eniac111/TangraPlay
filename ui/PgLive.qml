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
        source: "qrc:/bpetrov.tangraplay/imports/TangraPlay/Assets/logo.png"

        states: ["mouseFadeIn", "MouseFadeOut"]
        state: "mouseFadeOut"

        transitions: [
            Transition {
                from: "*"
                to: "mouseFadeIn"
                NumberAnimation {
                    target: logo
                    properties: "scale"
                    from: 0.95
                    to: 1
                    duration: 400
                    easing.type: Easing.OutBounce
                }
            }
        ]

        MouseArea {
            anchors.fill: parent
            cursorShape: Qt.PointingHandCursor
            hoverEnabled: true
            onPressed: {
                Qt.openUrlExternally("http://radiotangra.com")
            }
            onContainsMouseChanged: {
                logo.state = containsMouse ? "mouseFadeIn" : "mouseFadeOut"
            }
        }
    }

    MediaButton {
        id: playPause
        x: 35
        y: 291
        width: 64
        height: 64
        MouseArea {
            anchors.fill: parent
            onClicked: {
                playPause.runAnimation()
                mediaControl()
                playPause.isClicked = !playPause.isClicked
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

    Image {
        id: playbtnframe
        x: 0
        y: 259
        width: 629
        height: 127
        source: "qrc:/bpetrov.tangraplay/imports/TangraPlay/Assets/playbtn-frame.png"
        fillMode: Image.PreserveAspectFit

        Text {
            id: text1
            x: 156
            y: 17
            text: qsTr("Предаване в ефир:")
            color: "#f9c620"
            font.family: mainfont.name
            font.pixelSize: 15
        }

        Text {
            id: text2
            x: 156
            y: 60
            text: qsTr("В момента звучи:")
            color: "#f9c620"
            font.family: mainfont.name
            font.pixelSize: 15
        }
    }
}

/*##^##
Designer {
    D{i:0;autoSize:true;height:480;width:640}
}
##^##*/

