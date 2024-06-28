//
//  RemoteImageView.swift
//  BIPDemo
//
//  Created by Micheal Bingham on 6/27/24.
//

import SwiftUI


struct RemoteImageView: View {
    @StateObject private var loader: ImageLoader
    var placeholder: Image

    init(url: String, placeholder: Image = Image(systemName: "photo")) {
        _loader = StateObject(wrappedValue: ImageLoader(url: url))
        self.placeholder = placeholder
    }

    var body: some View {
        if let image = loader.image {
            Image(uiImage: image)
                .resizable()
        } else {
            placeholder
                .resizable()
        }
    }
}

class ImageLoader: ObservableObject {
    @Published var image: UIImage?

    private static let imageCache = NSCache<NSString, UIImage>()

    init(url: String) {
        loadImage(from: url)
    }

    private func loadImage(from url: String) {
        if let cachedImage = ImageLoader.imageCache.object(forKey: url as NSString) {
            self.image = cachedImage
            return
        }

        guard let imageURL = URL(string: url) else {
            return
        }

        let task = URLSession.shared.dataTask(with: imageURL) { data, response, error in
            guard let data = data, let uiImage = UIImage(data: data) else {
                return
            }

            DispatchQueue.main.async {
                self.image = uiImage
                ImageLoader.imageCache.setObject(uiImage, forKey: url as NSString)
            }
        }
        task.resume()
    }
}

#Preview {
    RemoteImageView(url: "https://google.com")
}
