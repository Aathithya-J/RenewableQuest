import SwiftUI

struct Challenge: Identifiable {
    let id = UUID()
    let title: String
    var completed: Bool
    let description: String
    let hint: String
    let reward: String
}

struct ChallengeView: View {
    @State private var challenges = [
        Challenge(title: "Take a 5-minute shower", completed: false, description: "Take a 5-minute shower instead of a long bath to save water.", hint: "Set a timer to make sure your shower is only 5 minutes long.", reward: "Save up to 25 gallons of water per shower!"),
        Challenge(title: "Unplug electronics when not in use", completed: false, description: "Unplug electronics when not in use to reduce standby power usage.", hint: "Use power strips to easily turn off multiple electronics at once.", reward: "Reduce your electricity bill and save energy!"),
        Challenge(title: "Use reusable bags when shopping", completed: false, description: "Use reusable bags when shopping instead of single-use plastic bags.", hint: "Keep reusable bags in your car or by the door to remember to bring them with you.", reward: "Reduce plastic waste and help the environment!")
    ]
    
    var body: some View {
        NavigationView {
            ScrollView {
                LazyVStack(spacing: 20) {
                    ForEach(challenges) { challenge in
                        RewardingView(challenge: challenge, toggleCompletion: {
                            if let index = challenges.firstIndex(where: { $0.id == challenge.id }) {
                                challenges[index].completed.toggle()
                            }
                        })
                    }
                }
                .padding()
            }
            .navigationTitle("Challenges")
        }
    }
}

struct RewardingView: View {
    let challenge: Challenge
    let toggleCompletion: () -> Void
    
    var body: some View {
        VStack {
            HStack {
                Text(challenge.title)
                    .font(.title3).bold()
                    .foregroundColor(.primary)
                Spacer()
                if challenge.completed {
                    Image(systemName: "checkmark")
                        .foregroundColor(.green)
                }
            }
            Divider()
            VStack(alignment: .leading, spacing: 10) {
                Text(challenge.description)
                    .font(.body)
                    .foregroundColor(.secondary)
                HStack(spacing: 10) {
                    Image(systemName: "lightbulb.fill").foregroundColor(.yellow)
                    Text(challenge.hint)
                        .font(.footnote)
                        .foregroundColor(.secondary)
                }
                HStack(spacing: 10) {
                    Image(systemName: "gift.fill").foregroundColor(.blue)
                    Text(challenge.reward)
                        .font(.footnote)
                        .foregroundColor(.secondary)
                }
            }
            HStack {
                Spacer()
                Button(action: toggleCompletion) {
                    Text(challenge.completed ? "Undo" : "Done")
                        .foregroundColor(.white)
                        .padding(.horizontal, 16)
                        .padding(.vertical, 8)
                        .background(challenge.completed ? Color.red : Color.green)
                        .cornerRadius(10)
                }
            }
        }
        .padding()
        .background(Color.white)
        .cornerRadius(15)
        .shadow(radius: 5)
    }
}


struct ChallengesView_Previews: PreviewProvider {
    static var previews: some View {
        ChallengeView()
    }
}
