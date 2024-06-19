//
//  UserProfileView.swift
//  EcommerceDemoApp
//
//  Created by Ravi Kumar Singh on 27/05/24.
//

import SwiftUI

struct UserProfileView: View {
    @ObservedObject var viewModel: ProfileViewModel
    
    var body: some View {
        ZStack {
            
            LinearGradient(gradient: Gradient(colors: [.blue, .white]), startPoint: .topLeading, endPoint: .bottomTrailing)
                .edgesIgnoringSafeArea(.all)
                .accessibility(identifier: "Profile")
            ScrollView {
                VStack(alignment: .leading, spacing: 20) {
                    HStack {
                        Image(systemName: "person.fill")
                            .resizable()
                            .aspectRatio(contentMode: .fill)
                            .frame(width: 100, height: 100)
                            .clipShape(Circle())
                            .overlay(Circle().stroke(Color.white, lineWidth: 4))
                            .shadow(radius: 10)
                            .accessibility(identifier: "profileImage")
                        VStack(alignment: .leading, spacing: 4) {
                            Text("\(viewModel.user.firstName) \(viewModel.user.lastName)")
                                .font(.title)
                                .fontWeight(.bold)
                                .accessibility(identifier: "userName")

                            Text(viewModel.user.email)
                                .font(.subheadline)
                                .foregroundColor(.white)
                                .accessibility(identifier: "userEmail")

                        }
                        .padding(.leading, 8)
                        
                        Spacer()
                    }
                    
                    HStack {
                        HStack(alignment: .top, spacing: 10) {
                            Text(StaticMessage.yourOrderTitle)
                                .font(.title3)
                                .fontWeight(.medium)
                                .accessibility(identifier: "yourOrders")

                        }
                        .padding(.vertical, 8)
                        .padding(.horizontal, 8)
                        .padding(.leading, 20)
                        .padding(.trailing, 20)
                        .background(Color.white)
                        .cornerRadius(8)
                        .shadow(radius: 4)
                        .foregroundColor(.blue)
                        
                        Spacer()
                        
                        HStack(alignment: .top, spacing: 10) {
                            NavigationLink(destination: AdressListView(adress: AddressModel.dummy)) {
                                Text(StaticMessage.yourAddressTitle)
                                    .font(.title3)
                                    .fontWeight(.medium)
                                    .accessibility(identifier: "yourAddress")

                            }
                        }
                        .padding(.vertical, 8)
                        .padding(.horizontal, 8)
                        .padding(.leading, 20)
                        .padding(.trailing, 20)
                        .background(Color.white)
                        .cornerRadius(8)
                        .shadow(radius: 4)
                    }
                    //VStack {
                    Text(StaticMessage.accountSettingTitle)
                        .font(.title3)
                        .fontWeight(.medium)
                        .accessibility(identifier: "accountSettings")

                    
                    Button {
                        print("")
                    } label: {
                        Text(StaticMessage.editProfileTitle)
                            .font(.subheadline)
                            .fontWeight(.light)
                            .accessibility(identifier: "editProfile")

                    }
                    
                    Button {
                        print("")
                    } label: {
                        Text(StaticMessage.saveCardTitle)
                            .font(.subheadline)
                            .fontWeight(.light)
                            .accessibility(identifier: "saveCard")

                    }
                    
                    Button {
                        print("")
                    } label: {
                        Text(StaticMessage.notificationTitle)
                            .font(.subheadline)
                            .fontWeight(.light)
                            .accessibility(identifier: "notifications")

                    }
                    
                    Button {
                        print("")
                    } label: {
                        Text(StaticMessage.contactUsTitle)
                            .font(.subheadline)
                            .fontWeight(.light)
                            .accessibility(identifier: "contactUs")

                    }
                    
                    Button {
                        print("")
                    } label: {
                        Text(StaticMessage.termsAndPolicyTitle)
                            .font(.subheadline)
                            .fontWeight(.light)
                            .accessibility(identifier: "termsAndPolicy")

                    }
                    
                    Button {
                        print("")
                    } label: {
                        Text(StaticMessage.questionAnswerTitle)
                            .font(.subheadline)
                            .fontWeight(.light)
                            .accessibility(identifier: "questionAnswer")

                    }
                }
                .padding()
            }
        }
    }
    func formattedDate(_ date: Date) -> String {
        let formatter = DateFormatter()
        formatter.dateStyle = .medium
        formatter.timeStyle = .short
        return formatter.string(from: date)
    }
    
}

struct UserProfileView_Previews: PreviewProvider {
    static var previews: some View {
        UserProfileView(viewModel: ProfileViewModel.init(user: UserModel.dummy, orders: [OrderModel.dummy]))
    }
}
