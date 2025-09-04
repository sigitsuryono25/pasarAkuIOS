//
//  Injector.swift
//  PasarAku
//
//  Created by Sigit Sur on 04/09/25.
//
import Swinject
import Foundation

let container: Container = {
    let c = Container()

    //register for apiservice
    c.register(ApiService.self) { _ in ApiServiceImpl() }

    return c
}()

struct AppConfig {
    static var baseURL: String {
        guard
            let url = Bundle.main.object(forInfoDictionaryKey: "BASE_URL")
                as? String
        else {
            fatalError("BASE_URL not found in Config.plist")
        }

        return url
    }
}
