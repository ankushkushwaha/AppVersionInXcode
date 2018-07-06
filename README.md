# Xcode Application versioning for iOS swift projects

#### Output
![alt text](https://raw.githubusercontent.com/ankushkushwaha/AppVersionInXcode/master/Images/6.png "Result")

#### Steps to configure

##### 1. Add build script Run Script
![alt text](https://raw.githubusercontent.com/ankushkushwaha/AppVersionInXcode/master/Images/1.png "Add RunScript")

##### 2. Copy following code in your runscript
-
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
![alt text](https://raw.githubusercontent.com/ankushkushwaha/AppVersionInXcode/master/Images/2.png "RunScript Code")

##### 3. Move/Drag the run script above the 'compile sources'
![alt text](https://raw.githubusercontent.com/ankushkushwaha/AppVersionInXcode/master/Images/3.png "Put Runscript above compile sources")

##### 4. Now Build your project, It will create a file AppInfo.swift in project's root folder

##### 5. Drag an drop AppInfo.swift file into your xcode project navigator.
![alt text](https://raw.githubusercontent.com/ankushkushwaha/AppVersionInXcode/master/Images/4.png "Add AppInfo.swift into Xcode")

#### Usage

```
guard let info = AppInfo() else {
    return
}
let infoText = "AppVersion: \(info.version) \nBuild: \(info.build) \nGit hash: \(info.gitCommitSHA)"
print(infoText)
```
![alt text](https://raw.githubusercontent.com/ankushkushwaha/AppVersionInXcode/master/Images/5.png "Logo Title Text 1")

