//
//  Common.swift
//  RelaxOn
//
//  Created by Doyeon on 2023/05/17.
//

/**
 Public 하게 쓰여지는 프로퍼티 & 함수 등
 */

import Foundation

/**
 Bundle에 있는 mp3 파일 경로 불러오는 기능
 */
func getPathUrl(forResource: String, musicExtension: MusicExtension) -> URL? {
    Bundle.main.url(forResource: forResource, withExtension: musicExtension.rawValue) ?? nil
}

/**
튜토리얼 이미지
 */
var tutorialImage = "TutorialGesture"

/**
 SoundDetailView의 프로퍼티
 */
var circleWidth: [CGFloat] = [120, 210, 250, 300]
var pointAngle: [Double] = [72, 144, 216, 288, 360]
var featureIcon: [String] = [FeatureIcon.interval.rawValue,
                             FeatureIcon.volume.rawValue,
                             FeatureIcon.fitch.rawValue,
                             FeatureIcon.filter.rawValue]


