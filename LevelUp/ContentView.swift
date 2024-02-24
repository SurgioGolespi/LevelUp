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
    @State var items: [String] = [""]
    @State var itemactive = false
    @State var additemactive = false
    var skills: [String]{
        get{
            return UserDefaults.standard.array(forKey: "skills") as? [String] ?? ["Outputs","Variables", "Operations", "Functions", "Views", "Inputs", "Buttons"]}
        set{
            UserDefaults.standard.set(newValue, forKey: "skills")}}
    var projects: [String]{
        get{
            return UserDefaults.standard.array(forKey: "projects") as? [String] ?? ["Calculator App Part 1", "Calculator App Part 2"]}
        set{
            UserDefaults.standard.set(newValue, forKey: "projects")}}
    var skillsarray: [Int]{
        get{
            return UserDefaults.standard.array(forKey: "skillsarray") as? [Int] ?? [0, 0, 0, 0, 0, 0, 0]}
        set{
            UserDefaults.standard.set(newValue, forKey: "skillsarray")}}
    var projectsarray: [Int]{
        get{
            return UserDefaults.standard.array(forKey: "projectsarray") as? [Int] ?? [0, 0]}
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
    func projectdone(at index: Int, to value: Int){
        var newarray = projectsarray
        newarray[index] = value
        UserDefaults.standard.set(newarray, forKey:  "projectsarray")}
    func requestnotification(){
        UNUserNotificationCenter.current().requestAuthorization(options: [.alert, .sound]){ granted, error in
            if granted{
                print("Notification authorization granted.")}
            else{
                print("Notification authorization denied.")}}}
    func resetprogress(){
        skillscompleted = 0
        projectscompleted = 0
        var newarray = Array(repeating: 0, count: skillsarray.count)
        UserDefaults.standard.set(newarray, forKey:  "skillsarray")
        newarray = Array(repeating: 0, count: projectsarray.count)
        UserDefaults.standard.set(newarray, forKey:  "projectsarray")}
    func itemtext(index: Int) -> String{
        if changeindex == 0 {
            return skillsarray.indices.contains(index) && skillsarray[index] == 1 ?
                "\(items[index]) \u{2713}" :
                items[index]}
        else{
            return projectsarray.indices.contains(index) && projectsarray[index] == 1 ?
                "\(items[index]) \u{2713}" :
                items[index]}}
    public var body: some View{
            ZStack{
                Color.black.edgesIgnoringSafeArea(.all)
                Text("Profile")
                    .offset(y: -60)
                    .frame(width: 300, height: 200)
                    .background(Color.white)
                    .cornerRadius(10)
                    .font(.system(size: 30))
                    .offset(y: -250)
                    .onAppear{
                        requestnotification()}
                Text("Skills: \(skillscompleted)/\(skills.count)")
                    .offset(x: -90, y: -250)
                    .font(.system(size: 20))
                Text("Projects: \(projectscompleted)/\(projects.count)")
                    .offset(x: -80, y: -200)
                    .font(.system(size: 20))
                ProgressView(value: Float(skillscompleted)/Float(skills.count))
                    .offset(x: 80, y: -250)
                    .frame(width: 100)
                    .accentColor(.black)
                ProgressView(value: Float(projectscompleted)/Float(projects.count))
                    .offset(x: 80, y: -200)
                    .frame(width: 100)
                    .accentColor(.black)
                Button(action:{
                    if(changeindex == 1){
                        items = skills
                        changeindex = 0}
                    else if changeindex == 0{
                        items = projects
                        changeindex = 1}}){
                            Text((changeindex == 0) ? "Skills" : "Projects")
                                .frame(width: 300, height: 75)
                                .foregroundColor(.black)
                                .background(Color.white)
                                .font(.system(size: 25))
                            .cornerRadius(10)}
                        .offset(y: -100)
                Button(action: {resetprogress()}){
                    Text("Reset")
                        .font(.system(size: 15))
                        .foregroundColor(.black)
                        .frame(width: 50, height: 50)
                        .background(
                            Circle()
                                .stroke(Color.black, lineWidth: 1)
                                .background(Circle().foregroundColor(Color.white)))}
                .offset(x: -120, y: -320)
                Button(action:{
                    additemactive = true}){
                    Text("Add One")
                        .font(.system(size: 15))
                        .foregroundColor(.black)
                        .frame(width: 50, height: 50)
                        .background(
                            Circle()
                                .stroke(Color.black, lineWidth: 1)
                                .background(Circle().foregroundColor(Color.white)))
                        .fullScreenCover(isPresented: $additemactive) {
                            AddItemView(additemactive: $additemactive)}}
                .offset(x: -120, y: -100)
                ScrollView(.vertical, showsIndicators: false){
                        ForEach(items.indices, id: \.self) { index in
                            Button(action:{
                                itemactive = true
                                doneindex = index
                                ItemView(itemactive: $itemactive).title = items[index]
                                ItemView(itemactive: $itemactive).program = programmatrix[changeindex][index]
                                ItemView(itemactive: $itemactive).description = descriptionmatrix[changeindex][index]}){
                                    Text(itemtext(index: index))
                                        .foregroundColor(.black)
                                        .frame(width: 300, height: 50)
                                        .background(Color.white)
                                        .cornerRadius(10)
                                        .fullScreenCover(isPresented: $itemactive) {
                                            ItemView(itemactive: $itemactive)}}}}
                .offset(y: 325)
                .padding(.bottom, 300)}}}
struct ContentView_Previews: PreviewProvider{
    static var previews: some View{
        ContentView()}}
