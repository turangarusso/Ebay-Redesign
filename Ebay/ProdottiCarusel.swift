//
//  ProdottiCarusel.swift
//  Ebay
//
//  Created by giovanni russo on 17/11/22.
//

import SwiftUI

struct ProdottiCarusel: View {
    var body: some View {
        ScrollView(.horizontal, showsIndicators: false){
            
            HStack(alignment: .top){
                
                ForEach(listaProdotti){ num in
                    
                    NavigationLink{
                        
                        ProdottoView(prod: num)
                        
                    }label:{
                        
                        
                            ZStack(alignment : .bottom){
                                
                                ZStack{
                                    VStack{
                                    Image(num.Immagine)
                                        .resizable()
                                        .scaledToFill()
                                        .frame(width: 220, height: 250)
                                        .clipped()
                                        .cornerRadius(20)
                                        .overlay(RoundedRectangle(cornerRadius: 20)
                                            .stroke(Color(white: 0.4))            )
                                        .shadow(radius: 5)
                                    
                                   
                        
                                        
                                        Text(num.title)
                                            .font(.system(size: 15, weight: .semibold))
                                            .multilineTextAlignment(.center)
                                            .foregroundColor(.primary)
                                            .padding(.bottom, 35.0)
                                    }// End Vstack
                                }// End Zstack
                                .tabViewStyle(PageTabViewStyle(indexDisplayMode: .never))
                            }// End Zstack with alignment
                            
                           
                            .padding()
                            
                        
                    }// End label
                    Spacer()
                        .frame(width:48)
                }
            } //EndHStack
        }//End ScrollView
    }
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

struct ProdottiCarusel_Previews: PreviewProvider {
    static var previews: some View {
        ProdottiCarusel()
    }
}
