import QtQuick 2.0
import QtQuick.Dialogs 1.2

Dialog {
    id: aboutDialog
    standardButtons: StandardButton.Ok
    height: 500
    width: 400

    Image {
        id: image
        x: 292
        y: 60
        width: 100
        height: 100
        fillMode: Image.PreserveAspectFit
        source: "../Resources/blago.png"
    }

    Text {
        id: element
        x: 0
        y: 8
        text: qsTr("TangraPlay v0.5 Beta")
        font.family: mainfont.name
        font.bold: true
        font.pixelSize: 33
    }

    Text {
        id: element1
        x: 28
        y: 80
        width: 216
        height: 61
        text: qsTr("(Винаги съм искал да направя софтуер с диалогов прозорец като mIRC )")
        font.family: mainfont.name
        wrapMode: Text.WrapAtWordBoundaryOrAnywhere
        elide: Text.ElideLeft
        font.pixelSize: 12
    }

    Text {
        id: element2
        x: 28
        y: 172
        width: 354
        height: 74
        text: qsTr("© 2020 Благовест Петров ( https://petrovs.info ) . Кодът е лиценциран под GNU GPL v3.0. \n Шрифтът е \"Kelly Slab\" и е взет от Google Fonts. Лицензиран е под OFL лиценз.")
        font.family: mainfont.name
        wrapMode: Text.WrapAtWordBoundaryOrAnywhere
        font.pixelSize: 12
    }

    Text {
        id: element3
        x: 28
        y: 271
        width: 354
        height: 36
        text: qsTr("Всички лога, графики и името \"Tangra Mega Rock\" са собственост на радио Тангра.")
        font.family: mainfont.name
        font.pixelSize: 12
        wrapMode: Text.WrapAtWordBoundaryOrAnywhere
    }

    Text {
        id: element4
        x: 28
        y: 323
        width: 354
        height: 36
        text: qsTr("Този софтуер e направен напълно с некомерсиална цел и не е свързан по никакъв начин с Рок Радио Tangra Mega Rock")
        font.family: mainfont.name
        font.pixelSize: 12
        wrapMode: Text.WrapAtWordBoundaryOrAnywhere
    }

}


