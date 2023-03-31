import SwiftUI

struct ChallengeRewardView: View {
    @State private var isShowingChallenges = false
    @State private var isShowingRewards = false
    
    var body: some View {
        VStack(alignment: .leading, spacing: 20) {
            Text("Challenges")
                .font(.title).bold()
            Text("Join community challenges to reduce your carbon footprint and compete with other users to see who can reduce their energy usage the most.")
                .font(.body)
            Button(action: {
                self.isShowingChallenges = true
            }) {
                Text("Join a Challenge")
                    .fontWeight(.bold)
                    .foregroundColor(.white)
                    .padding()
                    .background(Color.green)
                    .cornerRadius(10)
            }
            
            Divider()
            
            Text("Rewards")
                .font(.title).bold()
            Text("Earn rewards for meeting sustainability goals and reducing your carbon footprint. The more you reduce, the more rewards you'll earn!")
                .font(.body)
            Button(action: {
                self.isShowingRewards = true
                
            }) {
                Text("View Rewards")
                    .fontWeight(.bold)
                    .foregroundColor(.white)
                    .padding()
                    .background(Color.green)
                    .cornerRadius(10)
            }
        }
        .padding()
        .sheet(isPresented: $isShowingChallenges) {
            ChallengeView()
        }
        .sheet(isPresented: $isShowingRewards) {
            RewardView()
        }
    }
}


struct ChallengeRewardView_Previews: PreviewProvider {
    static var previews: some View {
        ChallengeRewardView()
    }
}
