
import UIKit

class VideoLessCollectionCell: UICollectionViewCell {
    
    let nameLabel: UILabel = {
        let nameLabel = UILabel()
        nameLabel.translatesAutoresizingMaskIntoConstraints = false
        nameLabel.text = "Nicholas Henahan"
        //nameLabel.font = UIFont.init(name: "Lato-Bold", size: 17)
        nameLabel.textColor = .black
        return nameLabel
    }()
    
    let imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .center
        imageView.layer.cornerRadius = 15
        imageView.clipsToBounds = true
        return imageView
    }()
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        conf()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
    }
    
    func conf() {
        
        contentView.backgroundColor = UIColor(red: 236/255, green: 240/255, blue: 248/255, alpha: 1)
        contentView.layer.cornerRadius = 15
        
        contentView.addSubview(imageView)
        NSLayoutConstraint.activate([
            imageView.leadingAnchor.constraint(equalTo: self.contentView.leadingAnchor, constant: 0),
            imageView.topAnchor.constraint(equalTo: self.contentView.topAnchor, constant: 0),
            imageView.bottomAnchor.constraint(equalTo: self.contentView.bottomAnchor, constant: 0),
            imageView.trailingAnchor.constraint(equalTo: self.contentView.trailingAnchor, constant: 0)
        ])
        
        contentView.addSubview(nameLabel)
        nameLabel.frame.size.width = imageView.frame.size.width
        nameLabel.frame.size.height = 23
        NSLayoutConstraint.activate([
            nameLabel.topAnchor.constraint(equalTo: contentView.bottomAnchor, constant: 10),
            nameLabel.centerXAnchor.constraint(equalTo: imageView.centerXAnchor)
        ])
    }
}
