//
//  PersistenStack.swift
//  CoreDataDemo
//
//  Created by 童小波 on 15/1/14.
//  Copyright (c) 2015年 tongxiaobo. All rights reserved.
//

import UIKit
import CoreData

@objc class PersistenStack : NSObject {
  
  var managedObjectContext: NSManagedObjectContext?
  var backgroundManagedObjectContext: NSManagedObjectContext?
  var storeURL: NSURL!
  var modelURL: NSURL!
  
  init(storeURL: NSURL, modelURL: NSURL) {
    super.init()
    self.storeURL = storeURL
    self.modelURL = modelURL
    self.setupManagedObjectContexts()
  }
  
  func setupManagedObjectContexts(){
    managedObjectContext = self.setupManagedObjectContextWithConcurrencyType( NSManagedObjectContextConcurrencyType.MainQueueConcurrencyType)
    self.managedObjectContext?.undoManager = NSUndoManager()
    
    backgroundManagedObjectContext = self.setupManagedObjectContextWithConcurrencyType(NSManagedObjectContextConcurrencyType.PrivateQueueConcurrencyType)
    self.managedObjectContext?.undoManager = nil
    
    NSNotificationCenter.defaultCenter().addObserverForName(NSManagedObjectContextDidSaveNotification, object: nil, queue: nil) { (note) -> Void in
      let moc = self.managedObjectContext
      if note.object != nil{
        moc?.performBlock({ () -> Void in
          moc?.mergeChangesFromContextDidSaveNotification(note)
          return
        })
      }
    }
  }
  
  func setupManagedObjectContextWithConcurrencyType(concurrency :NSManagedObjectContextConcurrencyType) -> NSManagedObjectContext{
    let managedObjectContext = NSManagedObjectContext(concurrencyType: concurrency)
    managedObjectContext.persistentStoreCoordinator = NSPersistentStoreCoordinator(managedObjectModel: managedObjectModel())
    var error: NSError?
    managedObjectContext.persistentStoreCoordinator?.addPersistentStoreWithType(NSSQLiteStoreType, configuration: nil, URL: self.storeURL, options: nil, error: &error)
    if error != nil{
      println(error?.localizedDescription)
      println("rm \"\(self.storeURL.path))\"")
    }
    return managedObjectContext
  }
  
  func managedObjectModel() -> NSManagedObjectModel{
    return NSManagedObjectModel(contentsOfURL: self.modelURL)!
  }
  
}


