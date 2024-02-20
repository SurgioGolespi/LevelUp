//
//  EventViewController.swift
//  LevelUp
//
//  Created by Suraj Gajula on 2/18/24.
//

import UIKit
import EventKitUI
class ViewController: UIViewController, EKEventEditViewDelegate, UINavigationControllerDelegate {
    func buttonTapped() {
        switch EKEventStore.authorizationStatus(for: .event) {
        case .notDetermined:
            let eventStore = EKEventStore()
            eventStore.requestAccess(to: .event) { (granted, error) in
                if granted {
                    print("h")
                    DispatchQueue.main.async {
                        self.showEventViewController()
                    }
                }
            }
        case .authorized:
            print("h")
            DispatchQueue.main.async {
                self.showEventViewController()
            }
        default:
            break
        }
    }
    
    func showEventViewController() {
        let eventVC = EKEventEditViewController()
        eventVC.editViewDelegate = self
        eventVC.eventStore = EKEventStore()
        
        let event = EKEvent(eventStore: eventVC.eventStore)
        event.title = "Hello calendar!"
        event.startDate = Date()
        
        eventVC.event = event

        present(eventVC, animated: true)
    }
    
    func eventEditViewController(_ controller: EKEventEditViewController, didCompleteWith action: EKEventEditViewAction) {
            dismiss(animated: true, completion: nil)
    }
    
}
