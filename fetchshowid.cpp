#include "fetchshowid.h"

FetchShowID::FetchShowID()
{
    n_manager = new QNetworkAccessManager;

    connect(n_manager, SIGNAL(finished(QNetworkReply*)),
             this, SLOT(replyFinished(QNetworkReply*)));

}


void FetchShowID::Fetch() {
    n_manager->get(QNetworkRequest(QUrl("http://app.radiotangra.com/TMR_monitor_songs")));
}
