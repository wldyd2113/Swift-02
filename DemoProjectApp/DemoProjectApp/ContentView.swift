//
//  ContentView.swift
//  DemoProjectApp
//
//  Created by 차지용 on 4/18/24.
//


import SwiftUI

struct Repository: Codable, Identifiable {
    let id: Int
    let name: String
    let description: String?
    let stargazersCount: Int
}

struct ContentView: View {
    @State private var username = "wldyd2113"
    @State private var repositories: [Repository] = []
    var body: some View {
        VStack {
            TextField("Github user,name:", text: $username)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding()
            Button("Fetch Data") {
                Task {
                    do {
                        async let fetchRepositoris = fetchRepositories(username: username)
                        repositories = try await fetchRepositoris
                    }catch {
                        print("Error: \(error)")
                    }
                }
            }
            List(repositories) { repo in
                VStack(alignment: .leading) {
                    Text(repo.name)
                        .font(.headline)
                    Text(repo.name)
                        .font(.subheadline)
                    Text("Stars: \(repo.stargazersCount)")
                }
                
            }
        }
    }
    func fetchRepositories(username: String) async throws -> [Repository] {
        let url = URL(string: "https://api.github.com/users/\(username)/repos")!
        
        let(data, _) = try await URLSession.shared.data(from: url)
        
        return try JSONDecoder().decode([Repository].self, from: data)
    }
}


#Preview {
    ContentView()
}
