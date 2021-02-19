#ifndef FETCHSHOWID_H
#define FETCHSHOWID_H
#include <QNetworkAccessManager>
#include <QNetworkReply>
#include <QObject>
#include <QDebug>
#include <QString>


class FetchShowID : public QObject
{
public:
    FetchShowID();
    void Fetch();

private:
    QNetworkAccessManager* n_manager;
};

#endif // FETCHSHOWID_H
