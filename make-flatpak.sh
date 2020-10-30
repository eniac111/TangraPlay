#!/bin/bash

flatpak-builder --user --install build-dir org.petrovs_info.tangraplay.json

flatpak run org.petrovs_info.tangraplay
