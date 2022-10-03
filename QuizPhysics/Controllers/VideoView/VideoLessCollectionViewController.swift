
import UIKit

class VideoLessCollectionViewController: UIViewController {
    
    var videoLessData: [Classes] = []
    
    let service = VideoLessService()
    
    let collectionView: UICollectionView = {
        
        let viewLayout = UICollectionViewFlowLayout()
        viewLayout.scrollDirection = .vertical
        viewLayout.minimumLineSpacing = 58
        viewLayout.minimumInteritemSpacing = 20
        viewLayout.itemSize = CGSize(width: (UIScreen.main.bounds.width - 60) / 2, height: (UIScreen.main.bounds.width - 60) / 2)
        viewLayout.sectionInset = UIEdgeInsets(top: 10, left: 20, bottom: 55, right: 20)
        
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: viewLayout)
        collectionView.backgroundColor = .white
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.frame = UIScreen.main.bounds
        return collectionView
    }()
    
    let idVideoLess = "idVideoLess"
    
    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .white
        title = "ВидеоУроки"
        
        if let localData = service.readLocalFile(forName: "dataVideoFizika") {
            videoLessData = service.parse(jsonData: localData)
        }
        
        setupViews()
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        collectionView.frame = view.bounds
    }
}

extension VideoLessCollectionViewController {
    
    private func setupViews() {
        
        view.backgroundColor = .blue
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.register(VideoLessCollectionCell.self, forCellWithReuseIdentifier: idVideoLess)
        
        view.addSubview(collectionView)
    }
}

extension VideoLessCollectionViewController: UICollectionViewDataSource, UICollectionViewDelegate {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        videoLessData.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: idVideoLess, for: indexPath) as! VideoLessCollectionCell
        
        cell.nameLabel.text = videoLessData[indexPath.row].classes
        cell.imageView.image = UIImage(named: "icon_placeholder")
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        let vc = VideoLessTableView(model: videoLessData[indexPath.row])
        self.navigationController?.pushViewController(vc, animated: true)
        vc.numberOfClass = indexPath.row
        
        if indexPath.row == 5 {
            vc.itsScientist = 1
        }
        
    }
}
