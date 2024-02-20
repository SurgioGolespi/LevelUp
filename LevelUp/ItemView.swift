//
//  ItemView.swift
//  LevelUp
//
//  Created by Suraj Gajula on 2/13/24.
//
import SwiftUI
import UserNotifications
var programmatrix: [[String]] = [
    ["print(\"Hello World\")"
    ,"var x = 5\nvar y = \"Five\"\nx = 7\ny = \"Seven\""
    ,"var x = 6\nvar y = 3\nprint(x + y)\nprint(x - y)\nprint(x * y)\nprint(x / y)"
    ,"func Hello() {\n    print(\"Hello World\")\n}\nHello()\nfunc Goodbye(String: Name){\n    print(\"Goodbye\\(Name)\"\n}"],
    ["Create a calculator using functions for each of the four operations in the operations\nskill. The calculator should print out the result of any performed operation."]]
var descriptionmatrix: [[String]] = [
    ["You can use a print statement\nto print the text stored within\nthe quotation marks."
    ,"You can use variables to hold values that can be modified\nwhen a program is run. Each variable has a data type that dictates how it can be used,\nsuch as an Int for numerical\ndata or a String for textual data."
    ,"You can use operations\nsuch to add, subtract, multiply, and divide numbers or variables that contain them. The\noperations are as follows: + for addition, - for subtraction, * for multiplication, and / for division."
    ,"You can use functions to reuse blocks of code that perform specific tasks. They can take\ninput parameters, perform operations, and return a result."],
    ["Requires: Print, Variables, Operations, Functions"]]
struct ItemView: View{
    @AppStorage("title") var title: String = "Title"
    @AppStorage("program") var program: String = "Program"
    @AppStorage("description") var description: String = "Description"
    @State var timeint: TimeInterval = 0
    @State var timeractive = false
    @State var timer: Timer?
    @State var backgroundTaskIdentifier: UIBackgroundTaskIdentifier = .invalid
    func timestring(time: TimeInterval) -> String {
            let hours = Int(time) / 3600
            let minutes = Int(time) / 60 % 60
            let seconds = Int(time) % 60
            return String(format: "%02i:%02i:%02i", hours, minutes, seconds)}
    func scheduleNotification() {
            let content = UNMutableNotificationContent()
            content.title = "Code Session Ended"
            content.body = "You have finished an hour of coding!"
            let trigger = UNTimeIntervalNotificationTrigger(timeInterval: 5, repeats: false)
            let request = UNNotificationRequest(identifier: "timerNotification", content: content, trigger: trigger)
            UNUserNotificationCenter.current().add(request)}
    var body: some View{
        ZStack{
            Color.black.edgesIgnoringSafeArea(.all)
            Text(title)
                .frame(width: 300, height: 50)
                .background(Color.white)
                .cornerRadius(20)
                .font(.system(size: 25))
                .offset(y : -350)
            Text(program)
                .frame(width: 300, height : 250)
                .background(Color.white)
                .cornerRadius(20)
                .font(.system(size: 20))
                .offset(y : -175)
            Text(description)
                .frame(width: 300, height : 250)
                .background(Color.white)
                .cornerRadius(20)
                .font(.system(size: 20))
                .offset(y : 100)
                .padding()
            Button(action:{
                ContentView().MarkAsCompleted()}){
                    Text("Mark as Completed")
                        .foregroundColor(.black)
                        .frame(width: 300, height: 50)
                        .background(Color.white)
                    .cornerRadius(20)}
                .offset(y: 275)
            Button(action: {
                if(!timeractive){
                    scheduleNotification()}
                timeractive = !timeractive}){
                        Text(timeractive ? "\(timestring(time: timeint))" : "Set Coding Time")
                            .onAppear {
                                timer = Timer.scheduledTimer(withTimeInterval: 1, repeats: true) { _ in
                                    if timeractive {
                                        timeint += 1}
                                    if timeint >= 5 {
                                        timeint = 0
                                        timeractive = false}}}
                    .foregroundColor(.black)
                    .frame(width: 300, height: 50)
                    .background(Color.white)
                .cornerRadius(20)}
                .offset(y: 350)}}}
struct ItemView_Previews: PreviewProvider{
    static var previews: some View{
        ItemView()}}
