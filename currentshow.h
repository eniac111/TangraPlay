#ifndef CURRENTSHOW_H
#define CURRENTSHOW_H

#include <QObject>
#include <QNetworkAccessManager>
#include <QNetworkReply>
#include <QNetworkRequest>
#include <QRegularExpression>

class CurrentShow : public QObject
{
    Q_OBJECT
public:
    explicit CurrentShow(QObject *parent = nullptr);

    Q_INVOKABLE void fetchData();

signals:
    void dataFetched(const QString &data);

private slots:
    void onNetworkReply(QNetworkReply *reply);

private:
    QNetworkAccessManager m_networkManager;
};

#endif // CURRENTSHOW_H
