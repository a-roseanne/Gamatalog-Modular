//
//  HomeRouter.swift
//  Gamatalog
//
//  Created by Angelica Roseanne on 20/11/21.
//

import SwiftUI
import Core
import Game

class HomeRouter {
//    func createDetailView(for game: GameModel) -> some View {
//        let detailUseCase = Injection.init().provideDetail(game: game)
//        let presenter = DetailPresenter(detailUseCase: detailUseCase)
//        return DetailGameView(presenter: presenter)
//    }
    
    func makeDetailView(for game: GameDomainModel) -> some View {
        
        let useCase: Interactor<
            Any,
            [GameDomainModel],
            GetGamesRepository<
                GetGameLocaleDataSource,
                GetGamesRemoteDataSource,
                GameTransformer>> = Injection.init().provideHome()
        
        let presenter = GetListPresenter(useCase: useCase)
        
        return DetailGameView(presenter: presenter, game: game)
    }
}
