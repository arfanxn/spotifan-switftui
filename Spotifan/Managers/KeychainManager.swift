//
//  KeychainManager.swift
//  Spotifan
//
//  Created by Muhammad Arfan on 07/11/22.
//

import Foundation

class KeychainManager {
	
	static let shared = KeychainManager()

	private func save(_ data: Data, service: String, account: String) {
		
		// Create query
		let query = [
			kSecValueData: data,
			kSecClass: kSecClassGenericPassword,
			kSecAttrService: service,
			kSecAttrAccount: account,
		] as CFDictionary
		
		// Add data in query to keychain
		let status = SecItemAdd(query, nil)
		
		if status != errSecSuccess {
			// Print out the error
			print("KeychainManager -> Error: \(status)")
		}
	}
	func save<T:Codable>(_ item: T, service: String, account: String) {
		
		do {
			// Encode as JSON data and save in keychain
			let data = try JSONEncoder().encode(item)
			save(data, service: service, account: account)
			
		} catch {
			assertionFailure("Fail to encode item for keychain: \(error)")
		}
	}
	

	private func get(service: String, account: String) -> Data? {
		
		let query = [
			kSecAttrService: service,
			kSecAttrAccount: account,
			kSecClass: kSecClassGenericPassword,
			kSecReturnData: true
		] as CFDictionary
		
		var result: AnyObject?
		SecItemCopyMatching(query, &result)
		
		return (result as? Data)
	}
	func get<T:Codable>(service: String, account: String, type: T.Type) -> T? {
		// Read item data from keychain
		guard let data = self.get(service: service, account: account) else {
			return nil
		}
		
		// Decode JSON data to object
		do {
			let item = try JSONDecoder().decode(type, from: data)
			return item
		} catch {
			assertionFailure("Fail to decode item for keychain: \(error)")
			return nil
		}
	}
	

	func delete(service: String, account: String) {
		
		let query = [
			kSecAttrService: service,
			kSecAttrAccount: account,
			kSecClass: kSecClassGenericPassword,
		] as CFDictionary
		
		// Delete item from keychain
		SecItemDelete(query)
	}
	
}
