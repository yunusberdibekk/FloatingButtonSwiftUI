//
//  ContentView.swift
//  FloatingButton
//
//  Created by Yunus Emre Berdibek on 6.05.2023.
//

import SwiftUI

struct ContentView: View {
    @State var showButtons = false
    var body: some View {
        ZStack {
            
            List(0..<25){ i in
                Text("Deneme")
            }
            //Mainview
            
            //Fabview
            VStack {
                
                Spacer()
                HStack{
                    
                    Spacer()
                    FloatingActionButton(showButtons: $showButtons)
                        .padding(.trailing, 30)
                }
                .padding([.bottom, .trailing], 30)
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct FloatingActionButton: View {
    @Binding var showButtons: Bool
    var body: some View {
        
        VStack(spacing: 20) {
            if self.showButtons {
                Button {
                    self.showButtons.toggle()
                } label: {
                    Image(systemName: "arrow.counterclockwise")
                        .frame(width: 35, height: 25)
                        .fontWeight(.regular)
                        .font(.system(size: 30))
                        .padding(18)
                   

                }
                .background(Color.blue)
                .foregroundColor(.white)
                .clipShape(Circle())

                Button {
                    self.showButtons.toggle()
                } label: {
                    Image(systemName: "arrow.clockwise")
                        .frame(width: 35, height: 25)
                        .fontWeight(.regular)
                        .font(.system(size: 30))
                        .padding(18)
                   
                }
                .background(Color.blue)
                .foregroundColor(.white)
                .clipShape(Circle())

            }
            
            Button {
                self.showButtons.toggle()
            } label: {
                Image(systemName: "chevron.up")
                    .frame(width: 35, height: 15)
                    .fontWeight(.regular)
                    .font(.system(size: 30))
                    .padding(22)
            }
            .background(Color.blue)
            .foregroundColor(.white)
            .clipShape(Circle())
            .rotationEffect(.init(degrees: self.showButtons ? 180 : 0))
            
            
        }.animation(.spring(), value: showButtons)
        
    }
}
