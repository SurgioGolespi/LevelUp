//
//  ItemView.swift
//  LevelUp
//
//  Created by Suraj Gajula on 2/13/24.
//
import SwiftUI
import UserNotifications
var programmatrix: [[String]] = [
    ["print(\"Hello World\")",
    """
    var x = 5
    var y = \"Five\"
    x = 7
    y = \"Seven\"
    """,
    """
    var x = 6
    var y = 3
    print(x + y)
    print(x - y)
    print(x * y)
    print(x / y)
    """,
    """
    func Hello() {
        print(\"Hello World\")
    }
    Hello()
    
    func Goodbye(String: Name) {
        print(\"Goodbye\\(Name)\")
    }
    Goodbye()
    """,
    """
    import SwiftUI
    struct ContentView: View {
         var body: some View {
             Text("Hello, World!")
         }
    }

    struct ContentView_Previews: PreviewProvider {
         static var previews: some View {
             ContentView()
         }
    }
    """,
    """
    VStack {
        TextField("Enter text", text: $text)
        Text("You entered: \\(text)")
    }
    """,
    """
    Button(action: {
            print("Button pressed.")}) {
            Text("Press Button")
    }
    """],
    ["Create a calculator app using functions for each of the four operations in the operations skill. The calculator should print out the result of any performed operation.",
    "Create a calculator app using interactive views and the functions from Part 1 so users can compute numbers of their choosing."]]
var descriptionmatrix: [[String]] = [
    ["You can use outputs through print statements that print the text stored within the quotation marks.",
    "You can use variables to hold values that can be modified when a program is run. Each variable has a data type that dictates how it can be used, such as an Int for numerical data or a String for textual data.",
    "You can use operations such to add, subtract, multiply, and divide numbers or variables that contain them. The operations are as follows: + for addition, - for subtraction, * for multiplication, and / for division.",
    "You can use functions to reuse blocks of code that perform specific tasks. They can take input parameters, perform operations, and return a result.",
    "You can use views to display information to the user of your app. Views can contain many types of UI elements, such as the Text element.",
    "You can use inputs to allow users to control your app. One way to input data is by using the TextField UI element within a view to store the input in variables.",
    "You can use buttons to run code whenever they are touched. Buttons are used within views and ca contain other elements like text."],
    ["Requires: Print, Variables, Operations, Functions",
    "Requires: Caculator App Part 1, Views, Inputs, Buttons"]]
struct ItemView: View{
    @AppStorage("title") var title: String = "Title"
    @AppStorage("program") var program: String = "Program"
    @AppStorage("description") var description: String = "Description"
    @State var timeint: TimeInterval = 0
    @State var timeractive = false
    @State var timer: Timer?
    @State var backgroundTaskIdentifier: UIBackgroundTaskIdentifier = .invalid
    func timestring(time: TimeInterval) -> String{
            let hours = Int(time)/3600
            let minutes = Int(time)/60 % 60
            let seconds = Int(time) % 60
            return String(format: "%02i:%02i:%02i", hours, minutes, seconds)}
    func starttimer(){
            let content = UNMutableNotificationContent()
            content.title = "Code Session Ended"
            content.body = "You have finished an hour of coding!"
            let trigger = UNTimeIntervalNotificationTrigger(timeInterval: 3600, repeats: false)
            let request = UNNotificationRequest(identifier: "timernotif", content: content, trigger: trigger)
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
                .frame(width: 250)
                .frame(width: 300, height : 250)
                .background(Color.white)
                .cornerRadius(20)
                .font(.system(size: 15))
                .offset(y : -175)
            Text(description)
                .frame(width: 250)
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
                    starttimer()}
                else if(timeractive){
                    UNUserNotificationCenter.current().removePendingNotificationRequests(withIdentifiers: ["timernotif"])
                    timeint = 0}
                timeractive = !timeractive}){
                        Text(timeractive ? "\(timestring(time: timeint))" : "Set Coding Time")
                            .onAppear {
                                timer = Timer.scheduledTimer(withTimeInterval: 1, repeats: true) { _ in
                                    if timeractive {
                                        timeint += 1}
                                    if timeint >= 3600 {
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
