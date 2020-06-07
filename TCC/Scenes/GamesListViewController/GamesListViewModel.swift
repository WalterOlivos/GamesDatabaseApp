//
//  GamesListViewModel.swift
//  TCC
//
//  Created by Walter Oliveira on 06/06/20.
//  Copyright © 2020 Walter Oliveira. All rights reserved.
//

import UIKit

protocol GamesListViewModelDelegate: class {
    func gamesListViewModelDidGetGames()
    func gamesListViewModel(didRecieve error: String)
}

class GamesListViewModel {
    
    weak var delegate: GamesListViewModelDelegate?
    
    var games: [GameModel] = []
    var page: Int = 1
    
    func fetchGames() {
        APIManager.APIMethods.loadGamesList(page: page) { games, error  in
            guard let error = error else {
                if let games = games {
                    self.games = games
                }
                self.delegate?.gamesListViewModelDidGetGames()
                return
            }
            
            self.delegate?.gamesListViewModel(didRecieve: error)
        }
    }
    
    func fetchMoreGames() {
        self.page += 1
        APIManager.APIMethods.loadGamesList(page: page) { games, error  in
            guard let error = error else {
                if let games = games {
                    self.games.append(contentsOf: games)
                }
                self.delegate?.gamesListViewModelDidGetGames()
                return
            }
            
            self.delegate?.gamesListViewModel(didRecieve: error)
        }
    }
    
}

extension GamesListViewModel: GameTableViewCellDelegate {
    func gameTableViewCellDidLoad(game: GameModel, image: UIImage) {
        for i in 0..<games.count {
            if games[i].id == game.id {
                games[i].image = image
            }
        }
    }
}
