import UIKit

enum Controller {
  
  case Detail(episode: Episode)
  case Episode
  case Profile
  
  var sb: UIStoryboard { return UIStoryboard(name: "Main", bundle: nil) }
  
  var instance: UIViewController {
    switch self {
    case .Detail(let episode):
      let vc = sb.instantiateViewController(withIdentifier: "Detail") as! DetailViewController
      vc.episode = episode
      return vc
    case .Episode():
      return sb.instantiateViewController(withIdentifier: "Episode") as! EpisodesViewController
    case .Profile():
      return sb.instantiateViewController(withIdentifier: "Profile") as! UINavigationController
    }
  }
}

protocol Transitionable: class {
  
  var navigationController: UINavigationController? { get }
  
  func present(vc: Controller)
  func push(vc: Controller)
}

extension Transitionable {
  
  func present(vc: Controller) {
    let vc = vc.instance
    navigationController?.present(vc, animated: true, completion: nil)
  }
  
  func push(vc: Controller) {
    let vc = vc.instance
    navigationController?.pushViewController(vc, animated: true)
  }
}
