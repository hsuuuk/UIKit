//
//  ViewController.swift
//  CoreDataPractice
//
//  Created by 심현석 on 2023/02/07.
//

import UIKit
import CoreData

struct Person {
    var name: String
    var number: Int
}

class ViewController: UIViewController {
    
    let kai = Person(name: "심현석", number: 3820)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        fetchCoreData()
    }
    
    func saveCoreData() {
        
        // MARK: - 1. NSManagedObjectContext를 가져온다.
        
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        let context = appDelegate.persistentContainer.viewContext
        
        // MARK: - 2. Entity를 가져온다.(내가 어느 Entity에 저장하는지 알기 위해서)
        
        let entity = NSEntityDescription.entity(forEntityName: "Contact", in: context)
        
        // MARK: - 3. NSManagedObject를 만든다.
        
        if let entity = entity {
            let person = NSManagedObject(entity: entity, insertInto: context)
            
            // MARK: - 4. NSManagedObject에 값을 세팅해준다.
            
            person.setValue(kai.name, forKey: "name")
            person.setValue(kai.number, forKey: "number")
            
            // MARK: - 5. NSManagedObjectContext를 저장한다.
            
            do {
                try context.save()
            } catch {
                print(error.localizedDescription)
            }
        }
    }
    
    func fetchCoreData() {
        saveCoreData()
        
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        let context = appDelegate.persistentContainer.viewContext
        
        do {
            let contact = try context.fetch(Contact.fetchRequest()) as! [Contact]
            contact.forEach {
                print($0.name)
            }
        } catch {
            print(error.localizedDescription)
        }
    }
    
    func deleteCoreData() {
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        let context = appDelegate.persistentContainer.viewContext

        do {
            let contact = try context.fetch(Contact.fetchRequest()) as! [Contact]
            if let target = contact.last {
                context.delete(target)
            }
            try context.save()
            
            contact.forEach {
                print($0.name)
            }
        } catch {
            print(error.localizedDescription)
        }
    }
}
