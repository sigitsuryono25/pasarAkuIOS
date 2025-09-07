//
//  AdsItemView.swift
//  PasarAku
//
//  Created by Sigit Sur on 07/09/25.
//
import SwiftUI

struct AdsItemView: View {
    let adsItem: AdsItem
    var onTap: (() -> Void)? = nil
    var onMoreTap: (() -> Void)? = nil

    var body: some View {
        VStack(alignment: .leading) {
            ImageWeb(
                url:
                    adsItem.foto.first ?? "",
                contentMode: ContentMode.fit,
                height: 200
            )
            .frame(maxWidth: .infinity)
            .aspectRatio(1, contentMode: .fill)
            .foregroundColor(.gray)
            .opacity(0.8)
            .clipped()

            Text(adsItem.judulIklan)
                .lineLimit(2)
                .truncationMode(.tail)
                .font(.body)
                .padding(.bottom, 4)
                .padding(.horizontal, 8)

            HStack(alignment: .center) {
                Text(adsItem.harga)
                    .bold()
                    .font(.caption)
                    .foregroundColor(Color("pasarAkuSecondary"))
            }
            .padding(.horizontal, 8)
            .padding(.bottom, 4)

            HStack {
                if self.adsItem.isPremium == "Y" {
                    ImageSvg(svg: "ic_premium", resizeable: false)
                        .foregroundColor(Color("pasarAkuSecondary"))
                }
                Text(adsItem.namaLengkap)
                    .font(.caption)
                Spacer()
                ImageSvg(svg: "ic_more_horiz", resizeable: false) {
                    onMoreTap?()
                }

            }
            .padding(.horizontal, 8)
            .padding(.bottom, 8)

        }
        .onTapGesture {
            onTap?()
        }
        .border(Color.gray, width: 0.2)
        .cornerRadius(4)
    }
}
