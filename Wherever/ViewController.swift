//
//  ViewController.swift
//  Wherever
//
//  Created by YUNI on 2016. 12. 28..
//  Copyright © 2016년 YUNI. All rights reserved.
//

import UIKit

class ViewController: UIViewController, MTMapViewDelegate {

    lazy var mapView: MTMapView = MTMapView(frame: CGRect(x: 0, y: 0, width: self.view.frame.size.width, height: self.view.frame.size.height))
    
    func poiItem(name: String, latitude: Double, longitude: Double) -> MTMapPOIItem {
        let item = MTMapPOIItem()
        item.itemName = name
        item.markerType = .redPin
        item.markerSelectedType = .redPin
        item.mapPoint = MTMapPoint(geoCoord: .init(latitude: latitude, longitude: longitude))
        item.showAnimationType = .noAnimation
        item.customImageAnchorPointOffset = .init(offsetX: 30, offsetY: 0)    // 마커 위치 조정
        
        return item
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        mapView.daumMapApiKey = "f9b84bc37a9917d052d08adb5f6677f6"
        mapView.delegate = self
        mapView.baseMapType = .standard
        self.view.insertSubview(mapView, at: 0)
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewDidAppear(_ animated: Bool) {
        var items = [MTMapPOIItem]()
        items.append(poiItem(name: "학교", latitude: 37.340181, longitude: 126.733522))
        mapView.addPOIItems(items)
        mapView.fitAreaToShowAllPOIItems()  // 모든 마커가 보이게 카메라 위치/줌 조정
    }
    
}

