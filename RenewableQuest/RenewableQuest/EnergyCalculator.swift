import SwiftUI

struct EnergyProvider: Identifiable {
    let id = UUID()
    let name: String
    let rate: Double
    let term: String
}
struct WaterProvider: Identifiable {
    let id = UUID()
    let name: String
    let rate: Double
    let term: String
}
struct OilProvider: Identifiable {
    let id = UUID()
    let name: String
    let rate: Double
    let type: String
    let term: String
}

struct EnergyCalculator: View {
    @State private var selectedSegment = 0
    @State private var monthlyUsage = ""
    @State private var selectedProvider = 0
    @FocusState var isInputActive: Bool
    let providers = [EnergyProvider(name: "Senoko", rate: 0.3160, term: "12 months"),
                     EnergyProvider(name: "Keppel Electric", rate: 0.30, term: "24 months"),
                     EnergyProvider(name: "Tuas Power", rate: 0.3180, term: "36 months")]
    let water = [WaterProvider(name: "American Water Works", rate: 1, term: "12 months"),
                 WaterProvider(name: "Xylem", rate: 0.1, term: "12 months"),
                 WaterProvider(name: "Culligna", rate: 0.12, term: "12 months")]
    let oil = [OilProvider(name: "Caltex", rate: 2.3,type: "ROM 92", term: "12 months"),
               OilProvider(name: "Shell", rate: 2.5, type:"ROM 95",  term:"12 months"),
               OilProvider(name: "Petronas", rate: 3, type:"Disel", term:"12 months")]
    
    var body: some View {
        NavigationView {
            Form {
                Picker(selection: $selectedSegment, label: Text("Type of Energy")) {
                    Text("Electricity").tag(0)
                    Text("Water").tag(1)
                    Text("Oil").tag(2)
                }
                .pickerStyle(SegmentedPickerStyle())
                Section(header: Text("Monthly Usage")) {
                    TextField("Enter your monthly usage in kWh", text: $monthlyUsage).keyboardType(.decimalPad).focused($isInputActive)
                        .toolbar {
                            ToolbarItemGroup(placement: .keyboard) {
                                Spacer()
                                Button("Done") {
                                    isInputActive = false
                                }
                            }
                        }
                }
                if selectedSegment == 0{
                    Section(header: Text("Providers")) {
                        ForEach(providers) { provider in
                            HStack {
                                Text("\(provider.name)")
                                Spacer()
                                Text("$\(String(format: "%.2f", calculateBill1(for: provider)))")
                                    .foregroundColor(calculateBill1(for: provider) == lowestBill1() ? .green : .gray)
                            }
                        }
                    }
                    
                    Section(header: Text("Lowest Bill")) {
                        Text("\(providers[selectedProvider].name) with a monthly rate of $\(String(format: "%.2f", lowestBill1()))")
                            .foregroundColor(.green)
                    }
                }
                if selectedSegment == 1{
                    Section(header: Text("Providers")) {
                        ForEach(water) { water in
                            HStack {
                                Text("\(water.name)")
                                Spacer()
                                Text("$\(String(format: "%.2f", calculateBill2(for: water)))")
                                    .foregroundColor(calculateBill2(for: water) == lowestBill2() ? .green : .gray)
                            }
                        }
                    }
                    
                    Section(header: Text("Lowest Bill")) {
                        Text("\(water[selectedProvider].name) with a monthly rate of $\(String(format: "%.2f", lowestBill2()))")
                            .foregroundColor(.green)
                    }
                }
                if selectedSegment == 2{
                    Section(header: Text("Providers")) {
                        ForEach(oil) { oil in
                            HStack {
                                Text("\(oil.name)")
                                Spacer()
                                Text("\(oil.type)")
                                Spacer()
                                Text("$\(String(format: "%.2f", calculateBill3(for: oil)))")
                                    .foregroundColor(calculateBill3(for: oil) == lowestBill3() ? .green : .gray)
                            }
                        }
                    }
                    
                    Section(header: Text("Lowest Bill")) {
                        Text("\(oil[selectedProvider].name) with a monthly rate of $\(String(format: "%.2f", lowestBill3()))")
                            .foregroundColor(.green)
                    }
                }
                
                
                
            }
            .navigationBarTitle("Energy Comparer")
            
        }
        
    }
    
    func calculateBill1(for provider: EnergyProvider) -> Double {
        let usage = Double(monthlyUsage) ?? 0
        return usage * provider.rate
    }
    func calculateBill2(for provider: WaterProvider) -> Double {
        let usage = Double(monthlyUsage) ?? 0
        return usage * provider.rate
    }
    func calculateBill3(for provider: OilProvider) -> Double {
        let usage = Double(monthlyUsage) ?? 0
        return usage * provider.rate
    }
    
    func lowestBill1() -> Double {
        let bills = providers.map { calculateBill1(for: $0) }
        let minBill = bills.min()
        selectedProvider = bills.firstIndex(of: minBill!)!
        return minBill!
    }
    func lowestBill2() -> Double {
        let bills = water.map { calculateBill2(for: $0) }
        let minBill = bills.min()
        selectedProvider = bills.firstIndex(of: minBill!)!
        return minBill!
    }
    func lowestBill3() -> Double {
        let bills = oil.map { calculateBill3(for: $0) }
        let minBill = bills.min()
        selectedProvider = bills.firstIndex(of: minBill!)!
        return minBill!
    }
    
}


struct EnergyCalculator_Previews: PreviewProvider {
    static var previews: some View {
        EnergyCalculator()
    }
}
