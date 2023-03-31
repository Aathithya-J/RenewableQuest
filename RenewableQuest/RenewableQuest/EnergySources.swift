import SwiftUI

struct RenewableEnergyProvider: Identifiable {
    let id = UUID()
    let name: String
    let location: String
    let type: String
    let roi: String
    let savings: Int
    let contact: String
}

struct EnergySourceView: View {
    let providers = [
        RenewableEnergyProvider(name: "SolarCity", location: "San Mateo, CA", type: "Solar Panels", roi: "10.5", savings: 5000, contact: "+1-800-123-4567"),
        RenewableEnergyProvider(name: "WindCo", location: "Seattle, WA", type: "Wind Turbines", roi: "12.8", savings: 7500, contact: "+1-800-987-6543"),
        RenewableEnergyProvider(name: "Green Energy Solutions", location: "Boston, MA", type: "Multiple", roi: "9.3", savings: 4000, contact: "+1-800-555-1212"),
    ]
    
    var body: some View {
        NavigationView {
            List(providers) { provider in
                VStack(alignment: .leading) {
                    Text(provider.name)
                        .font(.headline)
                    HStack {
                        Text("Location:")
                            .font(.subheadline)
                        Text(provider.location)
                            .font(.subheadline)
                    }
                    HStack {
                        Text("Type:")
                            .font(.subheadline)
                            .foregroundColor(Color.orange)
                        Text(provider.type)
                            .font(.subheadline)
                            .foregroundColor(Color.orange)
                    }
                    HStack {
                        Text("ROI:")
                            .font(.subheadline)
                            .foregroundColor(Color.green)
                        
                        Text("\(provider.roi)%")
                            .font(.subheadline)
                            .foregroundColor(Color.green)
                    }
                    HStack {
                        Text("Savings:")
                            .font(.subheadline)
                            .foregroundColor(Color.blue)
                        Text("$\(provider.savings)/year")
                            .font(.subheadline)
                            .foregroundColor(Color.blue)
                    }
                    HStack {
                        Text("Contact:")
                            .font(.subheadline)
                            .foregroundColor(Color.red)
                        Text(provider.contact)
                            .font(.subheadline)
                            .foregroundColor(Color.red)
                    }
                }
            }
            .navigationBarTitle(Text("Providers"))
        }
    }
}

struct EnergySourceView_Previews: PreviewProvider {
    static var previews: some View {
        EnergySourceView()
    }
}
