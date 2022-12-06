//
//  ProdottoView.swift
//  Ebay
//
//  Created by giovanni russo on 17/11/22.
//

import SwiftUI

struct ProdottoView: View {
    @State var prod: Prodotti
    @State var selection: Int = 1
    @State var quantityAmount: Int = 1
    
    var body: some View {
        
        ScrollView {
            
            VStack(spacing: 0) {
                
                Image(decorative: prod.Immagine)
                    .resizable()
                    .scaledToFit()
                    .frame(minWidth: 200, maxWidth: 500,minHeight: 200, maxHeight: 400)
                    .overlay(alignment: .bottomTrailing){
                        Image(systemName: "heart").padding()
                    }
                    

                HStack {
                    
                    Spacer()
                    
                    Image(systemName: "dollarsign.circle.fill")
                    
                    Text("Price:")
                    
                    Text("$\(String(format: "%.2f",prod.price))")
                    
                    Spacer()
                    
                    Image(systemName: "shippingbox.fill")
                    
                    Text("Free Shipping")
                    
                    Spacer()

                }//end HStack
                .padding(.vertical)
                .background(Color.primary.opacity(0.1))
                
                VStack {
                    Picker(selection: $selection, label: Text("Picker")) {
                        
                        Text("Information").tag(1)
                        
                        Text("Reviews").tag(2)
                        
                    }.pickerStyle(.segmented)
                        .padding()
                    
                    Spacer()
                    
                    if selection == 1 {
                        
                        Text("Product Information")
                            .padding(.vertical)
                            .font(.title)
                    
                    
                    Spacer()
                    
                    HStack(spacing: 0){
                        
                        Spacer()
                        
                        VStack(alignment:.listRowSeparatorLeading){
                            
                            Text("Condition:")
                                .bold()
                            
                            Divider()
                            
                            Text("Availability:")
                                .bold()
                            
                            Divider()
                            
                            Text("Made in:").bold()
                            
                            Divider()
                            
                            Text("Category:").bold()
                            
                            Divider()
                            

                        }.padding()
                        
                        VStack(alignment:.leading){
                            Text("New")
                            
                            Spacer()
                            
                            Divider()

                            Text("In Stock")
                            
                            Divider()
                            
                            Text("Italy")
                            
                            Divider()
                            
                            Text(prod.categoria)
                            
                            Divider()
                            

                        }.padding()
                        
                    }//END HSTACK
                    } else{
                        
                        Text("Sorry no reviews found...")
                            .padding(.vertical)
                            .font(.title3)
                            
                        
                    }
                    
                //button
                    Text("Seller's description of product")
                        .padding(.horizontal)
                        .font(.title2)
                        
                    Spacer()
                    
                    NavigationLink{
                        Text("Description")
                    }
                label:{
                    
                    Text("   Product description  > ").bold().foregroundColor(.black).padding(.horizontal)
                        .padding(10)
                        .font(.subheadline)
                        
                    }
                }.padding(.trailing)
               //end VStack
                
                Stepper("Amount: \(quantityAmount)", value: $quantityAmount, in: 1...10)
                    .padding()
                
                    Button {
                    } label: {
                        
                        Spacer()
                        
                        Text("Buy Now").foregroundColor(.black)
                            .tint(.black)
                            .padding(5)
                            
                        Spacer()
                        
                    }.padding(.horizontal)
                    .buttonStyle(.borderedProminent)
                    .tint(.mint)
                    .cornerRadius(10)
                
                Spacer()
                    
                    Button {
                    } label: {
                        
                        Spacer()
                        
                        Text("Add to Cart").foregroundColor(.black)
                            .tint(.black)
                            .padding(5)
                        
                        Spacer()
                        
                    }.padding(.horizontal)
                        .buttonStyle(.bordered)
                    .tint(.mint)
                    .cornerRadius(10)
                
                Divider().padding()
                
                Text("Top products")
                    .padding()
                    .font(.title2)
                
                ProdottiCarusel()
                   
    
            }// end VStack with spacing
            
        }.navigationTitle(prod.title)
            .navigationBarTitleDisplayMode(.inline)
        
    }//end body
    
    func getScale(proxy: GeometryProxy) -> CGFloat{
        
        let midPoint: CGFloat = 125
        
        let viewFrame = proxy.frame(in: CoordinateSpace.global)
        
        var scale: CGFloat = 1.0
        
        let deltaXAnimationThreshold: CGFloat = 125
        
        let diffFromCenter = abs(midPoint - viewFrame.origin.x - deltaXAnimationThreshold / 2)
        
        if diffFromCenter < deltaXAnimationThreshold{
            scale = 1 + (deltaXAnimationThreshold - diffFromCenter) / 500
        }
        
        return scale
    }//end func
}

struct ProdottoView_Previews: PreviewProvider {
    static var previews: some View {
        ProdottoView(prod: Prodotti(id: 1, title: "Svegia", subtitle: "New | Professional Vendor", Immagine: "1",
                                    categoria: "elettronica", price: 5.55, starred: false))
    }
}
