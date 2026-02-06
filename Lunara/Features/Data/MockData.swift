//
//  MockData.swift
//  Lunara
//
//  Created by Alexandra on 6.02.26.
//

struct MockData {
    public static let horoscopeMockData = HoroscopeData(data: HoroscopeData.GeneralData(sign: ZodiacSign.virgo.rawValue,
                                                                                        scores: HoroscopeData.GeneralData.Scores(overall: 80,
                                                                                                                                 love: 70,
                                                                                                                                 career: 60,
                                                                                                                                 money: 80,
                                                                                                                                 health: 90),
                                                        lucky: HoroscopeData.GeneralData.Lucky(number: 3,
                                                                                               timeWindow: "11am - 1pm",
                                                                                               color: HoroscopeData.GeneralData.Lucky.Color(key: "green",
                                                                                                                                            label: "Green")),
                                                        content: HoroscopeData.GeneralData.Content(text: "ContentText",
                                                                                                   theme: "Love",
                                                                                                   keywords: ["Live", "Laught"],
                                                                                                   strengths: ["Live", "Laught"],
                                                                                                   weaknesses: ["Cars", "Grey color"])))
}
