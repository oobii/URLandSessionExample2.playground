// https://developer.apple.com/library/content/documentation/Xcode/Conceptual/swift_playgrounds_doc_format/PlaygroundLiveViewable.html#//apple_ref/doc/uid/TP40017343-CH40-SW1

// https://www.raywenderlich.com/158106/urlsession-tutorial-getting-started
import UIKit
import Foundation
import PlaygroundSupport


// TODO: lookup queues are for future expansion
let mainQueue = DispatchQueue.main
let backgroundQueue = DispatchQueue.global(qos: .userInitiated)


// for async code in Playground

PlaygroundPage.current.needsIndefiniteExecution = true

// To remove "Failed to obtain sandbox extension for path=
// Playgrounds are sandboxed

URLCache.shared = URLCache(memoryCapacity: 0, diskCapacity: 0, diskPath: nil)


// .default or .ephemeral or .background
let config:URLSessionConfiguration = .default
let session = URLSession(configuration: config )

var searchTerm = "Katy Perry"
var myUrlComponents = URLComponents(string: "https://itunes.apple.com/search")
myUrlComponents?.query = "media=music&entity=song&term=\(searchTerm)"


if let url = myUrlComponents?.url {
    
    
    let task = session.dataTask(with: url) { (data, response, error) in
        
        if let error = error {
            print("Error: \(error.localizedDescription)")
        } else {
            if let response = response as? HTTPURLResponse {
                print("response code = \(response.statusCode)")
                response.statusCode
                if let myData = data {
                    if let myString = String(data: myData, encoding: String.Encoding.utf8) {
                        print(myString)
                        myString
                    }
                }
            }
        }
    }
    task.resume()
}


 