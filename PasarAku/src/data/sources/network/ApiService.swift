//
//  ApiService.swift
//  PasarAku
//
//  Created by Sigit Sur on 04/09/25.
//
import Alamofire

let baseURL = AppConfig.baseURL

protocol ApiService {
    func getCategories() async throws -> Category
    func getSlider() async throws -> Slider
    func getAds(page: String) async throws -> AdsList
    func getAdsByCategory(categoryId: String, page: String) async throws
        -> AdsList
}

class ApiServiceImpl: ApiService {
    private let baseUrlApi = baseURL + "index.php/Api"

    func getCategories() async throws -> Category {
        let url = "\(baseUrlApi)/ApiKategori/getKategoriList"
        let data = try await AF.request(url).serializingDecodable(Category.self)
            .value

        return data
    }

    func getSlider() async throws -> Slider {
        let url = "\(baseUrlApi)/ApiSlider/getSliderList"
        let data = try await AF.request(url).serializingDecodable(Slider.self)
            .value
        return data
    }

    func getAds(page: String) async throws -> AdsList {
        let url = "\(baseUrlApi)/ApiIklan/getListIklan?page=\(page)"
        let data = try await AF.request(url).serializingDecodable(AdsList.self)
            .value
        return data
    }

    func getAdsByCategory(categoryId: String, page: String) async throws
        -> AdsList
    {
        let url =
            "\(baseUrlApi)/ApiIklan/getListIklan?kategori=\(categoryId)&page=\(page)"
        
        print(url)
        let data = try await AF.request(url).serializingDecodable(AdsList.self)
            .value
        return data
    }
}
