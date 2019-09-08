
//
//  APIWrapper.swift
//  MoviesChallenge
//
//  Created by Safa Ads on 9/8/19.
//  Copyright © 2019 safaads. All rights reserved.
//

import UIKit
import Alamofire

class APIWrapper {

    func makeRequest(url:URL, method:HTTPMethod, parameters:Parameters, completion: @escaping (Data)->()) {
        Alamofire.request(url, method: method, parameters: parameters, encoding: URLEncoding.queryString, headers: nil).validate().responseData { (response) in
            if response.result.isSuccess {
                if let data = response.data {
                    completion(data)
                }
            }
            if response.result.isFailure {
                ErrorView.getSharedInstance().show()
            }
        }
    }
    
    
}
