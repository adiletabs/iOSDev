//
//  CustomAnnotationView.swift
//  Map
//
//  Created by Adilet Absatov on 25.03.2021.
//

import Foundation
import MapKit

class CustomAnnotationView: MKPinAnnotationView {
    override init(annotation: MKAnnotation?, reuseIdentifier: String?) {
        super.init(annotation: annotation, reuseIdentifier: reuseIdentifier)
        animatesDrop = true
        canShowCallout = true
        rightCalloutAccessoryView = UIButton(type: .infoLight)
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
}
