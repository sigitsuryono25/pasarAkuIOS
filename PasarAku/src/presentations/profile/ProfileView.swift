//
//  ProfileView.swift
//  PasarAku
//
//  Created by Sigit Sur on 01/09/25.
//
import SwiftUI

struct ProfileView: View {
    var body: some View {
        VStack {
            ProfileheaderView()
            Spacer()
            VStack {
                HStack {
                    Text("Transaksi")
                        .font(.body)
                        .fontWeight(.semibold)
                    Spacer()
                    Image(systemName: "chevron.right")
                }
                Spacer()
            }
            .padding()
        }
    }
}

struct ProfileheaderView: View {
    var body: some View {
        VStack {
            HStack {
                Image("profile")
                    .resizable()
                    .frame(width: 60, height: 60)
                    .clipShape(Circle())

                VStack(alignment: .leading) {
                    Text("Sigit Sur")
                        .font(.title2)
                        .foregroundColor(.white)
                        .fontWeight(.bold)
                    Text("Premium Member")
                        .font(.caption)
                        .foregroundColor(.white)
                }
                .padding(.horizontal, 20)
                Spacer()

                HStack {
                    Image(systemName: "gear")
                        .resizable()
                        .frame(width: 24, height: 24)
                        .foregroundColor(.white)
                }
            }

            HStack {
                Image(
                    systemName:
                        "minus.plus.batteryblock.stack.exclamationmark.fill"
                )
                .padding()
                VStack(alignment: .leading) {
                    Text("Klain kupon 5% hari ini")
                        .font(.caption)
                        .fontWeight(.bold)
                    Text("Kupon ini belum digunakan")
                        .font(.caption)
                        .foregroundColor(.secondary)
                }
                Spacer()
                Image(systemName: "chevron.right")
                    .padding()
            }
            .background(.white)
            .cornerRadius(10)
        }
        .padding()
        .background(Color("pasarAkuSecondary"))
    }

}

#Preview {
    ProfileView()
}
