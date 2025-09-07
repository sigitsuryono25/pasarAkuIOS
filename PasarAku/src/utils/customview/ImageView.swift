//
//  ImageWeb.swift
//  PasarAku
//
//  Created by Sigit Sur on 04/09/25.
//
import SwiftUI

struct ImageWeb: View {
    let url: String
    var contentMode: ContentMode = .fit
    var width: CGFloat? = nil
    var height: CGFloat? = nil

    var body: some View {
        AsyncImage(url: URL(string: url)) { image in
            image
                .resizable()
                .aspectRatio(contentMode: contentMode)
                .frame(width: width, height: height)
        } placeholder: {
            ZStack {
                Color.gray.opacity(0.2)
                ProgressView()
            }
        }
    }
}

struct ImageSvg: View {
    let svg: String
    var resizeable: Bool = true
    var renderMode: Image.TemplateRenderingMode? = .template
    var onTap: (() -> Void)? = nil

    var body: some View {
        let img = Image(svg)
            .renderingMode(renderMode)
        if !resizeable {
            img.onTapGesture(perform: onTap ?? {})
        } else {
            img.resizable().onTapGesture(perform: onTap ?? {})
        }
    }
}
