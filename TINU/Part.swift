//
//  Part.swift
//  TINU
//
//  Created by Pietro Caruso on 05/09/17.
//  Copyright © 2017 Pietro Caruso. All rights reserved.
//

import Cocoa

//this is just a simple class that represents a drive, used fot the drive scan algoritm
public class Part{
	
	enum driveTrypes{
		case normal
		case apfs
		case coreStorage
	}
	
	var driveType: driveTrypes = .normal
	
    var bsdName: String
    var apfsBDSName: String?
    var name: String
    var path: String
    var fileSystem: String
    var partScheme: String
    var hasEFI: Bool
    var totSize: Float
    
    var hasAPFSVolumes = false
	var hasOriginalVolumes = false
	
	var tmDisk = false
	
	var size: UInt64! = 0
	
    public init(){
        bsdName = "/dev/"
        name = ""
        path = "/Volumes/"
        fileSystem = ""
        partScheme = ""
        hasEFI = false
        totSize = 0
    }
    
    public init(partitionBSDName: String, partitionName: String, partitionPath: String, partitionFileSystem: String, partitionScheme: String, partitionHasEFI: Bool, partitionSize: Float){
        bsdName = partitionBSDName
        name = partitionName
        path = partitionPath
        fileSystem = partitionFileSystem
        partScheme = partitionScheme
        hasEFI = partitionHasEFI
        totSize = partitionSize
    }
    
    public func copy() -> Part{
        let p = Part(partitionBSDName: bsdName, partitionName: name, partitionPath: path, partitionFileSystem: fileSystem, partitionScheme: partScheme, partitionHasEFI: hasEFI, partitionSize: totSize)
        p.hasAPFSVolumes = hasAPFSVolumes
		p.hasOriginalVolumes = hasOriginalVolumes
        p.apfsBDSName = apfsBDSName
		p.driveType = driveType
		p.size = size
		
		p.tmDisk = tmDisk
		
        return p
    }
    
    
    
}
