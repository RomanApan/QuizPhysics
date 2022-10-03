
import UIKit
import PDFKit

class AbstractViewController: UIViewController {
    
    var indexP: Int = 0
    var mainTitle: String = ""
    var namePDF: String = ""

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
        
        guard let path = Bundle.main.url(forResource: namePDF, withExtension: "pdf") else { return }
        
        if let doc = PDFDocument(url: path){
            pdfView.document = doc
        }
    }
}
