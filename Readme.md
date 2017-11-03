![language](https://img.shields.io/badge/Language-C%2B%2B11-green.svg)  ![dependencies](https://img.shields.io/badge/Dependencies-Boost%201.63-green.svg)  ![license_gpl3](https://img.shields.io/badge/License-GPL%203.0-green.svg)

# OpenVR-WalkInPlace

An OpenVR driver that applies virtual movement using a pedometer

The OpenVR driver hooks into the HTC Vive lighthouse driver and tracks movement of the HMD and Vive Controllers. It then applies movement into the virtual envrionment.

# Step Detection Motivation
I have done work with step detection locomotion with mobile phone VR games. So once I got my vive I was also interested in the options. Once I saw the functionality of OpenVR and https://github.com/matzman666/OpenVR-InputEmulator to emulate input and track poses I figured it has the ability to detect and "emulate" a step. In the long run I hope to expand this driver for many games and be able to use WIP locomotion as a standard input method.


# Current Games that Work with OpenVR-WalkInPlace

- Arizona Sunshine
- Onward
- Any others that use the touch-pad as movement like an analog stick

# Unsupported games

- Games that do not use the touch-pad as movement

# Features

- Change HMD Step Thresholds
- Change Vive Controller Step Thresholds
- Change How long a Virtual Step lasts

# Upcoming

- Options for emulating other input methods
- Tracker support (for feet)
- Running / jogging / walking detection

# Notes:

This is a work-in-progress and may have flaws.

## Installer

Download the newest installer from the [release section](https://github.com/pottedmeat7/OpenVR-WalkInPlace/releases) and then execute it. Don't forget to exit SteamVR before installing/de-installing.

# Documentation

### WalkInPlace Overlay
Just enable "Step Detection" in the UI.
Enable the "analog" locomotion in the games settings this is the input method that uses touching the touch-pad (not clicking)
Then you simply walk in place to emulate walking in the VR world.

## Initial Setup
### Boost
1. Goto https://sourceforge.net/projects/boost/files/boost-binaries/1.63.0/
1. Download Boost 1.63 Binaries (boost_1_63_0-msvc-14.0-64.exe)
1. Install Boost into `OpenVR-WalkInPlace/third-party/boost_1_63_0`
  
### Qt
1. Goto https://download.qt.io/official_releases/qt/5.7/5.7.0/
1. Download Qt 5.7.0
1. Run the Qt installer (I installed it to "c:\Qt")
1. Goto `OpenVR-WalkInPlace\client_overlay`
1. Create `client_overlay.vcxproj.user` and paste the following into it:

```
<?xml version="1.0" encoding="utf-8"?>
<Project ToolsVersion="14.0" xmlns="http://schemas.microsoft.com/developer/msbuild/2003">
  <PropertyGroup>
    <QTDIR>C:\Qt\5.7\msvc2015_64</QTDIR>
  </PropertyGroup>
</Project>
```

NOTE: Adjust the path the `msvc2015_64` folder in Qt to match your installation

Then run the `windeployqt.bat` if your system doesn't find the exe update the batch to the absolute path
in `{QT_INSTLATION_PATH}\5.7\msvc2015_64\bin\windeployqt.exe`

## Building
1. Open *'VRWalkInPlace.sln'* in Visual Studio 2015.
2. Build Solution


# Known Bugs

- The shared-memory message queue is prone to deadlock the driver when the client crashes or is exited ungracefully.

# License

This software is released under GPL 3.0.
