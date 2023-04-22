import QtQuick 2.0
import QtQuick.Controls 2.15

Image {
    id: buttonIcon
    x: 64
    y: 64
    property int animationDuration: 250
    fillMode: Image.PreserveAspectFit
    source: isClicked ? "qrc:/bpetrov.tangraplay/imports/TangraPlay/Assets/buuf-pause.png" : "qrc:/bpetrov.tangraplay/imports/TangraPlay/Assets/buuf-play.png"
    property bool isClicked: false

    function runAnimation() {
        glow.visible = true
        animation1.start()
        animation2.start()
    }

    MouseArea {
        anchors.fill: parent
        onClicked: {
            root.clicked()
            stack.push(viewBeerSize)
        }

        onPressed: {
            glow.visible = true
            animation1.start()
            animation2.start()
        }
    }

    ///////// Click animation
    Rectangle {
        id: glow
        visible: false

        width: 250
        height: 250
        color: "#00000000"
        radius: 125
        scale: 1.05
        border.color: "#ffffff"
    }

    PropertyAnimation {
        target: glow
        id: animation1
        duration: buttonIcon.animationDuration
        loops: 1
        from: 1.05
        to: 1.2
        property: "scale"
    }

    ParallelAnimation {
        id: animation2
        SequentialAnimation {
            PropertyAnimation {
                target: glow
                duration: buttonIcon.animationDuration
                loops: 1
                from: 0.2
                to: 1.0
                property: "opacity"
            }
            PropertyAnimation {
                target: glow
                duration: buttonIcon.animationDuration
                loops: 1
                from: 1.0
                to: 0.0
                property: "opacity"
            }

            PropertyAction {
                target: glow
                property: "visible"
                value: false
            }
        }

        SequentialAnimation {
            PropertyAction {
                target: glow
                property: "border.width"
                value: 20
            }

            PauseAnimation {
                duration: 200
            }

            PropertyAnimation {
                target: glow
                duration: buttonIcon.animationDuration
                loops: 1
                from: 20
                to: 10
                property: "border.width"
            }
        }
    }
}
