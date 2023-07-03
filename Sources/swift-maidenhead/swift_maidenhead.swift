import Foundation
import CoreLocation

let letters = ["A", "B", "C", "D", "E", "F", "G", "H", "I", "J", "K", "L", "M", "N", "O", "P", "Q", "R", "S", "T", "U", "V", "W", "X", "Y", "Z"]

public enum Precision {
    case field, square, subsquare
}

public struct Maidenhead {
    var precision: Precision = Precision.subsquare
    var coordinate: CLLocationCoordinate2D
    var locator: String = ""
    
    init(coordinate: CLLocationCoordinate2D) {
        self.coordinate = coordinate
        self.locator = calculateLocator()
    }
    
    public func calculateLocator() -> String {
        switch self.precision {
        case .field:
            return calculateField()
        case .square:
            return calculateField() + calculateSquare()
        case .subsquare:
            return calculateField() + calculateSquare() + calculateSubSquare()
        }
    }

    private func calculateField() -> String {
        let longitude = self.coordinate.longitude + 180
        let longitudeLetter = letters[Int(longitude) / 20]
        
        let latitude = self.coordinate.latitude + 90
        let latitudeLetter = letters[Int(latitude) / 10]
        
        return longitudeLetter + latitudeLetter
    }

    private func calculateSquare() -> String {
        let longitude = self.coordinate.longitude + 180
        let longitudeDigit = String(Int(longitude) / 2 % 10)
        
        let latitude = self.coordinate.latitude + 90
        let latitudeDigit = String(Int(latitude) % 10)
        
        return longitudeDigit + latitudeDigit
    }

    private func calculateSubSquare() -> String {
        let longitude = self.coordinate.longitude + 180
        let longitudeLetter = letters[Int(longitude * 60 / 5) % 24].lowercased()

        let latitude = self.coordinate.latitude + 90
        let latitudeLetter = letters[Int(latitude * 60 / 2.5) % 24].lowercased()
        
        return longitudeLetter + latitudeLetter
    }

    public func calculateGridCorners(locator: String) {
        
    }

}

