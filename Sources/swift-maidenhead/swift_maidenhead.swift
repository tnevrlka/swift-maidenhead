import Foundation
import CoreLocation

let letters = ["A", "B", "C", "D", "E", "F", "G", "H", "I", "J", "K", "L", "M", "N", "O", "P", "Q", "R", "S", "T", "U", "V", "W", "X", "Y", "Z"]

public enum Precision {
    case field, square, subsquare
}

public func calculateLocator(location: CLLocationCoordinate2D) -> String {
    return calculateField(location: location) + calculateSquare(location: location) + calculateSubSquare(location: location)
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

private func calculateSubSquare(location: CLLocationCoordinate2D) -> String {
    let longitude = location.longitude + 180
    let longitudeLetter = letters[Int(longitude * 60 / 5) % 24].lowercased()

    let latitude = location.latitude + 90
    let latitudeLetter = letters[Int(latitude * 60 / 2.5) % 24].lowercased()
    
    return longitudeLetter + latitudeLetter
}
