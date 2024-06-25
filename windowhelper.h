#ifndef WINDOWHELPER_H
#define WINDOWHELPER_H

#include <QObject>
#include <QQuickWindow>
#include <QPoint>

class WindowHelper : public QObject
{
    Q_OBJECT
public:
    explicit WindowHelper(QObject *parent = nullptr);

    Q_INVOKABLE void startWindowMove(QQuickWindow *window, int x, int y);

signals:

};

#endif // WINDOWHELPER_H
