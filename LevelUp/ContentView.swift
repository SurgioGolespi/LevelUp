//
//  ContentView.swift
//  LevelUp
//
//  Created by Suraj Gajula on 2/5/24.
//
import SwiftUI
var items = ["Hello World","Variables", "Math", "Functions", "For Loops", "While Loops", "Conditionals", "Arrays", "Methods", "Classes"]
var completed = 0
var itemscompleted = [false, false, false, false, false, false, false, false, false, false]
struct ContentView: View{
    var body: some View{
        ZStack{
            Color.black.edgesIgnoringSafeArea(.all)
            Rectangle()
                .fill(Color.white)
                .frame(width: 300, height: 200)
                .offset(y : -250)
            Text("Profile")
                .offset(y : -300)
                .font(.system(size: 25))
                .foregroundColor(.black)
            Text("C#: \(completed)/10")
                .offset(x : -100, y : -250)
                .font(.system(size: 20))
            Button(action: {
                print("Skills Tapped")}) {
                    Text("Skills")
                        .frame(width: 125, height: 40)
                        .foregroundColor(.black)
                        .background(Color.white)}
                .offset(x : -85, y : -100)
            Button(action: {
                print("Location Tapped")}) {
                    Text("Location")
                        .frame(width: 125, height: 40)
                        .foregroundColor(.black)
                        .background(Color.white)}
            .offset(x : 85, y : -100)
            ScrollView(.vertical, showsIndicators: false) {
                VStack {
                    ForEach(items.indices, id: \.self) { index in
                        Button(action: {
                            print("\(items[index]) Tapped")
                            if itemscompleted[index] == false{
                                itemscompleted[index] = true
                                completed += 1}}){
                                Text(items[index])
                                    .foregroundColor(.black)
                                    .frame(width: 300, height: 50)
                                .background(Color.white)}}}}
            .offset(y : 325)
            .padding(.bottom, 300)}}}
#Preview{
    ContentView()}
