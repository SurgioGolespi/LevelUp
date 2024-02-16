//
//  ContentView.swift
//  LevelUp
//
//  Created by Suraj Gajula on 2/5/24.
//
import SwiftUI
struct ContentView: View{
    @AppStorage("skillscompleted") var skillscompleted = 0
    @AppStorage("projectscompleted") var projectscompleted = 0
    var skills = ["Print","Variables", "Operations", "Functions"]
    var projects = ["Calculator"]
    @State var items: [String]
    @State var skillsarray: [Int]
    @State var isActive: Int? = nil
    @State var programindex = 0
    @State var descriptionindex = 0
    init(){
        let savedskills = UserDefaults.standard.array(forKey: "skillsarray") as? [Int] ?? [0, 0, 0, 0, 0, 0, 0, 0, 0, 0]
        _skillsarray = State(initialValue: savedskills)
        _items = State(initialValue: skills)}
    var body: some View{
        NavigationStack{
            ZStack{
                Color.black.edgesIgnoringSafeArea(.all)
                Text("Profile")
                    .offset(y: -50)
                    .frame(width: 300, height: 200)
                    .background(Color.white)
                    .cornerRadius(10)
                    .font(.system(size: 25))
                    .offset(y: -250)
                Text("Skills: \(skillscompleted)/\(skills.count)")
                    .offset(x: -90, y: -250)
                    .font(.system(size: 20))
                Text("Projects: \(projectscompleted)/\(projects.count)")
                    .offset(x: -80, y: -200)
                    .font(.system(size: 20))
                Button(action: {
                    items = skills
                    programindex = 0
                    descriptionindex = 0}){
                    Text("Skills")
                        .frame(width: 125, height: 40)
                        .foregroundColor(.black)
                        .background(Color.white)
                        .cornerRadius(10)}
                .offset(x: -85, y: -100)
                Button(action: {
                    items = projects
                    programindex = 1
                    descriptionindex = 1}){
                    Text("Projects")
                        .frame(width: 125, height: 40)
                        .foregroundColor(.black)
                        .background(Color.white)
                        .cornerRadius(10)}
                .offset(x: 85, y: -100)
                ScrollView(.vertical, showsIndicators: false){
                    VStack {
                        ForEach(items.indices, id: \.self) { index in
                            Button(action: {
                                isActive = 1
                                title = items[index]
                                program = programmatrix[programindex][index]
                                description = descriptionmatrix[descriptionindex][index]}){
                                Text(items[index])
                                    .foregroundColor(.black)
                                    .frame(width: 300, height: 50)
                                    .background(Color.white)
                                    .cornerRadius(10)}}}}
            .offset(y: 325)
            .padding(.bottom, 300)
            Spacer()
            NavigationLink("", destination: ItemView(), tag: 1, selection: $isActive)}}}}
struct ContentView_Previews: PreviewProvider{
    static var previews: some View{
        ContentView()}}
