
import Foundation

class VideoLessService {
    
    func readLocalFile(forName name: String) -> Data? {
        do {
            if let bundlePath = Bundle.main.path(forResource: name, ofType: "json"),
               let jsonData = try String(contentsOfFile: bundlePath).data(using: .utf8) {
                return jsonData
            }
        } catch {
            print(error)
        }
        return nil
    }
    
    func parse(jsonData: Data) ->  [Classes]{
        do {
            let decodedData = try JSONDecoder().decode(Meh.self, from: jsonData)
            return decodedData.meh
        } catch {
            print("decode error")
            return []
        }
    }
}
