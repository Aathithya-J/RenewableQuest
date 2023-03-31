//
//  ContentView.swift
//  RenewableQuest
//
//  Created by AathithyaJ on 23/3/23.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            TabView {
                EnergyCalculator()
                    .tabItem {
                        Label("Calculator", systemImage: "apps.iphone")
                        
                    }
                ChallengeRewardView()
                    .tabItem {
                        Label("Rewards", systemImage: "dollarsign.arrow.circlepath")
                        
                    }
                EnergySourceView()
                    .tabItem {
                        Label("Sources", systemImage: "doc.text")
                        
                    }
                CommunityView()
                    .tabItem {
                        Label("Community", systemImage: "message.badge.circle")
                        
                    }
            }
            
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
