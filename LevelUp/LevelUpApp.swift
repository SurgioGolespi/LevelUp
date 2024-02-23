//
//  LevelUpApp.swift
//  LevelUp
//
//  Created by Suraj Gajula on 2/5/24.
//
import SwiftUI
@main
struct LevelUpApp: App{
    @AppStorage("launchedbefore") var launchactive = 0
    var body: some Scene{
        WindowGroup{
            if launchactive == 0{
                LaunchView()}
            if launchactive == 1{
                ContentView()}}}}
