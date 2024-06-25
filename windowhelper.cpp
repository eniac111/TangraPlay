#include "windowhelper.h"

WindowHelper::WindowHelper(QObject *parent) : QObject(parent)
{
}

void WindowHelper::startWindowMove(QQuickWindow *window, int x, int y)
{
    if (window) {
        window->startSystemMove();
    }
}
