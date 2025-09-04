//
//  CategoryItem.swift
//  PasarAku
//
//  Created by Sigit Sur on 04/09/25.
//

struct CategoryItem {
    let id: String
    let name: String
    let iconUrl: String
}

extension DataKategori {
    func toDomain() -> CategoryItem {
        CategoryItem(
            id: idKategori ?? "", name: namaKategori ?? "",
            iconUrl: "\(baseURL)assets/img/\(icon ?? "")")
    }
}

extension Category {
    func toDomainList() -> [CategoryItem] {
        dataKategori.map { ($0).toDomain() }
    }
}
