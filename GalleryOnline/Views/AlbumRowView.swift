//
//  AlbumRowView.swift
//  GalleryOnline
//
//  Created by Tomi Mandala Putra on 18/07/2024.
//

import SwiftUI

struct AlbumRowView: View {
    var album: Album

    var body: some View {
        HStack(alignment: .center) {
            AsyncImage(url: URL(string: album.thumbnailUrl)) { phase in
                switch phase {
                case .failure:
                    Image(systemName: "photo").font(.largeTitle)
                case .success(let image):
                    image.resizable()
                default: ProgressView()
                }
            }
            .frame(width: 150, height: 150)
            .clipShape(RoundedRectangle(cornerRadius: 8))

            VStack(alignment: .leading) {
                Text("\(album.id)").bold()
                Text(album.title).bold().font(.title3)
            }
        }
    }
}

#Preview {
    AlbumRowView(album: Album(albumId: 1, id: 1, title: "Title", url: "https://via.placeholder.com/600/92c952", thumbnailUrl: "https://via.placeholder.com/150/92c952"))
}
