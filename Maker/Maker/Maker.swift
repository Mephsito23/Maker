//
//  Maker.swift
//  Maker
//
//  Created by Maru on 2017/5/10.
//  Copyright © 2017年 Souche. All rights reserved.
//

import Foundation

enum OutputType {
    case error
    case standard
}

enum ParameterType: String {
    case swiftlintyml = "y"
    case podfile = "p"
    case cartfile = "c"
    case prettierrc = "pre"
    case help = "h"
    case unkown

    init(raw: String) {
        switch raw {
        case "y":
            self = .swiftlintyml
        case "p":
            self = .podfile
        case "c":
            self = .cartfile
        case "pre":
            self = .prettierrc
        case "h":
            self = .help
        default:
            self = .unkown
        }
    }
}

final class ConsoleIO {
    func fetchOption(value: String) -> (option: ParameterType, value: String) {
        return (ParameterType(raw: value), value)
    }

    func logUsage() {
        let executableName = (CommandLine.arguments[0] as NSString).lastPathComponent
        print("Maker Usage:")
        print("🤡 🤡 🤡 🤡 🤡 🤡 🤡 🤡 🤡 🤡 🤡 🤡 🤡 🤡 🤡 🤡 🤡 🤡 🤡 🤡 🤡 🤡 🤡 🤡 🤡 🤡 🤡 🤡 🤡")
        print(getHelp())
        print("❤️ ❤️ ❤️ ❤️ ❤️ ❤️ ❤️ ❤️ ❤️ ❤️ ❤️ ❤️ ❤️ ❤️ ❤️ ❤️ ❤️ ❤️ ❤️ ❤️❤️ ❤️ ❤️ ❤️ ❤️ ❤️ ❤️ ❤️ ❤️")
        print("Enjoy your coding time!")
    }

    func write(message: String, to: OutputType = .standard) {
        switch to {
        case .standard:
            print("\u{001B}[;m\(message)")
        case .error:
            fputs("\u{001B}[0;31m\(message)\n", stderr)
        }
    }
}

final class Maker {
    let consoleIO = ConsoleIO()

    // MARK: - Public Method

    func staticMode() {
        let argCount = CommandLine.argc
        let argument = CommandLine.arguments[1]
        let command = String(argument.suffix(argument.count - 1))
        let (param, _) = consoleIO.fetchOption(value: command)
        var name: String?

        if argCount == 2 {
            switch param {
            case .cartfile:
                let temple = getCarthageTemple().base64Encoded()
                creatFileTemple(temple: temple, fileName: "Cartfile")
            case .prettierrc:
                let temple = getPrettierrcTemple().base64Encoded()
                creatFileTemple(temple: temple, fileName: ".prettierrc.js")
            case .help:
                consoleIO.write(message: getHelp())
            default:
                consoleIO.write(message: "Sorry! you input unrecognized params")
            }
            return
        }

        name = CommandLine.arguments[2]
        guard let projectName = name else {
            consoleIO.write(message: "Sorry! project name don't is null.", to: .error)
            return
        }

        guard argCount == 3 else {
            consoleIO.write(message: "Sorry! you input invaild params count.", to: .error)
            return
        }

        switch param {
        case .podfile:
            let temple = getPodTemple(projectName).base64Encoded()
            creatFileTemple(temple: temple, fileName: "Podfile")
        case .swiftlintyml:
            let temple = getSwiftLintTemple(projectName).base64Encoded()
            creatFileTemple(temple: temple, fileName: ".swiftlint.yml")
        default:
            consoleIO.write(message: "Sorry! you input unrecognized params")
        }
    }
}

extension Maker {
    // MARK: - Business Logic

    fileprivate func creatFileTemple(temple: String, fileName: String) {
        let currentPath = FileManager.default.currentDirectoryPath
        if FileManager.default.createFile(atPath: "\(currentPath)/\(fileName)", contents: Data(base64Encoded: temple), attributes: nil) {
            consoleIO.write(message: "create \(fileName) success.", to: .standard)
        } else {
            consoleIO.write(message: "create \(fileName) fail.", to: .error)
        }
    }
}
