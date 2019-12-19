# CocoaPodsVendoredDSYMIssue

See: https://github.com/CocoaPods/CocoaPods/issues/9419

Run using Make:
```sh
$ make
```

You should get something along the lines of:
```
error: Multiple commands produce '/Users/kyle/Library/Developer/Xcode/DerivedData/ClientApp-hcaxpttrbfuuzofmmcsdxpvgmvqh/Build/Products/Debug-iphonesimulator/VendoredFramework.framework.dSYM':
1) That command depends on command in Target 'ClientApp' (project 'ClientApp'): script phase “[CP] Embed Pods Frameworks”
2) That command depends on command in Target 'ClientAppUITestHost' (project 'ClientApp'): script phase “[CP] Embed Pods Frameworks”


warning: duplicate output file '/Users/kyle/Library/Developer/Xcode/DerivedData/ClientApp-hcaxpttrbfuuzofmmcsdxpvgmvqh/Build/Products/Debug-iphonesimulator/VendoredFramework.framework.dSYM' on task: PhaseScriptExecution [CP] Embed Pods Frameworks /Users/kyle/Library/Developer/Xcode/DerivedData/ClientApp-hcaxpttrbfuuzofmmcsdxpvgmvqh/Build/Intermediates.noindex/ClientApp.build/Debug-iphonesimulator/ClientAppUITestHost.build/Script-0B91F756715E69CE2E47BA72.sh (in target 'ClientAppUITestHost' from project 'ClientApp')
** TEST BUILD FAILED **
```
