//
//  ContentView.swift
//  LevelUp
//
//  Created by Suraj Gajula on 2/5/24.
//
import SwiftUI
import UserNotifications
public struct ContentView: View{
    @AppStorage("skillscompleted") var skillscompleted = 0
    @AppStorage("projectscompleted") var projectscompleted = 0
    @AppStorage("doneindex") var doneindex = 0
    @AppStorage("changeindex") var changeindex = 0
    @State var items: [String]
    @State var navactive: Int? = nil
    var skills = ["Print","Variables", "Operations", "Functions"]
    var projects = ["Calculator"]
    var skillsarray: [Int]{
        get{
            return UserDefaults.standard.array(forKey: "skillsarray") as? [Int] ?? [0, 0, 0, 0]}
        set{
            UserDefaults.standard.set(newValue, forKey: "skillsarray")}}
    var projectsarray: [Int]{
        get{
            return UserDefaults.standard.array(forKey: "projectsarray") as? [Int] ?? [0]}
        set{
            UserDefaults.standard.set(newValue, forKey: "projectsarray")}}
    init(){
        _items = State(initialValue: skills)}
    func MarkAsCompleted(){
        if changeindex == 0{
            if skillsarray[doneindex] != 1{
                skilldone(at: doneindex, to: 1)
                skillscompleted += 1}}
        if changeindex == 1{
            if projectsarray[doneindex] != 1{
                projectdone(at: doneindex, to: 1)
                projectscompleted += 1}}}
    func skilldone(at index: Int, to value: Int) {
        var newarray = skillsarray
        newarray[index] = value
        UserDefaults.standard.set(newarray, forKey:  "skillsarray")}
    func projectdone(at index: Int, to value: Int) {
        var newarray = projectsarray
        newarray[index] = value
        UserDefaults.standard.set(newarray, forKey:  "projectsarray")}
    func requestNotificationAuthorization() {
            UNUserNotificationCenter.current().requestAuthorization(options: [.alert, .sound]) { granted, error in
                if granted {
                    print("Notification authorization granted.")
                } else {
                    print("Notification authorization denied.")
                }
            }
        }
    public var body: some View{
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
                    .onAppear {
                        requestNotificationAuthorization()
                    }
                Text("Skills: \(skillscompleted)/\(skills.count)")
                    .offset(x: -90, y: -250)
                    .font(.system(size: 20))
                Text("Projects: \(projectscompleted)/\(projects.count)")
                    .offset(x: -80, y: -200)
                    .font(.system(size: 20))
                Button(action: {
                    if(changeindex == 1){
                        items = skills
                        changeindex = 0}
                    else if changeindex == 0{
                        items = projects
                        changeindex = 1}}){
                        Text((changeindex != 0) ? "Projects" : "Skills")
                            .frame(width: 300, height: 50)
                            .foregroundColor(.black)
                            .background(Color.white)
                        .cornerRadius(10)}
                    .offset(y: -100)
                ScrollView(.vertical, showsIndicators: false){
                    VStack {
                        ForEach(items.indices, id: \.self) { index in
                            Button(action:{
                                navactive = 1
                                doneindex = index
                                ItemView().title = items[index]
                                ItemView().program = programmatrix[changeindex][index]
                                ItemView().description = descriptionmatrix[changeindex][index]}){
                                    Text(items[index])
                                        .foregroundColor(.black)
                                        .frame(width: 300, height: 50)
                                        .background(Color.white)
                                    .cornerRadius(10)}}}}
                .offset(y: 350)
                .padding(.bottom, 300)
                NavigationLink("", destination: ItemView(), tag: 1, selection: $navactive)}}}}
struct ContentView_Previews: PreviewProvider{
    static var previews: some View{
        ContentView()}}
