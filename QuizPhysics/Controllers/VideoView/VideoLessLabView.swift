
import UIKit
import PDFKit

class VideoLessLabView: UIViewController {
    
    var indexP: Int = 0
    var mainTitle: String = ""
    var des: String = ""
    var videoID: String = ""

    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
        title = mainTitle
        
        let pdfView = PDFView()
        
        pdfView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(pdfView)

        pdfView.leadingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.leadingAnchor, constant: 0).isActive = true
        pdfView.trailingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.trailingAnchor, constant: 0).isActive = true
        pdfView.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor, constant: 0).isActive = true
        pdfView.bottomAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.bottomAnchor, constant: 0).isActive = true
        
        if videoID == "tQpjz9x-o0Y" {
            guard let path = Bundle.main.url(forResource: "Лабораторная работа к приложению", withExtension: "pdf") else { return }
            
            if let doc = PDFDocument(url: path){
                pdfView.document = doc
            }
        } else if videoID == "u0ZCr0JT8EM" {
            guard let path = Bundle.main.url(forResource: "лабораторная работа к Закона Архимеда-cropped", withExtension: "pdf") else { return }
            
            if let doc = PDFDocument(url: path){
                pdfView.document = doc
            }
        }
    }
}
