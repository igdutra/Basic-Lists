//
//  SnapshotTestCase.swift
//  productListTests
//
//  Created by Renan Silveira on 16/03/21.
//

import FBSnapshotTestCase
import XCTest

class SnapshotTestCase: FBSnapshotTestCase {

    // MARK: - Public methods

    func verifySnapshotView(delay: TimeInterval = 0,
                            tolerance: CGFloat = 0,
                            identifier: String = "",
                            file: StaticString = #file,
                            line: UInt = #line,
                            framesToRemove: [CGRect] = [],
                            view: @escaping () -> UIView?) {
        guard let view = view() else {
            XCTFail("could not fetch view", file: file, line: line)
            return
        }

        var image = view.asImage()

        if !framesToRemove.isEmpty {
            image = image.addImageWithFrame(frames: framesToRemove) ?? UIImage()
        }

        folderName = customFolderName(file: file)
        let customIdentifier = "\(identifier)_\(UIDevice.current.name.replacingOccurrences(of: " ", with: ""))"
        FBSnapshotVerifyView(UIImageView(image: image), identifier: customIdentifier, suffixes: NSOrderedSet(array: ["_64"]), perPixelTolerance: 0.005, overallTolerance: tolerance, file: file, line: line)
    }

    // MARK: - Private methods

    private func customFolderName(file: StaticString) -> String {
        let fileName = String(describing: type(of: self))
        let methodName: String = invocation?.selector.description ?? ""
        return "\(fileName)/\(methodName)"
    }
}
