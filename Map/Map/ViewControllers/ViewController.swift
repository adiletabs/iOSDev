//
//  ViewController.swift
//  Map
//
//  Created by Adilet Absatov on 25.03.2021.
//

import UIKit
import MapKit

class ViewController: UIViewController, MKMapViewDelegate, EditDelegate, LocationsDelegate {
    @IBOutlet weak var map: MKMapView!
    
    var mapType: [Int: MKMapType] = [0: .standard, 1: .satellite, 2: .hybrid]
    var locations: [MKPointAnnotation] = []
    var currentPin: MKPointAnnotation?
    var currentIndex: Int?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        map.delegate = self
        map.register(CustomAnnotationView.self, forAnnotationViewWithReuseIdentifier: MKMapViewDefaultAnnotationViewReuseIdentifier)
    }

    @IBAction func switchMode(_ sender: UISegmentedControl) {
        map.mapType = mapType[sender.selectedSegmentIndex] ?? .standard
    }
    
    @IBAction func longPress(_ sender: UILongPressGestureRecognizer) {
        let touchPoint = sender.location(in: self.map)
        let coordinate = self.map.convert(touchPoint, toCoordinateFrom: self.map)
        
        let alertController = UIAlertController(title: "New location", message: nil, preferredStyle: .alert)
        alertController.addTextField { (textfield) in
            textfield.placeholder = "Location"
        }
        alertController.addTextField { (textfield) in
            textfield.placeholder = "Description"
        }
        
        let save = UIAlertAction(title: "OK", style: .default) { [weak self](alert) in
            let location = alertController.textFields![0] as UITextField
            let description = alertController.textFields![1] as UITextField
            
            let annotation = MKPointAnnotation()
            annotation.title = location.text
            annotation.subtitle = description.text
            annotation.coordinate = coordinate
            self?.map.addAnnotation(annotation)
            self?.locations.append(annotation)
            
            self?.currentIndex = (self?.locations.count)! - 1
            self?.currentPin = annotation
            self?.navigate((self?.currentIndex!)!)
        }
        
        alertController.addAction(save)
        self.present(alertController, animated: true)
    }
    
    @IBAction func prevButtonPressed(_ sender: UIButton) {
        if let index = currentIndex {
            currentIndex = max(0, index - 1)
            navigate(currentIndex!)
        }
    }
    
    @IBAction func nextButtonPressed(_ sender: UIButton) {
        if let index = currentIndex {
            currentIndex = min(locations.count - 1, index + 1)
            navigate(currentIndex!)
        }
    }
    
    func mapView(_ mapView: MKMapView, annotationView view: MKAnnotationView, calloutAccessoryControlTapped control: UIControl) {
        currentPin = view.annotation as? MKPointAnnotation
        performSegue(withIdentifier: "editSegue", sender: view)
        self.definesPresentationContext = true
        self.providesPresentationContextTransitionStyle = true
        overlayBlurredBackgroundView()
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let destination = segue.destination as? LocationsViewController {
            destination.delegate = self
        } else if segue.identifier == "editSegue" {
            if let navcon = segue.destination as? UINavigationController {
                navcon.modalPresentationStyle = .overFullScreen
                if let destination = navcon.visibleViewController as? EditViewController {
                    destination.pin = currentPin
                    destination.delegate = self
                }
            }
        }
    }
    
    func overlayBlurredBackgroundView() {
        let blurredBackgroundView = UIVisualEffectView()
        blurredBackgroundView.frame = view.frame
        blurredBackgroundView.effect = UIBlurEffect(style: .light)
        view.addSubview(blurredBackgroundView)
    }
        
    func removeBlurredBackgroundView() {
        for subview in view.subviews {
            if subview.isKind(of: UIVisualEffectView.self) {
                subview.removeFromSuperview()
            }
        }
    }
    
    func navigate(_ index: Int) {
        if index >= locations.count || index < 0 {
            return
        }
        self.currentIndex = index
        self.currentPin = locations[index]
        let regionRadius: CLLocationDistance = 30000
        let coordinateRegion = MKCoordinateRegion(center: currentPin!.coordinate,
                                                  latitudinalMeters: regionRadius, longitudinalMeters: regionRadius)
        map.setRegion(coordinateRegion, animated: true)
        self.navigationItem.title = currentPin!.title ?? ""
    }
    
    func removeLocation(_ index: Int) {
        if index <= currentIndex! {
            if index == currentIndex! {
                navigationItem.title = ""
            }
            currentIndex! = max(currentIndex! - 1, 0)
        }
        let annotation = locations[index]
        locations.remove(at: index)
        map.removeAnnotation(annotation)
    }
}
