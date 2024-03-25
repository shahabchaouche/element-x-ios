//
// Copyright 2022 New Vector Ltd
//
// Licensed under the Apache License, Version 2.0 (the "License");
// you may not use this file except in compliance with the License.
// You may obtain a copy of the License at
//
// http://www.apache.org/licenses/LICENSE-2.0
//
// Unless required by applicable law or agreed to in writing, software
// distributed under the License is distributed on an "AS IS" BASIS,
// WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
// See the License for the specific language governing permissions and
// limitations under the License.
//

import XCTest

extension XCUIElement {
    func clearAndTypeText(_ text: String) {
        forceTap()
        
        guard let currentValue = value as? String else {
            XCTFail("Tried to clear and type text into a non string value")
            return
        }
        
        let deleteString = String(repeating: XCUIKeyboardKey.delete.rawValue, count: currentValue.count)
        typeText(deleteString)
        
        for character in text {
            typeText(String(character))
        }
    }
    
    func forceTap() {
        let coordinate: XCUICoordinate = coordinate(withNormalizedOffset: .init(dx: 0.5, dy: 0.5))
        coordinate.tap()
    }
}
