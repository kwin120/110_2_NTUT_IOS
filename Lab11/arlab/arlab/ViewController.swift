//
//  ViewController.swift
//  arlab
//
//  Created by Media Lab on 2022/6/15.
//  Copyright © 2022 Media Lab. All rights reserved.
//

import UIKit
import SceneKit
import ARKit

class ViewController: UIViewController, ARSCNViewDelegate {

    @IBOutlet var sceneView: ARSCNView!
    var dragonNode: SCNNode?
    var ballNode: SCNNode?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        sceneView.delegate = self
        sceneView.autoenablesDefaultLighting = true
        let dragonScene = SCNScene(named: "art.scnassets/ARKit_Class_Model.scn")
        dragonNode = dragonScene?.rootNode
        let ballScene = SCNScene(named: "art.scnassets/Ball DAE.scn")
        ballNode = ballScene?.rootNode
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        let configuration = ARImageTrackingConfiguration()
        if let trackingImages = ARReferenceImage.referenceImages(inGroupNamed: "ARKit_Class_QRCode", bundle: Bundle.main){
            configuration.trackingImages = trackingImages
            configuration.maximumNumberOfTrackedImages = 2
        }
        sceneView.session.run(configuration)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        sceneView.session.pause()
    }
    
    func renderer(_ renderer: SCNSceneRenderer, nodeFor anchor: ARAnchor) -> SCNNode? {
        let node = SCNNode()
        
        if let imageAnchor = anchor as? ARImageAnchor{
            let size = imageAnchor.referenceImage.physicalSize
            let plane = SCNPlane(width: size.width, height: size.height)
            plane.firstMaterial?.diffuse.contents = UIColor.white.withAlphaComponent(0.5)
            let planeNode = SCNNode(geometry: plane)
            planeNode.eulerAngles.x = -.pi/2
            node.addChildNode(planeNode)
            
            var shapeNode: SCNNode?
            if imageAnchor.referenceImage.name == "QRCode"{
                shapeNode = dragonNode
            }else if imageAnchor.referenceImage.name == "ball_code"{
                shapeNode = ballNode
            }
            
            let shapeSpin = SCNAction.rotateBy(x: 0, y: 2, z: 0, duration: 10)
            let repeatSpin = SCNAction.repeatForever(shapeSpin)
            shapeNode?.runAction(repeatSpin)
            
            guard let shape = shapeNode else {
                return nil
            }
            node.addChildNode(shape)
        }

        return node
    }
}
