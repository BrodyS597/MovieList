//
//  MovieDetailViewController.swift
//  MovieList
//
//  Created by Brody Sears on 1/19/22.
//

import UIKit

class MovieDetailViewController: UIViewController {
    
    // MARK: - IBOutlets
    @IBOutlet weak var runTimeTextField: UITextField!
    @IBOutlet weak var MovieNameTextField: UITextField!
    @IBOutlet weak var leadActorTextField: UITextField!
    
    // MARK: - Properties
    var movie: Movie? = nil
    
    // MARK: - LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        guard let movie = movie else { return }
        updateUI(movie)
    }
    
    // MARK: - Helper Functions
    func updateUI(_ movie: Movie) {
        MovieNameTextField.text = movie.title
        runTimeTextField.text = "\(movie.runTime)"
        leadActorTextField.text = movie.leadActor
    }
    
    // MARK: - IBAction
    @IBAction func saveBtnPressed(_ sender: Any) {
        // unwrapping potential movie properties deom out text fields
        guard let movieName = MovieNameTextField.text,
              !movieName.isEmpty,
              let runTimeString = runTimeTextField.text,
              let runTime = Int(runTimeString),
              let leadActor = leadActorTextField.text,
              !leadActor.isEmpty
        else { return }
        /// if we have a movie, then we are going to update it using the `MovieControllers`
        ///  if we do not have a movie (movie is nil) then we are going to create a new movie using `MovieControllers` create function
        if let movie = movie {
            // calling update function
            MovieController.shared.update(movie, withTitle: movieName, runTime: runTime, leadActor: leadActor)
        } else {
            // calling create funciton
            MovieController.shared.createMovie(title: movieName, runTime: runTime, leadActor: leadActor)
        }
        // popping our view controller off the view stack, dropping it out of memory and our view
        self.navigationController?.popViewController(animated: true)
    }
    
    @IBAction func clearBtnPressed(_ sender: Any) {
        MovieNameTextField.text = ""
        runTimeTextField.text = ""
        leadActorTextField.text = ""
    }
    
    @IBAction func deleteBtnPressed(_ sender: Any) {
        /// This guard statment will unwrap our optional `movie` into a non optional `movie`. If this unwrapping fails, we will return from the function, if it passes, we will delete this movie.
        if let movie = movie {
            MovieController.shared.delete(movie)
        }
        self.navigationController?.popViewController(animated: true)
    }
}
