//
//  MyInfo.swift
//  SwiftUIDemo
//
//  Created by Willy Hsu on 2024/12/23.
//

import Foundation

//typealias Experience = (title: String, company: String, startDate: String, endDate: String)

struct skillID:Identifiable{
    var name: String
    var category: [String]
    var id: String {
        name
    }
}

struct Experience: Identifiable {
    var id = UUID()
    var role: String
    var company: String
    var startDate: String
    var endDate: String
}

struct SocialMedia: Identifiable {
    var id = UUID()
    var logo: String
    var name: String
    var url: String
}

struct Resume {
    static let shared = Resume()
    let name     = "Willy Hsu"
    let title    = "iOS Developer"
    let location = "位置：台灣"
    let skills   = [ "Swift","UIkit","SwiftUI","SPM","CocoaPods ","Firebase"]
    
    let skill = [
        "Swift": ["UIkit", "SwiftUI"],
        "IDE": ["Xcode", "Visual Studio Code"],
        "套件管理": ["SPM", "CocoaPods "],
        "版本控制": ["Git", "Github", "Sourcetree"]]
    
    let experiences: [Experience] = [
        Experience(role: "招募顧問", company: "PERSOLKELLY", startDate: "2020 年 3 月", endDate: "2024 年 11月"),
        Experience(role: "大學生", company: "世新大學", startDate: "2016 年 9 月", endDate: "2020 年 6 月")
    ]
    
    let phoneUrl = "tel://0912345678"
    let socialMedia: [SocialMedia] = [
            SocialMedia(logo: "https://www.freepnglogos.com/uploads/linkedin-logo-design-30.png", name: "LinkedIn", url: "https://www.linkedin.com/in/willy-hsu-2a277a1a4/"),
            SocialMedia(logo: "https://cdn3.iconfinder.com/data/icons/social-network-30/512/social-06-1024.png", name: "YouTube", url: "https://www.youtube.com/channel/UCN8ZR0wOPHxkveC1mkcMVXw")
        ]
}
