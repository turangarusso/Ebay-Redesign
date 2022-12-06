//
//  ContentView.swift
//  Ebay
//
//  Created by giovanni russo on 16/11/22.
//

import SwiftUI

struct ContentView: View {
    
    @State private var searchText = ""
    @State var selectedFlavor: Int = 1
    @State var selectedOrder: Int = 1
    var body: some View {
       
        
        NavigationView{
            VStack {
                
                HStack{
                    
                    Picker("Category", selection: $selectedFlavor) {
                        Text("Category").tag(1)
                        Text("Tablet").tag(2)
                        Text("Electronics").tag(3)
                        Text("Lamps").tag(4)
                        Text("Smartphone").tag(5)
                        Text("Bags").tag(6)
                        
                    }.pickerStyle(.automatic).accentColor(.mint)
                        
                        
                    
                    Picker("Category", selection: $selectedOrder) {
                        Text("Price Decrescent").tag(1)
                        Text("Price Increasing").tag(2)
                        
                    }.pickerStyle(.menu).accentColor(.mint)
                       
                    
                    Image(systemName: "cart")
                        
                        
                }//End Hstack picker
                
                if ProdottiFiltrati.isEmpty {
                    
                    Text("Sorry No Products Found...")
                        .foregroundColor(.secondary)

                }
                
                List(ProdottiFiltrati){ num in
                    
                    NavigationLink{
                        
                        ProdottoView(prod: num)
                        
                    }label: {
                        
                        Image( num.Immagine)
                            .resizable()
                            .frame(width: 120, height: 120)
                            .clipShape(RoundedRectangle(cornerRadius: 5))
                            .overlay(RoundedRectangle(cornerRadius: 5)
                                .stroke(.black, lineWidth: 1))
                        
                        VStack(alignment: .leading) {
                            
                            HStack(){
                                
                                Text(num.title)
                                    .font(.headline)
                                
                                Spacer()
                                
                                Image(systemName: "heart")
                                
                            }
                            
                            Text(num.subtitle)
                                .font(.subheadline)
                            
                            Text("")
                            
                            Text("$\(String(format: "%.2f",num.price))")
                            
                            Text("Free Shipping")
                                .foregroundColor(.secondary)
                                .font(.footnote)
                        }
                        
                        
                    } //end label
                    
                    
                    
                }// end lista
                
                .listStyle(.plain)
                .searchable(text: $searchText, prompt: "Search for a product")
            }//end nav view
        }
    }
    
    
    
    var ProdottiFiltrati: [Prodotti] {
        if selectedOrder == 1{
            listaProdotti.sort { (lhs: Prodotti, rhs: Prodotti) -> Bool in
                // you can have additional code here
                return lhs.price > rhs.price
            }
        }else{
            listaProdotti.sort { (lhs: Prodotti, rhs: Prodotti) -> Bool in
                // you can have additional code here
                return lhs.price < rhs.price
            }
        }
       
        if searchText.isEmpty && selectedFlavor ==  1{
            
            return listaProdotti
        } else {
            
            switch selectedFlavor {
            case 2:
                
                return listaProdotti.filter{ $0.categoria.localizedCaseInsensitiveContains("Tablet") }
                
            case 3:
                return listaProdotti.filter{ $0.categoria.localizedCaseInsensitiveContains("Electronics") }

            case 4:
                return listaProdotti.filter{ $0.categoria.localizedCaseInsensitiveContains("Lamps") }
            case 5:
                return listaProdotti.filter{ $0.categoria.localizedCaseInsensitiveContains("Smartphone") }

            default:
                return listaProdotti.filter { $0.title.localizedCaseInsensitiveContains(searchText) }
            }
            
           
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
