#!/bin/sh

# Step 1. Remove pre-existing artifacts and set up
PACKAGING_DIR="${SRCROOT}/../../../Packaging"
RELEASE_DIR="${PACKAGING_DIR}/${PROJECT_NAME}"
TEMP_BUILD_DIR="${RELEASE_DIR}/build"
if [ -d "${RELEASE_DIR}" ]; then
rm -rf "${RELEASE_DIR}"
fi

mkdir -p "${RELEASE_DIR}"

IPHONE="iphone"
OS="os"
SIMULATOR="simulator"
UNIVERSAL="universal"

IPHONE_DIR="${TEMP_BUILD_DIR}/${CONFIGURATION}-${IPHONE}${OS}"
SIMULATOR_DIR="${TEMP_BUILD_DIR}/${CONFIGURATION}-${IPHONE}${SIMULATOR}"
UNIVERSAL_DIR="${TEMP_BUILD_DIR}/${CONFIGURATION}-${UNIVERSAL}"

IPHONE_NAME="${PROJECT_NAME}-iOS"
SIMULATOR_NAME="${PROJECT_NAME}-iOS-${SIMULATOR}"
UNIVERSAL_NAME="${PROJECT_NAME}-iOS-${UNIVERSAL}"

# Step 2. Build Device and Simulator versions
xcodebuild -project "${PROJECT_NAME}".xcodeproj -scheme "${PROJECT_NAME}" -configuration "${CONFIGURATION}" -sdk "${IPHONE}${OS}" ONLY_ACTIVE_ARCH=NO clean BUILD_DIR="${TEMP_BUILD_DIR}" archive -UseModernBuildSystem=NO
xcodebuild -project "${PROJECT_NAME}".xcodeproj -scheme "${PROJECT_NAME}" -configuration "${CONFIGURATION}" -sdk "${IPHONE}${SIMULATOR}" ONLY_ACTIVE_ARCH=NO clean BUILD_DIR="${TEMP_BUILD_DIR}" build -UseModernBuildSystem=NO

# Step 3. Prepare universal folder for creation of universal executable via lipo
# a) Grab framework file instead of symlink
cp -L -R "${IPHONE_DIR}/${PROJECT_NAME}.framework" "${RELEASE_DIR}"
rm "${IPHONE_DIR}/${PROJECT_NAME}.framework"
mv "${RELEASE_DIR}/${PROJECT_NAME}.framework" "${IPHONE_DIR}"
# b) Copy the framework structure (from iphoneos build) to the universal folder
cp -R "${IPHONE_DIR}/" "${UNIVERSAL_DIR}"
# c) Remove iphoneos executable to ensure universal zip will contain universal executable
rm "${UNIVERSAL_DIR}/${PROJECT_NAME}.framework/${PROJECT_NAME}"
# d) Copy the Swift modules (from iphonesimulator build) to the universal folder
if [ -d "${SIMULATOR_DIR}/${PROJECT_NAME}.framework/Modules/${PROJECT_NAME}.swiftmodule" ]; then
cp -R "${SIMULATOR_DIR}/${PROJECT_NAME}.framework/Modules/${PROJECT_NAME}.swiftmodule/." "${UNIVERSAL_DIR}/${PROJECT_NAME}.framework/Modules/${PROJECT_NAME}.swiftmodule"
fi

# Step 4. Create universal binary file using lipo and place the combined executable in the copied framework directory
lipo -create -output "${BUILT_PRODUCTS_DIR}/${PROJECT_NAME}.framework/${PROJECT_NAME}" "${SIMULATOR_DIR}/${PROJECT_NAME}.framework/${PROJECT_NAME}" "${IPHONE_DIR}/${PROJECT_NAME}.framework/${PROJECT_NAME}"
cp "${BUILT_PRODUCTS_DIR}/${PROJECT_NAME}.framework/${PROJECT_NAME}" "${UNIVERSAL_DIR}/${PROJECT_NAME}.framework/${PROJECT_NAME}"

# Step 5. Move outputs
mv "${IPHONE_DIR}" "${TEMP_BUILD_DIR}/${IPHONE_NAME}"
mv "${SIMULATOR_DIR}" "${TEMP_BUILD_DIR}/${SIMULATOR_NAME}"
mv "${UNIVERSAL_DIR}" "${TEMP_BUILD_DIR}/${UNIVERSAL_NAME}"
cp "${PACKAGING_DIR}/LICENSE.md" "${TEMP_BUILD_DIR}/${IPHONE_NAME}/LICENSE.md"
cp "${PACKAGING_DIR}/LICENSE.md" "${TEMP_BUILD_DIR}/${SIMULATOR_NAME}/LICENSE.md"
cp "${PACKAGING_DIR}/LICENSE.md" "${TEMP_BUILD_DIR}/${UNIVERSAL_NAME}/LICENSE.md"

# Step 6. Copy universal framework to project directory (for linking by other projects)
if [ -d "${SRCROOT}/universal-build" ]; then
rm -rf "${SRCROOT}/universal-build"
fi
mkdir "${SRCROOT}/universal-build"
cp -R "${TEMP_BUILD_DIR}/${UNIVERSAL_NAME}/${PROJECT_NAME}.framework" "${SRCROOT}/universal-build"

# Step 7. Clean up and zip
cd "${TEMP_BUILD_DIR}"
zip -rm "${RELEASE_DIR}/${IPHONE_NAME}.zip" "${IPHONE_NAME}"
zip -rm "${RELEASE_DIR}/${SIMULATOR_NAME}.zip" "${SIMULATOR_NAME}"
zip -rm "${RELEASE_DIR}/${UNIVERSAL_NAME}.zip" "${UNIVERSAL_NAME}"

# Step 8. Open packaging directory
rm -rf "${TEMP_BUILD_DIR}"
