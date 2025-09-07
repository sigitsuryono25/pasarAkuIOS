//
//  LoginView.swift
//  PasarAku
//
//  Created by Sigit Sur on 07/09/25.
//
import SwiftUI

struct LoginView: View {
    @Binding var showSheet: Bool

    var body: some View {
        VStack(alignment: .leading) {
            Text("Login")
                .font(.title2)
                .bold()
                .padding(.vertical)
            Spacer()
            HStack {
                Spacer()
                Image("ic_login")
                    .resizable()
                    .scaledToFit()
                    .padding()
                Spacer()
            }

            Spacer()

            HStack {
                ImageSvg(
                    svg: "ic_google",
                    renderMode: Image.TemplateRenderingMode.original
                )
                .frame(width: 24, height: 24)
                Text("Continue with Google")
                Spacer()
            }
            .padding()
            .border(Color.gray, width: 0.2)
            .cornerRadius(8)

            HStack {
                ImageSvg(
                    svg: "ic_facebook",
                    renderMode: Image.TemplateRenderingMode.original
                )
                .frame(width: 24, height: 24)
                Text("Continue with Facebook")
                Spacer()
            }
            .padding()
            .border(Color.gray, width: 0.2)
            .cornerRadius(8)

            HStack {
                ImageSvg(
                    svg: "ic_email",
                    renderMode: Image.TemplateRenderingMode.original
                )
                .frame(width: 24, height: 24)
                Text("Continue with Email")
                Spacer()
            }
            .padding()
            .border(Color.gray, width: 0.2)
            .cornerRadius(8)

        }
        .padding()
        .presentationDetents([.large])
        .presentationDragIndicator(.visible)
    }
}
