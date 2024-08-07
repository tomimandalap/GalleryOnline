//
//  GalleryOnlineApp.swift
//  GalleryOnline
//
//  Created by Tomi Mandala Putra on 18/07/2024.
//

import SwiftUI

@main
struct GalleryOnlineApp: App {
    @State private var albumViewModel = AlbumViewModel()
    var body: some Scene {
        WindowGroup {
            AlbumListView().environment(albumViewModel)
        }
    }
}
