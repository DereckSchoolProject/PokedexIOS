//
//  ViewController.swift
//  MacDoPokeApi
//
//  Created by Service Informatique on 22/03/2021.
//  Copyright © 2021 MDS. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    var pokedexList: [Pokemon] = []
    @IBOutlet weak var pokedex: UITableView!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        pokedex.delegate = self
        pokedex.dataSource = self
        AF.request("https://pokeapi.co/api/v2/pokemon?offset=0&limit=2000").responseJSON {(respons) in
                let json = try? JSON(data: respons.data!)
            
                for rowJSON in (json?["results"])! {
                    let row = rowJSON.1
                    self.pokedexList.append(Pokemon(name: row["name"].string!, detailUrl: row["url"].string!))
            }

            self.pokedex.reloadData()
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        pokedexList.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell")
        cell?.textLabel?.text = "\(pokedexList[indexPath.row].name)"

        return cell!
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let storyboard = UIStoryboard(name: "Main",bundle: nil)
        let vc: PokemonViewController = storyboard.instantiateViewController(identifier: "PokemonViewController") as! PokemonViewController
        vc.pokemon = pokedexList[indexPath.row]
        navigationController?.pushViewController(vc, animated: true)
    }
}
