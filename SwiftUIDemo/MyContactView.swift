//
//  MyContactView.swift
//  SwiftUIDemo
//
//  Created by Willy Hsu on 2024/12/24.
//

import SwiftUI
import SDWebImageSwiftUI

let socialMedia = Resume.shared.socialMedia
let phoneUrl = Resume.shared.phoneUrl


struct MyContactView: View {
    var body: some View {
        NavigationView {
            List {
                Button {
                    UIApplication.shared.open(URL(string: phoneUrl)!)
                } label: {
                    HStack(spacing: 15) {
                        Image(systemName: "phone.circle.fill")
                            .foregroundColor(.green)
                            .imageScale(.large)
                        Text("Phone")
                            .font(.headline)
                    }
                    .padding(.vertical, 10)
                }
                
                ForEach(socialMedia, id: \.name) { media in
                    Button {
                        if let url = URL(string: media.url) {
                            UIApplication.shared.open(url)
                        }
                    } label: {
                        HStack(spacing: 15) {
                            WebImage(url: URL(string: media.logo))
                                .onSuccess { image, data, cacheType in
                                    
                                }
                                .resizable()
                                .scaledToFit()
                                .frame(width: 20, height: 20)
                                
                            
                            Text(media.name)
                                .font(.headline)
                        }
                        .padding(.vertical, 10)
                    }
                }
            }
        }
    }
}

#Preview {
    MyContactView()
}
