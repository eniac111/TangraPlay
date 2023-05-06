import QtQuick 2.0

Item {
    property string theShow: ""

    function getShow(url) {
        let request = new XMLHttpRequest()

        request.onreadystatechange = function () {
            if (request.readyState === XMLHttpRequest.DONE) {
//                let content = request.response.slice(0, request.response.indexOf("\n"));
                let response = {
                    status : request.status,
                    headers : request.getAllResponseHeaders(),
                    content : request.response
                };
            };
            theShow = request.responseText.toString().slice(0, request.response.indexOf("\n"));
        }

        request.open("GET", "http://app.radiotangra.com/TMR_monitor_songs")
        request.send()
    }

   Timer {
       interval: 30000
       running: true
       repeat: true
       onTriggered: getShow()
   }
}
