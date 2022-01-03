//
//  ServiseAPI.swift
//  testTaskForITS_Partner
//
//  Created by sleman on 3.01.22.
//

import Foundation

class ServiseAPI {
    
//    func fetchUrlSession(completionHandler: @escaping (User) -> Void) {
//        let jsonUrl = "https://json-generator.com/api/json/get/clyWAUbaxu?indent=2"
//        guard let url = URL(string: jsonUrl) else { return }
//        let session = URLSession.shared
//        let task = session.dataTask(with: url) { [weak self] data, response, error in
//            if let data = data, let users = self?.parseJSON(withData: data) {
//                completionHandler(users)
//            }
//        }
//        task.resume()
//    }
//
//
//     private func parseJSON(withData data: Data) -> User? {
//        let decoder = JSONDecoder()
//        do {
//            let users = try decoder.decode(User.self, from: data)
//            guard let user =  User(user: users) else { return nil }
//            return user
//        } catch let error as NSError {
//            print(error.localizedDescription)
//        }
//        return nil
//    }
}
