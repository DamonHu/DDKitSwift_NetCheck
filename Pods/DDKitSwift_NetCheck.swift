//
//  DDNetCheck.swift
//  DDNetCheck
//
//  Created by Damon on 2025/4/5.
//

import DDKitSwift
import DDNetCheck

func UIImageHDBoundle(named: String?) -> UIImage? {
    guard let name = named else { return nil }
    guard let bundlePath = Bundle(for: DDKitSwift_NetCheck.self).path(forResource: "DDKitSwift_NetCheck", ofType: "bundle") else { return nil }
    let bundle = Bundle(path: bundlePath)
    return UIImage(named: name, in: bundle, compatibleWith: nil)
}

extension String{
    var ZXLocaleString: String {
        //优先使用主项目翻译
        let mainValue = NSLocalizedString(self, comment: "")
        if mainValue != self {
            return mainValue
        }
        //使用自己的bundle
        if let bundlePath = Bundle(for: DDKitSwift_NetCheck.self).path(forResource: "DDKitSwift_NetCheck", ofType: "bundle"), let bundle = Bundle(path: bundlePath) {
            return NSLocalizedString(self, tableName: nil, bundle: bundle, value: self, comment: "")
        }
        return self
    }
}

//ZXKitPlugin
open class DDKitSwift_NetCheck: DDKitSwiftPluginProtocol {
    public var isRunning: Bool = false
    private var url: String
    
    public init(url: String) {
        self.url = url
    }
    
    public var pluginIdentifier: String {
        return "com.ddkit.DDKitSwift_NetCheck"
    }

    public var pluginIcon: UIImage? {
        return UIImageHDBoundle(named: "icon_netcheck.png")
    }

    public var pluginTitle: String {
        return "Network Diagnosis".ZXLocaleString
    }

    public var pluginType: DDKitSwiftPluginType {
        return .other
    }

    public func start() {
        let vc = DDNetCheckVC(url: self.url)
        DDKitSwift.getCurrentNavigationVC()?.pushViewController(vc, animated: true)
    }
    
    public func stop() {
        
    }
}
