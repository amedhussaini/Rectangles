//
//  ViewController.swift
//  Rectangles
//
//  Created by Amed Hussaini on 9/12/18.
//  Copyright © 2018 Amed Hussaini. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    let box1 = TouchBox(frame: CGRect(x: 100, y: 100, width: 100, height: 100))
    let box2 = TouchBox(frame: CGRect(x: 200, y: 200, width: 100, height: 100))
    let box3 = TouchBox(frame: CGRect(x: 300, y: 300, width: 100, height: 100))
    let box4 = TouchBox(frame: CGRect(x: 0, y: 300, width: 100, height: 100))
    let box5 = TouchBox(frame: CGRect(x: 0, y: 400, width: 100, height: 100))
    let box6 = TouchBox(frame: CGRect(x: 0, y: 500, width: 100, height: 100))

    var boxes: [TouchBox]?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        let panGestureRecognizer = UIPanGestureRecognizer(target: self, action: #selector(didPanGestureRecognizer(gesture:)))
        view.addGestureRecognizer(panGestureRecognizer)
        
        //boxes = [box1, box2, box3, box4, box5, box6]
        // all of this would normally encapsulted in a nice class or factory method that would create these with function, but i got time constrained
        boxes = createRandomBoxes()
        
        if let boxes = self.boxes {
            for box in boxes {
                box.backgroundColor = UIColor.blue
                view.addSubview(box)
            }
        }


    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        //animate(box: boxView)
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @objc
    func didPanGestureRecognizer(gesture: UIPanGestureRecognizer) {
        
        // this prints out the coordinates of the pan in the corresponding view.  normally i'd check to confirm which gesture recognizer is recognized, but we only have one
        
        /*
         this is incredibly ugly and if i had more time I would have subclassed a UIView and internalized everything.  My first attempt was the wrong way to do it and had to throw up this ugly solution
 
 
         */
        
        let x = gesture.location(in: view).x
        let y = gesture.location(in: view).y
        
        if let boxes = self.boxes {
            for box in boxes {
                

                if box.isTouching(with: (Double(box.frame.origin.x), Double(box.frame.origin.y)), against: (Double(x), Double(y))) {
                    animate(box: box)
                }
            }
        }
        

        /*
        if (x > 100 && y > 100 && x < 200 && y < 200) {
            animate(box: box1)
        }
        if (x > 200 && y > 200 && x < 300 && y < 300) {
            animate(box: box2)
        }
        
        if (x > 300 && y > 300 && x < 400 && y < 400) {
            animate(box: box3)
        }
        
        if (x > 0 && y > 300 && x < 100 && y < 400) {
            animate(box: box4)
        }
        
        if (x > 0 && y > 400 && x < 100 && y < 500) {
            animate(box: box5)
        }
        
        if (x > 0 && y > 500 && x < 100 && y < 600) {
            animate(box: box6)
        }
         */

    }
    
    
    private func animate(box view: TouchBox) {
    
        // this should be a calayer keyframe animation instead to check if the animation is running, i ran out of time
        
        if !view.isAnimating {
            view.isAnimating = true
            UIView.animate(withDuration: 0.5, animations: {
                view.backgroundColor = UIColor.white
            }) { (completed) in
                if completed {
                    UIView.animate(withDuration: 0.5, animations: {
                        view.backgroundColor = UIColor.blue
                    }, completion: { (completed) in
                        if completed {
                            view.isAnimating = false
                        }
                    })
                }
            }
            
        }
        

        
    }
    private func createRandomBoxes() -> [TouchBox] {
        
        var boxes = [TouchBox]()
        
        for index in 0...20 {
            
            for index2 in 0...20 {
                print(index)
                print(index2)
                let box = TouchBox(frame: CGRect(x: 50*index2, y: 50*index, width: 50, height: 50))
                box.backgroundColor = UIColor.blue
                boxes.append(box)
                
            }
            

        }
        
        return boxes
        
    }
}

