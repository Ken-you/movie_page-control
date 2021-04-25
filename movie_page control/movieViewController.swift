//
//  movieViewController.swift
//  movie_page control
//
//  Created by yousun on 2021/4/25.
//

import UIKit

// 圖片、名稱先用 array 設定，之後都用 movieIndex 抓取位置。
let movies = ["black-widow","demonslayer","fast9","minions","wonderwoman1984",]
let movieNames = ["黑寡婦","鬼滅之刃","玩命關頭9","小小兵","神力女超人1984",]

var movieIndex = 0

class movieViewController: UIViewController {

    @IBOutlet weak var movieSegment: UISegmentedControl!
    @IBOutlet weak var movieImageView: UIImageView!
    @IBOutlet weak var movieNameLabel: UILabel!
    @IBOutlet weak var moviePageDot: UIPageControl!
    
    
    // 之後都用這個 function 去改變圖片、名稱
    func movieSelect() {
            
            // 可讓頭、尾圖片相接
            if movieIndex == 5 {
                movieIndex = 0
            }else if movieIndex == -1{
                movieIndex = 4
            }
            
            movieImageView.image = UIImage(named: movies[movieIndex])
            movieNameLabel.text = movieNames[movieIndex]
            moviePageDot.currentPage = movieIndex
            movieSegment.selectedSegmentIndex = movieIndex
        }
        
        
    override func viewDidLoad() {
        super.viewDidLoad()
    
        movieSelect()
    }
    
    // segment 抓目前的位置
    @IBAction func changeSegment(_ sender: UISegmentedControl) {
        
        movieIndex = sender.selectedSegmentIndex
        movieSelect()
    }
    
    // page control 抓目前的位置
    @IBAction func changePageDot(_ sender: UIPageControl) {
        
        movieIndex = sender.currentPage
        movieSelect()
    }
    
    
    // 兩個 swipe 拉到同一個 IBAction
    @IBAction func swipeChange(_ sender: UISwipeGestureRecognizer) {
        
        if sender.direction == .left{
            
            movieIndex += 1
            movieSelect()
            
        }else if sender.direction == .right{
            
            movieIndex -= 1
            movieSelect()
        }
    }
    
    
    // Botton 上一頁、下一頁
    @IBAction func previousBtn(_ sender: Any) {
        
        movieIndex -= 1
        movieSelect()
    }
    
    @IBAction func nextBtn(_ sender: Any) {
        
        movieIndex += 1
        movieSelect()
    }
    
}
