//
//  RemoteImageView.swift
//  BIPDemo
//
//  Created by Micheal Bingham on 6/27/24.
//

import SwiftUI


struct RemoteImageView: View {
    @StateObject private var loader: ImageLoader
    @State private var isLoaded = false

    init(url: String) {
        _loader = StateObject(wrappedValue: ImageLoader(url: url))
    }

    var body: some View {
        ZStack {
            Rectangle()
                .fill(Color.white)
                .aspectRatio(contentMode: .fit)
                .cornerRadius(10)
                .shadow(color: Color.black.opacity(0.1), radius: 10, x: 0, y: 2.21)
                .overlay(
                    Group {
                        if let image = loader.image {
                            Image(uiImage: image)
                                .resizable()
                                .aspectRatio(contentMode: .fill)
                                .opacity(isLoaded ? 1 : 0)
                                .cornerRadius(10)
                                .onAppear {
                                    withAnimation(.easeIn(duration: 0.5)) {
                                        isLoaded = true
                                    }
                                }
                        }
                    }
                )
        }
        .padding()
    }
}

class ImageLoader: ObservableObject {
    @Published var image: UIImage?

    private static let imageCache = NSCache<NSString, UIImage>()

    init(url: String) {
        Task {
            await loadImage(from: url)
        }
    }

    private func loadImage(from url: String) async {
        if let cachedImage = ImageLoader.imageCache.object(forKey: url as NSString) {
            DispatchQueue.main.async {
                self.image = cachedImage
            }
            return
        }

        guard let imageURL = URL(string: url) else {
            return
        }

        do {
            let (data, _) = try await URLSession.shared.data(from: imageURL)
            if let uiImage = UIImage(data: data) {
                DispatchQueue.main.async {
                    self.image = uiImage
                    ImageLoader.imageCache.setObject(uiImage, forKey: url as NSString)
                }
            }
        } catch {
            print("Error loading image: \(error)")
        }
    }
}



#Preview {
    RemoteImageView(url: "https://picsum.photos/seed/picsum/300/300")
        .frame(width: 400)
}
