
import UIKit
import WebKit

class VideoScientistViewController: UIViewController {
    
    lazy var scrollView: UIScrollView = {
        let scrollV = UIScrollView()
        scrollV.backgroundColor = .white
        return scrollV
    }()
    
    lazy var containerView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .white
        return view
    }()
    
    lazy var imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    lazy var shortDossier: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .black
        label.font = UIFont(name: "Apple SD Gothic Neo", size: 20)
        label.textAlignment = .center
        label.numberOfLines = 0
        label.backgroundColor = .white
        return label
    }()
    
    lazy var webPlayer: WKWebView = {
        let webPlayer = WKWebView()
        webPlayer.translatesAutoresizingMaskIntoConstraints = false
        return webPlayer
    }()
    
    lazy var fullDossier: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .black
        label.font = UIFont(name: "Apple SD Gothic Neo", size: 20)
        label.textAlignment = .center
        label.numberOfLines = 0
        label.backgroundColor = .white
        return label
    }()
    
    var videoID: String = ""

    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .white
        title = ""
        
        setContsraints()
        
        getVideo(videoCode: videoID)
        
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        scrollView.frame = view.bounds
    }
    
    func getVideo(videoCode: String) {
        let url = URL(string: "https://www.youtube.com/embed/\(videoCode)")
        webPlayer.load(URLRequest(url: url!))
    }
    
}

extension VideoScientistViewController {
    
    func setContsraints() {
        
        view.addSubview(scrollView)
        
        scrollView.addSubview(containerView)
        NSLayoutConstraint.activate([
            containerView.topAnchor.constraint(equalTo: scrollView.topAnchor, constant: 0),
            containerView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor, constant: 0),
            containerView.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor, constant: 0),
            containerView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor, constant: 0),
            containerView.widthAnchor.constraint(equalToConstant: self.view.safeAreaLayoutGuide.layoutFrame.width)
        ])
        
        containerView.addSubview(imageView)
        NSLayoutConstraint.activate([
            imageView.topAnchor.constraint(equalTo: containerView.topAnchor, constant: 10),
            imageView.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 10),
            imageView.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -10),
            imageView.heightAnchor.constraint(equalToConstant: self.view.frame.width/2 + 100)
        ])
        
        containerView.addSubview(shortDossier)
        NSLayoutConstraint.activate([
            shortDossier.topAnchor.constraint(equalTo: imageView.bottomAnchor, constant: 20),
            shortDossier.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 10),
            shortDossier.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -10),
            shortDossier.heightAnchor.constraint(equalToConstant: 50)
        ])
        
        containerView.addSubview(webPlayer)
        NSLayoutConstraint.activate([
            webPlayer.topAnchor.constraint(equalTo: shortDossier.bottomAnchor, constant: 20),
            webPlayer.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 0),
            webPlayer.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: 0),
            webPlayer.heightAnchor.constraint(equalToConstant: self.view.frame.width/2 + 100)
            
        ])
        
        containerView.addSubview(fullDossier)
        NSLayoutConstraint.activate([
            fullDossier.topAnchor.constraint(equalTo: webPlayer.bottomAnchor, constant: 20),
            fullDossier.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 10),
            fullDossier.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -10),
            fullDossier.bottomAnchor.constraint(equalTo: containerView.bottomAnchor, constant: -10)
            
        ])
    }
}
