import UIKit
import Foundation

struct User: Decodable {
    let name:String
}

enum ResultData {
    case returnData(Data?)
    case error(Error?)
}

protocol NetworkingProtocol {
    func callService(completion: @escaping (ResultData) -> Void)
}

class Networking:NetworkingProtocol {
    
    func callService(completion: @escaping (ResultData) -> Void) {
        URLSession.shared.dataTask(with: URLRequest(url: URL(string: "")!)) { data, response, error in
            
            guard let data = data else {
                completion(.error(NSError(domain: "", code: 0)))
                return
            }
            
            if let error = error {
                completion(.error(NSError(domain: "", code: 0)))
            }
            
            completion(.returnData(data))
            
        }
    }
    
}

protocol userVMProtocol {
    func callService()
}

class UserVM:userVMProtocol {
    
    let networking:NetworkingProtocol?
    
    init(networking: NetworkingProtocol?) {
        self.networking = networking
    }
    
    func callService() {
        self.networking?.callService(completion: { [weak self] result in
            guard let self = self else { return }
            switch result {
            case .returnData(let data):
                guard let data = data else { return }
                do {
                    let model = try JSONDecoder().decode(User.self, from: data)
                } catch {
                    //show error
                }
            case .error(let error): break
            }
        })
    }
}

class ViewController {
    
    let vm: userVMProtocol?
    
    init(vm: userVMProtocol?) {
        self.vm = vm
    }
    
}
