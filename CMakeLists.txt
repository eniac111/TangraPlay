project(tangraplay)

cmake_minimum_required(VERSION 3.1 FATAL_ERROR)

set(QT_MIN_VERSION "5.10.0")
set(KF5_DEP_VERSION "5.40.0")

# We need some parts of the ECM CMake helpers.
find_package(ECM ${KF5_DEP_VERSION} QUIET REQUIRED NO_MODULE)

# We append to the module path so modules can be overridden from the command line.
list(APPEND CMAKE_MODULE_PATH ${ECM_MODULE_PATH})

set(CMAKE_CXX_FLAGS  "${CMAKE_CXX_FLAGS} -std=c++0x")

find_package(Qt5 ${QT_MIN_VERSION} CONFIG REQUIRED COMPONENTS Core Quick QuickControls2 Multimedia Widgets Gui )

include_directories(.)
include_directories(${Qt5Core_PRIVATE_INCLUDE_DIRS})

set(CMAKE_INCLUDE_CURRENT_DIR ON)
set(CMAKE_AUTOMOC ON)

include(KDEFrameworkCompilerSettings NO_POLICY_SCOPE)
include(KDEInstallDirs)
include(KDECMakeSettings)

include(ECMOptionalAddSubdirectory)
include(ECMAddAppIcon)
include(ECMInstallIcons)


add_subdirectory(Resources)
qt5_add_resources(RESOURCES qml.qrc)

SET(SOURCES
    main.cpp
    )

add_executable(tangraplay
    ${SOURCES}
    ${RESOURCES}
    )

qt5_use_modules(tangraplay Quick QuickControls2 Core Multimedia )

target_link_libraries(tangraplay 
    Qt5::Quick
    Qt5::QuickControls2
    Qt5::Core
    Qt5::Widgets
    Qt5::Gui
    Qt5::Multimedia )

install(TARGETS tangraplay DESTINATION ${KDE_INSTALL_TARGETS_DEFAULT_ARGS})

install(PROGRAMS org.petrovs_info.tangraplay.desktop  DESTINATION ${KDE_INSTALL_APPDIR})
install(FILES org.petrovs_info.tangraplay.appdata.xml DESTINATION ${KDE_INSTALL_METAINFODIR})
