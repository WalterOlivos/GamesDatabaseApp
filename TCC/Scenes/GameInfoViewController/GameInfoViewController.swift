//
//  GameInfoViewController.swift
//  TCC
//
//  Created by Walter Oliveira on 06/06/20.
//  Copyright © 2020 Walter Oliveira. All rights reserved.
//

import UIKit

class GameInfoViewController: UIViewController {

    @IBOutlet weak var backgroundImage: UIImageView!
    @IBOutlet weak var launchDate: UILabel!
    @IBOutlet weak var rating: UILabel!
    @IBOutlet weak var textView: UITextView!
    
    var game: GameModel?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupView()
    }
 
    private func setupView() {
        guard let game = game else { return }
        
        navigationItem.title = game.name
        
        backgroundImage.image = game.image
        
        let dataLancamento = game.released.formattedDateFromString(dateString: game.released, withFormat: "dd/MM/yyyy")
        
        launchDate.text = "Launch Date: \(dataLancamento!)"
        
        rating.text = "Rating: \(game.rating)/5"
        
        let genres = setupGenres(game.genres)
        
        let platforms = setupPlatforms(game.platforms)
        
        let tags = setupTags(game.tags)
        
        textView.text = "Genres: \(genres) \n \nPlatforms: \(platforms) \n \nTags: \(tags)"
        
    }

    func setupGenres(_ array: [GenreModel]) -> String {
        var genres: String = ""
        
        let n = array.count
        if n > 1 {
            for i in 0..<n {
                if i == n - 1 {
                    genres += "\(array[i].name)"
                } else {
                    genres += "\(array[i].name), "
                }
            }
        } else {
            genres = array[0].name
        }
        
        return genres
    }
    
    func setupPlatforms(_ array: [PlatformsModel]) -> String {
        var platforms: String = ""
        
        let n = array.count
        if n > 1 {
            for i in 0..<n {
                if i == n - 1{
                    platforms += "\(array[i].platform.name)"
                } else {
                    platforms += "\(array[i].platform.name), "
                }
            }
        } else {
            platforms = array[0].platform.name
        }
        
        return platforms
    }
    
    func setupTags(_ array: [TagModel]) -> String {
        var tags: String = ""
        
        let n = array.count
        if n > 1 {
            for i in 0..<n {
                if i == n - 1{
                    tags += "\(array[i].name)"
                } else {
                    tags += "\(array[i].name), "
                }
            }
        } else {
            tags = array[0].name
        }
        
        return tags
    }
    
}

extension GameInfoViewController {
    static func instantiate(game: GameModel) -> GameInfoViewController {
        guard let vc = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "GameInfoViewController") as? GameInfoViewController else {
            fatalError("Unexpectedly failed getting EventDetailViewController from Storyboard")
        }
        
        vc.game = game
        
        return vc
    }
}
