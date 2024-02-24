//
//  AddItemView.swift
//  LevelUp
//
//  Created by Suraj Gajula on 2/23/24.
//
import SwiftUI
struct AddItemView: View{
    @Binding var additemactive: Bool
    @State var titleinput: String = ""
    @State var programinput: String = ""
    @State var descriptioninput: String = ""
    var body: some View{
        ZStack{
            Color.black.edgesIgnoringSafeArea(.all)
            TextField("Enter Title", text: $titleinput)
                .frame(width: 250, height: 50)
                .foregroundColor(.black)
                .background(.white)
                .cornerRadius(10)
                .offset(y: -350)
            TextField("Enter Program/Skill Requirements", text: $programinput)
                .frame(width: 300, height: 250)
                .foregroundColor(.black)
                .background(.white)
                .cornerRadius(10)
                .offset(y: -175)
            TextField("Enter Description", text: $descriptioninput)
                .frame(width: 300, height: 250)
                .foregroundColor(.black)
                .background(.white)
                .cornerRadius(10)
                .offset(y: 100)
            Button(action: {
                additemactive = false}){
                    Text("Back")
                        .frame(width: 50, height: 50)
                        .background(Color.black)
                    .foregroundColor(.white)}
                .offset(x: -162.5, y: -350)
            Button(action: {
                additemactive = false
                var newskillsarray = ContentView().skillsarray
                newskillsarray.append(0)
                UserDefaults.standard.set(newskillsarray, forKey:  "skillsarray")
                var newskills = ContentView().skills
                newskills.append(titleinput)
                UserDefaults.standard.set(newskills, forKey:  "skills")
                programmatrix[0].append(programinput)
                descriptionmatrix[0].append(descriptioninput)}){
                    Text("Save As Skill")
                        .frame(width: 137.5, height: 100)
                        .background(Color.white)
                        .foregroundColor(.black)
                    .cornerRadius(10)}
                .offset(x: -82.5,y: 300)
            Button(action: {
                additemactive = false
                var newprojectsarray = ContentView().projectsarray
                newprojectsarray.append(0)
                UserDefaults.standard.set(newprojectsarray, forKey:  "projectsarray")
                var newprojects = ContentView().projects
                newprojects.append(titleinput)
                UserDefaults.standard.set(newprojects, forKey:  "projects")
                programmatrix[1].append(programinput)
                descriptionmatrix[1].append(descriptioninput)}){
                    Text("Save As Project")
                        .frame(width: 137.5, height: 100)
                        .background(Color.white)
                        .foregroundColor(.black)
                    .cornerRadius(10)}
            .offset(x: 82.5,y: 300)}}}
struct AddItemView_Previews: PreviewProvider{
    static var previews: some View{
        AddItemView(additemactive: .constant(true))}}
