project(tangraplay)

cmake_minimum_required(VERSION 3.1 FATAL_ERROR)

set(QT_MIN_VERSION "5.15.0")

set(CMAKE_CXX_FLAGS  "${CMAKE_CXX_FLAGS} -std=c++0x")

set(CMAKE_MODULE_PATH ${CMAKE_MODULE_PATH} ${ECM_MODULE_PATH} ${ECM_KDE_MODULE_DIR})

find_package(Qt5 ${QT_MIN_VERSION} CONFIG REQUIRED COMPONENTS Core Quick )


set(CMAKE_AUTORCC ON)

include(KDEFrameworkCompilerSettings NO_POLICY_SCOPE)
include(KDEInstallDirs)
include(KDECMakeSettings))

include(ECMOptionalAddSubdirectory)
include(ECMAddAppIcon)
include(ECMInstallIcons)

include_directories(${Qt5Core_PRIVATE_INCLUDE_DIRS})

include_directories(.)

add_subdirectory(Resources)

SET(SOURCES
    main.cpp
    fetchsnowid.cpp
    )

add_executable(TangraPlay ${SOURCES})



set_target_properties(flatpak-demo PROPERTIES INSTALL_RPATH ${CMAKE_INSTALL_FULL_LIBDIR}/flatpak-demo)

target_link_libraries(flatpak-demo LINK_PUBLIC Qt5::QuickControls2 Qt5::Widgets Qt5::Quick Qt5::DBus Qt5::Core KF5::Notifications)

install(TARGETS flatpak-demo ${INSTALL_TARGETS_DEFAULT_ARGS})

install(PROGRAMS org.petrovs_info.tangraplay.desktop  DESTINATION ${KDE_INSTALL_APPDIR})
install(FILES org.petrovs_info.tangraplay.appdata.xml DESTINATION ${KDE_INSTALL_METAINFODIR})
