//
//  AlbumDetailView.swift
//  GalleryOnline
//
//  Created by Tomi Mandala Putra on 18/07/2024.
//

import SwiftUI

struct AlbumDetailView: View {
    @Environment(\.dismiss) var dismiss

    var album: Album

    var body: some View {
        VStack {
            AsyncImage(url: URL(string: album.thumbnailUrl)) { phase in
                switch phase {
                case .failure:
                    Image(systemName: "photo").font(.largeTitle)
                case .success(let image):
                    image.resizable()
                default: ProgressView()
                }
            }
            .ignoresSafeArea()
            .frame(maxHeight: 300)

            List {
                Text(album.title)
                    .font(.title2)

                Text("AlbumId \(album.albumId)")
                    .font(.subheadline)
                    .foregroundStyle(.gray)

                Text(album.thumbnailUrl)
                    .font(.subheadline)
                    .foregroundStyle(.blue)
            }
        }
        .navigationBarBackButtonHidden(true)
        .toolbar {
            ToolbarItem(placement: .navigationBarLeading) {
                Button(action: { dismiss() }) {
                    Image(systemName: "chevron.left")
                    Text("Back")
                }.foregroundStyle(.black)
            }
        }
    }
}

#Preview {
    NavigationStack {
        AlbumDetailView(album: Album(albumId: 1, id: 1, title: "Title", url: "https://via.placeholder.com/600/92c952", thumbnailUrl: "https://via.placeholder.com/150/92c952"))
    }
}
