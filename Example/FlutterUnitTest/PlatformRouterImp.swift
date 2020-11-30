//
//  PlatformRouterImp.swift
//  PMFlutterApp
//
//  Created by yong.xing on 2020/11/18.
//

import Foundation

class PlatformRouterImp: NSObject, FLBPlatform {
    func open(_ url: String, urlParams: [AnyHashable : Any], exts: [AnyHashable : Any], completion: @escaping (Bool) -> Void) {
        var animated = false;
        if exts["animated"] != nil{
            animated = exts["animated"] as! Bool;
        }
        let vc = FLBFlutterViewContainer.init();
        vc.setName(url, params: urlParams);
        self.navigationController().pushViewController(vc, animated: animated);
        completion(true);
    }
    
    func present(_ url: String, urlParams: [AnyHashable : Any], exts: [AnyHashable : Any], completion: @escaping (Bool) -> Void) {
        var animated = false;
        if exts["animated"] != nil{
            animated = exts["animated"] as! Bool;
        }
        let vc = FLBFlutterViewContainer.init();
        vc.setName(url, params: urlParams);
        navigationController().present(vc, animated: animated) {
            completion(true);
        };
    }
    
    func close(_ uid: String, result: [AnyHashable : Any], exts: [AnyHashable : Any], completion: @escaping (Bool) -> Void) {
        var animated = false;
        if exts["animated"] != nil{
            animated = exts["animated"] as! Bool;
        }
        let presentedVC = self.navigationController().presentedViewController;
        let vc = presentedVC as? FLBFlutterViewContainer;
        if vc?.uniqueIDString() == uid {
            vc?.dismiss(animated: animated, completion: {
                completion(true);
            });
        }else{
            self.navigationController().popViewController(animated: animated);
        }
    }
    
    func navigationController() -> UINavigationController {
        
        let keyWindow = UIApplication.shared.windows
//                .filter({$0.activationState == .foregroundActive})
//                .map({$0 as? UIWindowScene})
//                .compactMap({$0})
//                .first?.windows
                .filter({$0.isKeyWindow}).first
        
        var vc = keyWindow?.rootViewController

        if (vc?.isKind(of: UITabBarController.self))! {
            vc = (vc as! UITabBarController).selectedViewController
        }else if (vc?.isKind(of: UINavigationController.self))!{
            vc = (vc as! UINavigationController).visibleViewController
        }else if ((vc?.presentedViewController) != nil){
            vc =  vc?.presentedViewController
        }
            
        return (vc?.navigationController)!
 
    }
}
