
import Foundation
import SwiftUI

struct Container: View {
    init() {
        let navBarAppearance = UINavigationBar.appearance()
        navBarAppearance.titleTextAttributes = [.foregroundColor: UIColor(hue: 0.505, saturation: 0.496, brightness: 0.489, alpha: 1.0)]
    }
    var body: some View {
        TabView {
            NavigationStack{
                HomeView()
                    .navigationBarTitleDisplayMode(.inline)
                    .toolbar {
                        ToolbarItem(placement: .principal) {
                            VStack {
                                Text("NMart")
                                    .bold()
                                    .foregroundColor(.white)
                            }
                        }
                    }
                    .toolbarBackground(Constants.AppColor.primaryColor, for:.tabBar,.navigationBar)//To change Navigation Bar Add comma and add after .tabbar- .navigationBar
                    .toolbarBackground(.visible, for: .tabBar,.navigationBar)

            }
            .tabItem {
                Label("Home", systemImage: "homekit")
            }
            
            NavigationStack{
                ProductsCatView()
                    .navigationBarTitleDisplayMode(.inline)
                    .toolbar {
                        ToolbarItem(placement: .principal) {
                            VStack {
                                Text("Category")
                                    .bold()
                                    .foregroundColor(.white)
                            }
                        }
                    }
                    .toolbarBackground(Constants.AppColor.primaryColor, for:.tabBar,.navigationBar)//To change Navigation Bar Add comma and add after .tabbar- .navigationBar
                    .toolbarBackground(.visible, for: .tabBar,.navigationBar)
            }
            .tabItem {
                Label {
                    Text("Products")
                } icon: {
                    Image(systemName: "chart.pie.fill")
                }
            }
            
            NavigationStack{
                CartView(viewModel: CartViewModel(cartUseCase: CartUseCase(dbRepo: DBRepo())))
                    .navigationBarTitleDisplayMode(.inline)
                    .toolbar {
                        ToolbarItem(placement: .principal) {
                            VStack {
                                Text("Cart")
                                    .bold()
                                    .foregroundColor(.white)
                            }
                        }
                    }
                    .toolbarBackground(Constants.AppColor.primaryColor, for:.tabBar,.navigationBar)//To change Navigation Bar Add comma and add after .tabbar- .navigationBar
                    .toolbarBackground(.visible, for: .tabBar,.navigationBar)
            }
            .tabItem {
                Label {
                    Text("Cart")
                } icon: {
                    Image(systemName: "cart")
                }
            }
            .badge(3)

            NavigationStack{
                Text("Profile")
                    .navigationBarTitleDisplayMode(.inline)
                    .toolbar {
                        ToolbarItem(placement: .principal) {
                            VStack {
                                Text("Profile")
                                    .bold()
                                    .foregroundColor(.white)
                            }
                        }
                    }
                    .toolbarBackground(Constants.AppColor.primaryColor, for:.tabBar,.navigationBar)//To change Navigation Bar Add comma and add after .tabbar- .navigationBar
                    .toolbarBackground(.visible, for: .tabBar,.navigationBar)
            }
            .tabItem {
                Label {
                    Text("Profile")
                } icon: {
                    Image(systemName: "chart.pie.fill")
                }
            }
        }
        .tint(Color(.white))
    }
}

struct Previews_Container_Previews: PreviewProvider {
    static var previews: some View {
        Container()
    }
}
