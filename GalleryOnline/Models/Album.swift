//
//  Album.swift
//  GalleryOnline
//
//  Created by Tomi Mandala Putra on 18/07/2024.
//

import Foundation

struct Album: Codable, Identifiable {
    let albumId: Int
    let id: Int
    let title: String
    let url: String
    let thumbnailUrl: String
}
