//
//  BaetaverseAppService.swift
//  Baetaverse
//
//  Created by JeongTaek Han on 2022/04/01.
//

import Foundation

final class BaetaverseAppService: AppService {
    
    private let auth: AppAuthService
    private let businessService: AppBusinessService
    
    var isLogin: Bool {
        auth.isLogin
    }
    
    init(auth: AppAuthService, businessService: AppBusinessService) {
        self.auth = auth
        self.businessService = businessService
    }
    
    static func configure() -> BaetaverseAppService {
        let networkService = NetworkServiceProvider()
        let auth = BaetaverseAuth(networkService: networkService)
        let businessService = BaetaverseBusinessService(networkService: networkService)
        return BaetaverseAppService(auth: auth, businessService: businessService)
    }
    
    func login(email: String, password: String) async throws {
        try await auth.login(email: email, password: password)
    }
    
    func logout() {
        auth.logout()
    }
    
    func signUp(email: String, password: String, name: String, phoneNumber: String) async throws {
        try await auth.signUp(email: email, password: password, name: name, phoneNumber: phoneNumber)
    }
    
    func registerEvaluateRequest(estimateRequest: EstimateRequest, products: [Product]) async throws {
        try await businessService.registerEvaluateRequest(
            token: auth.token,
            estimateRequest: estimateRequest,
            products: products
        )
    }
    
    func registerEstimate(estimate: Estimate) async throws {
        try await businessService.registerEstimate(token: auth.token, estimate: estimate)
    }
    
    func queryHSCode(code: String) async throws -> [String] {
        return try await businessService.queryHSCode(token: auth.token, code: code)
    }
    
    func queryEstimateRequests() async throws -> [EstimateRequest] {
        return try await businessService.queryEstimateRequests(token: auth.token)
    }
    
    func queryEstimateRequestDetail(id: String) async throws -> (EstimateRequest, [Product]) {
        return try await businessService.queryEstimateRequestDetail(token: auth.token, id: id)
    }
    
}
