/**
 * Copyright IBM Corporation 2016
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 * http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 **/

import Foundation

import LoggerAPI

public class PrintLogger: Logger {
    private let type: LoggerMessageType

    public func log(_ type: LoggerMessageType, msg: String,
                    functionName: String, lineNum: Int, fileName: String ) {
        if type.rawValue >= self.type.rawValue {
            print("\(type): \(functionName) \(fileName) line \(lineNum) - \(msg)")
        }
    }

    public func isLogging(_ level: LoggerAPI.LoggerMessageType) -> Bool {
        return type.rawValue >= self.type.rawValue
    }
    
    public static func use(_ type: LoggerMessageType = .verbose) {
        Log.logger = PrintLogger(type)
        setbuf(stdout, nil)
    }

    public init (_ type: LoggerMessageType = .verbose) {
        self.type = type
    }
}
