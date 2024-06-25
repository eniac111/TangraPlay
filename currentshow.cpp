#include "currentshow.h"
#include <QDebug> // Include the qDebug header

CurrentShow::CurrentShow(QObject *parent)
    : QObject { parent }
{
    connect(&m_networkManager, &QNetworkAccessManager::finished, this, &CurrentShow::onNetworkReply);
}

void CurrentShow::fetchData()
{
    QNetworkRequest request(QUrl("http://www.radiotangra.com/"));
    m_networkManager.get(request);
}

void CurrentShow::onNetworkReply(QNetworkReply *reply)
{
    if (reply->error() == QNetworkReply::NoError) {
        QString response = reply->readAll();

               // Output the raw response for debugging
        // qDebug() << "HTTP Response:" << response;

               // Define the regular expression as a static object
        static const QRegularExpression re(QStringLiteral(R"(<span class="txt_yel">Предаване в ефир: </span>\s*<div class="clearfix"></div>\s*<span>(.*?)</span>)"));
        QRegularExpressionMatch match = re.match(response);

               // Output the match result for debugging
        // qDebug() << "Match has match:" << match.hasMatch();

        if (match.hasMatch()) {
            QString extractedText = match.captured(1);
            // qDebug() << "Extracted Text:" << extractedText; // Output the extracted text
            emit dataFetched(extractedText);
        } else {
            // qDebug() << "Pattern not found";
            emit dataFetched("Unknown");
        }
    } else {
        // qDebug() << "Error fetching data:" << reply->errorString();
        emit dataFetched("Error fetching data");
    }
    reply->deleteLater();
}
