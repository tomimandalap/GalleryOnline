//
//  AlbumViewModel.swift
//  GalleryOnline
//
//  Created by Tomi Mandala Putra on 18/07/2024.
//

import Foundation

@Observable
class AlbumViewModel {
    var albums: [Album] = []

    func fetchAlbum() {
        guard let url = URL(string: "https://jsonplaceholder.typicode.com/photos") else { return }

        // data, response, error
        URLSession.shared.dataTask(with: url) { data, _, error in

            if let result = data {
                do {
                    // decode data JSON to Array of Album
                    let resultDecodeAlbums = try JSONDecoder().decode([Album].self, from: result)

                    // Update data album di main thread
                    DispatchQueue.main.async {
                        self.albums = resultDecodeAlbums
                    }
                } catch {
                    print("Error decoding data \(error)")
                }
            }

        }.resume() // menjalankan data task
    }
}
