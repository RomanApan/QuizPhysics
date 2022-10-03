
import UIKit
import WebKit
import SafariServices

class VideoLessViewController: UIViewController, SFSafariViewControllerDelegate {
    
    let url = "https://forms.gle/HPBPy6pcfy8rvPuGA"
    
    var videoID: String = ""
    
    var nameOfLess: String = ""
    
    var webPlayer: WKWebView = {
        let webPlayer = WKWebView()
        webPlayer.translatesAutoresizingMaskIntoConstraints = false
        return webPlayer
    }()
    
    lazy var buttonTask: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.layer.cornerRadius = 15
        button.backgroundColor = .black
        button.setTitle("Задачи", for: .normal)
        button.setTitleColor(UIColor.white, for: .normal)
        return button
    }()
    
    lazy var buttonLab: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.layer.cornerRadius = 15
        button.backgroundColor = .black
        button.setTitle("Лабораторная работа", for: .normal)
        button.setTitleColor(UIColor.white, for: .normal)
        return button
    }()
    
    lazy var buttonTest: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.layer.cornerRadius = 15
        button.backgroundColor = .black
        button.setTitle("Итоговый тест", for: .normal)
        button.setTitleColor(UIColor.white, for: .normal)
        return button
    }()
    
    lazy var buttonConspect: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.layer.cornerRadius = 15
        button.backgroundColor = .black
        button.setTitle("Конспект к уроку", for: .normal)
        button.setTitleColor(UIColor.white, for: .normal)
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .white
        title = self.nameOfLess
        
        view.addSubview(webPlayer)
        webPlayer.leadingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.leadingAnchor, constant: 0).isActive = true
        webPlayer.trailingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.trailingAnchor, constant: 0).isActive = true
        webPlayer.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor, constant: 0).isActive = true
        webPlayer.heightAnchor.constraint(equalToConstant: self.view.frame.width/2 + 100).isActive = true
        
        if videoID == "tQpjz9x-o0Y" {
            view.addSubview(buttonTask)
            buttonTask.leadingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.leadingAnchor, constant: 40).isActive = true
            buttonTask.trailingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.trailingAnchor, constant: -40).isActive = true
            buttonTask.topAnchor.constraint(equalTo: webPlayer.safeAreaLayoutGuide.bottomAnchor, constant: 20).isActive = true
            buttonTask.heightAnchor.constraint(equalToConstant: 60).isActive = true
            buttonTask.addTarget(self, action: #selector(buttonActionTask), for: .touchUpInside)
            
            view.addSubview(buttonConspect)
            buttonConspect.leadingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.leadingAnchor, constant: 40).isActive = true
            buttonConspect.trailingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.trailingAnchor, constant: -40).isActive = true
            buttonConspect.topAnchor.constraint(equalTo: buttonTask.safeAreaLayoutGuide.bottomAnchor, constant: 20).isActive = true
            buttonConspect.heightAnchor.constraint(equalToConstant: 60).isActive = true
            buttonConspect.addTarget(self, action: #selector(buttonActionConspect), for: .touchUpInside)
            
            view.addSubview(buttonLab)
            buttonLab.leadingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.leadingAnchor, constant: 40).isActive = true
            buttonLab.trailingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.trailingAnchor, constant: -40).isActive = true
            buttonLab.topAnchor.constraint(equalTo: buttonConspect.safeAreaLayoutGuide.bottomAnchor, constant: 20).isActive = true
            buttonLab.heightAnchor.constraint(equalToConstant: 60).isActive = true
            buttonLab.addTarget(self, action: #selector(buttonActionLab), for: .touchUpInside)
            
            view.addSubview(buttonTest)
            buttonTest.leadingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.leadingAnchor, constant: 40).isActive = true
            buttonTest.trailingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.trailingAnchor, constant: -40).isActive = true
            buttonTest.topAnchor.constraint(equalTo: buttonLab.safeAreaLayoutGuide.bottomAnchor, constant: 20).isActive = true
            buttonTest.heightAnchor.constraint(equalToConstant: 60).isActive = true
            buttonTest.addTarget(self, action: #selector(buttonActionTest), for: .touchUpInside)
        } else if videoID == "BOtzWyBX34I" {
            view.addSubview(buttonTask)
            buttonTask.leadingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.leadingAnchor, constant: 40).isActive = true
            buttonTask.trailingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.trailingAnchor, constant: -40).isActive = true
            buttonTask.topAnchor.constraint(equalTo: webPlayer.safeAreaLayoutGuide.bottomAnchor, constant: 20).isActive = true
            buttonTask.heightAnchor.constraint(equalToConstant: 80).isActive = true
            buttonTask.addTarget(self, action: #selector(buttonActionTask), for: .touchUpInside)
            
            view.addSubview(buttonConspect)
            buttonConspect.leadingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.leadingAnchor, constant: 40).isActive = true
            buttonConspect.trailingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.trailingAnchor, constant: -40).isActive = true
            buttonConspect.topAnchor.constraint(equalTo: buttonTask.safeAreaLayoutGuide.bottomAnchor, constant: 20).isActive = true
            buttonConspect.heightAnchor.constraint(equalToConstant: 80).isActive = true
            buttonConspect.addTarget(self, action: #selector(buttonActionConspect), for: .touchUpInside)
            
            view.addSubview(buttonTest)
            buttonTest.leadingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.leadingAnchor, constant: 40).isActive = true
            buttonTest.trailingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.trailingAnchor, constant: -40).isActive = true
            buttonTest.topAnchor.constraint(equalTo: buttonConspect.safeAreaLayoutGuide.bottomAnchor, constant: 20).isActive = true
            buttonTest.heightAnchor.constraint(equalToConstant: 80).isActive = true
            
            buttonTest.addTarget(self, action: #selector(buttonActionTest), for: .touchUpInside)
        } else if videoID == "qtj64yv6lYI" {
            view.addSubview(buttonTask)
            buttonTask.leadingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.leadingAnchor, constant: 40).isActive = true
            buttonTask.trailingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.trailingAnchor, constant: -40).isActive = true
            buttonTask.topAnchor.constraint(equalTo: webPlayer.safeAreaLayoutGuide.bottomAnchor, constant: 20).isActive = true
            buttonTask.heightAnchor.constraint(equalToConstant: 80).isActive = true
            buttonTask.addTarget(self, action: #selector(buttonActionTask), for: .touchUpInside)
            
            view.addSubview(buttonConspect)
            buttonConspect.leadingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.leadingAnchor, constant: 40).isActive = true
            buttonConspect.trailingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.trailingAnchor, constant: -40).isActive = true
            buttonConspect.topAnchor.constraint(equalTo: buttonTask.safeAreaLayoutGuide.bottomAnchor, constant: 20).isActive = true
            buttonConspect.heightAnchor.constraint(equalToConstant: 80).isActive = true
            buttonConspect.addTarget(self, action: #selector(buttonActionConspect), for: .touchUpInside)
            
            view.addSubview(buttonTest)
            buttonTest.leadingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.leadingAnchor, constant: 40).isActive = true
            buttonTest.trailingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.trailingAnchor, constant: -40).isActive = true
            buttonTest.topAnchor.constraint(equalTo: buttonConspect.safeAreaLayoutGuide.bottomAnchor, constant: 20).isActive = true
            buttonTest.heightAnchor.constraint(equalToConstant: 80).isActive = true
            
            buttonTest.addTarget(self, action: #selector(buttonActionTest), for: .touchUpInside)
        } else if videoID == "u0ZCr0JT8EM" {
            view.addSubview(buttonTask)
            buttonTask.leadingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.leadingAnchor, constant: 40).isActive = true
            buttonTask.trailingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.trailingAnchor, constant: -40).isActive = true
            buttonTask.topAnchor.constraint(equalTo: webPlayer.safeAreaLayoutGuide.bottomAnchor, constant: 20).isActive = true
            buttonTask.heightAnchor.constraint(equalToConstant: 60).isActive = true
            buttonTask.addTarget(self, action: #selector(buttonActionTask), for: .touchUpInside)
            
            view.addSubview(buttonConspect)
            buttonConspect.leadingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.leadingAnchor, constant: 40).isActive = true
            buttonConspect.trailingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.trailingAnchor, constant: -40).isActive = true
            buttonConspect.topAnchor.constraint(equalTo: buttonTask.safeAreaLayoutGuide.bottomAnchor, constant: 20).isActive = true
            buttonConspect.heightAnchor.constraint(equalToConstant: 60).isActive = true
            buttonConspect.addTarget(self, action: #selector(buttonActionConspect), for: .touchUpInside)
            
            view.addSubview(buttonLab)
            buttonLab.leadingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.leadingAnchor, constant: 40).isActive = true
            buttonLab.trailingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.trailingAnchor, constant: -40).isActive = true
            buttonLab.topAnchor.constraint(equalTo: buttonConspect.safeAreaLayoutGuide.bottomAnchor, constant: 20).isActive = true
            buttonLab.heightAnchor.constraint(equalToConstant: 60).isActive = true
            buttonLab.addTarget(self, action: #selector(buttonActionLab), for: .touchUpInside)
            
            view.addSubview(buttonTest)
            buttonTest.leadingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.leadingAnchor, constant: 40).isActive = true
            buttonTest.trailingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.trailingAnchor, constant: -40).isActive = true
            buttonTest.topAnchor.constraint(equalTo: buttonLab.safeAreaLayoutGuide.bottomAnchor, constant: 20).isActive = true
            buttonTest.heightAnchor.constraint(equalToConstant: 60).isActive = true
            buttonTest.addTarget(self, action: #selector(buttonActionTest), for: .touchUpInside)
        }
        
        getVideo(videoCode: videoID)
    }
    
    func getVideo(videoCode: String) {
        let url = URL(string: "https://www.youtube.com/embed/\(videoCode)")
        webPlayer.load(URLRequest(url: url!))
    }
    
    @objc func buttonActionTest(sender: UIButton!) {
        
        let vc = VideoLessTestView()
        
        self.navigationController?.pushViewController(vc, animated: true)
        
        vc.indexPath = 0
        vc.rounds = 5
        vc.videoID = self.videoID
    }
    
    @objc func buttonActionLab(sender: UIButton!) {
        
        let vc = VideoLessLabView()
        vc.videoID = self.videoID
        
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    @objc func buttonActionTask(sender: UIButton!) {
        
        let vc = VideoLessTaskView()
        vc.videoID = self.videoID
        
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    @objc func buttonActionConspect(sender: UIButton!) {
        
        let vc = VideoLessConspectView()
        vc.videoID = self.videoID
        
        self.navigationController?.pushViewController(vc, animated: true)
    }
}
