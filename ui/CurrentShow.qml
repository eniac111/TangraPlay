import QtQuick 2.12

Item {
    property string theShow: ""

    function updateShow(show) {
        theShow = show;
        console.log(show);
    }

    Timer {
        interval: 30000
        running: true
        repeat: true
        onTriggered: currentShowC.fetchData()
    }

    Connections {
        target: currentShowC
        function onDataFetched(data){
           updateShow(data)
        }
    }

    Component.onCompleted: currentShowC.fetchData()
}
