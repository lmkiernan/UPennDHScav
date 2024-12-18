//
//  DiningHallView.swift
//  HW 3
//
//  Created by liam on 11/9/24.
//

import SwiftUI

struct ShakeDetector: UIViewControllerRepresentable {
    var onShake: () -> Void
    func makeUIViewController(context: Context) -> ShakeViewController {
        let controller = ShakeViewController()
        controller.onShake = onShake
        return controller
    }
    
    func updateUIViewController(_ uiViewController: ShakeViewController, context: Context) {}
}

class ShakeViewController: UIViewController {
    var onShake: (() -> Void)?
    
    override func motionEnded(_ motion: UIEvent.EventSubtype, with event: UIEvent?) {
        if motion == .motionShake {
            onShake?()
        }
    }
    
}

struct DiningHallView: View {
    @ObservedObject var viewModel: ScavViewModel
    var body: some View {
        VStack {
            if (viewModel.halls[viewModel.din].collected != true) {
                Text("Shake Phone to Collect \(viewModel.halls[viewModel.din].text)!")
                    .font(.title)
                    .fontWeight(.bold)
                    .multilineTextAlignment(.center)
            } else {
                ZStack {
                    Rectangle()
                        .size(width: 1000000, height: 10000000)
                        .foregroundStyle(Color.green)
                        .ignoresSafeArea()
                    Text("You've Already Collected \(viewModel.halls[viewModel.din].text)! \n \n Navigate to other dining halls to collect them next")
                        .font(.title)
                        .fontWeight(.bold)
                        .foregroundColor(Color.white)
                        .multilineTextAlignment(.center)
                }
            }
        }
        .overlay(
            ShakeDetector {
                viewModel.shaken = true
                viewModel.reqLocation()
                viewModel.loadGame()
                
                if (viewModel.checkProximityToDiningHall()) {
                    viewModel.halls[viewModel.din].collected = true
                }
            }
        )
    }
}

#Preview {
    DiningHallView(viewModel: ScavViewModel())
}

