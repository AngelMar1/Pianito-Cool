//
//  ViewController.swift
//  Piano (prueba 1)
//
//  Created by Angel Mar on 27/12/22.
//

import UIKit
import AVFoundation
import SwiftUI

class ViewController: UIViewController {
    
    var player1 =  AVAudioPlayer()
    var player2 =  AVAudioPlayer()
    var player3 =  AVAudioPlayer()
    var player4 =  AVAudioPlayer()
    var player5 =  AVAudioPlayer()
    var player6 =  AVAudioPlayer()
    var player7 =  AVAudioPlayer()
    var player8 =  AVAudioPlayer()
    var player9 =  AVAudioPlayer()
    
    var playerlayer = AVPlayerLayer()
    
    @IBOutlet var notes: [UIButton]!
    @IBOutlet var C3: UIButton!
    @IBOutlet var Csos3: UIButton!
    @IBOutlet var D3: UIButton!
    @IBOutlet var Dsos3: UIButton!
    @IBOutlet var E3: UIButton!
    @IBOutlet var F3: UIButton!
    @IBOutlet var Fsos3: UIButton!
    @IBOutlet var G3: UIButton!
    @IBOutlet var Gsos3: UIButton!
    @IBOutlet var A3: UIButton!
    @IBOutlet var Asos3: UIButton!
    @IBOutlet var B3: UIButton!
    @IBOutlet var C4: UIButton!
    @IBOutlet var Csos4: UIButton!
    @IBOutlet var D4: UIButton!
    @IBOutlet var Dsos4: UIButton!
    @IBOutlet var E4: UIButton!
    @IBOutlet var F4: UIButton!
    @IBOutlet var Fsos4: UIButton!
    @IBOutlet var G4: UIButton!
    @IBOutlet var Gsos4: UIButton!
    @IBOutlet var A4: UIButton!
    @IBOutlet var Asos4: UIButton!
    @IBOutlet var B4: UIButton!
    @IBOutlet var C5: UIButton!

    @IBOutlet var SwitchChords : UISwitch!
    
    @IBOutlet private weak var menuButton: UIButton!
    @IBOutlet private weak var menuClassButton: UIButton!
    @IBOutlet private weak var playButton: UIButton!
    
    @IBOutlet weak var TappedPlay: UIButton!
    
    var typeChords = 1

    let references = ["C3","C#3","D3","D#3","E3","F3","F#3","G3","G#3","A3","A#3","B3","C4","C#4","D4","D#4","E4","F4","F#4","G4","G#4","A4","A#4","B4","C5"]
    
