//
//  ViewController.swift
//  MySwiftVidyoIntegration
//
//  Created by Ibukunoluwa Soyebo on 09/11/2021.
//

import UIKit

class ViewController: UIViewController {
    
    var connector: VCConnector?
    
    @IBOutlet weak var myVidyoView: UIView!
    @IBOutlet weak var controlButtonView: UIView!
    @IBOutlet weak var micButton: UIButton!
    @IBOutlet weak var callButton: UIButton!
    @IBOutlet weak var cameraButton: UIButton!
    @IBOutlet weak var switchCameraButton: UIButton!
    let hostname = ""
    let displayname = ""
    let roomKey = ""
    
    private var micMuted    = false
    private var cameraMuted = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        VCConnectorPkg.vcInitialize()
        self.connector = VCConnector(&myVidyoView, viewStyle: .default, remoteParticipants: 4, logFileFilter: "admin [admin@myswiftintegration.platform.vidyo.io]", logFileName: "", userData: 0)
        controlButtonView.layer.cornerRadius = controlButtonView.frame.width/2
    }
    
    
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        connector?.showView(at: &myVidyoView, x: 0, y: 0, width: UInt32(myVidyoView.frame.size.width), height: UInt32(myVidyoView.frame.size.height))
    }
    

    
    @IBAction func onCallButtonPressed(_ sender: Any) {
        connector?.connectToRoom(asGuest: hostname, displayName: displayname, roomKey: roomKey, roomPin: "", connectorIConnect: self)
    }
    
    
    @IBAction func onMicButtonPressed(_ sender: Any) {
        micMuted.toggle()
        connector?.setMicrophonePrivacy(micMuted)
    }
    
    @IBAction func onCameraButtonPressed(_ sender: Any) {
        cameraMuted.toggle()
        connector?.setCameraPrivacy(cameraMuted)
    }
    
    
    @IBAction func onCameraSwitchPressed(_ sender: Any) {
        connector?.cycleCamera()
    }
    
}


extension ViewController: VCConnectorIConnect{
    func onSuccess() {
        
    }
    
    func onFailure(_ reason: VCConnectorFailReason) {
        
    }
    
    func onDisconnected(_ reason: VCConnectorDisconnectReason) {
        
    }
    
    
}
