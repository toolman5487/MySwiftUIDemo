//
//  MyResumeView.swift
//  SwiftUIDemo
//
//  Created by Willy Hsu on 2024/12/23.
//

import SwiftUI
let myInfo = Resume.shared
let colums = [GridItem(.flexible()), GridItem(.flexible())]

struct MyResumeView: View {
    @State private var showButton = false
    var body: some View {
        myInformation
        skillSet
        contactButton
        

    }
    var myInformation: some View{
        HStack {
            Image(systemName: "person.circle.fill")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 150, height: 150)
                .padding()
                .background(Color.white)
                .clipShape(Circle())
            
            VStack(spacing: 15) {
                Text(myInfo.name)
                    .font(.title.weight(.heavy))
                    .fontWeight(.bold)
                    .foregroundColor(.black)
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
    }
    var skillSet: some View{
        let skills = myInfo.skill.map {
            skillID(name: $0, category: $1)
        }.sorted { item1, item2 in
            item1.name < item2.name
        }
        
        return VStack{
            Text("技能")
                .font(.title.weight(.heavy))
                .frame(maxWidth: .infinity,alignment: .leading)
                .padding()
            Color.gray.frame(height: 1)
                .padding(.horizontal)
            
            LazyVGrid(columns: colums) {
                ForEach(skills) { skill in
                    VStack(alignment: .leading, spacing: 10) {
                        Text(skill.name)
                            .font(.headline)
                            .frame(maxWidth: .infinity, alignment: .leading)
                        
                        VStack() {
                            ForEach(skill.category, id: \.self) { category in
                                Text(category)
                                    .lineLimit(1)
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
            }
}



#Preview {
    MyResumeView()
}
