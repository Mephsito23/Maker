//
//  swiftlint.swift
//  Maker
//
//  Created by mac on 2020/1/16.
//  Copyright © 2020 Souche. All rights reserved.
//

import Foundation

let swiftLintTemple = "aaa"

// swiftlint:disable function_body_length
func getSwiftLintTemple(_ name: String) -> String {
    return """
        disabled_rules: # 执行时排除掉的规则
          - colon
          - comma
          - control_statement
          - mark
        opt_in_rules: # 一些规则仅仅是可选的
          - empty_count
        missing_docs:
          - internal
          # 可以通过执行如下指令来查找所有可用的规则:
          # swiftlint rules
        included: # 执行 linting 时包含的路径。如果出现这个 `--path` 会被忽略。
          - \(name)
        excluded: # 执行 linting 时忽略的路径。 优先级比 `included` 更高。
          - Carthage
          - Pods

        #最后一个集合元素添加逗号
        trailing_comma:
          mandatory_comma: true
        # 可配置的规则可以通过这个配置文件来自定义
        # 二进制规则可以设置他们的严格程度
        force_cast: warning # 隐式
        force_try:
          severity: warning # 显式
        # 同时有警告和错误等级的规则，可以只设置它的警告等级
        # 隐式
        line_length: 120
        # 可以通过一个数组同时进行隐式设置
        type_body_length:
          - 300 # warning
          - 400 # error
        # 或者也可以同时进行显式设置
        file_length:
          warning: 500
          error: 1200
        # 命名规则可以设置最小长度和最大程度的警告/错误
        # 此外它们也可以设置排除在外的名字
        type_name:
          min_length: 3 # 只是警告
          max_length: # 警告和错误
            warning: 40
            error: 50
          excluded: iPhone # 排除某个名字
        identifier_name:
          min_length: 3 # 只有最小长度
          max_length: # 警告和错误
            warning: 40
            error: 50 # 只有错误
          excluded: # 排除某些名字
            - id
            - URL
            - GlobalAPIKey
        reporter: "xcode" # 报告类型 (xcode, json, csv, checkstyle, junit, html, emoji)
    """
}

func getPodTemple(_ name: String) -> String {
    return """
    source 'https://github.com/CocoaPods/Specs.git'
    platform :ios, '11.0'

    target '\(name)' do
      use_frameworks!
      pod 'Malert'
      pod 'UMCCommon'
      pod 'UMCSecurityPlugins'
      pod 'UMCCommonLog'
      pod 'UMCAnalytics'
      #pod 'UMCPush'
      pod 'UMCShare/UI'
      pod 'UMCShare/Social/ReducedWeChat'
      pod 'UMCShare/Social/ReducedQQ'
      pod 'UMCShare/Social/Email'
      pod 'JCore', '2.1.4-noidfa'
      pod 'JPush', '3.2.4-noidfa'
      pod 'Google-Mobile-Ads-SDK'
      pod "Qiniu"
      #pod 'ImageViewer.swift', '~> 3.0'
      pod 'JXPhotoBrowser', '~> 3.0'
      #pod 'Money-FlightSchool', '~> 1.1.1'
    end
    """
}

func getCarthageTemple() -> String {
    return """
        github "iWeslie/PokerCard"
        github "yannickl/DynamicColor" == 4.2.1
        github "onevcat/Kingfisher"
        github "hackiftekhar/IQKeyboardManager"
        github "CocoaLumberjack/CocoaLumberjack"
        github "SwifterSwift/SwifterSwift"  #类似YYkit
        github "SnapKit/SnapKit" ~> 5.0.1
        github "devicekit/DeviceKit" ~> 2.3.0
        github "SVProgressHUD/SVProgressHUD"
        github "malcommac/SwiftDate" ~> 6.1
        github "CoderMJLee/MJRefresh"
        github "Moya/Moya" ~> 14.0.0-beta.6
        github "ReactiveX/RxSwift"
        github "RxSwiftCommunity/RxDataSources"
        github "bizz84/SwiftyStoreKit"
        github "dzenbot/DZNEmptyDataSet"
        github "kishikawakatsumi/KeychainAccess"
        github "RxSwiftCommunity/RxSwiftExt"
        github "tilltue/TLPhotoPicker"
        github "tristanhimmelman/ObjectMapper"
    """
}

func getPrettierrcTemple() -> String {
    return """
        module.exports = {
            semi: true, // 行位是否使用分号，默认为true
            trailingComma: 'es5', // 是否使用尾逗号，有三个可选值"<none|es5|all>"
            singleQuote: true, // 字符串是否使用单引号，默认为false，使用双引号
            printWidth: 120, // 一行的字符数，如果超过会进行换行，默认为80
            tabWidth: 4, // 一个tab代表几个空格数
            useTabs: true, // 启用tab缩进
            bracketSpacing: true, // 对象大括号直接是否有空格，默认为true，效果：{ foo: bar }
        };

    """
}

func getHelp() -> String {
    let executableName = (CommandLine.arguments[0] as NSString).lastPathComponent
    return """
      \(executableName) -y careat .swiftlint.yml
      \(executableName) -p careat Podfile
      \(executableName) -c careat Cartfile
      \(executableName) -pre careat .prettierrc.js
    """
}
