//
//  ViewController.swift
//  Task1
//
//  Created by Michael Zanaty on 5/5/23.
//
//use api to pull info and display on screen
//separate funcs from View Controller
//sunday may 7

import UIKit

class QuestionVC: UITableViewController {
    
    @IBOutlet weak var QuestionTableView: UITableView!
    var questions: [Question] = []
    var indexPathRow = 0

    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        getQuestions { questions in
            self.questions = questions
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
        }
    }
    
    // MARK: - Table view data source
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
            if segue.identifier == "showAnswerSegue" {
                let answerVC = segue.destination as! AnswerVC
                if let indexPath = tableView.indexPathForSelectedRow {
                    let question = questions[indexPath.row]
                    answerVC.Answer = question.correctAnswer
                }
            }
        }
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return questions.count+1
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "questionCell", for: indexPath) as! QuestionTableViewCell
        let question = questions[indexPathRow]
        cell.configure(with: question)
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
            performSegue(withIdentifier: "showAnswerSegue", sender: self)
        }
//    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//        let question = questions[indexPath.row]
//        let correctAnswer = question.correctAnswer
//        performSegue(withIdentifier: "showAnswer", sender: correctAnswer)
//    }
}


    
    
    

    

   



