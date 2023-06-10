
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
                    .navigationTitle("NMart")
                    .toolbarBackground(Constants.AppColor.primaryColor, for:.tabBar)//To change Nvigation Bar Add comma and add after .tabbar- .navigationBar
                    .toolbarBackground(.visible, for: .tabBar)

            }
            .tabItem {
                Label("Home", systemImage: "homekit")
                    .foregroundColor(.black)
            }
            
            NavigationStack{
                ProductsCatView()
                    .navigationBarTitleDisplayMode(.inline)
                    .navigationTitle("Products")
                .toolbarBackground(Constants.AppColor.primaryColor, for:.tabBar)//To change Nvigation Bar Add comma and add after .tabbar- .navigationBar
                .toolbarBackground(.visible, for: .tabBar)
            }
            .tabItem {
                Label {
                    Text("Products")
                        .foregroundColor(.red)
                        .background(.white)
                } icon: {
                    Image(systemName: "chart.pie.fill")
                }
            }
            
            NavigationStack{
                CartView(viewModel: CartViewModel())
                    .navigationBarTitleDisplayMode(.inline)
                    .navigationTitle("Cart")
                .toolbarBackground(Constants.AppColor.primaryColor, for:.tabBar)//To change Nvigation Bar Add comma and add after .tabbar- .navigationBar
                .toolbarBackground(.visible, for: .tabBar)
            }
            .tabItem {
                Label {
                    Text("Cart")
                        .foregroundColor(.red)
                        .background(.white)
                } icon: {
                    Image(systemName: "cart")
                }
            }
            .badge(3)

            NavigationStack{
                Text("Profile")
                    .navigationBarTitleDisplayMode(.inline)
                    .navigationTitle("Profile")
                .toolbarBackground(Constants.AppColor.primaryColor, for:.tabBar)//To change Nvigation Bar Add comma and add after .tabbar- .navigationBar
                .toolbarBackground(.visible, for: .tabBar)
            }
            .tabItem {
                Label {
                    Text("Profile")
                        .foregroundColor(.red)
                        .background(.white)
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
