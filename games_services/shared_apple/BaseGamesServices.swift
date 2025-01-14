import GameKit

public class BaseGamesServices: NSObject {
  
  // MARK: - Properties
  
  var viewController: ViewController {
#if os(iOS) || os(tvOS)
    UIApplication.shared.windows.first!.rootViewController!
#else
    NSApplication.shared.windows.first!.contentViewController!
#endif
  }
  
  var isAuthenticated: Bool {
    GKLocalPlayer.local.isAuthenticated
  }
  
  var currentPlayer: GKLocalPlayer {
    GKLocalPlayer.local
  }
  
}

// MARK: - GKGameCenterControllerDelegate

extension BaseGamesServices: GKGameCenterControllerDelegate {
  
  public func gameCenterViewControllerDidFinish(_ gameCenterViewController: GKGameCenterViewController) {
    gameCenterViewController.dismiss()
  }
}
