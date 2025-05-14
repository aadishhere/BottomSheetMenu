//
//  ContentView.swift
//  BottomSheetMenu
//
//  Created by Aadish Jain on 14/05/25.
//

import SwiftUI

struct ContentView: View {
    @State private var showSheet = false

    var body: some View {
        ZStack {
            VStack {
                Spacer()
                Button(action: {
                    withAnimation(.easeInOut) {
                        showSheet = true
                    }
                }) {
                    Text("sheet menu trigger")
                        .font(.headline)
                        .foregroundColor(.white)
                        .padding()
                        .frame(width: 200)
                        .background(Color.blue)
                        .clipShape(Capsule())
                }
                Spacer()
            }

            if showSheet {
                Color.primary.opacity(0.2)
                    .ignoresSafeArea()
                    .onTapGesture {
                        withAnimation(.easeInOut) {
                            showSheet = false
                        }
                    }

                BottomSheetView(showSheet: $showSheet)
                    .transition(.move(edge: .bottom))
            }
        }
    }
}

//MARK: Sheet Design

struct BottomSheetView: View {
    @Binding var showSheet: Bool

    var body: some View {
        VStack(spacing: 0) {
            VStack(spacing: 15) {
                BottomSheetOption(title: "Report Issues", icon: "exclamationmark.bubble") {
                    print("ButtonPressed")
                }
                BottomSheetOption(title: "Schedule Meeting", icon: "text.bubble.badge.clock") {
                    print("ButtonPressed")
                }
                BottomSheetOption(title: "Request CallBack", icon: "phone.arrow.down.left") {
                    print("ButtonPressed")
                }
                BottomSheetOption(title: "Close", icon: "xmark") {
                    print("ButtonPressed")
                    dismiss()
                }
            }
            .padding(.top, 20)
            .padding(.horizontal, 24)
            .padding(.bottom, 30)
        }
        .frame(maxWidth: .infinity)
        .background(Color.primary.opacity(0.2))
        .background(.ultraThinMaterial)
        .clipShape(RoundedRectangle(cornerRadius: 25, style: .continuous))
        .padding(.horizontal, 8)
        .frame(maxHeight: .infinity, alignment: .bottom)
        .ignoresSafeArea(.all)
    }

    private func dismiss() {
        withAnimation(.easeInOut) {
            showSheet = false
        }
    }
}

struct BottomSheetOption: View {
    let title: String
    let icon: String
    let action: () -> Void

    var body: some View {
        Button(action: action) {
            HStack(spacing: 16) {
                Image(systemName: icon)
                    .foregroundColor(.white)
                    .padding(10)
                    .background(Color.blue)
                    .clipShape(Circle())

                Text(title)
                    .foregroundColor(.primary)
                    .font(.body)

                Spacer()
            }
            .padding()
            .background(Color(.systemGray6).opacity(0.5))
            .clipShape(RoundedRectangle(cornerRadius: 25, style: .continuous))
        }
        .buttonStyle(PlainButtonStyle())
    }
}

#Preview {
    ContentView()
}
