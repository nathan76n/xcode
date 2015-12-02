import Foundation

var str = "Hello, playground"

let jsonStr = "{\"user\": {\"name\": \"jquave\",\"id\": 542,\"url\": \"http://jamesonquave.com\"},\"friend_ids\": [299,341,492],\"alert_message\": \"Please verify e-mail address to continue\"}"

var err:NSError?
let data = jsonStr.dataUsingEncoding(NSUTF8StringEncoding, allowLossyConversion: false) ?? NSData()

typealias JSONDict = [String:AnyObject]

let parsed = NSJSONSerialization.JSONObjectWithData(data, options: NSJSONReadingOptions.allZeros, error: &err) as? JSONDict


if let parsed = parsed {//LumaJSON.parse(jsonStr) {
    
    // Simple printing to the console to check JSON structure
    println(parsed)
    
    // Simple Key/Value retreival
    if let alertMessage = parsed["alert_message"] as? String {
        println("Alert: \(alertMessage)")
    }
    
    // Nested JSON
    if let userName = parsed["user"]?["name"] as? String {
        println("Username is \(userName)")
    }
    
    // Nested object casting works using Swift's built-in mechanisms
    if let friendIDs = parsed["friend_ids"] as? [Int] {
        for friendID in friendIDs {
            println("Friend ID: \(friendID)")
        }
    }
}