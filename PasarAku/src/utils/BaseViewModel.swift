//
//  BaseViewModel.swift
//  PasarAku
//
//  Created by Sigit Sur on 07/09/25.
//

import Foundation

open class BaseViewModel: ObservableObject {
    var currentPage = 0
    var isLoading = false
    var hasMoreData = true
    
    let apiService: ApiService
    
    init(apiService: ApiService = container.resolve(ApiService.self)!) {
        self.apiService = apiService
    }
}
