//
//  ViewController.swift
//  ImageListView
//
//  Created by lieon on 2019/6/17.
//  Copyright © 2019 lieon. All rights reserved.
//

import UIKit
import ImageListView
import Kingfisher

class ViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    fileprivate var dataList: [[URL]] = []
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let urlStrs: [String] =
            [
                "https://thoughtworks-mobile-2018.herokuapp.com/images/tweets/008.jpeg",
                "https://thoughtworks-mobile-2018.herokuapp.com/images/tweets/009.jpeg",
                "https://thoughtworks-mobile-2018.herokuapp.com/images/tweets/010.jpeg",
                "https://thoughtworks-mobile-2018.herokuapp.com/images/tweets/014.jpeg",
                "https://thoughtworks-mobile-2018.herokuapp.com/images/tweets/015.jpeg",
                "https://thoughtworks-mobile-2018.herokuapp.com/images/tweets/016.jpeg",
                "https://thoughtworks-mobile-2018.herokuapp.com/images/tweets/016.jpeg",
                "https://thoughtworks-mobile-2018.herokuapp.com/images/tweets/017.jpeg",
                "https://thoughtworks-mobile-2018.herokuapp.com/images/tweets/008.jpeg",
                "https://thoughtworks-mobile-2018.herokuapp.com/images/tweets/003.jpeg",
                "https://thoughtworks-mobile-2018.herokuapp.com/images/tweets/020.jpeg",
                "https://thoughtworks-mobile-2018.herokuapp.com/images/tweets/021.jpeg",
                "https://thoughtworks-mobile-2018.herokuapp.com/images/tweets/001.jpeg",
                "https://thoughtworks-mobile-2018.herokuapp.com/images/tweets/002.jpeg",
                "https://thoughtworks-mobile-2018.herokuapp.com/images/tweets/003.jpeg"
        ]
        dataList = (0 ..< 9).map { urlStrs[0 ... $0].map { URL(string: $0)!} }
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(UINib(nibName: "ImageListTableViewCell", bundle: nil), forCellReuseIdentifier: "ImageListTableViewCell")
    }


}

extension ViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "ImageListTableViewCell", for: indexPath)  as? ImageListTableViewCell else {
            return UITableViewCell()
        }
        let urls = dataList[indexPath.row]
        cell.imageListView.config(urls.count, fetchImageHandler: { imageView, index in
            imageView?.kf.setImage(with: urls[index])
        })
        cell.selectionStyle = .none
        cell.label.text = "Swift New Balance:\(indexPath.row)"
        return cell
    }
}

extension ViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        let urls = dataList[indexPath.row]
        let topInset: CGFloat = 50
        let bottomInset: CGFloat = 5
        return ImageListView.caculateHeight(urls) + topInset + bottomInset
    }
}

