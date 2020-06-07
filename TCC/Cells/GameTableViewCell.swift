//
//  GameTableViewCell.swift
//  TCC
//
//  Created by Walter Oliveira on 06/06/20.
//  Copyright © 2020 Walter Oliveira. All rights reserved.
//

import UIKit

protocol GameTableViewCellDelegate: class {
    func gameTableViewCellDidLoad(game: GameModel, image: UIImage)
}

class GameTableViewCell: UITableViewCell {
    
    @IBOutlet weak var backgroundImage: UIImageView?
    @IBOutlet weak var titleLabel: UILabel?
    @IBOutlet weak var releaseLabel: UILabel?
    @IBOutlet weak var ratingLabel: UILabel?
    
    weak var delegate: GameTableViewCellDelegate?

    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }

    override func prepareForReuse() {
        backgroundImage?.image = nil
        titleLabel?.text = nil
        releaseLabel?.text = nil
        ratingLabel?.text = nil
    }
    
    func load(_ game: GameModel) {
        if game.image == nil {
            backgroundImage?.load(url: game.imageURL) { image in
                self.delegate?.gameTableViewCellDidLoad(game: game, image: image)
            }
        } else {
            backgroundImage?.image = game.image
        }
        
        titleLabel?.text = game.name
        let dataLancamento = game.released.formattedDateFromString(dateString: game.released, withFormat: "dd/MM/yyyy")
        releaseLabel?.text = "Launch Date: \(dataLancamento!)"
        ratingLabel?.text = "Rating: \(game.rating)/5"
        
    }
}
