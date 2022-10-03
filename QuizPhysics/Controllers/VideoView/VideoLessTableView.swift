
import UIKit

class VideoLessTableView: UIViewController {
    
    var videoLessData: Classes
    
    var itsScientist: Int = 0
    
    init(model: Classes) {
        self.videoLessData = model
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    var numberOfClass: Int = -1
    
    let tableView: UITableView = {
        let tableView = UITableView()
        return tableView
    }()
    
    let idVideoLessCell = "idVideoLessCell"
    
    var nameCategory: [String] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .white
        view.addSubview(tableView)
        
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(VideoLessTableCell.self, forCellReuseIdentifier: idVideoLessCell)
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        tableView.frame = view.bounds
    }
}

extension VideoLessTableView: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        videoLessData.category.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: idVideoLessCell, for: indexPath) as! VideoLessTableCell
        
        cell.textLabel?.text = "\(videoLessData.category[indexPath.row].nameSubject)"
        cell.detailTextLabel?.text = "\(videoLessData.category[indexPath.row].nameCategory)"
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        50
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        if itsScientist == 1 {
            let vc = VideoScientistViewController()
            navigationController?.pushViewController(vc, animated: true)
            tableView.deselectRow(at: indexPath, animated: true)
            vc.shortDossier.text = videoLessData.category[indexPath.row].shortDossier
            vc.fullDossier.text = videoLessData.category[indexPath.row].fullDossier
            vc.videoID = videoLessData.category[indexPath.row].idVideo
            
            if let url = URL(string: videoLessData.category[indexPath.row].scientistFace) {
                let task = URLSession.shared.dataTask(with: url) { data, response, error in
                    guard let data = data, error == nil else { return }
                    DispatchQueue.main.async {
                        vc.imageView.image = UIImage(data: data)
                    }
                }
                task.resume()
            }
        } else {
            let vc = VideoLessViewController()
            navigationController?.pushViewController(vc, animated: true)
            tableView.deselectRow(at: indexPath, animated: true)
            vc.nameOfLess = "\(videoLessData.category[indexPath.row].nameSubject)"
            vc.videoID = videoLessData.category[indexPath.row].idVideo
        }
    }
}
