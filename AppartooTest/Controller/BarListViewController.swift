//
//  ViewController.swift
//  AppartooTest
//
//  Created by Vigneswaranathan Sugeethkumar on 12/03/2019.
//  Copyright © 2019 Vigneswaranathan Sugeethkumar. All rights reserved.
//

import UIKit

class BarListViewController: UIViewController {
    @IBOutlet weak var tableView: UITableView!
    
    var images: [UIImage] = [UIImage(named: "bar1")!,
                             UIImage(named: "bar2")!,
                             UIImage(named: "bar3")!,
                             UIImage(named: "bar4")!,
                             UIImage(named: "bar5")!]
    
    @IBOutlet weak var test: UILabel!
    
     let data = ParseJson.getDataFromJson(data: ParseJson.jsonData!)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.title = "Bar"
        navigationController?.navigationBar.prefersLargeTitles = true
        
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let cell = sender as? UITableViewCell {
            let indexPath = self.tableView.indexPath(for: cell)!
            
            let barVC = segue.destination as! BarViewController
            barVC.bar = data!.bars[indexPath.row]
        }
    }
}

extension BarListViewController: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return images.count
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let image = images[indexPath.row]
        let cell = tableView.dequeueReusableCell(withIdentifier: "BarCell") as! BarCell
        cell.setImageBar(image: image,name: data!.bars[indexPath.row]!.name,tags: data!.bars[indexPath.row]!.address)
        
        return cell
    }
    
    /*func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let barVC = BarViewController()
        barVC.bar = data!.bars[indexPath.row]
        
        self.navigationController?.prepare(for: UIStoryboardSegue(identifier: "cellToBarView", source: self, destination: barVC), sender: nil)
        
    }*/
    
    
    
    
    
}
