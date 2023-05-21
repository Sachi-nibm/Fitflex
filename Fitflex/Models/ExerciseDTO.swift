//
//  ExerciseDTO.swift
//  Fitflex
//
//  Created by Sachini Perera on 2023-05-21.
//

// This file was generated from JSON Schema using quicktype, do not modify it directly.
// https://app.quicktype.io
import Foundation

struct ExerciseDTO: Codable {
    let bodyParts: [String]
    let caloriesBurnedPerMinute: Int
    let category, description, difficulty: String
    let durationMinutes: Int
    let id: String
    let imageURL: String
    let name: String
    let steps: [String]
    let videoURL: String

    enum CodingKeys: String, CodingKey {
        case bodyParts = "body_parts"
        case caloriesBurnedPerMinute = "calories_burned_per_minute"
        case category, description, difficulty
        case durationMinutes = "duration_minutes"
        case id
        case imageURL = "image_url"
        case name, steps
        case videoURL = "video_url"
    }
}
