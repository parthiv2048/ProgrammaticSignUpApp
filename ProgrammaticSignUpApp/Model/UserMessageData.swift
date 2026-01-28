//
//  UserMessageData.swift
//  ProgrammaticSignUpApp
//
//  Created by Parthiv Ganguly on 1/28/26.
//

class UserMessageData {
    var messageText: String
    var messageSelected: Bool
    
    init(messageText: String, messageSelected: Bool) {
        self.messageText = messageText
        self.messageSelected = messageSelected
    }
    
    static func generateMockData() -> [UserMessageData] {
        var messages: [UserMessageData] = []
        for i in 1...20 {
            messages.append(UserMessageData(messageText: "Message \(i)", messageSelected: false))
        }
        return messages
    }
}

