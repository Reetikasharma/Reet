//
//  ProfileViewModel.swift
//  DemoTest
//
//  Created by Reetika Sharma on 23/08/21.
//

import Foundation
class  ProfileViewModel {
    
    //MARK: PROPERTIES
    var service = NetworkService()
    
    //MARK: FUNCTIONS
    func request(completion:@escaping(Result<ProfileData?,Error>)->Void) {
        let url = generate(url: URL.init(string: getDataUrl)!)
        service.sendRequest(request: url) { (result) in
            switch result {
            case .success(let data):
                let decoder = JSONDecoder()
                let messages = try? decoder.decode(ProfileData.self, from: data!)
                completion(.success(messages))
            case .failure(let error):
                print(error)
                completion(Result.failure(error))
            }
        }
    }
    
    func generate(url:URL)->URLRequest {
        var request = URLRequest.init(url: url)
        request.method = .get
        return request
    }
    
}

