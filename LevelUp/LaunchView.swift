//
//  LaunchView.swift
//  LevelUp
//
//  Created by Suraj Gajula on 2/22/24.
//
import SwiftUI
public struct LaunchView: View{
    @State var navactive = false
    let slides = ["Welcome to LevelUp.",
                  "Track your learning.",
                  "Plan study sessions.",
                  "Save time and money."]
    public var body: some View{
        ZStack{
            TabView{
                ForEach(slides, id: \.self){ slide in
                    Text(slide)
                        .frame(width: 300)
                        .font(.system(size: 30))
                    .foregroundColor(.white)}}
            .background(Color.black)
            .tabViewStyle(PageTabViewStyle())
            Button(action :{
                navactive = true
                LevelUpApp().launchactive = 1}) {
                Text("Done")
                    .foregroundColor(.black)
                    .padding()}
                    .background(Color.white)
                    .cornerRadius(10)
                    .offset(x: 125, y: -350)
                .fullScreenCover(isPresented: $navactive) {
                            ContentView()}}}}
struct LaunchView_Previews: PreviewProvider{
    static var previews: some View{
        LaunchView()}}
