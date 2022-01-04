//
//  ServiseAPI.swift
//  testTaskForITS_Partner
//
//  Created by sleman on 3.01.22.
//

import Foundation

class ServiseAPI {
    let jsonUrl = "https://api.json-generator.com/templates/0SZV_OPhVzbr/data?access_token=czvx85ecg2wsw0xiselmbqntusvbx9n4v4ng5hdj"
    func fetchUrlSession(completionHandler: @escaping ([User]) -> Void) {
        guard let url = URL(string: jsonUrl) else { return }
        let session = URLSession.shared
        let task = session.dataTask(with: url) { [weak self] data, _, error in
            if let data = data, let users = self?.parseJSON(withData: data) {
                completionHandler(users)
            }
        }
        task.resume()
    }
     private func parseJSON(withData data: Data) -> [User]? {
        let decoder = JSONDecoder()
         var usersNew: [User] = []
        do {
            let users = try decoder.decode([User].self, from: data)
            for man in users{
                guard let user =  User(user: man) else { return nil }
                usersNew.append(user)
            }
            return usersNew
        } catch let error as NSError {
            print(error.localizedDescription)
        }
        return nil
    }
}
