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
}
