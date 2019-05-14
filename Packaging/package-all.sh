#!/bin/sh

set -e

NC_PROJECTS_DIR="${BASH_SOURCE%/*}/../FeatureFrameworksWithNestedCore/Projects"
NF_PROJECTS_DIR="${BASH_SOURCE%/*}/../CoreFrameworkWithNestedFeatures/Projects"

## Install dependencies on top level frameworks
## Nested Core
cp -R "${NC_PROJECTS_DIR}/NestedCoreFramework/universal-build/NestedCoreFramework.framework" "${NC_PROJECTS_DIR}/SwiftFeatureFramework"
cp -R "${NC_PROJECTS_DIR}/NestedCoreFramework/universal-build/NestedCoreFramework.framework" "${NC_PROJECTS_DIR}/ObjcFeatureFramework"
## Nested Features
cp -R "${NF_PROJECTS_DIR}/NestedSwiftFramework/universal-build/NestedSwiftFramework.framework" "${NF_PROJECTS_DIR}/CoreFramework"
cp -R "${NF_PROJECTS_DIR}/NestedObjcFramework/universal-build/NestedObjcFramework.framework" "${NF_PROJECTS_DIR}/CoreFramework"

# Package Nested Frameworks
## NC - Nested
xcodebuild -project "${NC_PROJECTS_DIR}/NestedCoreFramework/NestedCoreFramework.xcodeproj" -scheme Packaging -UseModernBuildSystem=NO archive
## NF - Nested
xcodebuild -project "${NF_PROJECTS_DIR}/NestedSwiftFramework/NestedSwiftFramework.xcodeproj" -scheme Packaging -UseModernBuildSystem=NO archive
xcodebuild -project "${NF_PROJECTS_DIR}/NestedObjcFramework/NestedObjcFramework.xcodeproj" -scheme Packaging -UseModernBuildSystem=NO archive

# Package Top Level Frameworks
## NC - Top Level
xcodebuild -project "${NC_PROJECTS_DIR}/SwiftFeatureFramework/SwiftFeatureFramework.xcodeproj" -scheme Packaging -UseModernBuildSystem=NO archive
xcodebuild -project "${NC_PROJECTS_DIR}/ObjcFeatureFramework/ObjcFeatureFramework.xcodeproj" -scheme Packaging -UseModernBuildSystem=NO archive

## NC - Top Level
xcodebuild -project "${NF_PROJECTS_DIR}/CoreFramework/CoreFramework.xcodeproj" -scheme Packaging -UseModernBuildSystem=NO archive

open "${BASH_SOURCE%/*}"
