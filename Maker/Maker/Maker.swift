//
//  Maker.swift
//  Maker
//
//  Created by Maru on 2017/5/10.
//  Copyright © 2017年 Souche. All rights reserved.
//

import Foundation

let temple = "ZGlzYWJsZWRfcnVsZXM6ICMg5omn6KGM5pe25o6S6Zmk5o6J55qE6KeE5YiZCiAgLSBjb2xvbgogIC0gY29tbWEKICAtIGNvbnRyb2xfc3RhdGVtZW50Cm9wdF9pbl9ydWxlczogIyDkuIDkupvop4TliJnku4Xku4XmmK/lj6/pgInnmoQKICAtIGVtcHR5X2NvdW50Cm1pc3NpbmdfZG9jczoKICAtIGludGVybmFsCiAgIyDlj6/ku6XpgJrov4fmiafooYzlpoLkuIvmjIfku6TmnaXmn6Xmib7miYDmnInlj6/nlKjnmoTop4TliJk6CiAgIyBzd2lmdGxpbnQgcnVsZXMKaW5jbHVkZWQ6ICMg5omn6KGMIGxpbnRpbmcg5pe25YyF5ZCr55qE6Lev5b6E44CC5aaC5p6c5Ye6546w6L+Z5LiqIGAtLXBhdGhgIOS8muiiq+W/veeVpeOAggogIC0gYW5pbWF0aW9uCmV4Y2x1ZGVkOiAjIOaJp+ihjCBsaW50aW5nIOaXtuW/veeVpeeahOi3r+W+hOOAgiDkvJjlhYjnuqfmr5QgYGluY2x1ZGVkYCDmm7Tpq5jjgIIKICAtIENhcnRoYWdlCiAgLSBQb2RzCgojIOWPr+mFjee9rueahOinhOWImeWPr+S7pemAmui/h+i/meS4qumFjee9ruaWh+S7tuadpeiHquWumuS5iQojIOS6jOi/m+WItuinhOWImeWPr+S7peiuvue9ruS7luS7rOeahOS4peagvOeoi+W6pgpmb3JjZV9jYXN0OiB3YXJuaW5nICMg6ZqQ5byPCmZvcmNlX3RyeToKICBzZXZlcml0eTogd2FybmluZyAjIOaYvuW8jwojIOWQjOaXtuacieitpuWRiuWSjOmUmeivr+etiee6p+eahOinhOWIme+8jOWPr+S7peWPquiuvue9ruWug+eahOitpuWRiuetiee6pwojIOmakOW8jwpsaW5lX2xlbmd0aDogMTIwCiMg5Y+v5Lul6YCa6L+H5LiA5Liq5pWw57uE5ZCM5pe26L+b6KGM6ZqQ5byP6K6+572uCnR5cGVfYm9keV9sZW5ndGg6CiAgLSAzMDAgIyB3YXJuaW5nCiAgLSA0MDAgIyBlcnJvcgojIOaIluiAheS5n+WPr+S7peWQjOaXtui/m+ihjOaYvuW8j+iuvue9rgpmaWxlX2xlbmd0aDoKICB3YXJuaW5nOiA1MDAKICBlcnJvcjogMTIwMAojIOWRveWQjeinhOWImeWPr+S7peiuvue9ruacgOWwj+mVv+W6puWSjOacgOWkp+eoi+W6pueahOitpuWRii/plJnor68KIyDmraTlpJblroPku6zkuZ/lj6/ku6Xorr7nva7mjpLpmaTlnKjlpJbnmoTlkI3lrZcKdHlwZV9uYW1lOgogIG1pbl9sZW5ndGg6IDQgIyDlj6rmmK/orablkYoKICBtYXhfbGVuZ3RoOiAjIOitpuWRiuWSjOmUmeivrwogICAgd2FybmluZzogNDAKICAgIGVycm9yOiA1MAogIGV4Y2x1ZGVkOiBpUGhvbmUgIyDmjpLpmaTmn5DkuKrlkI3lrZcKaWRlbnRpZmllcl9uYW1lOgogIG1pbl9sZW5ndGg6ICMg5Y+q5pyJ5pyA5bCP6ZW/5bqmCiAgICBlcnJvcjogNCAjIOWPquaciemUmeivrwogIGV4Y2x1ZGVkOiAjIOaOkumZpOafkOS6m+WQjeWtlwogICAgLSBpZAogICAgLSBVUkwKICAgIC0gR2xvYmFsQVBJS2V5CnJlcG9ydGVyOiAieGNvZGUiICMg5oql5ZGK57G75Z6LICh4Y29kZSwganNvbiwgY3N2LCBjaGVja3N0eWxlLCBqdW5pdCwgaHRtbCwgZW1vamkpCg=="

enum OutputType {
    case error
    case standard
}

enum ParameterType: String {
    case swiftlintyml = "y"
    case podfile = "p"
    case unkown

    init(raw: String) {
        switch raw {
        case "y":
            self = .swiftlintyml
        case "p":
            self = .podfile
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
        print("\(executableName) -y: aotocreate a .swiftlint.yml file with template")
        print("\(executableName) -p: autocreate a Podfile file with template")
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

        guard argCount == 2 else {
            consoleIO.write(message: "Sorry! you input invaild params count.", to: .error)
            return
        }

        let command = String(argument.suffix(1))
        let (param, _) = consoleIO.fetchOption(value: command)
        switch param {
        case .podfile:
            createPodFile()
        case .swiftlintyml:
            createYML()
        default:
            consoleIO.write(message: "Sorry! you input unrecognized params")
        }
    }
}

extension Maker {
    // MARK: - Business Logic

    fileprivate func createYML() {
        let currentPath = FileManager.default.currentDirectoryPath

        if FileManager.default.createFile(atPath: "\(currentPath)/.swiftlint.yml", contents: Data(base64Encoded: temple), attributes: nil) {
            consoleIO.write(message: "create .swiftlint.yml success.", to: .standard)
        } else {
            consoleIO.write(message: "create .swiftlint.yml fail.", to: .error)
        }
    }

    fileprivate func createPodFile() {
        consoleIO.write(message: "Sorry! Not support yet.", to: .error)
    }
}
