//
//  GroupOperationListStreamView.swift
//  CombineDemo
//
//  Created by kevin.cheng on 9/6/19.
//  Copyright © 2019 Kevin Cheng. All rights reserved.
//

import SwiftUI

struct UnifyingOperationListStreamView: View {
    @EnvironmentObject var streamStore: StreamStore
    func streamView(streamModel: UnifyingOperationStreamModel) -> some View {
        let sourceStreams = streamStore.streams.filter { $0.isDefault }
        guard sourceStreams.count > 1 else {
            return AnyView(EmptyView())
        }
        let operationStreamViewModel = MultiStreamViewModel(streamTitle: streamModel.name ?? "",
                                                  stream1Model: sourceStreams[0],
                                                  stream2Model: sourceStreams[1],
                                                  unifyingStreamModel: streamModel)
        return AnyView(MultiStreamView(viewModel: operationStreamViewModel))
     }

    var body: some View {
        ForEach(streamStore.unifyingStreams) { stream in
                NavigationLink(destination: self.streamView(streamModel: stream)) {
                    MenuRow(detailViewName: stream.name ?? "")
            }
        }.onMove { (source, destination) in
            var storedStreams = self.streamStore.unifyingStreams
            storedStreams.move(fromOffsets: source, toOffset: destination)
            self.streamStore.unifyingStreams = storedStreams
        }
    }
}

//struct GroupOperationListStreamView_Previews: PreviewProvider {
//    static var previews: some View {
//        UnifyingOperationListStreamView(storedUnifyingOperationStreams: .constant([]))
//    }
//}
