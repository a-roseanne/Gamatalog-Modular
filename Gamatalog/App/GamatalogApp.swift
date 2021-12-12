//
//  GamatalogApp.swift
//  Gamatalog
//
//  Created by Angelica Roseanne on 16/11/21.
//

import SwiftUI
import RealmSwift
import Core
import Game

@main
struct GamatalogApp: App {
    var body: some Scene {
        let homeUseCase: Interactor<
                Any,
                [GameDomainModel],
                GetGamesRepository<
                    GetGameLocaleDataSource,
                    GetGamesRemoteDataSource,
                    GameTransformer>
            > = Injection.init().provideHome()
            
            let homePresenter = GetListPresenter(useCase: homeUseCase)
//        let homeUseCase = Injection.init().provideHome()
//        let homePresenter = HomePresenter(homeUseCase: homeUseCase)
        
        let favoriteUseCase = Injection.init().provideFavorite()
        let favoritePresenter = FavoritePresenter(favoriteUseCase: favoriteUseCase)
        
        WindowGroup {
            ContentView()
                .environmentObject(homePresenter)
                .environmentObject(favoritePresenter)
        }
    }
}
