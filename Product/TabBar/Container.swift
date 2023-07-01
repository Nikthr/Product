
import Foundation
import SwiftUI

enum Tab {
    case home
    case prod
    case cart
    case profile
}

class SelectedTab:ObservableObject {
    @Published var selected:Tab = .home
}

struct Container: View {
    @ObservedObject var selection = SelectedTab()
    var body: some View {
        TabView(selection:$selection.selected) {
            NavigationStack{
                ViewContainer.createHomeView()
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
            .tag(Tab.home)
            
            NavigationStack{
                ViewContainer.createCatView()
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
            .tag(Tab.prod)

            
            NavigationStack{
                ViewContainer.createCartView()
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
            .environmentObject(selection)
            .tabItem {
                Label {
                    Text("Cart")
                } icon: {
                    Image(systemName: "cart")
                }
            }
            .tag(Tab.cart)
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
            .tag(Tab.profile)
        }
        .tint(Color(.white))
    }
}

struct Previews_Container_Previews: PreviewProvider {
    static var previews: some View {
        Container()
    }
}
