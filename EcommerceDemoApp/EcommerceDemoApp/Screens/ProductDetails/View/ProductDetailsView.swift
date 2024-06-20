//
//  ProductDetailsView.swift
//  EcommerceDemoApp
//
//  Created by Ravi Kumar Singh on 27/05/24.
//

import SwiftUI

struct ProductDetailsView: View {
    
    var products: ProductModel
   @EnvironmentObject var productDetailsViewModel : ProductDetailsViewModel
    var body: some View {
        VStack(spacing: 16) {
            HStack {
                Button(action: {
                    
                }, label: {
                    Image(systemName: "chevron.left")
                        .foregroundColor(.gray)
                        .bold()
                })

                .multilineTextAlignment(.trailing)
                .accessibility(identifier: "backButton")
                Spacer()

                AsyncImageView(imageURL: products.image)
                    .scaledToFit()
                    .frame(height: 300)
                    .accessibility(identifier: "image")
                Spacer()

                Button(action: {
                   
                }, label: {
                    Image(systemName: "chevron.right")
                        .foregroundColor(.gray)
                        .bold()
                })
                .accessibility(identifier: "nextButton")
                .multilineTextAlignment(.trailing)
            }

            Text(products.title)
                .font(.headline)
                .padding(.top)
                .accessibility(identifier: "productTitle")

            Text(products.description)
                .font(.footnote)
                .foregroundStyle(.secondary)
                .accessibility(identifier: "productDescription")

            RatingInfoView(rating: products.rating.rate.toString())
                .accessibility(identifier: "ratingInfo")
            HStack {
                VStack(alignment: .leading, spacing: 8) {
                    Text(StaticMessage.totalPriceTitle)
                        .font(.subheadline)
                        .foregroundStyle(.secondary)
                    Text(products.price.toCurrencyFormate())
                        .font(.title3)
                        .fontWeight(.bold)
                        .foregroundStyle(.indigo)
                }
                .padding(.leading)
                .accessibility(identifier: "priceInfo")
                
                Spacer()

                HStack(spacing: 0) {
                    Button {
                        productDetailsViewModel.addProduct(CartProductModel(id: products.id, title: products.title, description: products.description, category: products.category, image: products.image, price: products.price, quantity: 1, rating: Rating(rate: 1.0, count: 1)))
                        productDetailsViewModel.addItem()
                        
                    } label: {
                        Image(systemName: "cart.fill.badge.plus")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 30, height: 30)
                            .frame(width: 50, height: 50)
                            .background(.indigo)
                            .accessibility(identifier: "addToCartButton")
                        Text(StaticMessage.buyNowTitle)
                            .font(.headline)
                            .fontWeight(.bold)
                            .frame(width: 100, height: 50)
                            .background(Color(UIColor.darkGray))
                            .accessibility(identifier: "buy Now")
                    }

                }
                .cornerRadius(15)
                .foregroundColor(.white)
            }
            .frame(maxWidth: .infinity)
            .frame(height: 100)
            .background(.gray.opacity(0.2))
            .cornerRadius(15)
        }
        .padding()
    }
}

struct ProductDetailsView_Previews: PreviewProvider {
    static var previews: some View {
        ProductDetailsView(products: ProductModel.dummy)
    }
}

struct RatingInfoView: View {
    let rating: String
    var body: some View {
        HStack {
            HStack {
                Image(systemName: "star.fill")
                    .foregroundStyle(.yellow)
                
                Text(rating + " " + StaticMessage.ratingTitle)
                    .foregroundStyle(.secondary)
            }
            .font(.callout)
            
            Spacer()
            
            circleImage
            
            Spacer()
            
            Text("4.6k Reviews")
            
            Spacer()
            
            circleImage
            
            Spacer()
            
            Text("4.6k Sold")
            
        }
        .foregroundStyle(.secondary)
        .font(.callout)
    }

    var circleImage: some View {
        Image(systemName: "circle.fill")
            .resizable()
            .frame(width: 8, height: 8)
    }
}
