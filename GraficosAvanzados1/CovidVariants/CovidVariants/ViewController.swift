//
//  ViewController.swift
//  CovidVariants
//
//  Created by Alumno on 1/21/22.
//  Copyright © 2022 Alumno. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return variants.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let celda = tableView.dequeueReusableCell(withIdentifier: "variants") as! CeldaVariantsController
        celda.lblLineage.text = variants[indexPath.row].lineage
        celda.lblDate.text = variants[indexPath.row].earliest_date
        celda.lblDessignated.text = variants[indexPath.row].designated_number
        celda.lblAssigned.text = variants[indexPath.row].assigned_number
        celda.lblName.text = variants[indexPath.row].who_name
        
        return celda
        
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    
    @IBOutlet weak var tvVariants: UITableView!
    var variants : [Variants] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        inicializarVariantes()
    }
    
    func inicializarVariantes(){
        
        
        let url = URL(string: "http://172.31.13.19:8000/api/variantes")!
        var solicitud = URLRequest(url: url)
        solicitud.httpMethod = "GET"
        solicitud.allHTTPHeaderFields = [
            "Accept" : "application/json"
        ]
        
        let task = URLSession.shared.dataTask(with: solicitud){
            data, request, error in
            if let data = data {
                if let variants_data = try? JSONDecoder().decode([Variants].self, from: data){
                    DispatchQueue.main.async {
                        self.variants = variants_data
                        self.tvVariants.reloadData()
                    }
                    
                }else{
                    print("no se pudo interpretar respuesta")
                }
                
            } else if let error = error {
                print(error.localizedDescription)
            }
            
        }
        task.resume()
    }

}

