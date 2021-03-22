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
    @IBOutlet weak var img: UIImageView!
    @IBOutlet weak var imgBack: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        navigationItem.title = pokemon?.name
        
        AF.request(pokemon!.detailUrl).responseJSON {(respons) in
            let json = try? JSON(data: respons.data!)
            
            let urlFront = json!["sprites"]["front_default"].string!
            let urlFrontShiny = json!["sprites"]["front_shiny"].string!

            self.img.kf.setImage(with: URL(string: urlFront))
            self.imgBack.kf.setImage(with: URL(string: urlFrontShiny))
        }
    }
}