    @IBAction func mode(_ sender: Any) {
        if(SwitchChords.isOn ){
            menuButton.isEnabled = true
            C4.isEnabled = false
            Csos4.isEnabled = false
            D4.isEnabled = false
            Dsos4.isEnabled = false
            E4.isEnabled = false
            F4.isEnabled = false
            Fsos4.isEnabled = false
            G4.isEnabled = false
            Gsos4.isEnabled = false
            A4.isEnabled = false
            Asos4.isEnabled = false
            B4.isEnabled = false
            C5.isEnabled = false
        }
        else
        {
            menuButton.isEnabled = false
            B3.isEnabled = true
            C4.isEnabled = true
            Csos4.isEnabled = true
            D4.isEnabled = true
            Dsos4.isEnabled = true
            E4.isEnabled = true
            F4.isEnabled = true
            Fsos4.isEnabled = true
            G4.isEnabled = true
            Gsos4.isEnabled = true
            A4.isEnabled = true
            Asos4.isEnabled = true
            B4.isEnabled = true
            C5.isEnabled = true
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let menu = UIMenu(title: "", children: [
            UIAction(title: "Major", handler: {_ in self.typeChords = 1}),
            UIAction(title: "Minor",  handler: {_ in self.typeChords = 2}),
            UIAction(title: "Dim",  handler: {_ in self.typeChords = 3}),
            UIAction(title: "sus2",  handler: {_ in self.typeChords = 4}),
            UIAction(title: "sus4",  handler: {_ in self.typeChords = 5}),
            UIAction(title: "Maj7",  handler: {_ in self.typeChords = 6}),
            UIAction(title: "7",  handler: {_ in self.typeChords = 7}),
            UIAction(title: "Scale Major",  handler: {_ in self.typeChords = 8}),
            UIAction(title: "Scale Minor",  handler: {_ in self.typeChords = 9}),
            ])
        
        let menu2 = UIMenu(title: "", children: [
            UIAction(title: "Class 1",  handler: {_ in self.playVideo()}),
            UIAction(title: "Class 2",  handler: {_ in self.playVideo()}),
            UIAction(title: "Class 3",  handler: {_ in self.playVideo()}),
            UIAction(title: "Class 4",  handler: {_ in self.playVideo()}),
            UIAction(title: "Class 5",  handler: {_ in self.playVideo()}),
            UIAction(title: "Class 6",  handler: {_ in self.playVideo()}),
            UIAction(title: "Class 7",  handler: {_ in self.playVideo()}),
            UIAction(title: "Class 8",  handler: {_ in self.playVideo()}),
            UIAction(title: "Class 9",  handler: {_ in self.playVideo()}),
            ])

        self.menuButton.menu = menu
        self.menuButton.showsMenuAsPrimaryAction = true
        
        self.menuClassButton.menu = menu2
        self.menuClassButton.showsMenuAsPrimaryAction = true

      //  setTypeChorde()
        // Do any additional setup after loading the view.
    }
    
    override func viewWillTransition(to size: CGSize, with coordinator: UIViewControllerTransitionCoordinator) {
        playerlayer.frame = CGRect(x: 0, y: 0, width: size.width, height: size.height)
    }
    
    @IBAction func Chords(_ sender: UIButton) {
        if SwitchChords.isOn {
            print("\(self.typeChords)")
            switch self.typeChords {
            case 1:
                playChordMajor(note: notes.firstIndex(of: sender)! + 1)
                break
            case 2:
                playChordMinor(note: notes.firstIndex(of: sender)! + 1)
                break
            case 3:
                playChordDim(note: notes.firstIndex(of: sender)! + 1)
                break
            case 4:
                playChordsus2(note: notes.firstIndex(of: sender)! + 1)
                break
            case 5:
                playChordsus4(note: notes.firstIndex(of: sender)! + 1)
                break
            case 6:
                playChordMaj7(note: notes.firstIndex(of: sender)! + 1)
                break
            case 7:
                playChord7(note: notes.firstIndex(of: sender)! + 1)
                break
            case 8:
                playScaleMajor(note: notes.firstIndex(of: sender)! + 1)
                break
            case 9:
                playScaleMinor(note: notes.firstIndex(of: sender)! + 1)
                break
            case 10:
                playScaleMinor(note: notes.firstIndex(of: sender)! + 1)
                break
            default:
                playChordMajor(note: notes.firstIndex(of: sender)! + 1)
                break
            }
        } else
        {
            playSound(note: notes.firstIndex(of: sender)! + 1)
            ChangeColorNotes(sender)
        }
    }
    
    //___________class______________//
    
    func playVideo () {
        let videoURL = URL (string: "https://www.sarmientos.app/VideoMPOO/Class1.mp4")
        let player = AVPlayer(url: videoURL!)
        playerlayer = AVPlayerLayer(player: player)
        playerlayer.frame = self.view.bounds
        playerlayer.videoGravity = .resizeAspect
        self.view.layer.addSublayer(playerlayer)
        player.play()
    }
    
    @IBAction func playPractice(_ sender: Any) {
        Practice(note: 1)
    }
    
    
    func Practice (note: Int) {
        let references1 = references [note + 15]
        let references2 = references [note + 14]
        let references3 = references [note + 15]
        let references4 = references [note + 14]
        let references5 = references [note + 15]
        let references6 = references [note + 10]
        let references7 = references [note + 13]
        let references8 = references [note + 11]
        let references9 = references [note + 8]
        
        guard let url1 = Bundle.main.url(forResource: references1, withExtension: "wav")
        else { return }
        guard let url2 = Bundle.main.url(forResource: references2, withExtension: "wav")
        else { return }
        guard let url3 = Bundle.main.url(forResource: references3, withExtension: "wav")
        else { return }
        guard let url4 = Bundle.main.url(forResource: references4, withExtension: "wav")
        else { return }
        guard let url5 = Bundle.main.url(forResource: references5, withExtension: "wav")
        else { return }
        guard let url6 = Bundle.main.url(forResource: references6, withExtension: "wav")
        else { return }
        guard let url7 = Bundle.main.url(forResource: references7, withExtension: "wav")
        else { return }
        guard let url8 = Bundle.main.url(forResource: references8, withExtension: "wav")
        else { return }
        guard let url9 = Bundle.main.url(forResource: references9, withExtension: "wav")
        else { return }
        
        print(references1,references2,references3,references4,references5,references6,references7,references8)
        player1 = try! AVAudioPlayer(contentsOf: url1)
        DispatchQueue.main.asyncAfter(deadline: .now() + 0) {
            self.player1.play() }
        player2 = try! AVAudioPlayer(contentsOf: url2)
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.4) {
            self.player2.play() }
        player3 = try! AVAudioPlayer(contentsOf: url3)
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.8) {
            self.player3.play() }
        player4 = try! AVAudioPlayer(contentsOf: url4)
        DispatchQueue.main.asyncAfter(deadline: .now() + 1.2) {
            self.player4.play() }
        player5 = try! AVAudioPlayer(contentsOf: url5)
        DispatchQueue.main.asyncAfter(deadline: .now() + 1.6) {
            self.player5.play() }
        player6 = try! AVAudioPlayer(contentsOf: url6)
        DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
            self.player6.play() }
        player7 = try! AVAudioPlayer(contentsOf: url7)
        DispatchQueue.main.asyncAfter(deadline: .now() + 2.4) {
            self.player7.play() }
        player8 = try! AVAudioPlayer(contentsOf: url8)
        DispatchQueue.main.asyncAfter(deadline: .now() + 2.8) {
            self.player8.play() }
        player9 = try! AVAudioPlayer(contentsOf: url9)
        DispatchQueue.main.asyncAfter(deadline: .now() + 3.2) {
            self.player9.play() }
        
        ChangeColorScale(E4)
        ChangeColorScale2(Dsos4)
        ChangeColorScale3(E4)
        ChangeColorScale4(Dsos4)
        ChangeColorScale5(E4)
        ChangeColorScale6(B3)
        ChangeColorScale7(D4)
        ChangeColorScale8(C4)
        ChangeColorScale9(A3)
    }
    
    //____________Notes______________//
    
    func ChangeColorNotes (_ sender: UIButton) {
        let colorOrig = sender.backgroundColor
        if sender.isEnabled {
        sender.backgroundColor = .orange
        sender.alpha = 0.8
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.3) {
            sender.backgroundColor = colorOrig }
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.3) {
            sender.alpha = 1.0 }
        } else {
            sender.isEnabled = true
            sender.backgroundColor = .orange
            sender.alpha = 0.8
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.3) {
                sender.backgroundColor = colorOrig }
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.3) {
                sender.alpha = 1.0 }
            sender.isEnabled = false
        }
    }
    
    func playSound(note: Int) {
        print(note,references[note - 1])
        let references = references [note - 1]
        guard let url = Bundle.main.url(forResource: references, withExtension: "wav")
        else { return }
        print (references)
        player1 = try! AVAudioPlayer(contentsOf: url)
        player1.play()
    }
    
    //____________Chords______________//
    
    func ChangeColorChords (_ sender: UIButton) {
        let colorOrig = sender.backgroundColor
        if sender.isEnabled {
        sender.backgroundColor = .orange
        sender.alpha = 0.8
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
            sender.backgroundColor = colorOrig }
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
            sender.alpha = 1.0 }
        } else {
            sender.isEnabled = true
            sender.backgroundColor = .orange
            sender.alpha = 0.8
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
                sender.backgroundColor = colorOrig }
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
                sender.alpha = 1.0 }
            sender.isEnabled = false
        }
    }

    func playChordMajor(note: Int) {
        let references1 = references [note - 1]
        let references3 = references [note + 3]
        let references5 = references [note + 6]
        guard let url1 = Bundle.main.url(forResource: references1, withExtension: "wav")
        else { return }
        guard let url2 = Bundle.main.url(forResource: references3, withExtension: "wav")
        else { return }
        guard let url3 = Bundle.main.url(forResource: references5, withExtension: "wav")
        else { return }
        print (references1,references3,references5)
        player1 = try! AVAudioPlayer(contentsOf: url1)
        player1.play()
        player2 = try! AVAudioPlayer(contentsOf: url2)
        player2.play()
        player3 = try! AVAudioPlayer(contentsOf: url3)
        player3.play()
        
        switch note {
        case 1:
            ChangeColorChords(C3)
            ChangeColorChords(E3)
            ChangeColorChords(G3)
            break
        case 2:
            ChangeColorChords(Csos3)
            ChangeColorChords(F3)
            ChangeColorChords(Gsos3)
            break
        case 3:
            ChangeColorChords(D3)
            ChangeColorChords(Fsos3)
            ChangeColorChords(A3)
            break
        case 4:
            ChangeColorChords(Dsos3)
            ChangeColorChords(G3)
            ChangeColorChords(Asos3)
            break
        case 5:
            ChangeColorChords(E3)
            ChangeColorChords(Gsos3)
            ChangeColorChords(B3)
            break
        case 6:
            ChangeColorChords(F3)
            ChangeColorChords(A3)
            ChangeColorChords(C4)
            break
        case 7:
            ChangeColorChords(Fsos3)
            ChangeColorChords(Asos3)
            ChangeColorChords(Csos4)
            break
        case 8:
            ChangeColorChords(G3)
            ChangeColorChords(B3)
            ChangeColorChords(D4)
            break
        case 9:
            ChangeColorChords(Gsos3)
            ChangeColorChords(C4)
            ChangeColorChords(Dsos4)
            break
        case 10:
            ChangeColorChords(A3)
            ChangeColorChords(Csos4)
            ChangeColorChords(E4)
            break
        case 11:
            ChangeColorChords(Asos3)
            ChangeColorChords(D4)
            ChangeColorChords(F4)
            break
        case 12:
            ChangeColorChords(B3)
            ChangeColorChords(Dsos4)
            ChangeColorChords(Fsos4)
            break
        default:
            return
        }
    }
    
    func playChordMinor(note: Int) {
        let references1 = references [note - 1]
        let references3 = references [note + 2]
        let references5 = references [note + 6]
        guard let url1 = Bundle.main.url(forResource: references1, withExtension: "wav")
        else { return }
        guard let url2 = Bundle.main.url(forResource: references3, withExtension: "wav")
        else { return }
        guard let url3 = Bundle.main.url(forResource: references5, withExtension: "wav")
        else { return }
        print (references1,references3,references5)
        player1 = try! AVAudioPlayer(contentsOf: url1)
        player1.play()
        player2 = try! AVAudioPlayer(contentsOf: url2)
        player2.play()
        player3 = try! AVAudioPlayer(contentsOf: url3)
        player3.play()
        
        switch note {
        case 1:
            ChangeColorChords(C3)
            ChangeColorChords(Dsos3)
            ChangeColorChords(G3)
            break
        case 2:
            ChangeColorChords(Csos3)
            ChangeColorChords(E3)
            ChangeColorChords(Gsos3)
            break
        case 3:
            ChangeColorChords(D3)
            ChangeColorChords(F3)
            ChangeColorChords(A3)
            break
        case 4:
            ChangeColorChords(Dsos3)
            ChangeColorChords(Fsos3)
            ChangeColorChords(Asos3)
            break
        case 5:
            ChangeColorChords(E3)
            ChangeColorChords(G3)
            ChangeColorChords(B3)
            break
        case 6:
            ChangeColorChords(F3)
            ChangeColorChords(Gsos3)
            ChangeColorChords(C4)
            break
        case 7:
            ChangeColorChords(Fsos3)
            ChangeColorChords(A3)
            ChangeColorChords(Csos4)
            break
        case 8:
            ChangeColorChords(G3)
            ChangeColorChords(Asos3)
            ChangeColorChords(D4)
            break
        case 9:
            ChangeColorChords(Gsos3)
            ChangeColorChords(B3)
            ChangeColorChords(Dsos4)
            break
        case 10:
            ChangeColorChords(A3)
            ChangeColorChords(C4)
            ChangeColorChords(E4)
            break
        case 11:
            ChangeColorChords(Asos3)
            ChangeColorChords(Csos4)
            ChangeColorChords(F4)
            break
        case 12:
            ChangeColorChords(B3)
            ChangeColorChords(D4)
            ChangeColorChords(Fsos4)
            break
        default:
            return
        }
    }
    
    func playChordDim (note: Int) {
        let references1 = references [note - 1]
        let references3 = references [note + 2]
        let references5 = references [note + 5]
        guard let url1 = Bundle.main.url(forResource: references1, withExtension: "wav")
        else { return }
        guard let url2 = Bundle.main.url(forResource: references3, withExtension: "wav")
        else { return }
        guard let url3 = Bundle.main.url(forResource: references5, withExtension: "wav")
        else { return }
        print (references1,references3,references5)
        player1 = try! AVAudioPlayer(contentsOf: url1)
        player1.play()
        player2 = try! AVAudioPlayer(contentsOf: url2)
        player2.play()
        player3 = try! AVAudioPlayer(contentsOf: url3)
        player3.play()
        
        switch note {
        case 1:
            ChangeColorChords(C3)
            ChangeColorChords(Dsos3)
            ChangeColorChords(Fsos3)
            break
        case 2:
            ChangeColorChords(Csos3)
            ChangeColorChords(E3)
            ChangeColorChords(G3)
            break
        case 3:
            ChangeColorChords(D3)
            ChangeColorChords(F3)
            ChangeColorChords(Gsos3)
            break
        case 4:
            ChangeColorChords(Dsos3)
            ChangeColorChords(Fsos3)
            ChangeColorChords(A3)
            break
        case 5:
            ChangeColorChords(E3)
            ChangeColorChords(G3)
            ChangeColorChords(Asos3)
            break
        case 6:
            ChangeColorChords(F3)
            ChangeColorChords(Gsos3)
            ChangeColorChords(B3)
            break
        case 7:
            ChangeColorChords(Fsos3)
            ChangeColorChords(A3)
            ChangeColorChords(C4)
            break
        case 8:
            ChangeColorChords(G3)
            ChangeColorChords(Asos3)
            ChangeColorChords(Csos4)
            break
        case 9:
            ChangeColorChords(Gsos3)
            ChangeColorChords(B3)
            ChangeColorChords(D4)
            break
        case 10:
            ChangeColorChords(A3)
            ChangeColorChords(C4)
            ChangeColorChords(Dsos4)
            break
        case 11:
            ChangeColorChords(Asos3)
            ChangeColorChords(Csos4)
            ChangeColorChords(E4)
            break
        case 12:
            ChangeColorChords(B3)
            ChangeColorChords(D4)
            ChangeColorChords(F4)
            break
        default:
            return
        }
    }
    
    func playChordsus2 (note: Int) {
        let references1 = references [note - 1]
        let references3 = references [note + 1]
        let references5 = references [note + 6]
        guard let url1 = Bundle.main.url(forResource: references1, withExtension: "wav")
        else { return }
        guard let url2 = Bundle.main.url(forResource: references3, withExtension: "wav")
        else { return }
        guard let url3 = Bundle.main.url(forResource: references5, withExtension: "wav")
        else { return }
        print (references1,references3,references5)
        player1 = try! AVAudioPlayer(contentsOf: url1)
        player1.play()
        player2 = try! AVAudioPlayer(contentsOf: url2)
        player2.play()
        player3 = try! AVAudioPlayer(contentsOf: url3)
        player3.play()
        
        switch note {
        case 1:
            ChangeColorChords(C3)
            ChangeColorChords(D3)
            ChangeColorChords(G3)
            break
        case 2:
            ChangeColorChords(Csos3)
            ChangeColorChords(Dsos3)
            ChangeColorChords(Gsos3)
            break
        case 3:
            ChangeColorChords(D3)
            ChangeColorChords(E3)
            ChangeColorChords(A3)
            break
        case 4:
            ChangeColorChords(Dsos3)
            ChangeColorChords(F3)
            ChangeColorChords(Asos3)
            break
        case 5:
            ChangeColorChords(E3)
            ChangeColorChords(Fsos3)
            ChangeColorChords(B3)
            break
        case 6:
            ChangeColorChords(F3)
            ChangeColorChords(G3)
            ChangeColorChords(C4)
            break
        case 7:
            ChangeColorChords(Fsos3)
            ChangeColorChords(Gsos3)
            ChangeColorChords(Csos4)
            break
        case 8:
            ChangeColorChords(G3)
            ChangeColorChords(A3)
            ChangeColorChords(D4)
            break
        case 9:
            ChangeColorChords(Gsos3)
            ChangeColorChords(Asos4)
            ChangeColorChords(Dsos4)
            break
        case 10:
            ChangeColorChords(A3)
            ChangeColorChords(B4)
            ChangeColorChords(E4)
            break
        case 11:
            ChangeColorChords(Asos3)
            ChangeColorChords(C4)
            ChangeColorChords(F4)
            break
        case 12:
            ChangeColorChords(B3)
            ChangeColorChords(Csos4)
            ChangeColorChords(Fsos4)
            break
        default:
            return
        }
    }
    
    func playChordsus4 (note: Int) {
        let references1 = references [note - 1]
        let references3 = references [note + 4]
        let references5 = references [note + 6]
        guard let url1 = Bundle.main.url(forResource: references1, withExtension: "wav")
        else { return }
        guard let url2 = Bundle.main.url(forResource: references3, withExtension: "wav")
        else { return }
        guard let url3 = Bundle.main.url(forResource: references5, withExtension: "wav")
        else { return }
        print (references1,references3,references5)
        player1 = try! AVAudioPlayer(contentsOf: url1)
        player1.play()
        player2 = try! AVAudioPlayer(contentsOf: url2)
        player2.play()
        player3 = try! AVAudioPlayer(contentsOf: url3)
        player3.play()
        
        switch note {
        case 1:
            ChangeColorChords(C3)
            ChangeColorChords(F3)
            ChangeColorChords(G3)
            break
        case 2:
            ChangeColorChords(Csos3)
            ChangeColorChords(Fsos3)
            ChangeColorChords(Gsos3)
            break
        case 3:
            ChangeColorChords(D3)
            ChangeColorChords(G3)
            ChangeColorChords(A3)
            break
        case 4:
            ChangeColorChords(Dsos3)
            ChangeColorChords(Gsos3)
            ChangeColorChords(Asos3)
            break
        case 5:
            ChangeColorChords(E3)
            ChangeColorChords(A3)
            ChangeColorChords(B3)
            break
        case 6:
            ChangeColorChords(F3)
            ChangeColorChords(Asos3)
            ChangeColorChords(C4)
            break
        case 7:
            ChangeColorChords(Fsos3)
            ChangeColorChords(B3)
            ChangeColorChords(Csos4)
            break
        case 8:
            ChangeColorChords(G3)
            ChangeColorChords(C4)
            ChangeColorChords(D4)
            break
        case 9:
            ChangeColorChords(Gsos3)
            ChangeColorChords(Csos4)
            ChangeColorChords(Dsos4)
            break
        case 10:
            ChangeColorChords(A3)
            ChangeColorChords(D4)
            ChangeColorChords(E4)
            break
        case 11:
            ChangeColorChords(Asos3)
            ChangeColorChords(Dsos4)
            ChangeColorChords(F4)
            break
        case 12:
            ChangeColorChords(B3)
            ChangeColorChords(E4)
            ChangeColorChords(Fsos4)
            break
        default:
            return
        }
    }
    
    func playChordMaj7 (note: Int) {
        let references1 = references [note - 1]
        let references3 = references [note + 3]
        let references5 = references [note + 6]
        let references7 = references [note + 10]
        guard let url1 = Bundle.main.url(forResource: references1, withExtension: "wav")
        else { return }
        guard let url2 = Bundle.main.url(forResource: references3, withExtension: "wav")
        else { return }
        guard let url3 = Bundle.main.url(forResource: references5, withExtension: "wav")
        else { return }
        guard let url4 = Bundle.main.url(forResource: references5, withExtension: "wav")
        else { return }
        print (references1,references3,references5,references7)
        player1 = try! AVAudioPlayer(contentsOf: url1)
        player1.play()
        player2 = try! AVAudioPlayer(contentsOf: url2)
        player2.play()
        player3 = try! AVAudioPlayer(contentsOf: url3)
        player3.play()
        player4 = try! AVAudioPlayer(contentsOf: url4)
        player4.play()
        
        switch note {
        case 1:
            ChangeColorChords(C3)
            ChangeColorChords(E3)
            ChangeColorChords(G3)
            ChangeColorChords(B3)
            break
        case 2:
            ChangeColorChords(Csos3)
            ChangeColorChords(F3)
            ChangeColorChords(Gsos3)
            ChangeColorChords(C4)
            break
        case 3:
            ChangeColorChords(D3)
            ChangeColorChords(Fsos3)
            ChangeColorChords(A3)
            ChangeColorChords(Csos4)
            break
        case 4:
            ChangeColorChords(Dsos3)
            ChangeColorChords(G3)
            ChangeColorChords(Asos3)
            ChangeColorChords(D4)
            break
        case 5:
            ChangeColorChords(E3)
            ChangeColorChords(Gsos3)
            ChangeColorChords(B3)
            ChangeColorChords(Dsos4)
            break
        case 6:
            ChangeColorChords(F3)
            ChangeColorChords(A3)
            ChangeColorChords(C4)
            ChangeColorChords(E4)
            break
        case 7:
            ChangeColorChords(Fsos3)
            ChangeColorChords(Asos3)
            ChangeColorChords(Csos4)
            ChangeColorChords(F4)
            break
        case 8:
            ChangeColorChords(G3)
            ChangeColorChords(B3)
            ChangeColorChords(D4)
            ChangeColorChords(Fsos4)
            break
        case 9:
            ChangeColorChords(Gsos3)
            ChangeColorChords(C4)
            ChangeColorChords(Dsos4)
            ChangeColorChords(G4)
            break
        case 10:
            ChangeColorChords(A3)
            ChangeColorChords(Csos4)
            ChangeColorChords(E4)
            ChangeColorChords(Gsos4)
            break
        case 11:
            ChangeColorChords(Asos3)
            ChangeColorChords(D4)
            ChangeColorChords(F4)
            ChangeColorChords(A4)
            break
        case 12:
            ChangeColorChords(B3)
            ChangeColorChords(Dsos4)
            ChangeColorChords(Fsos4)
            ChangeColorChords(Asos4)
            break
        default:
            return
        }
    }
    
    func playChord7 (note: Int) {
        let references1 = references [note - 1]
        let references3 = references [note + 3]
        let references5 = references [note + 6]
        let references7 = references [note + 9]
        guard let url1 = Bundle.main.url(forResource: references1, withExtension: "wav")
        else { return }
        guard let url2 = Bundle.main.url(forResource: references3, withExtension: "wav")
        else { return }
        guard let url3 = Bundle.main.url(forResource: references5, withExtension: "wav")
        else { return }
        guard let url4 = Bundle.main.url(forResource: references5, withExtension: "wav")
        else { return }
        print (references1,references3,references5,references7)
        player1 = try! AVAudioPlayer(contentsOf: url1)
        player1.play()
        player2 = try! AVAudioPlayer(contentsOf: url2)
        player2.play()
        player3 = try! AVAudioPlayer(contentsOf: url3)
        player3.play()
        player4 = try! AVAudioPlayer(contentsOf: url4)
        player4.play()
        
        switch note {
        case 1:
            ChangeColorChords(C3)
            ChangeColorChords(E3)
            ChangeColorChords(G3)
            ChangeColorChords(Asos3)
            break
        case 2:
            ChangeColorChords(Csos3)
            ChangeColorChords(F3)
            ChangeColorChords(Gsos3)
            ChangeColorChords(B3)
            break
        case 3:
            ChangeColorChords(D3)
            ChangeColorChords(Fsos3)
            ChangeColorChords(A3)
            ChangeColorChords(C4)
            break
        case 4:
            ChangeColorChords(Dsos3)
            ChangeColorChords(G3)
            ChangeColorChords(Asos3)
            ChangeColorChords(Csos4)
            break
        case 5:
            ChangeColorChords(E3)
            ChangeColorChords(Gsos3)
            ChangeColorChords(B3)
            ChangeColorChords(D4)
            break
        case 6:
            ChangeColorChords(F3)
            ChangeColorChords(A3)
            ChangeColorChords(C4)
            ChangeColorChords(Dsos4)
            break
        case 7:
            ChangeColorChords(Fsos3)
            ChangeColorChords(Asos3)
            ChangeColorChords(Csos4)
            ChangeColorChords(E4)
            break
        case 8:
            ChangeColorChords(G3)
            ChangeColorChords(B3)
            ChangeColorChords(D4)
            ChangeColorChords(F4)
            break
        case 9:
            ChangeColorChords(Gsos3)
            ChangeColorChords(C4)
            ChangeColorChords(Dsos4)
            ChangeColorChords(Fsos4)
            break
        case 10:
            ChangeColorChords(A3)
            ChangeColorChords(Csos4)
            ChangeColorChords(E4)
            ChangeColorChords(G4)
            break
        case 11:
            ChangeColorChords(Asos3)
            ChangeColorChords(D4)
            ChangeColorChords(F4)
            ChangeColorChords(Gsos4)
            break
        case 12:
            ChangeColorChords(B3)
            ChangeColorChords(Dsos4)
            ChangeColorChords(Fsos4)
            ChangeColorChords(A4)
            break
        default:
            return
        }
    }
    
    //____________Scales______________//
    
    func ChangeColorScale (_ sender: UIButton) {
        let colorOrig = sender.backgroundColor
        if sender.isEnabled {
        DispatchQueue.main.asyncAfter(deadline: .now() + 0) {
            sender.backgroundColor = .systemBlue }
        DispatchQueue.main.asyncAfter(deadline: .now() + 0) {
            sender.alpha = 1 }
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.4) {
                sender.backgroundColor = colorOrig }
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.4) {
                sender.alpha = 1 }
        } else {
            sender.isEnabled = true
            DispatchQueue.main.asyncAfter(deadline: .now() + 0) {
                sender.backgroundColor = .systemBlue }
            DispatchQueue.main.asyncAfter(deadline: .now() + 0) {
                sender.alpha = 1 }
                DispatchQueue.main.asyncAfter(deadline: .now() + 0.4) {
                    sender.backgroundColor = colorOrig }
                DispatchQueue.main.asyncAfter(deadline: .now() + 0.4) {
                    sender.alpha = 1 }
            sender.isEnabled = false
        }
    }
    
    func ChangeColorScale2 (_ sender: UIButton) {
        let colorOrig = sender.backgroundColor
        if sender.isEnabled {
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.4) {
            sender.backgroundColor = .systemBlue }
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.4) {
            sender.alpha = 1 }
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.8) {
                sender.backgroundColor = colorOrig }
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.8) {
                sender.alpha = 1 }
        } else {
            sender.isEnabled = true
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.4) {
                sender.backgroundColor = .systemBlue }
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.4) {
                sender.alpha = 1 }
                DispatchQueue.main.asyncAfter(deadline: .now() + 0.8) {
                    sender.backgroundColor = colorOrig }
                DispatchQueue.main.asyncAfter(deadline: .now() + 0.8) {
                    sender.alpha = 1 }
            sender.isEnabled = false
        }
    }
    
    func ChangeColorScale3 (_ sender: UIButton) {
        let colorOrig = sender.backgroundColor
        if sender.isEnabled {
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.8) {
            sender.backgroundColor = .systemBlue }
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.8) {
            sender.alpha = 1 }
            DispatchQueue.main.asyncAfter(deadline: .now() + 1.2) {
                sender.backgroundColor = colorOrig }
            DispatchQueue.main.asyncAfter(deadline: .now() + 1.2) {
                sender.alpha = 1 }
        } else {
            sender.isEnabled = true
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.8) {
                sender.backgroundColor = .systemBlue }
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.8) {
                sender.alpha = 1 }
                DispatchQueue.main.asyncAfter(deadline: .now() + 1.2) {
                    sender.backgroundColor = colorOrig }
                DispatchQueue.main.asyncAfter(deadline: .now() + 1.2) {
                    sender.alpha = 1 }
            sender.isEnabled = false
        }
    }
    
    func ChangeColorScale4 (_ sender: UIButton) {
        let colorOrig = sender.backgroundColor
        if sender.isEnabled {
            DispatchQueue.main.asyncAfter(deadline: .now() + 1.2) {
            sender.backgroundColor = .systemBlue }
            DispatchQueue.main.asyncAfter(deadline: .now() + 1.2) {
            sender.alpha = 1 }
            DispatchQueue.main.asyncAfter(deadline: .now() + 1.6) {
                sender.backgroundColor = colorOrig }
            DispatchQueue.main.asyncAfter(deadline: .now() + 1.6) {
                sender.alpha = 1 }
        } else {
            sender.isEnabled = true
            DispatchQueue.main.asyncAfter(deadline: .now() + 1.2) {
                sender.backgroundColor = .systemBlue }
            DispatchQueue.main.asyncAfter(deadline: .now() + 1.2) {
                sender.alpha = 1 }
            DispatchQueue.main.asyncAfter(deadline: .now() + 1.6) {
                    sender.backgroundColor = colorOrig }
            DispatchQueue.main.asyncAfter(deadline: .now() + 1.6) {
                    sender.alpha = 1 }
            sender.isEnabled = false
        }
    }
    
    func ChangeColorScale5 (_ sender: UIButton) {
        let colorOrig = sender.backgroundColor
        if sender.isEnabled {
            DispatchQueue.main.asyncAfter(deadline: .now() + 1.6) {
            sender.backgroundColor = .systemBlue }
            DispatchQueue.main.asyncAfter(deadline: .now() + 1.6) {
            sender.alpha = 1 }
            DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
                sender.backgroundColor = colorOrig }
            DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
                sender.alpha = 1 }
        } else {
            sender.isEnabled = true
            DispatchQueue.main.asyncAfter(deadline: .now() + 1.6) {
                sender.backgroundColor = .systemBlue }
            DispatchQueue.main.asyncAfter(deadline: .now() + 1.6) {
                sender.alpha = 1 }
            DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
                    sender.backgroundColor = colorOrig }
            DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
                    sender.alpha = 1 }
            sender.isEnabled = false
        }
    }
    
    func ChangeColorScale6 (_ sender: UIButton) {
        let colorOrig = sender.backgroundColor
        if sender.isEnabled {
            DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
            sender.backgroundColor = .systemBlue }
            DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
            sender.alpha = 1 }
            DispatchQueue.main.asyncAfter(deadline: .now() + 2.4) {
                sender.backgroundColor = colorOrig }
            DispatchQueue.main.asyncAfter(deadline: .now() + 2.4) {
                sender.alpha = 1 }
        } else {
            sender.isEnabled = true
            DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
                sender.backgroundColor = .systemBlue }
            DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
                sender.alpha = 1 }
            DispatchQueue.main.asyncAfter(deadline: .now() + 2.4) {
                    sender.backgroundColor = colorOrig }
            DispatchQueue.main.asyncAfter(deadline: .now() + 2.4) {
                    sender.alpha = 1 }
            sender.isEnabled = false
        }
    }
    
    func ChangeColorScale7 (_ sender: UIButton) {
        let colorOrig = sender.backgroundColor
        if sender.isEnabled {
            DispatchQueue.main.asyncAfter(deadline: .now() + 2.4) {
            sender.backgroundColor = .systemBlue }
            DispatchQueue.main.asyncAfter(deadline: .now() + 2.4) {
            sender.alpha = 1 }
            DispatchQueue.main.asyncAfter(deadline: .now() + 2.8) {
                sender.backgroundColor = colorOrig }
            DispatchQueue.main.asyncAfter(deadline: .now() + 2.8) {
                sender.alpha = 1 }
        } else {
            sender.isEnabled = true
            DispatchQueue.main.asyncAfter(deadline: .now() + 2.4) {
                sender.backgroundColor = .systemBlue }
            DispatchQueue.main.asyncAfter(deadline: .now() + 2.4) {
                sender.alpha = 1 }
            DispatchQueue.main.asyncAfter(deadline: .now() + 2.8) {
                    sender.backgroundColor = colorOrig }
            DispatchQueue.main.asyncAfter(deadline: .now() + 2.8) {
                    sender.alpha = 1 }
            sender.isEnabled = false
        }
    }
    
    func ChangeColorScale8 (_ sender: UIButton) {
        let colorOrig = sender.backgroundColor
        if sender.isEnabled {
            DispatchQueue.main.asyncAfter(deadline: .now() + 2.8) {
            sender.backgroundColor = .systemBlue }
            DispatchQueue.main.asyncAfter(deadline: .now() + 2.8) {
            sender.alpha = 1 }
            DispatchQueue.main.asyncAfter(deadline: .now() + 3.2) {
                sender.backgroundColor = colorOrig }
            DispatchQueue.main.asyncAfter(deadline: .now() + 3.2) {
                sender.alpha = 1 }
        } else {
            sender.isEnabled = true
            DispatchQueue.main.asyncAfter(deadline: .now() + 2.8) {
                sender.backgroundColor = .systemBlue }
            DispatchQueue.main.asyncAfter(deadline: .now() + 2.8) {
                sender.alpha = 1 }
            DispatchQueue.main.asyncAfter(deadline: .now() + 3.2) {
                    sender.backgroundColor = colorOrig }
            DispatchQueue.main.asyncAfter(deadline: .now() + 3.2) {
                    sender.alpha = 1 }
            sender.isEnabled = false
        }
    }
    
    func ChangeColorScale9 (_ sender: UIButton) {
        let colorOrig = sender.backgroundColor
        if sender.isEnabled {
            DispatchQueue.main.asyncAfter(deadline: .now() + 3.2) {
            sender.backgroundColor = .systemBlue }
            DispatchQueue.main.asyncAfter(deadline: .now() + 3.2) {
            sender.alpha = 1 }
            DispatchQueue.main.asyncAfter(deadline: .now() + 3.6) {
                sender.backgroundColor = colorOrig }
            DispatchQueue.main.asyncAfter(deadline: .now() + 3.6) {
                sender.alpha = 1 }
        } else {
            sender.isEnabled = true
            DispatchQueue.main.asyncAfter(deadline: .now() + 3.2) {
                sender.backgroundColor = .systemBlue }
            DispatchQueue.main.asyncAfter(deadline: .now() + 3.2) {
                sender.alpha = 1 }
            DispatchQueue.main.asyncAfter(deadline: .now() + 3.6) {
                    sender.backgroundColor = colorOrig }
            DispatchQueue.main.asyncAfter(deadline: .now() + 3.6) {
                    sender.alpha = 1 }
            sender.isEnabled = false
        }
    }
    
    func playScaleMajor (note: Int) {
        let references1 = references [note - 1]
        let references2 = references [note + 1]
        let references3 = references [note + 3]
        let references4 = references [note + 4]
        let references5 = references [note + 6]
        let references6 = references [note + 8]
        let references7 = references [note + 10]
        let references8 = references [note + 11]
        guard let url1 = Bundle.main.url(forResource: references1, withExtension: "wav")
        else { return }
        guard let url2 = Bundle.main.url(forResource: references2, withExtension: "wav")
        else { return }
        guard let url3 = Bundle.main.url(forResource: references3, withExtension: "wav")
        else { return }
        guard let url4 = Bundle.main.url(forResource: references4, withExtension: "wav")
        else { return }
        guard let url5 = Bundle.main.url(forResource: references5, withExtension: "wav")
        else { return }
        guard let url6 = Bundle.main.url(forResource: references6, withExtension: "wav")
        else { return }
        guard let url7 = Bundle.main.url(forResource: references7, withExtension: "wav")
        else { return }
        guard let url8 = Bundle.main.url(forResource: references8, withExtension: "wav")
        else { return }
        
        print(references1,references2,references3,references4,references5,references6,references7,references8)
        player1 = try! AVAudioPlayer(contentsOf: url1)
        DispatchQueue.main.asyncAfter(deadline: .now() + 0) {
            self.player1.play() }
        player2 = try! AVAudioPlayer(contentsOf: url2)
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.4) {
            self.player2.play() }
        player3 = try! AVAudioPlayer(contentsOf: url3)
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.8) {
            self.player3.play() }
        player4 = try! AVAudioPlayer(contentsOf: url4)
        DispatchQueue.main.asyncAfter(deadline: .now() + 1.2) {
            self.player4.play() }
        player5 = try! AVAudioPlayer(contentsOf: url5)
        DispatchQueue.main.asyncAfter(deadline: .now() + 1.6) {
            self.player5.play() }
        player6 = try! AVAudioPlayer(contentsOf: url6)
        DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
            self.player6.play() }
        player7 = try! AVAudioPlayer(contentsOf: url7)
        DispatchQueue.main.asyncAfter(deadline: .now() + 2.4) {
            self.player7.play() }
        player8 = try! AVAudioPlayer(contentsOf: url8)
        DispatchQueue.main.asyncAfter(deadline: .now() + 2.8) {
            self.player8.play() }
    
    switch note {
    case 1:
        ChangeColorScale(C3)
        ChangeColorScale2(D3)
        ChangeColorScale3(E3)
        ChangeColorScale4(F3)
        ChangeColorScale5(G3)
        ChangeColorScale6(A3)
        ChangeColorScale7(B3)
        ChangeColorScale8(C4)
        break
    case 2:
        ChangeColorScale(Csos3)
        ChangeColorScale2(Dsos3)
        ChangeColorScale3(F3)
        ChangeColorScale4(Fsos3)
        ChangeColorScale5(Gsos3)
        ChangeColorScale6(Asos3)
        ChangeColorScale7(C4)
        ChangeColorScale8(Csos4)
        break
    case 3:
        ChangeColorScale(D3)
        ChangeColorScale2(E3)
        ChangeColorScale3(Fsos3)
        ChangeColorScale4(G3)
        ChangeColorScale5(A3)
        ChangeColorScale6(B3)
        ChangeColorScale7(Csos4)
        ChangeColorScale8(D4)
        break
    case 4:
        ChangeColorScale(Dsos3)
        ChangeColorScale2(F3)
        ChangeColorScale3(G3)
        ChangeColorScale4(Gsos3)
        ChangeColorScale5(Asos3)
        ChangeColorScale6(C4)
        ChangeColorScale7(D4)
        ChangeColorScale8(Dsos4)
        break
    case 5:
        ChangeColorScale(E3)
        ChangeColorScale2(Fsos3)
        ChangeColorScale3(Gsos3)
        ChangeColorScale4(A3)
        ChangeColorScale5(B3)
        ChangeColorScale6(Csos4)
        ChangeColorScale7(Dsos4)
        ChangeColorScale8(E4)
        break
    case 6:
        ChangeColorScale(F3)
        ChangeColorScale2(G3)
        ChangeColorScale3(A3)
        ChangeColorScale4(Asos3)
        ChangeColorScale5(C4)
        ChangeColorScale6(D4)
        ChangeColorScale7(E4)
        ChangeColorScale8(F4)
        break
    case 7:
        ChangeColorScale(Fsos3)
        ChangeColorScale2(Gsos3)
        ChangeColorScale3(Asos3)
        ChangeColorScale4(B3)
        ChangeColorScale5(Csos4)
        ChangeColorScale6(Dsos4)
        ChangeColorScale7(F4)
        ChangeColorScale8(Fsos4)
        break
    case 8:
        ChangeColorScale(G3)
        ChangeColorScale2(A3)
        ChangeColorScale3(B3)
        ChangeColorScale4(C4)
        ChangeColorScale5(D4)
        ChangeColorScale6(E4)
        ChangeColorScale7(Fsos4)
        ChangeColorScale8(G4)
        break
    case 9:
        ChangeColorScale(Gsos3)
        ChangeColorScale2(Asos3)
        ChangeColorScale3(C4)
        ChangeColorScale4(Csos4)
        ChangeColorScale5(Dsos4)
        ChangeColorScale6(F4)
        ChangeColorScale7(G4)
        ChangeColorScale8(Gsos4)
        break
    case 10:
        ChangeColorScale(A3)
        ChangeColorScale2(B3)
        ChangeColorScale3(Csos4)
        ChangeColorScale4(D4)
        ChangeColorScale5(E4)
        ChangeColorScale6(Fsos4)
        ChangeColorScale7(Gsos4)
        ChangeColorScale8(A4)
        break
    case 11:
        ChangeColorScale(Asos3)
        ChangeColorScale2(C4)
        ChangeColorScale3(D4)
        ChangeColorScale4(Dsos4)
        ChangeColorScale5(F4)
        ChangeColorScale6(G4)
        ChangeColorScale7(A4)
        ChangeColorScale8(Asos4)
        break
    case 12:
        ChangeColorScale(B3)
        ChangeColorScale2(Csos4)
        ChangeColorScale3(Dsos4)
        ChangeColorScale4(E4)
        ChangeColorScale5(Fsos4)
        ChangeColorScale6(Gsos4)
        ChangeColorScale7(Asos4)
        ChangeColorScale8(B4)
        break
    default:
        return
        }
    }
    
    func playScaleMinor (note: Int) {
        let references1 = references [note - 1]
        let references2 = references [note + 1]
        let references3 = references [note + 2]
        let references4 = references [note + 4]
        let references5 = references [note + 6]
        let references6 = references [note + 7]
        let references7 = references [note + 9]
        let references8 = references [note + 11]
        guard let url1 = Bundle.main.url(forResource: references1, withExtension: "wav")
        else { return }
        guard let url2 = Bundle.main.url(forResource: references2, withExtension: "wav")
        else { return }
        guard let url3 = Bundle.main.url(forResource: references3, withExtension: "wav")
        else { return }
        guard let url4 = Bundle.main.url(forResource: references4, withExtension: "wav")
        else { return }
        guard let url5 = Bundle.main.url(forResource: references5, withExtension: "wav")
        else { return }
        guard let url6 = Bundle.main.url(forResource: references6, withExtension: "wav")
        else { return }
        guard let url7 = Bundle.main.url(forResource: references7, withExtension: "wav")
        else { return }
        guard let url8 = Bundle.main.url(forResource: references8, withExtension: "wav")
        else { return }
        
        print(references1,references2,references3,references4,references5,references6,references7,references8)
        player1 = try! AVAudioPlayer(contentsOf: url1)
        DispatchQueue.main.asyncAfter(deadline: .now() + 0) {
            self.player1.play() }
        player2 = try! AVAudioPlayer(contentsOf: url2)
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.4) {
            self.player2.play() }
        player3 = try! AVAudioPlayer(contentsOf: url3)
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.8) {
            self.player3.play() }
        player4 = try! AVAudioPlayer(contentsOf: url4)
        DispatchQueue.main.asyncAfter(deadline: .now() + 1.2) {
            self.player4.play() }
        player5 = try! AVAudioPlayer(contentsOf: url5)
        DispatchQueue.main.asyncAfter(deadline: .now() + 1.6) {
            self.player5.play() }
        player6 = try! AVAudioPlayer(contentsOf: url6)
        DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
            self.player6.play() }
        player7 = try! AVAudioPlayer(contentsOf: url7)
        DispatchQueue.main.asyncAfter(deadline: .now() + 2.4) {
            self.player7.play() }
        player8 = try! AVAudioPlayer(contentsOf: url8)
        DispatchQueue.main.asyncAfter(deadline: .now() + 2.8) {
            self.player8.play() }
    
    switch note {
    case 1:
        ChangeColorScale(C3)
        ChangeColorScale2(D3)
        ChangeColorScale3(Dsos3)
        ChangeColorScale4(F3)
        ChangeColorScale5(G3)
        ChangeColorScale6(Gsos3)
        ChangeColorScale7(Asos3)
        ChangeColorScale8(C4)
        break
    case 2:
        ChangeColorScale(Csos3)
        ChangeColorScale2(Dsos3)
        ChangeColorScale3(E3)
        ChangeColorScale4(Fsos3)
        ChangeColorScale5(Gsos3)
        ChangeColorScale6(A3)
        ChangeColorScale7(B3)
        ChangeColorScale8(Csos4)
        break
    case 3:
        ChangeColorScale(D3)
        ChangeColorScale2(E3)
        ChangeColorScale3(F3)
        ChangeColorScale4(G3)
        ChangeColorScale5(A3)
        ChangeColorScale6(Asos3)
        ChangeColorScale7(C4)
        ChangeColorScale8(D4)
        break
    case 4:
        ChangeColorScale(Dsos3)
        ChangeColorScale2(F3)
        ChangeColorScale3(Fsos3)
        ChangeColorScale4(Gsos3)
        ChangeColorScale5(Asos3)
        ChangeColorScale6(B3)
        ChangeColorScale7(Csos4)
        ChangeColorScale8(Dsos4)
        break
    case 5:
        ChangeColorScale(E3)
        ChangeColorScale2(Fsos3)
        ChangeColorScale3(G3)
        ChangeColorScale4(A3)
        ChangeColorScale5(B3)
        ChangeColorScale6(C4)
        ChangeColorScale7(D4)
        ChangeColorScale8(E4)
        break
    case 6:
        ChangeColorScale(F3)
        ChangeColorScale2(G3)
        ChangeColorScale3(Gsos3)
        ChangeColorScale4(Asos3)
        ChangeColorScale5(C4)
        ChangeColorScale6(Csos4)
        ChangeColorScale7(Dsos4)
        ChangeColorScale8(F4)
        break
    case 7:
        ChangeColorScale(Fsos3)
        ChangeColorScale2(Gsos3)
        ChangeColorScale3(A3)
        ChangeColorScale4(B3)
        ChangeColorScale5(Csos4)
        ChangeColorScale6(D4)
        ChangeColorScale7(E4)
        ChangeColorScale8(Fsos4)
        break
    case 8:
        ChangeColorScale(G3)
        ChangeColorScale2(A3)
        ChangeColorScale3(Asos3)
        ChangeColorScale4(C4)
        ChangeColorScale5(D4)
        ChangeColorScale6(Dsos4)
        ChangeColorScale7(F4)
        ChangeColorScale8(G4)
        break
    case 9:
        ChangeColorScale(Gsos3)
        ChangeColorScale2(Asos3)
        ChangeColorScale3(B3)
        ChangeColorScale4(Csos4)
        ChangeColorScale5(Dsos4)
        ChangeColorScale6(E4)
        ChangeColorScale7(Fsos4)
        ChangeColorScale8(Gsos4)
        break
    case 10:
        ChangeColorScale(A3)
        ChangeColorScale2(B3)
        ChangeColorScale3(C4)
        ChangeColorScale4(D4)
        ChangeColorScale5(E4)
        ChangeColorScale6(F4)
        ChangeColorScale7(G4)
        ChangeColorScale8(A4)
        break
    case 11:
        ChangeColorScale(Asos3)
        ChangeColorScale2(C4)
        ChangeColorScale3(Csos4)
        ChangeColorScale4(Dsos4)
        ChangeColorScale5(F4)
        ChangeColorScale6(Fsos4)
        ChangeColorScale7(Gsos4)
        ChangeColorScale8(Asos4)
        break
    case 12:
        ChangeColorScale(B3)
        ChangeColorScale2(Csos4)
        ChangeColorScale3(D4)
        ChangeColorScale4(E4)
        ChangeColorScale5(Fsos4)
        ChangeColorScale6(G4)
        ChangeColorScale7(A4)
        ChangeColorScale8(B4)
        break
    default:
        return
        }
    }
    
    
}
