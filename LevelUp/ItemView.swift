//
//  ItemView.swift
//  LevelUp
//
//  Created by Suraj Gajula on 2/13/24.
//
import SwiftUI
public var title: String = "Title"
public var program = "Program"
public var description = "Description"
let programmatrix: [[String]] = [
    ["print(\"Hello World\")"
    ,"let x = 5\nlet y = \"Five\"\nx = 7\ny = \"Seven\""
    ,"let x = 6\nlet y = 3\nprint(x + y)\nprint(x - y)\nprint(x * y)\nprint(x / y)"
    ,"func Hello() {\n    print(\"Hello World\")\n}\nHello()\nfunc Goodbye(String: Name){\n    print(\"Goodbye\\(Name)\"\n}"],
    ["Create a calculator using functions for each of the four operations in the operations\nskill. The calculator should print out the result of any performed operation."]]
let descriptionmatrix: [[String]] = [
    ["You can use a print statement\nto print the text stored within\nthe quotation marks."
    ,"You can use variables to hold values that can be modified\nwhen a program is run. Each variable has a data type that dictates how it can be used,\nsuch as an Int for numerical\ndata or a String for textual data."
    ,"You can use operations\nsuch to add, subtract, multiply, and divide numbers or variables that contain them. The\noperations are as follows: + for addition, - for subtraction, * for multiplication, and / for division."
    ,"You can use functions to reuse blocks of code that perform specific tasks. They can take\ninput parameters, perform operations, and return a result."],
    ["Requires: Print, Variables, Operations, Functions"]]
struct ItemView: View{
    var body: some View{
        NavigationView{
            ZStack{
                Color.black.edgesIgnoringSafeArea(.all)
                Text(title)
                    .frame(width: 300, height: 100)
                    .background(Color.white)
                    .cornerRadius(20)
                    .font(.system(size: 25))
                    .offset(y : -300)
                Text(program)
                    .frame(width: 300, height : 300)
                    .background(Color.white)
                    .cornerRadius(20)
                    .font(.system(size: 20))
                    .offset(y : -75)
                Text(description)
                    .frame(width: 300, height : 250)
                    .background(Color.white)
                    .cornerRadius(20)
                    .font(.system(size: 20))
                    .offset(y : 225)}}}}
struct ItemView_Previews: PreviewProvider{
    static var previews: some View{
        ItemView()}}
