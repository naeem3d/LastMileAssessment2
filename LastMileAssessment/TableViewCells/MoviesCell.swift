//
//  MoviesCell.swift
//  LastMileAssessment
//
//  Created by naeem alabboodi  on 11/04/21.
//

import UIKit

class MoviesCell: UITableViewCell {

    @IBOutlet weak private var lblTitle: UILabel!
    @IBOutlet weak var lblGenre: UILabel!
    @IBOutlet weak private var lblPopularity: UILabel!
    @IBOutlet weak  var lblReleaseDate: UILabel!

    @IBOutlet weak  var imgPoster: UIImageView!
    
    let imageCache = NSCache<NSString, UIImage>()
    
    var moviesViewModel: MoviesViewModel? {
        didSet {
            lblTitle.text = moviesViewModel?.title
            if let popularity = moviesViewModel?.popularity, let releaseDate = moviesViewModel?.release_date {
                lblPopularity.text = "Popularity: \(popularity)"
                lblReleaseDate.text = "Release Date: \(releaseDate)"
            }
            if let posterPath = moviesViewModel?.poster_path {
                loadImageView(avatarUrl: "\(Constants.API.IMAGE_URL)\(posterPath)", userName: moviesViewModel!.title!)
            }
        }
    }
    
   
    
    private func loadImageView(avatarUrl: String, userName: String) {
        DispatchQueue.global().async {
            if let cachedImage = self.imageCache.object(forKey: userName as NSString) {
                DispatchQueue.main.async {
                    self.imgPoster.image = cachedImage
                }
            } else {
                guard let url = URL(string: avatarUrl) else { return }
                if let data = try? Data(contentsOf: url) {
                    if let image = UIImage(data: data) {
                        DispatchQueue.main.async {
                            self.imageCache.setObject(image, forKey: userName as NSString)
                            self.imgPoster.image = image
                        }
                    }
                }
            }
        }
    }

}
