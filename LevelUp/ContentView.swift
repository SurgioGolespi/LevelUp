//
//  ContentView.swift
//  LevelUp
//
//  Created by Suraj Gajula on 2/5/24.
//
import SwiftUI

struct ContentView: View{
    @AppStorage("completed") var completed = 0
    var skills = ["Hello World","Variables", "Operations", "Functions", "For Loops", "While Loops", "Conditionals", "Arrays", "Methods", "Classes"]
    var projects = ["Calculator"]
    @State var items: [String]
    @State var skillscompleted: [Int]
    init(){
        let savedskills = UserDefaults.standard.array(forKey: "skillscompleted") as? [Int] ?? [0, 0, 0, 0, 0, 0, 0, 0, 0, 0]
        _skillscompleted = State(initialValue: savedskills)
        _items = State(initialValue: skills)}
    var body: some View{
        NavigationView{
            ZStack{
                Color.black.edgesIgnoringSafeArea(.all)
                RoundedRectangle(cornerRadius: 20)
                    .fill(Color.white)
                    .frame(width: 300, height: 200)
                    .offset(y: -250)
                Text("Profile")
                    .offset(y: -300)
                    .font(.system(size: 25))
                    .foregroundColor(.black)
                Text("Skills: \(completed)/\(skills.count)")
                    .offset(x: -90, y: -250)
                    .font(.system(size: 20))
                Button(action: {items = skills}){
                    Text("Skills")
                        .frame(width: 125, height: 40)
                        .foregroundColor(.black)
                        .background(Color.white)
                        .cornerRadius(10)}
                .offset(x: -85, y: -100)
                Button(action: {items = projects}){
                    Text("Projects")
                        .frame(width: 125, height: 40)
                        .foregroundColor(.black)
                        .background(Color.white)
                        .cornerRadius(10)}
                .offset(x: 85, y: -100)
                ScrollView(.vertical, showsIndicators: false){
                    VStack {
                        ForEach(items.indices, id: \.self) { index in
                            NavigationLink(destination: ItemView()){
                                Text(items[index])
                                    .foregroundColor(.black)
                                    .frame(width: 300, height: 50)
                                    .background(Color.white)
                                    .cornerRadius(10)}}}}
            .offset(y: 325)
            .padding(.bottom, 300)}}}}
struct ContentView_Previews: PreviewProvider{
    static var previews: some View{
        ContentView()}}
