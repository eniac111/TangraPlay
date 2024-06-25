import QtQuick

Item {
    property string theTrack: ""

    function getTrack(url) {
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
            theTrack = request.responseText.toString().slice(0, request.response.indexOf("\n"));
        }

        request.open("GET", "http://www.radiotangra.com/pages/onair.html")
        request.send()
    }

   Timer {
       interval: 30000
       running: true
       repeat: true
       onTriggered: getTrack()
   }
}
