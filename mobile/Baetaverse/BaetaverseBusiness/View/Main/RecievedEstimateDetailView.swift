//
//  RecievedEstimateDetailView.swift
//  BaetaverseBusiness
//
//  Created by JeongTaek Han on 2022/05/03.
//

import SwiftUI

struct RecievedEstimateDetailView: View {
    
    var body: some View {
        ScrollView {
            EstimateContentView()
        }
        .navigationTitle("상세화물정보")
        .navigationBarTitleDisplayMode(.inline)
    }
    
}

fileprivate struct EstimateContentView: View {
    
    var body: some View {
        VStack(alignment: .leading) {
            ShippingInformationView()
            Divider()
            ItemInformationView()
            Divider()
            MoreDetailsInformationView()
        }
        .padding()
    }
    
}

fileprivate struct ShippingInformationView: View {
    
    var body: some View {
        VStack(alignment: .leading, spacing: 15) {
            Text("배송정보")
                .font(.title)
            
            VStack(alignment: .leading) {
                Text("D - 27")
                Text("* 출고예정일")
                Text("* 견적마감일")
                Text("Door to Door / Port to Port")
                Text("출발지")
                Text("도착지")
            }
        }
    }
    
}

fileprivate struct ItemInformationView: View {
    
    var body: some View {
        VStack(alignment: .leading, spacing: 15) {
            Text("물품정보")
                .font(.title)
            VStack(alignment: .leading) {
                Text("물품명")
                Text("HSCode")
                Text("물품총가액")
                Text("총 중량")
            }
            VStack(alignment: .leading) {
                HStack {
                    Text("화물포장정보")
                    Picker(selection: .constant(1), label: Text("화물포장정보")) {
                        Text("1").tag(1)
                        Text("2").tag(2)
                    }
                }
            }
            VStack {
                HStack {
                    Text("가로")
                    TextField(text: .constant("가로정보"), prompt: Text("가로")) {
                        Text("가로")
                    }
                    Text("세로")
                    TextField(text: .constant("세로정보"), prompt: Text("세로")) {
                        Text("세로")
                    }
                    Text("높이")
                    TextField(text: .constant("높이정보"), prompt: Text("높이")) {
                        Text("높이")
                    }
                }
                HStack {
                    Text("CBM")
                    TextField(text: .constant("가로 * 세로 * 높이"), prompt: Text("CBM")) {
                        Text("CBM")
                    }
                }
                HStack {
                    Text("개수")
                    TextField(text: .constant("개수입력"), prompt: Text("개수")) {
                        Text("개수")
                    }
                }
            }
            .textFieldStyle(.roundedBorder)
        }
    }
    
}

fileprivate struct MoreDetailsInformationView: View {
    
    var body: some View {
        Text("Hello Wolrd2")
    }
    
}

struct RecievedEstimateDetailView_Previews: PreviewProvider {
    
    static var previews: some View {
        RecievedEstimateDetailView()
    }
    
}
