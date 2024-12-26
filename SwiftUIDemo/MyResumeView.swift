//
//  MyResumeView.swift
//  SwiftUIDemo
//
//  Created by Willy Hsu on 2024/12/23.
//

import SwiftUI
let myInfo = Resume.shared
//let colums = [GridItem(.flexible()), GridItem(.flexible())]

struct MyResumeView: View {
    @State private var showButton = false
    var body: some View {
        ScrollView{
            myInformation
            skillSet
            workExperience
            contactButton
        }
        
    }
    
}

extension MyResumeView{
    
    var myInformation: some View {
        HStack {
            Image(systemName: "person.circle")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .foregroundColor(Color.secondary)
                .padding()
                .background(Color.white)
                .clipShape(Circle())
            
            VStack(spacing: 15) {
                Text(myInfo.name)
                    .font(.title.bold())
                    .foregroundColor(.primary)
                    .padding(.horizontal)
                
                Text(myInfo.title)
                    .foregroundColor(.secondary)
                    .padding(.horizontal)
                
                Label(myInfo.location, systemImage: "location")
                    .foregroundColor(.secondary)
                    .padding(.horizontal)
            }
        }
        .padding()
        .background(Color.secondary.opacity(0.1))
        .cornerRadius(20)
        .padding(.horizontal)
    }
    
    var workExperience: some View {
        VStack {
            Text("工作經歷")
                .font(.title.weight(.heavy))
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding()
            
            Color.gray.frame(height: 1)
                .padding(.horizontal)
            
            
            let column = [GridItem(.flexible())]
            LazyVGrid(columns: column, alignment: .leading) {
                ForEach(myInfo.experiences) { experience in
                    VStack(alignment: .leading ,spacing: 10) {
                        Text(experience.role)
                            .font(.headline)
                            .foregroundColor(.primary)
                        
                        Text(experience.company)
                            .font(.subheadline)
                            .foregroundColor(.secondary)
                        
                        Text("\(experience.startDate) - \(experience.endDate)")
                            .font(.caption)
                            .foregroundColor(.gray)
                    }
                    .padding()
                }
            }
            
        }
        .padding()
        .background(Color.secondary.opacity(0.1))
        .cornerRadius(20)
        .padding(.horizontal)
    }
    
    var skillSet: some View {
        let colums = [GridItem(.flexible()), GridItem(.flexible())]
        let skills = myInfo.skill.map {
            skillID(name: $0, category: $1)
        }.sorted { item1, item2 in
            item1.name < item2.name
        }
        
        return VStack {
            Text("技能")
                .font(.title.weight(.heavy))
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding()
            Color.gray.frame(height: 1)
                .padding(.horizontal)
            
            LazyVGrid(columns: colums) {
                ForEach(skills) { skill in
                    VStack(alignment: .leading, spacing: 10) {
                        Text(skill.name)
                            .font(.headline)
                            .frame(maxWidth: .infinity, alignment: .leading)
                        
                        VStack {
                            ForEach(skill.category, id: \.self) { category in
                                Text(category)
                                    .lineLimit(1)
                                    .minimumScaleFactor(0.5)
                                    .foregroundColor(.secondary)
                                    .frame(maxWidth: .infinity, alignment: .leading)
                            }
                        }
                    }
                    .padding()
                }
            }
        }
        .background(Color.secondary.opacity(0.1))
        .cornerRadius(20)
        .padding(.horizontal)
    }
    
    var contactButton: some View {
        Button {
            showButton = true
        } label: {
            Text("聯絡方式")
                .padding(.vertical)
                .font(.system(.title3, design: .rounded).bold())
                .frame(maxWidth: .infinity)
        }
        .buttonStyle(.borderedProminent)
        .tint(.blue)
        .padding(.horizontal)
        .sheet(isPresented: $showButton) {
            MyContactView()
                .presentationDetents([.fraction(0.5)])
                .presentationDragIndicator(.visible)
        }
    }
}


#Preview {
    MyResumeView()
}
