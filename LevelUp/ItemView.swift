//
//  ItemView.swift
//  LevelUp
//
//  Created by Suraj Gajula on 2/13/24.
//
import SwiftUI
var title = "Title"
struct ItemView: View{
    var contents = "Contents"
    func ItemText(text: String){
        title = text;}
    var body: some View{
        NavigationView{
            ZStack{
                Color.black.edgesIgnoringSafeArea(.all)
                RoundedRectangle(cornerRadius: 20)
                    .fill(Color.white)
                    .frame(width: 300, height: 700)
                Text(title)
                    .offset(y : -300)
                    .font(.system(size: 25))
                Text(contents)}}}}
struct ItemView_Previews: PreviewProvider{
    static var previews: some View{
        ItemView()}}
