//
//  ContentView.swift
//  recipe1
//
//  Created by Raghad Mohammed Almarri on 14/04/1446 AH.
//




import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationView {
            VStack {
                TopBarView(title: "Food Recipes")
                Spacer()
                
                // Empty State Icon and Text
                EmptyStateView()
                Spacer()
            }
            .background(Color.black.edgesIgnoringSafeArea(.all)) // Full-screen black background
        }
    }
}


struct TopBarView: View {
    let title: String
    
    var body: some View {
        HStack {
            Text(title)
                .font(.largeTitle)
                .fontWeight(.bold)
                .foregroundColor(.white)
            Spacer()
            
            // Navigation Link to next page
            NavigationLink(destination: AddRecipeView()) {
                Image(systemName: "plus")
                    .font(.title)
                    .foregroundColor(.orange)
            }
        }
        .padding()
        .background(Color.black)
    }
}


struct EmptyStateView: View {
    var body: some View {
        VStack {
            // Placeholder for the icon (fork and knife in circle)
            Image(systemName: "fork.knife.circle.fill")
                .resizable()
                .scaledToFit()
                .frame(width: 200, height: 200)
                .foregroundColor(.orange)
            
            Text("There’s no recipe yet")
                .font(.title2)
                .fontWeight(.bold)
                .foregroundColor(.white)
                .padding(.top, 20)
            
            Text("Please add your recipes")
                .foregroundColor(.gray)
                .padding(.top, 5)
        }
    }
}


struct AddRecipeView: View {
    var body: some View {
        Text("This is the Add Recipe Page") // This will be the next page
            .font(.largeTitle)
            .fontWeight(.bold)
            .foregroundColor(.orange)
            .padding()
    }
}

// Previews
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
