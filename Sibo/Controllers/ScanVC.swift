//
//  ScanVC.swift
//  QRInventory
//
//  Created by MacBook Pro on 06/04/2019.
//  Copyright © 2019 MacBook Pro. All rights reserved.
//

import UIKit
import AVFoundation


class ScanVC: UIViewController {
    
    @IBOutlet weak var square: UIImageView!
    @IBOutlet weak var backImage:UIImageView!
    @IBOutlet weak var barBackgroundView:UIView!
    var video = AVCaptureVideoPreviewLayer()
    var qrDitalils = String()
    var scanned = false;
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //Creating session
        CreatSession()
        settingTapGesturse()
      
    }
    override func viewDidAppear(_ animated: Bool) {
        super.viewWillAppear(true);
        scanned = false;
    }
    
    
}
extension ScanVC:AVCaptureMetadataOutputObjectsDelegate{
    func CreatSession(){
        //Creating session
        let session = AVCaptureSession()
        
        //Define capture devcie
        //let captureDevice = AVCaptureDevice.defaultDevice(withMediaType: AVMediaTypeVideo)
        if  let captureDevice = AVCaptureDevice.default(for: AVMediaType.video){
            do
            {
                let input = try AVCaptureDeviceInput(device: captureDevice)
                session.addInput(input)
                
            }
            catch
            {
                print ("ERROR")
            }
            
            let output = AVCaptureMetadataOutput()
            session.addOutput(output)
            
            output.setMetadataObjectsDelegate(self, queue: DispatchQueue.main)
            
            output.metadataObjectTypes = [AVMetadataObject.ObjectType.qr]
            
            video = AVCaptureVideoPreviewLayer(session: session)
            video.frame = view.layer.bounds
            view.layer.addSublayer(video)
            
            self.view.bringSubviewToFront(square)
            self.view.bringSubviewToFront(barBackgroundView)
            
            
            session.startRunning()
        }
        else{
            print("no device Found...!!!")
        }
        
        
    }
    func metadataOutput(_ output: AVCaptureMetadataOutput, didOutput metadataObjects: [AVMetadataObject], from connection: AVCaptureConnection) {
        
        if metadataObjects != nil && metadataObjects.count != 0
        {
            if let object = metadataObjects[0] as? AVMetadataMachineReadableCodeObject
            {
                if object.type == AVMetadataObject.ObjectType.qr
                {
                  
                    
                    DispatchQueue.main.async(execute: {
                        if !self.scanned{
                            self.qrDitalils = object.stringValue!
                            print(self.qrDitalils)
                           self.performSegue(withIdentifier: "NewScanItemVC", sender: nil)
                            self.scanned = true;
                        }
                          // self.dismiss(animated: true, completion: nil)
                    })
                 
                }
                else{
                    print("This is not QRCode..!!!")
                }
            }
            else{
                print("The Code in not Machine Readable..!!!")
            }
        }
        else {
            print("There is no data in QRCode..!!!")
        }
       
    }
    
}
extension ScanVC{
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "NewScanItemVC"{
            let desti = segue.destination as! NewScanItemVC
            desti.qrcodeText = self.qrDitalils
        }
    }
}
extension ScanVC{
    func settingTapGesturse(){
        let tap = UITapGestureRecognizer(target: self, action: #selector(ScanVC.handleTap(_:)))
        backImage.addGestureRecognizer(tap)
        
    }
    
    // function which is triggered when handleTap is called
    @objc func handleTap(_ sender: UITapGestureRecognizer) {
        print("back image Tapped")
        self.dismiss(animated: true, completion: nil)
        
    }
}


