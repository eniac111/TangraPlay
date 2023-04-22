#include <QGuiApplication>
#include <QApplication>
#include <QQmlApplicationEngine>
#include <QQmlContext>
#include "tangratray.h"

int main(int argc, char *argv[])
{

    QApplication app(argc, argv);
    QQmlApplicationEngine engine;

    engine.addImportPath(":/bpetrov.tangraplay/imports");

    TangraTray * tangratray = new TangraTray();
    QQmlContext *context = engine.rootContext();
    context->setContextProperty("tangraTray", tangratray);

    const QUrl url(u"qrc:/bpetrov.tangraplay/imports/TangraPlay/ui/main.qml"_qs);
    QObject::connect(&engine, &QQmlApplicationEngine::objectCreated,
                     &app, [url](QObject *obj, const QUrl &objUrl) {
        if (!obj && url == objUrl)
            QCoreApplication::exit(-1);
    }, Qt::QueuedConnection);

    engine.load(url);

    return app.exec();
}
