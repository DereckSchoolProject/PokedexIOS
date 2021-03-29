//
//  PokemonViewController.swift
//  MacDoPokeApi
//
//  Created by Service Informatique on 22/03/2021.
//  Copyright © 2021 MDS. All rights reserved.
//

import Foundation
import UIKit
import Alamofire
import SwiftyJSON
import Kingfisher

class PokemonViewController: UIViewController {

    var pokemon: Pokemon?

    @IBOutlet weak var front: UIImageView!
    @IBOutlet weak var frontShiny: UIImageView!
    @IBOutlet weak var back: UIImageView!
    @IBOutlet weak var backShiny: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        navigationItem.title = pokemon?.name
        
        AF.request(pokemon!.detailUrl).responseJSON {(respons) in
            let json = try? JSON(data: respons.data!)
            
            let urlFront = json!["sprites"]["front_default"].string!
            let urlFrontShiny = json!["sprites"]["front_shiny"].string!
            let urlBack = json!["sprites"]["back_default"].string!
            let urlBackShiny = json!["sprites"]["back_shiny"].string!

            self.front.kf.setImage(with: URL(string: urlFront))
            self.frontShiny.kf.setImage(with: URL(string: urlFrontShiny))
            self.back.kf.setImage(with: URL(string: urlBack))
            self.backShiny.kf.setImage(with: URL(string: urlBackShiny))
        }
    }
}
