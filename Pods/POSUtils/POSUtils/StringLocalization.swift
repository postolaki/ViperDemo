import Foundation
import UIKit

/*
 for Objective C import:
 #import "ProjectName-Swift.h"
 */

private func isSimulator(completion: (() -> Void)?) {
    #if targetEnvironment(simulator)
        completion?()
    #endif
}

private func handleLocalizations(table: String, key: String) {
    isSimulator {
        Localizationhandler.shared.currentTable = table
        Localizationhandler.shared.initLocalizationsUtils()
        
        let tableDict = Localizationhandler.shared.dictWithLanguages[table]
        Localizationhandler.shared.checkIfKeyExist(in: tableDict, key: key)
    }
}

public extension String {
    public var localized: String {
        let table = "Localizable"
        handleLocalizations(table: table, key: self)
        
        return NSLocalizedString(self, comment: "")
    }
    
    public func localized(table: String) -> String {
        handleLocalizations(table: table, key: self)
        
        return NSLocalizedString(self, tableName: table, comment: "")
    }
}

public extension NSString {
    public var localized: String {
        let table = "Localizable"
        handleLocalizations(table: table, key: self as String)
        
        return NSLocalizedString(self as String, comment: "")
    }
    
    public func localized(table: String) -> String {
        handleLocalizations(table: table, key: self as String)
        
        return NSLocalizedString(self as String, tableName: table, comment: "")
    }
}
