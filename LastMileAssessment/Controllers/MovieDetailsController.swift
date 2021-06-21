//
//  MovieDetailsController.swift
//  LastMileAssessment
//
//  Created by naeem alabboodi on 20/06/21.
//

import UIKit

class MovieDetailsController: UIViewController {

    @IBOutlet weak private var lblTitle: UILabel!
    @IBOutlet weak private var lblGenre: UILabel!
    @IBOutlet weak private var lblPopularity: UILabel!
    @IBOutlet weak private var lblReleaseDate: UILabel!
    @IBOutlet weak private var lblOverView: UILabel!
    @IBOutlet weak private var imgMovie: UIImageView!

    var movieModel: MoviesViewModel!
    var genre: String?
    var movieImage: UIImage?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateFields()
        // Do any additional setup after loading the view.
    }
    
    func updateFields() {
        self.lblTitle.text = movieModel.title
        self.lblOverView.text = movieModel.overview
        self.lblGenre.text = genre
        if let popularity = movieModel.popularity, let releaseDate = movieModel.release_date {
            self.lblPopularity.text = "Popularity: \(popularity)"
            lblReleaseDate.text = "Release Date: \(releaseDate)"
        }
        self.lblReleaseDate.text = movieModel.release_date
        self.imgMovie.image = movieImage
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
