//
//  ContentView.swift
//  Gamatalog
//
//  Created by Angelica Roseanne on 16/11/21.
//

import SwiftUI
import Core
import Game

struct ContentView: View {
    @EnvironmentObject var homePresenter: GetListPresenter<Any, GameDomainModel, Interactor<Any, [GameDomainModel], GetGamesRepository<GetGameLocaleDataSource, GetGamesRemoteDataSource, GameTransformer>>>

    @EnvironmentObject var favoritePresenter: FavoritePresenter
    
    var body: some View {
        NavigationView {
            HomeGameView(presenter: homePresenter, favPresenter: favoritePresenter)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
