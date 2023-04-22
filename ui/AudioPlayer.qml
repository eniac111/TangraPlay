import QtQuick 2.0
import QtMultimedia

MediaPlayer {
    property variant quality: {
        "low"  : "http://stream-bg-01.radiotangra.com/Tangra-middle.m3u",
        "high" : "http://stream-bg-01.radiotangra.com/Tangra-high.m3u"
    }

    audioOutput: AudioOutput {}

    source: "http://stream-bg-01.radiotangra.com:8000/Tangra-high"
}
