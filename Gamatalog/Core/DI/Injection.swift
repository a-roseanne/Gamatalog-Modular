//
//  Injection.swift
//  Gamatalog
//
//  Created by Angelica Roseanne on 20/11/21.
//

import Foundation
import RealmSwift
import Game
import Core

final class Injection: NSObject {
    let realm = try? Realm()
    
    func provideHome<U: UseCase>() -> U where U.Request == Any, U.Response == [GameDomainModel] {
        
        let locale = GetGameLocaleDataSource(realm: realm!)
            
        let remote = GetGamesRemoteDataSource(endpoint: Endpoints.Gets.gameList.url)
            
        let mapper = GameTransformer()
            
        let repository = GetGamesRepository(
            localeDataSource: locale,
            remoteDataSource: remote,
            mapper: mapper)
        // swiftlint:disable force_cast
        return Interactor(repository: repository) as! U
        // swiftlint:enable force_cast

    }
    
//    func provideGetDetail<U: UseCase>() ->  U where U.Request == [String: String], U.Response == DetailModel {
//        let remote = GetDetailRemote(endpoint: Endpoints.Gets.gameDetail.url, key: API.key)
//        let mapper = DetailTransform()
//        let repository = GetDetailRepository(
//            remoteDataSource: remote,
//            mapper: mapper)
//        // swiftlint:disable force_cast
//        return Interactor(repository: repository) as! U
//        // swiftlint:enable force_cast
//    }
    
    private func provideRepository() -> GameRepositoryProtocol {
        let realm = try? Realm()

        let locale: LocaleDataSource = LocaleDataSource.sharedInstance(realm)
        let remote: RemoteDataSource = RemoteDataSource.sharedInstance

        return GameRepository.sharedInstance(locale, remote)
    }
    
    func provideDetail(game: GameModel) -> DetailUseCase {
        let repo = provideRepository()
        return DetailInteractor(repository: repo, game: game)
    }

    func provideFavorite() -> FavoriteUseCase {
      let repository = provideRepository()
      return FavoriteInteractor(repository: repository)
    }
}
