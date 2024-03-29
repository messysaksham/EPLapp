//
//  DetailViewStandings.swift
//  MessiFootball
//
//  Created by Saksham on 14/02/24.
//

import SwiftUI

struct DetailViewStandings: View {

    @State var table : table?

    @ObservedObject var detailview = Viewmodel()
    let kfimage = KFimage()
    let url = BaseUrl.shared.getStandingsUrl()


    var body: some View {


        Text( table?.team?.shortName ?? "")
    }
}

//#Preview {
//    DetailViewStandings(table: .)
//}
