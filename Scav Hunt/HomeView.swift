//
//  ContentView.swift
//  HW 3
//
//  Created by liam on 11/9/24.
//

import SwiftUI
import CoreLocation

struct HomeView: View {
    @StateObject var viewModel = ScavViewModel()
    var body: some View {
        NavigationStack {
            GeometryReader { geometry in
                VStack {
                    Text("Dining Hall Scavenger")
                        .font(.largeTitle)
                        .fontWeight(.heavy)
                        .multilineTextAlignment(.center)
                    HStack {
                        NavigationLink(destination: DiningHallView(viewModel: viewModel)) {
                            ZStack {
                                if (viewModel.halls[0].collected) {
                                    Image("commons")
                                        .resizable()
                                        .scaledToFill()
                                        .frame(width: geometry.size.width / 2.15, height: geometry.size.height / 7.05)
                                        .overlay(Color.green.opacity(0.3))
                                        .cornerRadius(10)
                                        .clipped()
                                } else {
                                    Image("commons")
                                            .resizable()
                                            .scaledToFill()
                                            .frame(width: geometry.size.width / 2.15, height: geometry.size.height / 7.05)
                                            .overlay(Color.gray.opacity(0.35))
                                            .cornerRadius(10)
                                            .clipped()
                                }
                                Text("1920 Commons")
                                    .font(.title3)
                                    .fontWeight(.heavy)
                                    .foregroundColor(Color.white)
                            }
                        }.simultaneousGesture(
                            TapGesture()
                                .onEnded(){
                                    viewModel.din = 0;
                                }
                        )
                        NavigationLink(destination: DiningHallView(viewModel: viewModel)) {
                            ZStack {
                                if (viewModel.halls[1].collected) {
                                    Image("accenture")
                                                .resizable()
                                                .scaledToFill()
                                                .frame(width: geometry.size.width / 2.15, height: geometry.size.height / 7.05)
                                                .overlay(Color.green.opacity(0.3))
                                                .cornerRadius(10)
                                                .clipped()
                                } else {
                                    Image("accenture")
                                                .resizable()
                                                .scaledToFill()
                                                .frame(width: geometry.size.width / 2.15, height: geometry.size.height / 7.05)
                                                .overlay(Color.gray.opacity(0.35))
                                                .cornerRadius(10)
                                                .clipped()
                                }
                                Text("Accenture Café")
                                    .font(.title3)
                                    .fontWeight(.heavy)
                                    .foregroundColor(Color.white)
                            }
                        }.simultaneousGesture(
                            TapGesture()
                                .onEnded(){
                                    viewModel.din = 1;
                                }
                        )
                    }
                    .padding(.leading, 10.0)
                    HStack {
                        NavigationLink(destination: DiningHallView(viewModel: viewModel)) {
                            ZStack{
                                if (viewModel.halls[2].collected) {
                                    Image("falk")
                                                .resizable()
                                                .scaledToFill()
                                                .frame(width: geometry.size.width / 2.15, height: geometry.size.height / 7.05)
                                                .overlay(Color.green.opacity(0.3))
                                                .cornerRadius(10)
                                                .clipped()
                                } else {
                                    Image("falk")
                                                .resizable()
                                                .scaledToFill()
                                                .frame(width: geometry.size.width / 2.15, height: geometry.size.height / 7.05)
                                                .overlay(Color.gray.opacity(0.35))
                                                .cornerRadius(10)
                                                .clipped()
                                }
                                Text("Falk Kosher Diner")
                                    .font(.title3)
                                    .fontWeight(.heavy)
                                    .foregroundColor(Color.white)
                            }
                        }.simultaneousGesture(
                            TapGesture()
                                .onEnded(){
                                    viewModel.din = 2;
                                }
                        )
                        NavigationLink(destination: DiningHallView(viewModel: viewModel)) {
                            ZStack {
                                if (viewModel.halls[3].collected) {
                                    Image("hill")
                                                .resizable()
                                                .scaledToFill()
                                                .frame(width: geometry.size.width / 2.15, height: geometry.size.height / 7.05)
                                                .overlay(Color.green.opacity(0.3))
                                                .cornerRadius(10)
                                                .clipped()
                                } else {
                                    Image("hill")
                                                .resizable()
                                                .scaledToFill()
                                                .frame(width: geometry.size.width / 2.15, height: geometry.size.height / 7.05)
                                                .overlay(Color.gray.opacity(0.35))
                                                .cornerRadius(10)
                                                .clipped()
                                }
                                Text("Hill House")
                                    .font(.title3)
                                    .fontWeight(.heavy)
                                    .foregroundColor(Color.white)
                            }
                        }.simultaneousGesture(
                            TapGesture()
                                .onEnded(){
                                    viewModel.din = 3;
                                }
                        )
                    }
                    .padding(.leading, 10.0)
                    HStack {
                        NavigationLink(destination: DiningHallView(viewModel: viewModel)) {
                            ZStack{
                                if (viewModel.halls[4].collected) {
                                    Image("houston")
                                                .resizable()
                                                .scaledToFill()
                                                .frame(width: geometry.size.width / 2.15, height: geometry.size.height / 7.05)
                                                .overlay(Color.green.opacity(0.3))
                                                .cornerRadius(10)
                                                .clipped()
                                } else {
                                    Image("houston")
                                                .resizable()
                                                .scaledToFill()
                                                .frame(width: geometry.size.width / 2.15, height: geometry.size.height / 7.05)
                                                .overlay(Color.gray.opacity(0.35))
                                                .cornerRadius(10)
                                                .clipped()
                                }
                                Text("Houston Market")
                                    .font(.title3)
                                    .fontWeight(.heavy)
                                    .foregroundColor(Color.white)
                            }
                        }.simultaneousGesture(
                            TapGesture()
                                .onEnded(){
                                    viewModel.din = 4;
                                }
                        )
                        NavigationLink(destination: DiningHallView(viewModel: viewModel)) {
                            ZStack{
                                if (viewModel.halls[5].collected) {
                                    Image("joes")
                                                .resizable()
                                                .scaledToFill()
                                                .frame(width: geometry.size.width / 2.15, height: geometry.size.height / 7.05)
                                                .overlay(Color.green.opacity(0.3))
                                                .cornerRadius(10)
                                                .clipped()
                                } else {
                                    Image("joes")
                                                .resizable()
                                                .scaledToFill()
                                                .frame(width: geometry.size.width / 2.15, height: geometry.size.height / 7.05)
                                                .overlay(Color.gray.opacity(0.35))
                                                .cornerRadius(10)
                                                .clipped()
                                }
                                Text("Joe's Café")
                                    .font(.title3)
                                    .fontWeight(.heavy)
                                    .foregroundColor(Color.white)
                            }
                        }.simultaneousGesture(
                            TapGesture()
                                .onEnded(){
                                    viewModel.din = 5;
                                }
                        )
                        
                    }
                    .padding(.leading, 10.0)
                    HStack {
                        NavigationLink(destination: DiningHallView(viewModel: viewModel)) {
                            ZStack{
                                if (viewModel.halls[6].collected) {
                                    Image("kings")
                                                .resizable()
                                                .scaledToFill()
                                                .frame(width: geometry.size.width / 2.15, height: geometry.size.height / 7.05)
                                                .overlay(Color.green.opacity(0.3))
                                                .cornerRadius(10)
                                                .clipped()
                                } else {
                                    Image("kings")
                                                .resizable()
                                                .scaledToFill()
                                                .frame(width: geometry.size.width / 2.15, height: geometry.size.height / 7.05)
                                                .overlay(Color.gray.opacity(0.35))
                                                .cornerRadius(10)
                                                .clipped()
                                }
                                Text("Kings Court English House")
                                    .font(.title3)
                                    .fontWeight(.heavy)
                                    .foregroundColor(Color.white)
                            }
                        }.simultaneousGesture(
                            TapGesture()
                                .onEnded(){
                                    viewModel.din = 6;
                                }
                        )
                        
                        NavigationLink(destination: DiningHallView(viewModel: viewModel)) {
                            ZStack{
                                if (viewModel.halls[7].collected) {
                                    Image("lauder")
                                                .resizable()
                                                .scaledToFill()
                                                .frame(width: geometry.size.width / 2.15, height: geometry.size.height / 7.05)
                                                .overlay(Color.green.opacity(0.3))
                                                .cornerRadius(10)
                                                .clipped()
                                } else {
                                    Image("lauder")
                                                .resizable()
                                                .scaledToFill()
                                                .frame(width: geometry.size.width / 2.15, height: geometry.size.height / 7.05)
                                                .overlay(Color.gray.opacity(0.35))
                                                .cornerRadius(10)
                                                .clipped()
                                }
                                Text("Lauder College House")
                                    .font(.title3)
                                    .fontWeight(.heavy)
                                    .foregroundColor(Color.white)
                            }
                        }.simultaneousGesture(
                            TapGesture()
                                .onEnded(){
                                    viewModel.din = 7;
                                }
                        )
                    }
                    .padding(.leading, 10.0)
                    HStack {
                        NavigationLink(destination: DiningHallView(viewModel: viewModel)) {
                            ZStack {
                                if (viewModel.halls[8].collected) {
                                    Image("mclelland")
                                                .resizable()
                                                .scaledToFill()
                                                .frame(width: geometry.size.width / 2.15, height: geometry.size.height / 7.05)
                                                .overlay(Color.green.opacity(0.3))
                                                .cornerRadius(10)
                                                .clipped()
                                } else {
                                    Image("mclelland")
                                                .resizable()
                                                .scaledToFill()
                                                .frame(width: geometry.size.width / 2.15, height: geometry.size.height / 7.05)
                                                .overlay(Color.gray.opacity(0.35))
                                                .cornerRadius(10)
                                                .clipped()
                                }
                                Text("McClelland \n Express")
                                    .font(.title3)
                                    .fontWeight(.heavy)
                                    .foregroundColor(Color.white)
                                    .multilineTextAlignment(.center)
                                    
                                
                            }
                        }
                        .simultaneousGesture(
                            TapGesture()
                                .onEnded(){
                                    viewModel.din = 8;
                                }
                        )
                        
                        
                        NavigationLink(destination: DiningHallView(viewModel: viewModel)) {
                            ZStack {
                                if (viewModel.halls[9].collected) {
                                    Image("pret")
                                                .resizable()
                                                .scaledToFill()
                                                .frame(width: geometry.size.width / 2.15, height: geometry.size.height / 7.05)
                                                .overlay(Color.green.opacity(0.3))
                                                .cornerRadius(10)
                                                .clipped()
                                } else {
                                    Image("pret")
                                                .resizable()
                                                .scaledToFill()
                                                .frame(width: geometry.size.width / 2.15, height: geometry.size.height / 7.05)
                                                .overlay(Color.gray.opacity(0.35))
                                                .cornerRadius(10)
                                                .clipped()
                                }
                                Text("Pret A Manager")
                                    .font(.title3)
                                    .fontWeight(.heavy)
                                    .foregroundColor(Color.white)
                            }
                        }.simultaneousGesture(
                            TapGesture()
                                .onEnded(){
                                    viewModel.din = 9;
                                }
                        )
                    }
                    .padding(.leading, 10.0)
                    HStack {
                        NavigationLink(destination: DiningHallView(viewModel: viewModel)) {
                            ZStack {
                                if (viewModel.halls[10].collected) {
                                    Image("qkit")
                                        .resizable()
                                        .scaledToFill()
                                        .frame(width: geometry.size.width / 2.15, height: geometry.size.height / 7.05)
                                        .overlay(Color.green.opacity(0.3))
                                        .cornerRadius(10)
                                        .clipped()
                                } else {
                                    Image("qkit")
                                        .resizable()
                                        .scaledToFill()
                                        .frame(width: geometry.size.width / 2.15, height: geometry.size.height / 7.05)
                                        .overlay(Color.gray.opacity(0.35))
                                        .cornerRadius(10)
                                        .clipped()
                                }
                                Text("Quaker Kitchen")
                                    .font(.title3)
                                    .fontWeight(.heavy)
                                    .foregroundColor(Color.white)
                            }
                            .simultaneousGesture(
                                TapGesture()
                                    .onEnded(){
                                        viewModel.din = 10;
                                    }
                            )
                        }
                        Button(action: {
                            for i in 0...10 {
                                viewModel.halls[i].collected = false
                            }
                        }) {
                            ZStack {
                                Rectangle()
                                    .fill(Color.gray)
                                    .frame(width: geometry.size.width / 2.15, height: geometry.size.height / 7.05)
                                    .cornerRadius(10)
                                    .clipped()
                                Text("Reset")
                                    .font(.title3)
                                    .fontWeight(.heavy)
                                    .foregroundColor(Color.white)
                            }
                        }
                        .frame(width: geometry.size.width / 2.15, height: geometry.size.height / 7.05)
                        .background(Color.gray)
                        .cornerRadius(10)
                        .clipped()
                    }
                        
                    .padding(.leading, 10.0)
                }
            }
        }
        .onAppear {
            viewModel.loadGame()
            viewModel.reqLocation()
        }
    }
}

#Preview {
    HomeView()
}
