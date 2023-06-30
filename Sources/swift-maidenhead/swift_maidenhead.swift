import Foundation
import CoreLocation

let letters = ["A", "B", "C", "D", "E", "F", "G", "H", "I", "J", "K", "L", "M", "N", "O", "P", "Q", "R", "S", "T", "U", "V", "W", "X", "Y", "Z"]

enum Precision {
    case field, square, subsquare
}

struct Maidenhead {
    var precision: Precision
    var location: CLLocationCoordinate2D
    var locator = ""
    
    init(precision: Precision, location: CLLocationCoordinate2D) {
        self.precision = precision
        self.location = location
        self.locator = calculateLocator(location: location)
    }
    
    func calculateLocator(location: CLLocationCoordinate2D) -> String {
        return calculateField(location: location) + calculateSquare(location: location)
    }
    
    private func calculateField(location: CLLocationCoordinate2D) -> String {
        let longitude = location.longitude + 180
        let longitudeLetter = letters[Int(longitude) / 20]
        
        let latitude = location.latitude + 90
        let latitudeLetter = letters[Int(latitude) / 10]
        
        return longitudeLetter + latitudeLetter
    }
    
    private func calculateSquare(location: CLLocationCoordinate2D) -> String {
        let longitude = location.longitude + 180
        let longitudeDigit = String(Int(longitude) / 2 % 10)
        
        let latitude = location.latitude + 90
        let latitudeDigit = String(Int(latitude) % 10)
        
        return longitudeDigit + latitudeDigit
    }
}
