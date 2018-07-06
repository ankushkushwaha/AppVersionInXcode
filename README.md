# Xcode Application versioning for iOS swift projects

#### Steps to configure

1. Add build script Run Script - 
![alt text](https://raw.githubusercontent.com/ankushkushwaha/AppVersionInXcode/master/Images/1.png "Logo Title Text 1")

2. Copy following shell script 
```
#/bin/sh

version=$(git rev-parse --verify HEAD | cut -c 1-7)

fileContent="// DO NOT EDIT,
// IT IS A MACHINE GENERATED FILE

//  AppInfo.swift
//
import Foundation
class AppInfo {
let version: String
let build: String
let gitCommitSHA: String = \"$version\"
init?() {
guard let version = Bundle.main.infoDictionary?[\"CFBundleShortVersionString\"] as? String,
let build = Bundle.main.infoDictionary?[\"CFBundleVersion\"] as? String else {
return nil
}
self.version = version
self.build = build
}
}"
echo "$fileContent" > AppInfo.swift
```
![alt text](https://raw.githubusercontent.com/ankushkushwaha/AppVersionInXcode/master/Images/2.png "Logo Title Text 1")

3. Move run script above the 'compile sources'
![alt text](https://raw.githubusercontent.com/ankushkushwaha/AppVersionInXcode/master/Images/3.png "Logo Title Text 1")

3. Now Build your project
4. It will create a file AppInfo.swift in project's root folder

5. Drag an drop AppInfo.swift file into your xcode project navigator - include image?
![alt text](https://raw.githubusercontent.com/ankushkushwaha/AppVersionInXcode/master/Images/4.png "Logo Title Text 1")

6. Enjoy using like following:
```
guard let info = AppInfo() else {
return
}
let infoText = "AppVersion: \(info.version) \nBuild: \(info.build) \nGit hash: \(info.gitCommitSHA)"
print(infoText)
```
![alt text](https://raw.githubusercontent.com/ankushkushwaha/AppVersionInXcode/master/Images/5.png "Logo Title Text 1")

