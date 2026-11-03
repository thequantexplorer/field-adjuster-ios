# Northwind field-adjuster-ios: agent instructions

- SwiftUI app, iOS 26. The Xcode project is generated from `project.yml` with XcodeGen (`xcodegen generate`). Commit the regenerated `FieldAdjuster.xcodeproj`.
- Test on the iOS Simulator: `xcodebuild test -project FieldAdjuster.xcodeproj -scheme FieldAdjuster -destination 'platform=iOS Simulator,name=iPhone 17 Pro'`.
- Money is integer cents.
- Every crash fix ships with a unit test and a UI test that repeat the steps from the crash report.
- Reproduce crashes in the Simulator before you fix them, and attach a screenshot or recording to the pull request.
