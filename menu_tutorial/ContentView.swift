//
//  ContentView.swift
//  menu_tutorial
//
//  Created by Seokhyun Kim on 2021-03-06.
//

import SwiftUI

let myPets = ["dog", "cat", "you"]
struct ContentView: View {
    
    @State private var shouldShowAlert : Bool = false
    @State private var myText : String = ""
    @State private var selected : Int = 0
    var body: some View {
        NavigationView {
            VStack(spacing: 20) {
                Spacer()
                Text("\(myPets[selected])")
                    .font(.system(size: 60))
                    .bold()
                Text("Select menu")
                    .font(.title2)
                    .fontWeight(.black)
                Spacer()
                Spacer()
            }
                .padding()
                .navigationTitle("Hi~~~")
                .toolbar(content: {
                    //navigationBar Leading 왼쪽.
                    ToolbarItem(placement: .primaryAction, content: {
                        Menu {
                            Button(action: {
                                print("Today is a coding day")
                                shouldShowAlert = true
                                myText = "Today is a coding day"
                            }, label: {
                                Label("Today is a coding day", systemImage : "flame.fill")
                            })
                            
                            //멀티 트레일링 클로저
                            Button{
                                print("Button clicked")
                                shouldShowAlert = true
                                myText = "Today is taking a rest"
                            } label: {
                                Label("Today is taking a rest", systemImage : "house.fill")
                            }
                            
                            Section {
                                //멀티 트레일링 클로저
                                Button{
                                } label: {
                                    Label("Making new file", systemImage : "doc")
                                }
                                Button{
                                } label: {
                                    Label("Making new folder", systemImage : "folder")
                                }
                            }
                            
                            Section {
                                //멀티 트레일링 클로저
                                Button{
                                } label: {
                                    Label("Delete all", systemImage : "trash")
                                }
                                Button{
                                } label: {
                                    Label("Making new folder", systemImage : "foler")
                                }
                            }
                            Picker(selection: $selected, label: Text("select pet")) {
                                ForEach(myPets.indices, id: \.self,
                                        content: { index in
                                            Text("\(myPets[index])").tag(index)
                                        })
                            }
                            
                        } label: {
                            Circle().foregroundColor(Color.init(#colorLiteral(red: 0, green: 0.3285208941, blue: 0.5748849511, alpha: 1)))
                                .frame(width: 50, height: 50)
                                .overlay(
                                    Label("More", systemImage: "ellipsis")
                                        .font(.system(size: 30))
                                        .foregroundColor(.white)
                                )
                        } //menu
                    })
                }) //Toolbar
                .alert(isPresented: $shouldShowAlert, content: {
                    Alert(title: Text("Alert"), message: Text("\(myText)"), dismissButton: .default(Text("OK")))
                })
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
