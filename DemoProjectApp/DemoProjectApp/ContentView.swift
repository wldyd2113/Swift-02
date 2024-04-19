//
//  ContentView.swift
//  DemoProjectApp
//
//  Created by 차지용 on 4/18/24.
//


import SwiftUI

struct User: Codable {
    let login: String
    let avatar_url: URL
}

struct Repository: Codable, Identifiable {
    let id: Int
    let name: String
    let description: String?
    let stargazersCount: Int
}

actor GithubService {
    func fetchUser(username: String) async throws -> User {
        let url = URL(string:"https://api.github.com/users/\(username)")!
        
        let(data, _) = try await URLSession.shared.data(from: url)
        
        return try JSONDecoder().decode(User.self, from: data)
    }
    
    func fetchRepositories(username: String) async throws -> [Repository] {
        let url = URL(string: "https://api.github.com/users/\(username)/repos")!
        
        let(data, _) = try await URLSession.shared.data(from: url)
        
        return try JSONDecoder().decode([Repository].self, from: data)
    }
}

struct ContentView: View {
    @State private var username = "wldyd2113"
    @State private var user: User?
    @State private var repositories: [Repository] = []
    let githubService = GithubService()
    
    var body: some View {
        VStack {
            TextField("Github user,name:", text: $username)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding()
            Button("Fetch Data") {
                Task {
                    do {
                        async let fetchRepositoris = githubService.fetchRepositories(username: username)
                        async let fetchUser = githubService.fetchUser(username: username)
                        
                        user =  try await fetchUser
                        repositories = try await fetchRepositoris
                    }catch {
                        print("Error: \(error)")
                    }
                }
            }
            if let user = user {
                AsyncImage(url: user.avatar_url) { image in
                    image.resizable()
                }placeholder: {
                    ProgressView()
                }
                .frame(width: 100, height: 100)
                .clipShape(/*@START_MENU_TOKEN@*/Circle()/*@END_MENU_TOKEN@*/)
                
                Text(user.login)
                    .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
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

}


#Preview {
    ContentView()
}
