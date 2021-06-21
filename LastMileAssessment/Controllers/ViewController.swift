

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak private var mainTableView: UITableView!
    @IBOutlet weak private var searchBar: UISearchBar!
    
    var moviesViewModels = [MoviesViewModel]()
    var genresViewModels = [GenresViewModel]()

    var isSearching = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        mainTableView.tableFooterView = UIView(frame: CGRect.zero)
        getAllTheMovies()
        getAllTheGenres()
    }
    
    private func getAllTheMovies() {
        Services.shared.getAllTheMovies(urlString: "\(Constants.API.MOVIES_URL)\(Constants.Keys.API_KEY)") { (result) in
            switch result {
            case .success(let moviesViewModel):
                if let moviesViewModel = moviesViewModel {
                    self.moviesViewModels = moviesViewModel
                    print(moviesViewModel)
                    DispatchQueue.main.async {
                        self.mainTableView.reloadData()
                    }
                }
            case .failure(let error):
                print(error)
            }
        }
    }
    
    private func getAllTheGenres() {
        Services.shared.getAllTheGenres(urlString: "\(Constants.API.GENRES_URL)\(Constants.Keys.API_KEY)") { (result) in
            switch result {
            case .success(let genresViewModels):
                if let genresViewModels = genresViewModels {
                    self.genresViewModels = genresViewModels
                    print(genresViewModels)
                }
            case .failure(let error):
                print(error)
            }
        }
    }
}

extension ViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
       return 20
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if moviesViewModels.count == 0 {
            return UITableViewCell()
        } else {
            let movieCell = tableView.dequeueReusableCell(withIdentifier: Constants.TableCells.movieCell) as! MoviesCell
            movieCell.moviesViewModel = moviesViewModels[indexPath.row]
            movieCell.lblGenre.text = getGenreName(genreId: moviesViewModels[indexPath.row].genre_ids![0])
            movieCell.setNeedsLayout()
            return movieCell
        }
    }
    
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 150
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let cell = tableView.cellForRow(at: indexPath) as? MoviesCell
        let movieDetailsController = UIStoryboard.init(name: "Main", bundle: nil).instantiateViewController(identifier: "MovieDetailsController") as? MovieDetailsController
        movieDetailsController?.movieModel = moviesViewModels[indexPath.row]
        movieDetailsController?.genre = getGenreName(genreId: moviesViewModels[indexPath.row].genre_ids![0])
        movieDetailsController?.movieImage = cell?.imgPoster.image
        self.navigationController?.pushViewController(movieDetailsController!, animated: true)
    }
    
    func getGenreName(genreId: Int) -> String {
        if let genre = genresViewModels.first(where: { $0.id == genreId }) {
            return "Genre: \(genre.name)"
        }
        return ""
    }
}

