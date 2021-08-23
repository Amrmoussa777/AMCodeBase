//
//  File.swift
//  
//
//  Created by Amr Moussa on 23/08/2021.
//
import UIKit

open class AMQuestionView <cellType:AMCollectionViewCell,Item:Codable>: UIView,
        UICollectionViewDelegate, UICollectionViewDataSource ,UICollectionViewDelegateFlowLayout{
    let quetionLabel = AMItemLable(textAlignment: .center, NoOfLines: 0, size: 25)
    var answersCV : UICollectionView!
    let layout  = UICollectionViewFlowLayout()
    let nextButton = AMButton(text: "Next", bGColor: .systemGreen, iconImage: Images.nextButton)
    
    open var currentQuestion:Int = 0
    open var questions:[Question] = []
    open var answers:[Answer] = []
    
    public var selectedAnswerID:Int?
    public var correctAnswer:Int?
    
    override public init(frame: CGRect) {
        super.init(frame: frame)
        configureCV()
        configureLyout()
    }
    
    required public init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    private func configureCV(){
        answersCV = UICollectionView(frame: bounds, collectionViewLayout: layout)
        answersCV.register(cellType.self, forCellWithReuseIdentifier:cellType.cellID)
        answersCV.delegate = self
        answersCV.dataSource = self
        answersCV.translatesAutoresizingMaskIntoConstraints = false
        answersCV.backgroundColor = .systemBackground
    }
    
    open func configureLyout(){
        addSubViews(quetionLabel,answersCV,nextButton)
        let padding:CGFloat = 10
        NSLayoutConstraint.activate([
            quetionLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: padding),
            quetionLabel.topAnchor.constraint(equalTo: topAnchor, constant: padding),
            quetionLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -padding),
//            quetionLabel.heightAnchor.constraint(equalToConstant: 150),
            
            nextButton.leadingAnchor.constraint(equalTo: leadingAnchor, constant: padding),
            nextButton.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -padding),
            nextButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -padding),
            nextButton.heightAnchor.constraint(equalToConstant: 50),
            
            answersCV.leadingAnchor.constraint(equalTo: leadingAnchor, constant: padding),
            answersCV.topAnchor.constraint(equalTo: quetionLabel.bottomAnchor, constant: padding),
            answersCV.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -padding),
            answersCV.bottomAnchor.constraint(equalTo: nextButton.topAnchor,constant: -padding),
        ])
        translatesAutoresizingMaskIntoConstraints = false
        nextButton.addTarget(self, action: #selector(nextTapped), for: .touchUpInside)
        quetionLabel.configureAsProfileHeadline()
    }
    
    
    open func setQuestions(questions:[Question]){
        self.questions = questions
        self.loadNextQuestion()
    }
    
    
    open  func loadNextQuestion(){
        if currentQuestion == questions.count - 1 {
            nextButton.setTitle("submit", for: .normal)
            nextButton.backgroundColor = .systemBlue
        }
        quetionLabel.setText(text: questions[currentQuestion].question)
        correctAnswer = questions[currentQuestion].correctAnswer
        #warning("get answers haere ")
        
        answersCV.reloadData()
    }
    
  
    
    open func getSelected()->Int?{
        return selectedAnswerID
    }
    
    open func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return answers.count
    }
    
    open func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = answersCV.dequeueReusableCell(withReuseIdentifier: cellType.cellID, for: indexPath) as! AMAnswerCell
        cell.updateItem(item: answers[indexPath.row])
        return cell
    }
    
    open func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        guard let  cell = collectionView.cellForItem(at: indexPath) as? AMAnswerCell else{return}
        selectedAnswerID = indexPath.row
        cell.selectedState()
        let cells  = collectionView.visibleCells as? [AMAnswerCell]
        cells?.forEach({ cell in
            guard cell.indexPath != indexPath else{return}
            cell.selectedNotState()
        })
    }
    
    
    open func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    
    open func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    
    open func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
    }
    
    
    open func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: answersCV.frame.size.width, height: 100)
    }
    
    @objc open func nextTapped(){
        guard let selectdID = selectedAnswerID else {
            showAlertView( Message: "Please choose  proper answer  ", buttonLabel: "Okey", actionButtonColor: .systemBlue)
            return}
        selectdID == correctAnswer ? getNewQuestion():showWrongAnswer()
         
    }
    
    open func showWrongAnswer(){
        showAlertView( Message: "Wrong Answer ", buttonLabel: "Okey", actionButtonColor: .systemBlue)
    }
    
    open func getNewQuestion(){
        guard (currentQuestion < questions.count - 1) else {
            showAlertView( Message:  "Last Question End of Exam ", buttonLabel: "Okey", actionButtonColor: .systemBlue)
            return
        }
       currentQuestion += 1
        loadNextQuestion()
    }
    
}





open class AMAnswerCell:AMCollectionViewCell{
    public static var cellID: String = "AnswersCell"
    
//    public let radioBox = AMPLayButton(text: "", bGColor: .systemBackground, iconImage: nil)
    public let answerLabel = AMOptionLabel(textAlignment: .left, NoOfLines: 0, size: 15)
    
    public override init(frame: CGRect) {
        super.init(frame: frame)
        configureLayout()
    }
    
    required public init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    open func configureLayout(){
        addSubViews(answerLabel)
        let padding:CGFloat = 10
        NSLayoutConstraint.activate([
            answerLabel.leadingAnchor.constraint(equalTo: leadingAnchor,constant: padding),
            answerLabel.topAnchor.constraint(equalTo: topAnchor, constant: padding),
            answerLabel.trailingAnchor.constraint(equalTo: trailingAnchor,constant: -padding),
            answerLabel.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -padding),
        ])
        answerLabel.RoundCorners()
        answerLabel.AddStroke(color: .systemGray6)
        
    }

    
    
    open func selectedState(){
        answerLabel.AddStroke(color: .systemGreen)
        answerLabel.backgroundColor = .systemGreen
        answerLabel.textColor = .white
    }
    
    open func selectedNotState(){
        answerLabel.AddStroke(color: .systemGray6)
        answerLabel.backgroundColor = .systemBackground
        answerLabel.textColor =  .secondaryLabel

    }
    
    
    open func updateItem(item: Codable) {
        guard let answer  = item as? Answer else {
            return
        }
        answerLabel.setText(text: answer.Answer)
        selectedNotState()
    }
    

}




public enum ExamStatus{
    case Active
    case Taken
}

public struct Question:Codable{
    public let id:String
    public let question:String
    public let correctAnswer:Int
    
    public init(id:String, question:String,correctAnswer:Int){
        self.id = id
        self.question = question
        self.correctAnswer = correctAnswer
        
    }
    
}

public struct Answer:Codable{
    public let id :String
    public let Answer:String
    
    public init(id:String,Answer:String){
        self.id = id
        self.Answer = Answer
 
    }
}
