import QtQuick
import QtQuick.Controls
import QtQml.XmlListModel

Item {
    x: 190
    y: 51



    XmlListModel {
        id: newsModel

        source: "http://www.radiotangra.com/news/rss.html"
        query: "/rss/channel/item"

        XmlListModelRole { name: "title"; elementName: "title"; attributeName: ""}
        XmlListModelRole { name: "link"; elementName: "link"; attributeName: "" }
    }

    ListView {
        id: newsList
        anchors.fill: parent
        anchors.topMargin: 38
        anchors.leftMargin: 39
        anchors.rightMargin: 27
        anchors.bottomMargin: 17
        model: newsModel
        delegate: NewsDelegate {}
        ScrollBar.vertical: ScrollBar {
            policy: ScrollBar.AlwaysOn
        }
    }

}
