import QtQuick 2.12
import QtQuick.Window 2.12
import Qt.labs.platform 1.1
import QtMultimedia 5.15

Item {
    Row {
        id: row
        x: 8
        y: 50
        width: 624
        height: 400
        spacing: 2

        Text {
            id: text1
            x: 61
            y: 50
            text: qsTr("Гледайте първо видео от новия албум на GOJIRA - той излиза на 3 април")
            font.pixelSize: 12
            font.family: mainfont.name
        }

        Text {
            id: text2
            x: 61
            y: 50
            text: qsTr("Историята на BLONDIE в предаването 'РОКЕНДРОЛ' на МОНИ ПАНЧЕВ от 16:00")
            font.pixelSize: 12
            font.family: mainfont.name
        }
    }



}
