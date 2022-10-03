
struct Meh: Codable {
    let meh: [Classes]
}

struct Classes: Codable {
    let classes: String
    let category: [Category]
}
    
struct Category: Codable {
    let nameCategory: String
    let nameSubject: String
    let idVideo: String
    let scientistFace: String
    let shortDossier: String
    let fullDossier: String
}
