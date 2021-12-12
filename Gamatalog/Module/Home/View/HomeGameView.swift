//
//  HomeGameView.swift
//  Gamatalog
//
//  Created by Angelica Roseanne on 20/11/21.
//

import SwiftUI
import Game
import Core

struct HomeGameView: View {
    @ObservedObject var presenter: GetListPresenter<Any, GameDomainModel, Interactor<Any, [GameDomainModel], GetGamesRepository<GetGameLocaleDataSource, GetGamesRemoteDataSource, GameTransformer>>>
    @ObservedObject var favPresenter: FavoritePresenter
    @State private var showProfileModal = false
    @State private var showFavoriteModal = false
    
    var body: some View {
        ZStack {
                if presenter.isLoading {
                    VStack {
                        Text("Loading Games ...")
                    }
                } else if presenter.isError {
                    VStack {
                        Text("Sorry, ERROR")
                    }
                } else if presenter.list.isEmpty {
                    VStack {
                        Text("Oops! No games")
                    }
                } else {
                    ScrollView(showsIndicators: false) {
                        ForEach(
                            self.presenter.list,
                            id: \.id
                        ) { game in
                            ZStack {
                                GameCardView(game: game)
                                .buttonStyle(PlainButtonStyle())
                            }
                            .padding()
                        }
                    }
                }
            }
            .onAppear {
                if self.presenter.list.count == 0 {
                    self.presenter.getList(request: nil)
                }
            }
            .navigationBarTitle(
                Text("Discover Games"),
                displayMode: .automatic
            )
            .sheet(isPresented: $showProfileModal) {
                MyAccountView()
            }
            .sheet(isPresented: $showFavoriteModal) {
                FavoriteView(presenter: favPresenter)
            }
            .toolbar {
                ToolbarItemGroup(placement: .navigationBarTrailing) {
                    Button {
                        self.showFavoriteModal.toggle()
                    } label: {
                    Image(systemName: "heart")
                        .accentColor(Color("ProfileButton"))
                        .font(.title2)
                    }
                    Button {
                        self.showProfileModal.toggle()
                    } label: {
                    Image(systemName: "person.crop.circle")
                        .accentColor(Color("ProfileButton"))
                        .font(.title2)
                    }
                }
            }
    }
}
