//
//  ViewController.swift
//  alert0530
//
//  Created by Jo JANGHUI on 2018. 5. 30..
//  Copyright © 2018년 jhDAT. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    
    var countView = UILabel(frame: CGRect(x: 0, y: 0, width: 350, height: 300))
    let countButten = UIButton(frame: CGRect(x: 0 , y: 0, width: 300, height: 50))
    
    // 기본적인 버튼 모양 및 커스텀도 가능합니다.
//    let countStatButten = UIButton(type: UIButtonType.infoDark)
    var count = 0 {
        didSet {
            countView.text = "\(count)"
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        countButten.setTitle("Count Stat(normal)", for: .normal)
        countButten.setTitle("Count Stat(highlighted)", for: .highlighted)
        
        // .selected를 사용하기 위해서는 countButten.isSelected = !countButten.isSelected 를 클릭할때 넣어줘야 보입니다.
//        countButten.setTitle("Count Stat(selected)", for: .selected)
        
        countButten.setTitleColor(UIColor.white, for: .normal)
        countButten.backgroundColor = UIColor.black
        
        //touchDown - 컨트롤을 터치하면 동작
//        countButten.addTarget(self, action: #selector(showAlert(_:)), for: UIControlEvents.touchDown)
        
        //touchUpInside - 컨트롤 영역 안에서 터치후 뗏을때 동작
//        countButten.addTarget(self, action: #selector(showAlert(_:)), for: UIControlEvents.touchUpInside)
        
        //touchDownRepeat - 여러번 터치를 했을때 동작
        countButten.addTarget(self, action: #selector(showAlert(_:)), for: UIControlEvents.touchDownRepeat)
        
        //touchUpOutside - 컨트롤 영역 안에서 터치후 컨트롤 영역 밖에서 뗏을때 동작
//        countButten.addTarget(self, action: #selector(showAlert(_:)), for: UIControlEvents.touchUpOutside)
        
        //touchDragEnter - 터치 영역이 컨트롤의 일정 영역 바깥쪽으로 나갔다가 다시 들어왔을 때 동작
//        countButten.addTarget(self, action: #selector(showAlert(_:)), for: UIControlEvents.touchDragEnter)
        
        //touchDragExit - 터치 영역이 컨트롤의 일정 영역 바깥쪽으로 나갔을 때 동작
//        countButten.addTarget(self, action: #selector(showAlert(_:)), for: UIControlEvents.touchDragExit)
        
        //Button의 위치를 변경해줬습니다.
        countButten.frame.origin = CGPoint(x: view.center.x - 150, y: view.frame.minY + 50)
        view.addSubview(countButten)
        
        let blackView = UIView(frame: CGRect(x: 10 , y: view.frame.minY + 250, width: view.frame.width - 20, height: 300))
        blackView.backgroundColor = .black
        view.addSubview(blackView)

        countView.backgroundColor = .clear
        countView.textColor = .white
        countView.font = UIFont.boldSystemFont(ofSize: 50)
        countView.frame.origin = CGPoint(x: blackView.frame.midX - 25, y: blackView.frame.minY)
        countView.text = "Count"
        view.addSubview(countView)

    }
    
    
    
    @objc func showAlert(_ button: UIButton) {
        
        // UIAlertControllerStyle.actionSheet - actionSheet(아래서 올라오는)로 보여줍니다.
        let alertController = UIAlertController(title: "COUNT", message: "OK: + 1, Cancel: + 0", preferredStyle: UIAlertControllerStyle.actionSheet)
        
        // UIAlertControllerStyle.alert - alert 창으로 보여줍니다.
//        let alertController = UIAlertController(title: "COUNT", message: "OK: + 1, Cancel: + 0", preferredStyle: UIAlertControllerStyle.alert)


        let alertOk = UIAlertAction(title: "count + 1", style: UIAlertActionStyle.default) { (_) in
            
            self.count += 1
        }
        let alertCancel = UIAlertAction(title: "Cancel", style: UIAlertActionStyle.cancel) { (_) in
        }
        let alertReset = UIAlertAction(title: "Reset", style: UIAlertActionStyle.destructive) { (_) in
            self.count = 0
        }
        
        for alert in [alertOk, alertCancel, alertReset] {
            alertController.addAction(alert)
        }
        
        self.present(alertController, animated: true, completion: nil)
    }
}

