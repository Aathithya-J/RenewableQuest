import SwiftUI

struct Reward: Identifiable {
    let id = UUID()
    let title: String
    let image: String
    let color: Color
    let price: String
}

struct RewardView: View {
    @State private var rewards = [
        Reward(title: "Green Thumb", image: "tree", color: .green, price: "-"),
        Reward(title: "Eco Hero", image: "star", color: .yellow, price: "20"),
        Reward(title: "Recycling Pro", image: "arrow.2.circlepath", color: .blue, price: "30"),
        Reward(title: "Water Saver", image: "drop", color: .blue, price: "40"),
        Reward(title: "Energy Efficient", image: "bolt", color: .purple, price: "50"),
        Reward(title: "Cash Reward", image: "dollarsign.circle", color: .green, price: "100"),
        Reward(title: "Voucher", image: "giftcard", color: .orange, price: "200")
    ]
    
    let columns = [
        GridItem(.adaptive(minimum: 150))
    ]
    
    var body: some View {
        NavigationView {
            ScrollView {
                LazyVGrid(columns: columns, spacing: 20) {
                    ForEach(rewards) { reward in
                        Card1View(reward: reward)
                            .frame(width: 150, height: 270) // Fixed size for the card
                    }
                }
                .padding()
                .frame(maxWidth: .infinity) // Set frame to fit the screen
            }
            .navigationTitle("Rewards")
        }
    }
}

struct Card1View: View {
    let reward: Reward

    var body: some View {
        VStack {
            Image(systemName: reward.image)
                .font(.system(size: 80))
                .foregroundColor(.white)
                .padding()
                .background(reward.color)
                .clipShape(Circle())
            Text(reward.title)
                .font(.headline)
                .foregroundColor(.primary)
                .multilineTextAlignment(.center)
            Text("$\(reward.price)")
                .font(.subheadline)
                .foregroundColor(.primary)
            Spacer()
            Button(action: {
                // TODO: Implement "collect" action
            }) {
                Text("Collect")
                    .font(.subheadline)
                    .foregroundColor(.white)
                    .padding(.horizontal, 20)
                    .padding(.vertical, 10)
                    .background(Color.blue)
                    .clipShape(Capsule())
            }
        }
        .padding()
        .background(Color.white)
        .cornerRadius(15)
        .shadow(radius: 5)
    }
}

struct RewardView_Previews: PreviewProvider {
    static var previews: some View {
        RewardView()
    }
}
