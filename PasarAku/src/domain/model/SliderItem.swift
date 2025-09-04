//
//  SliderItem.swift
//  PasarAku
//
//  Created by Sigit Sur on 04/09/25.
//

struct SliderItem {
    let id: String
    let cover: String
}

extension DataSlider {
    func toDomain() -> SliderItem {
        SliderItem(id: id ?? "", cover: "\(baseURL)assets/cover/\(cover ?? "")")
    }
}

extension Slider {
    func toDomainList() -> [SliderItem] {
        dataSlider.map { $0.toDomain() }
    }
}
