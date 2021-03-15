//
//  CheckModel.swift
//  Swift6SNS1
//
//  Created by yasuki.satou on 2021/02/15.
//

import Foundation
import Photos

class CheckModel {

    func showCheckPermission(){
           PHPhotoLibrary.requestAuthorization { (status) in
               
               switch(status){
                   
               case .authorized:
                   print("許可されてますよ")

               case .denied:
                       print("拒否")

               case .notDetermined:
                           print("notDetermined")
                   
               case .restricted:
                           print("restricted")
                   
               case .limited:
                   print("limited")
               @unknown default: break
                   
               }
               
           }
       }

}
