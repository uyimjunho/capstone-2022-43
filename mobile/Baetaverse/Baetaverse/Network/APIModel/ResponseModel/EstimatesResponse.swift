//
//  EstimatesResponse.swift
//  Baetaverse
//
//  Created by JeongTaek Han on 2022/05/09.
//

import Foundation

extension APIResponseModel {
    
    struct EstimatesResponse: Decodable {
        
        let id: UUID
        let quoteId: UUID
        let hsCode: String
        let country: String
        let createdAt: Date
        
        enum CodingKeys: String, CodingKey {
            
            case id
            case quoteId = "Quote_id"
            case hsCode = "HSCODE"
            case country = "COUNTRY"
            case createdAt = "created_at"
            
        }
        
    }
    
}
