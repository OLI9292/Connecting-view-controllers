import UIKit

class EpisodesViewController: UITableViewController, Transitionable {
  
  let episodes = [
    Episode(title: "Episode One"),
    Episode(title: "Episode Two"),
    Episode(title: "Episode Three")
  ]
  
  override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    let episode = episodes[indexPath.row]
    push(vc: Controller.Detail(episode: episode))
  }
  
  override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return episodes.count
  }
  
  override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
    let episode = episodes[indexPath.row]
    cell.textLabel?.text = episode.title
    return cell
  }
  
  @IBAction func showProfile(_ sender: AnyObject) {
    present(vc: Controller.Profile)
  }
}


class DetailViewController: UIViewController {
  
  @IBOutlet weak var label: UILabel? {
    didSet {
      label?.text = episode?.title
    }
  }
  
  var episode: Episode?
}


class ProfileViewController: UIViewController {
  var person: String = ""
  var didTapClose: () -> () = {}
  
  @IBAction func close(_ sender: AnyObject) {
    navigationController?.dismiss(animated: true, completion: nil)
  }
}
