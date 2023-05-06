cmake_minimum_required(VERSION 3.16 FATAL_ERROR)

project(tangraplay VERSION 0.1 LANGUAGES CXX)


#set(BIN_OUTPUT_DIRECTORY "${CMAKE_BINARY_DIR}/bin")
set(CMAKE_AUTOMOC ON)
set(CMAKE_CXX_STANDARD 17)
set(CMAKE_CXX_STANDARD_REQUIRED ON)

find_package(Qt6 6.5 REQUIRED COMPONENTS Quick Widgets Core QuickControls2 Widgets Gui Multimedia)

qt_standard_project_setup(REQUIRES 6.5)

set(CMAKE_INCLUDE_CURRENT_DIR ON)
set(CMAKE_AUTOMOC ON)

if (WIN32)
    set(QT_DEFAULT_MEDIA_BACKEND windows)
else()
    set(QT_DEFAULT_MEDIA_BACKEND gstreamer)
endif()

list(APPEND QML_ASSETS
    Assets/tangra.ico
    Assets/pause-button.svg
    Assets/logo.png
    Assets/play-button.svg
    Assets/menu-background.png
    Assets/dark_leather.png
    Assets/menubtn-background.png
    Assets/blago.png
    Assets/KellySlab-Regular.ttf
    Assets/news-icon.png
    Assets/buuf-pause.png
    Assets/buuf-play.png
    Assets/playbtn-frame.png
    Assets/live.png
    Assets/news.png
    Assets/podcast.png
)

qt_add_executable(apptangraplay
    main.cpp
    tangratray.h tangratray.cpp
)

qt_add_qml_module(apptangraplay
    URI TangraPlay
    VERSION 1.0
    RESOURCE_PREFIX /bpetrov.tangraplay/imports
    QML_FILES ui/main.qml
              ui/AboutProgram.qml
              ui/AudioPlayer.qml
              ui/MediaButton.qml
              ui/MenuButton.qml
              ui/MenuToolbar.qml
              ui/PgLive.qml
              ui/PgNews.qml
              ui/NewsDelegate.qml
              ui/CurrentShow.qml
    RESOURCES
              ${QML_ASSETS}
)

set_target_properties(apptangraplay PROPERTIES
    MACOSX_BUNDLE_GUI_IDENTIFIER tangraplay.blago.cloud
    MACOSX_BUNDLE_BUNDLE_VERSION ${PROJECT_VERSION}
    MACOSX_BUNDLE_SHORT_VERSION_STRING ${PROJECT_VERSION_MAJOR}.${PROJECT_VERSION_MINOR}
    MACOSX_BUNDLE TRUE
    WIN32_EXECUTABLE TRUE
)

target_link_libraries(apptangraplay PRIVATE
    Qt6::Quick
    Qt6::QuickControls2
    Qt6::Core
    Qt6::Widgets
    Qt6::Gui
    Qt6::Multimedia )

install(TARGETS apptangraplay
    BUNDLE DESTINATION .
    LIBRARY DESTINATION ${CMAKE_INSTALL_LIBDIR})
