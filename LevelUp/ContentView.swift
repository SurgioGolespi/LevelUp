//
//  ContentView.swift
//  LevelUp
//
//  Created by Suraj Gajula on 2/5/24.
//
import SwiftUI
struct ContentView: View{
    @AppStorage("completed") var completed = 0
    var items = ["Hello World","Variables", "Math", "Functions", "For Loops", "While Loops", "Conditionals", "Arrays", "Methods", "Classes"]
    @State var itemscompleted: [Int]
    init(){
        if let savedArray = UserDefaults.standard.array(forKey: "itemscompleted") as? [Int]{
            self._itemscompleted = State(initialValue: savedArray)}
        else{
            self._itemscompleted = State(initialValue: [0, 0, 0, 0, 0, 0, 0, 0, 0, 0])}}
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
                            if itemscompleted[index] == 0{
                                itemscompleted[index] = 1
                                UserDefaults.standard.set(itemscompleted, forKey: "itemscompleted")
                                completed += 1}}){
                                Text(items[index])
                                    .foregroundColor(.black)
                                    .frame(width: 300, height: 50)
                                .background(Color.white)}}}}
            .offset(y : 325)
            .padding(.bottom, 300)}}}
#Preview{
    ContentView()}
