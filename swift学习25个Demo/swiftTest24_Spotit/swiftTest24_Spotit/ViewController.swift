//
//  ViewController.swift
//  swiftTest24_Spotit
//
//  Created by 李俊成 on 2018/5/21.
//  Copyright © 2018年 李俊成. All rights reserved.
//

import UIKit
import CoreSpotlight
import MobileCoreServices
class ViewController: UIViewController ,UITableViewDelegate,UITableViewDataSource,UISearchBarDelegate {
    
    var tabMovies = UITableView()
    var searchBar = UISearchBar()
    
    var moviesInfo : NSMutableArray!
    var selctedMovieIndex : Int!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpUI()
        loadMoviesInfo()
        configureTableView()
        navigationItem.title = "Movies"
        setupSearchableContent()
    
    }
    func setUpUI() {
        searchBar.frame = CGRect(x: 0, y: 64, width: 300, height: 36)
        searchBar.backgroundColor = UIColor.gray
        searchBar.delegate = self
        searchBar.showsCancelButton = true
        searchBar.showsSearchResultsButton = true
        searchBar.showsBookmarkButton = true
        view.addSubview(searchBar)
        tabMovies.frame = CGRect(x: 0, y: 100, width: 300, height: view.bounds.height - 100)
        view.addSubview(tabMovies)
        
    }
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        print("----\(searchText)")
    }
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        print("CancelButtonClicked")
    }
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        print("SearchButtonClicked")
    }
    func loadMoviesInfo() {
        if let path = Bundle.main.path(forResource: "MoviesData", ofType: "plist")
        {
            moviesInfo = NSMutableArray(contentsOfFile: path)
        }
    }
    func setupSearchableContent() {
        var searchableItems = [CSSearchableItem]()
        for i in 0...(moviesInfo.count - 1) {
            let movie = moviesInfo[i] as! [String:String]
            let searchableItemAttributeSet = CSSearchableItemAttributeSet(itemContentType: kUTTypeText as String)
            searchableItemAttributeSet.title = movie["Title"]
            let imagePathParts = movie["Image"]?.components(separatedBy: ".")
            searchableItemAttributeSet.thumbnailURL = Bundle.main.url(forResource: imagePathParts?[0], withExtension: imagePathParts?[1])
            searchableItemAttributeSet.contentDescription = movie["Description"]!
            var keywords = [String]()
            let movieCategories = movie["Category"]?.components(separatedBy: ", ")
            for movieCategory in movieCategories! {
                keywords.append(movieCategory)
            }
            let stars = movie["Stars"]?.components(separatedBy: ", ")
            for star in stars! {
                keywords.append(star)
            }
            searchableItemAttributeSet.keywords = keywords
            let searchableItem = CSSearchableItem(uniqueIdentifier: "com.appcoda.SpotIt.\(i)", domainIdentifier: "movies", attributeSet: searchableItemAttributeSet)
            searchableItems.append(searchableItem)
            CSSearchableIndex.default().indexSearchableItems(searchableItems) { (error) -> Void in
                if error != nil {
                    print(error?.localizedDescription ?? "error.deful")
                }
            }
        }
    }
    
    override func restoreUserActivityState(_ activity: NSUserActivity) {
        if activity.activityType == CSSearchableItemActionType {
            if let userInfo = activity.userInfo {
                let selectedMovie = userInfo[CSSearchableItemActivityIdentifier] as! String
                selctedMovieIndex = Int(selectedMovie.components(separatedBy: ".").last!)
                performSegue(withIdentifier: "idSegueSHowMoviewDetails", sender: self)
                
            }
        }
    }
    func configureTableView() {
        tabMovies.delegate = self
        tabMovies.dataSource = self
        tabMovies.tableFooterView = UIView(frame: CGRect.zero)
        tabMovies.register(MovieTableViewCell.self, forCellReuseIdentifier: "cell")
    }
    // MARK: UItableView Functions
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if moviesInfo != nil {
            return moviesInfo.count
        }
        return 0
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! MovieTableViewCell
        let currentMovieInfo = moviesInfo[(indexPath as NSIndexPath).row] as! [String : String]
        cell.lblTitle.text = currentMovieInfo["Title"]!
         cell.lblDescription.text = currentMovieInfo["Description"]!
         cell.lblRating.text = currentMovieInfo["Rating"]!
         cell.imageMovieImage.image = UIImage(named: currentMovieInfo["Image"]!)
        return cell
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100.0
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        selctedMovieIndex = (indexPath as NSIndexPath).row
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}























































