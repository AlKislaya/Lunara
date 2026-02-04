//
//  HoroscopeService.swift
//  Lunara
//
//  Created by Alexandra on 4.02.26.
//

import Foundation

enum HoroscopeError: LocalizedError {
    case invalidURL(endPoint: String)
    case serverError(description: String, code: Int)
    case jsonEncodingError
    
    var errorDescription: String? {
        switch self {
        case .invalidURL(let endPoint):
            return "Cannot form url for endpoint: \(endPoint)"
        case .serverError(let description, _):
            return description
        case .jsonEncodingError:
            return "json encoding error"
        }
    }
    
    var code: Int {
           switch self {
           case .invalidURL(endPoint: let endPoint):
               return 400
               
           case .serverError(_, let code):
               return code
               
           case .jsonEncodingError:
               return 1202
           }
       }
}

class HoroscopeService {
    public func fetchHoroscope(for sign: ZodiacSign, date: Date) async throws -> HoroscopeData? {
        let url = try formHoroscopeForSignURL(sign: sign.rawValue, date: date)
        
        var request = URLRequest(url: url)
        request.setValue(HoroscopeService.apiKey, forHTTPHeaderField: HTTPData.Headers.Keys.xApiKey)
        
        let (data, response) = try await URLSession.shared.data(for: request)
        
        if let httpResponse = response as? HTTPURLResponse, httpResponse.statusCode != 200 {
            throw HoroscopeError.serverError(description: httpResponse.description, code: httpResponse.statusCode)
        }
        
        return try parseJson(with: data)
    }
    
    public func fetchHoroscope(birthDate: Date, city: String, date: Date) async throws -> HoroscopeData? {
        let url = try formPersonalHoroscopeURL()
        
        var request = URLRequest(url: url)
        request.setValue(HoroscopeService.apiKey, forHTTPHeaderField: HTTPData.Headers.Keys.xApiKey)
        request.setValue(HTTPData.Headers.Values.contentTypeJson, forHTTPHeaderField: HTTPData.Headers.Keys.contentType)
        request.httpMethod = "POST"
        request.httpBody = try encodePersonalHoroscopePayloadToJson(birthDate: birthDate, city: city, date: date)
        
        let (data, response) = try await URLSession.shared.data(for: request)
        
        if let httpResponse = response as? HTTPURLResponse, httpResponse.statusCode != 200 {
            throw HoroscopeError.serverError(description: httpResponse.description, code: httpResponse.statusCode)
        }
        
        return try parseJson(with: data)
    }
}

extension HoroscopeService {
    
    private func formHoroscopeForSignURL(sign: String, date: Date) throws -> URL {
        guard let url = URL(string: UrlLibrary.baseUrl + UrlLibrary.EndPoints.horoscopeForSign) else {
            throw HoroscopeError.invalidURL(endPoint: UrlLibrary.EndPoints.horoscopeForSign)
        }
        
        let configurationsQuery = [URLQueryItem(name: HTTPData.Params.sign, value: sign),
                                   URLQueryItem(name: HTTPData.Params.date, value: formatDate(date: date))]
        
        return url.appending(queryItems: configurationsQuery)
    }
    
    private func formPersonalHoroscopeURL() throws -> URL {
        guard let url = URL(string: UrlLibrary.baseUrl + UrlLibrary.EndPoints.horoscopePersonal) else {
            throw HoroscopeError.invalidURL(endPoint: UrlLibrary.EndPoints.horoscopePersonal)
        }
        
        return url
    }
}

extension HoroscopeService {
    
    private func parseJson(with data: Data) throws -> HoroscopeData? {
        let decoder = JSONDecoder()
        let result = try decoder.decode(HoroscopeData.self, from: data)
        return result
    }
    
    private func encodePersonalHoroscopePayloadToJson(birthDate: Date, city: String, date: Date) throws -> Data {
        let birthData = PersonalHoroscopePayloadData.PersonalBirthData(date: birthDate, city: city)
        let payloadData = PersonalHoroscopePayloadData(birth: birthData, date: date)
        
        let encoder = JSONEncoder()
        let jsonData = try encoder.encode(payloadData)
        
        guard let jsonString = String(data: jsonData, encoding: .utf8) else {
            throw HoroscopeError.jsonEncodingError
        }
        print(jsonString)
        
        return jsonData
    }
    
    private func formatDate(date: Date) -> String {
        let formatter = DateFormatter()
        formatter.dateFormat = HoroscopeService.dateFormat
        return formatter.string(from: date)
    }
    
    /*
     "birth": {
         "year": 1990, "month": 5, "day": 15,
         "hour": 14, "minute": 30,
         "city": "New York"
     },
     "date": "2023-10-27",
     */
    struct PersonalHoroscopePayloadData: Encodable {
        var birth: PersonalBirthData
        var date: Date
        
        struct PersonalBirthData: Encodable {
            var year: Int
            var month: Int
            var day: Int
            var hour: Int
            var minute: Int
            var city: String
            
            init(date: Date, city: String) {
                let calendar = Calendar.current
                
                year = calendar.component(.year, from: date)
                month = calendar.component(.month, from: date)
                day = calendar.component(.day, from: date)
                hour = calendar.component(.hour, from: date)
                minute = calendar.component(.minute, from: date)
                
                self.city = city
            }
        }
    }
}

extension HoroscopeService {
    private static let apiKey = "979871046b33bca54c62d49b3b2617d3924009b5ec76e543f33a1483c4d11367"
    private static let dateFormat = "yyyy-MM-dd"
    
    private struct UrlLibrary {
        static let baseUrl = "https://astro-api-1qnc.onrender.com"
        struct EndPoints {
            static let horoscopeForSign = "/api/v1/horoscope/daily/sign"
            static let horoscopePersonal = "/api/v1/horoscope/daily/personal"
        }
    }
    
    private struct HTTPData {
        struct Headers {
            struct Keys {
                static let xApiKey = "x-api-key"
                static let contentType = "Content-Type"
            }
            
            struct Values {
                static let contentTypeJson = "application/json"
            }
        }
        struct Params {
            static let sign = "sign"
            static let birth = "birth"
            static let date = "date"
        }
    }
}

struct HoroscopeData: Decodable {
    var data: GeneralData
    
    struct GeneralData: Decodable {
        var sign: String
        var scores: Scores
        var lucky: Lucky
        var content: Content
        
        struct Scores: Decodable {
            let overall: Int
            let love: Int
            let career: Int
            let money: Int
            let health: Int
        }
        
        struct Lucky: Decodable {
            var number: Int
            var timeWindow: String
            var color: Color
            
            struct Color: Decodable {
                var key: String
                var label: String
            }
            enum CodingKeys: String, CodingKey {
                case number
                case timeWindow = "time_window"
                case color
            }
        }
        
        struct Content: Decodable {
            var text: String
            var theme: String
            var keywords: [String]
            var strengths: [String]
            var weaknesses: [String]
            
            enum CodingKeys: String, CodingKey {
                case text
                case theme
                case keywords
                case strengths = "do"
                case weaknesses = "dont"
            }
        }
    }
}
