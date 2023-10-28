//
//  Created by Artem Novichkov on 28.10.2023.
//

import SwiftUI

public extension View {

    @MainActor
    func makeImageData(size: CGSize) -> Data? {
        let imageRenderer = ImageRenderer(content: frame(width: size.width, height: size.height))
        imageRenderer.scale = 3
        guard let cgImage = imageRenderer.cgImage else {
            return nil
        }
        let bitmapImageRep = NSBitmapImageRep(cgImage: cgImage)
        return bitmapImageRep.representation(using: .jpeg, properties: [:])
    }
}
