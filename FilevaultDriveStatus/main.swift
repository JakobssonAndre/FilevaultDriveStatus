#!/usr/bin/env swift

import Foundation

print("Fetching information about FileVault status ..\r\n")

let task = NSTask()
task.launchPath = "/usr/bin/env"
task.arguments = ["fdesetup", "status"]

let pipe = NSPipe()
task.standardOutput = pipe
task.launch()

let result = pipe.fileHandleForReading.readDataToEndOfFile()
let status: String = NSString(data: result, encoding: NSUTF8StringEncoding)! as String
print(status)

task.waitUntilExit()

print("Press enter to continue ..")
let ignore = readLine()
