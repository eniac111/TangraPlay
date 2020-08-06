#include "fetchshowid.h"
#include <QNetworkAccessManager>
#include <QObject>
#include <QDebug>
#include <QString>

FetchShowID::FetchShowID()
{

}

//int FetchShowID::Fetch() {
//    QNetworkAccessManager *manager = new QNetworkAccessManager(this);
//    QObject::connect(manager, &QNetworkAccessManager::finished, this, [=](QNetworkReply *reply) {
//        if (reply->error()) {
//            qDebug() << reply->errorString();
//            return;
//        }

//        QString answer = reply->readAll();

//    }
//}
