//
//  AlbumListView.swift
//  GalleryOnline
//
//  Created by Tomi Mandala Putra on 18/07/2024.
//

import SwiftUI

struct AlbumListView: View {
    @Environment(AlbumViewModel.self) var albumViewModel

    var body: some View {
        NavigationStack {
            List(albumViewModel.albums) { album in
                NavigationLink(destination: AlbumDetailView(album: album)) {
                    AlbumRowView(album: album)
                }
            }
            .navigationTitle("Gallery Online")
            .onAppear {
                albumViewModel.fetchAlbum()
            }
        }
    }
}

#Preview {
    AlbumListView().environment(AlbumViewModel())
}
