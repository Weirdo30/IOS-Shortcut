//
//  ContentView.swift
//  lab
//
//  Created by Jiajun Wang on 5/19/22.
//

import SwiftUI
import UniformTypeIdentifiers
import Foundation


struct ContentView: View {
    @State var adding = [ablock]()
    @State var addintent = false
    
    var body: some View {
        NavigationView{VStack{
            List {
                ForEach(adding, id: \.self){ item in
                    if item.name == "if" {
                        HStack{
                            ifblock()
                        }
                    }
                    else if item.name == "end if"{
                        Text(item.name)
                    }
                    else {
                        HStack{
                        if (item.indented == true){
                            Text("   ")
                        }
                            Text(item.name)}
                    }
                }.onMove(perform: move)
            }
            .toolbar{
                EditButton()
            }
            Menu("Options") {
                        Button("work", action: addA)
                        Button("do", action: addB)
                        Button("sleep", action: addC)
                        Button("block", action: addD)
                        Button("else", action: addE)
                        Button("for nnnnnnn", action: addF)
                        Button("if", action: addG)
                    }
        }
        .padding()}
        
    }
    
    func ident(){addintent.toggle()}
    func addA() { adding.append(ablock(name:"work"))}
    func addB() { adding.append(ablock(name:"do"))}
    func addC() { adding.append(ablock(name:"sleep"))}
    func addD() { adding.append(ablock(name:"block"))}
    func addE() { adding.append(ablock(name:"else"))}
    func addF() { adding.append(ablock(name:"for nnnnnn"))}
    func addG() { adding.append(ablock(name:"if"))
        adding.append(ablock(name:"end if"))
    }
    func move(from source: IndexSet, to destination: Int) {
        var indent = false
        adding.move(fromOffsets: source, toOffset: destination)
        for index in adding.indices{
            if adding[index].name == "if"{
                indent.toggle()
            }
            else if adding[index].name == "end if"{
                indent.toggle()
            }
            else{
                if indent == true{
                    adding[index].indented = true
                }
                else {
                    adding[index].indented = false
                }
            }
        }
    }
}

struct ablock: Hashable, Identifiable{
    var id = UUID().uuidString
    var name:String
    var indented = false
    
}


struct ifblock : View {
    @State var showlist = false
    @State var list = ["greater", "less", "equal to"]
    @State var listname = "Conditons"
    var body: some View {
        HStack {
            Text("if")
            Menu(listname) {
                Button("less", action: less)
                Button("greater", action: greater)
                Button("equal", action: equal)
                Button("cancel", action: cancel)
                }
                
        }
    }
    func less() { listname = "less"}
    func greater() { listname = "greater"}
    func equal() { listname = "equal"}
    func cancel() { listname = listname}
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
