//
//  LocalProfileManager.swift
//  ProfileControlledFeature
//
//  Created by Stewart Thomson on 8/11/2024.
//

import Foundation
import Security

class LocalProfileManager {


    func isProfileInstalled() -> Bool {

        guard let certificatePath = Bundle.main.url(forResource: "Test Signing", withExtension: "cer") else { return false }
        guard let certificateData = try? Data(contentsOf: certificatePath, options: []) else { return false }

        guard let cfData = CFDataCreate(kCFAllocatorDefault, [UInt8](certificateData), certificateData.count) else { return false }
        guard let certificate = SecCertificateCreateWithData(nil, cfData) else { return false }
        let policy = SecPolicyCreateBasicX509()

        var rawTrust: SecTrust?
        guard SecTrustCreateWithCertificates(certificate, policy, &rawTrust) == errSecSuccess, let trust = rawTrust else { return false }

        // Evaluate trust
        var result: CFError?
        let trusted = SecTrustEvaluateWithError(trust, &result)

        if result == nil {
            return trusted
        } else {
            return false
        }
    }
}
