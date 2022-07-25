//
//  MainRouter.swift
//  Pizza Station
//
//  Created by Shadi Elattar on 11/5/21.
//

import Foundation
import Alamofire

enum MainRouter: APIRouter{
    case slider
    
    var method: HTTPMethod{
        switch self{
        case .slider:
            return .get
        }
    }
    
    
    var path: String{
        switch self{
        case .slider:
            return "slider.php"
        }
    }
    
    var parameters: Parameters?{
        switch self{
        case .slider:
            return nil
        }
    }
    
    var encoding: ParameterEncoding{
        switch self{
        case .slider:
            return URLEncoding.default
        }
    }
    
    

    
}



enum PizzaErrors: Error{
    case URLNotValid
}
