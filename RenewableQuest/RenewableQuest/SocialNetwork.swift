import SwiftUI

struct Post: Identifiable {
    var id = UUID()
    var author: String
    var content: String
    var likes: Int
    var isLiked: Bool = false
}

struct CommunityView: View {
    @State private var posts: [Post] = [
        Post(author: "John", content: "Installed solar panels on my roof today!", likes: 10),
        Post(author: "Jane", content: "I just learned how to compost my food waste. It feels great to reduce my carbon footprint!", likes: 5),
        Post(author: "Mark", content: "Does anyone know a good source for sustainable fashion?", likes: 2),
    ]
    
    var body: some View {
        NavigationView {
            List(posts.indices) { index in
                let post = posts[index]
                VStack(alignment: .leading) {
                    Text(post.author)
                        .font(.headline)
                    Text(post.content)
                        .font(.body)
                        .padding(.bottom, 8)
                    HStack {
                        Button(action: {
                            // Toggle the isLiked property for the post
                            posts[index].isLiked.toggle()
                            if posts[index].isLiked {
                                posts[index].likes += 1
                            } else {
                                posts[index].likes -= 1
                            }
                        }) {
                            Image(systemName: post.isLiked ? "heart.fill" : "heart")
                        }
                        Text("\(post.likes)")
                    }
                    .foregroundColor(post.isLiked ? .red : .gray)
                }
            }
            .navigationBarTitle("Community")
            .navigationBarItems(trailing: Button(action: {
                // Show the new post view
            }, label: {
                Image(systemName: "square.and.pencil")
            }))
        }
    }
}


struct CommunityView_Previews: PreviewProvider {
    static var previews: some View {
        CommunityView()
    }
}
