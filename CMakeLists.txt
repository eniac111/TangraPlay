project(tangraplay)

cmake_minimum_required(VERSION 2.8.12 FATAL_ERROR)

set(QT_MIN_VERSION "5.15.0")

set(CMAKE_CXX_FLAGS  "${CMAKE_CXX_FLAGS} -std=c++0x")

set(CMAKE_MODULE_PATH ${CMAKE_MODULE_PATH} ${ECM_MODULE_PATH} ${ECM_KDE_MODULE_DIR})

find_package(Qt5 ${QT_MIN_VERSION} CONFIG REQUIRED COMPONENTS Core Quick )


include(KDEInstallDirs)
include(KDECMakeSettings)
include(KDECompilerSettings NO_POLICY_SCOPE)

include(ECMInstallIcons)
include(ECMPackageConfigHelpers)
include(ECMOptionalAddSubdirectory)

include_directories(${Qt5Core_PRIVATE_INCLUDE_DIRS})

include_directory(.)

add_subdiretory(Resources)

SET(SOURCES
    main.cpp
    fetchsnowid.cpp
    )

qt5_add_resources(qml.qrc)

add_executable(TangraPlay ${SOURCES})



set_target_properties(flatpak-demo PROPERTIES INSTALL_RPATH ${CMAKE_INSTALL_FULL_LIBDIR}/flatpak-demo)

target_link_libraries(flatpak-demo LINK_PUBLIC Qt5::QuickControls2 Qt5::Widgets Qt5::Quick Qt5::DBus Qt5::Core KF5::Notifications)

install(TARGETS flatpak-demo ${INSTALL_TARGETS_DEFAULT_ARGS})

install(PROGRAMS org.petrovs_info.tangraplay.desktop  DESTINATION ${KDE_INSTALL_APPDIR})
install(FILES org.petrovs_info.tangraplay.appdata.xml DESTINATION ${KDE_INSTALL_METAINFODIR})
