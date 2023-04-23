#include "tangratray.h"

TangraTray::TangraTray(QObject *parent) : QObject(parent)
{

    QMenu *trayIconMenu = new QMenu();

    QAction * viewWindowAction = new QAction(tr("Показване"), this);
    QAction * quitAction = new QAction(tr("Изход"), this);

    connect(viewWindowAction, &QAction::triggered, this, &TangraTray::signalIconActivated);
    connect(quitAction, &QAction::triggered, this, &TangraTray::signalQuit);

    trayIconMenu->addAction(viewWindowAction);
    trayIconMenu->addAction(quitAction);

    trayIcon = new QSystemTrayIcon();
    trayIcon->setContextMenu(trayIconMenu);
    setTrayIcon(":/bpetrov.tangraplay/imports/tangra.ico");

    trayIcon->show();

    connect(trayIcon, SIGNAL(activated(QSystemTrayIcon::ActivationReason)),
            this, SLOT(iconActivated(QSystemTrayIcon::ActivationReason)));
}

void TangraTray::iconActivated(QSystemTrayIcon::ActivationReason reason)
{
    switch (reason){
    case QSystemTrayIcon::Trigger:
        emit signalIconActivated();
        break;
    default:
        break;
    }
}

void TangraTray::setTrayIcon(QString image)
{
    QIcon icon = QIcon(image);
    trayIcon->setIcon(icon);
    trayIcon->show();
}

void TangraTray::hideIconTray()
{
    trayIcon->hide();
}
