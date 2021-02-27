
# PSShellgeiBot

PSShellgeiBot PowerShellから [websh](https://github.com/jiro4989/websh) のAPIを使ってシェル芸を実行します。

## 環境

```
Windows 10 Pro [64bit] (10.0.19041)
```

## バージョン

- PowerShell Core 7

```
PS> $PSVersionTable
Name                           Value
----                           -----
PSVersion                      7.0.3
PSEdition                      Core
GitCommitId                    7.0.3
OS                             Microsoft Windows 10.0.19041
Platform                       Win32NT
PSCompatibleVersions           {1.0, 2.0, 3.0, 4.0…}
PSRemotingProtocolVersion      2.3
SerializationVersion           1.1.0.1
WSManStackVersion              3.0
```

- Windows PowerShell

```
PS> $PSVersionTable
Name                           Value
----                           -----
PSVersion                      5.1.19041.610
PSEdition                      Desktop
PSCompatibleVersions           {1.0, 2.0, 3.0, 4.0...}
BuildVersion                   10.0.19041.610
CLRVersion                     4.0.30319.42000
WSManStackVersion              3.0
PSRemotingProtocolVersion      2.3
SerializationVersion           1.1.0.1
```

## 機能

- シェル芸の実行
- 実行結果の出力
- 画像の投稿
- 実行結果の画像をローカルに保存
- 保存した画像をデフォルトの画像ビューアで開く(`-ShowImage` スイッチを付けると有効になります。)

## 使い方

### シェル芸を実行

`-Code` パラメータに記述するか、パイプラインから入力します。

```pwsh
PS> Invoke-Shbot -Code 'uname -a'

Linux e9b38cbb8ec8 4.15.0-55-generic #60-Ubuntu SMP Tue Jul 2 18:22:20 UTC 2019 x86_64 x86_64 x86_64 GNU/Linux

PS> 'uname -a' | Invoke-Shbot

Linux d643fdbf8022 4.15.0-55-generic #60-Ubuntu SMP Tue Jul 2 18:22:20 UTC 2019 x86_64 x86_64 x86_64 GNU/Linux
```

`-Code` パラメータを指定しない場合はプロンプトが表示されます。

```pwsh
PS> Invoke-Shbot

cmdlet Invoke-Shbot at command pipeline position 1

Supply values for the following parameters:

Code: echo hello

hello
```

### 実行結果の画像を保存

シェル芸bot上の `/images/` に保存した画像は、ローカルのtempディレクトリ( `%LOCALAPPDATA%\Temp` )に保存されます。
保存した画像が不要になったら適宜削除してください。

`-ShowImage` スイッチを付けると、保存した画像をデフォルトの画像ビューアで開きます。

```pwsh
PS> 'screenfetch | textimg -s' | Invoke-Shbot -ShowImage
```


### 画像を投稿

`-ImagePath` パラメータを指定します。

```
PS> Invoke-Shbot -ImagePath ./hoge.png -Code 'convert -resize x500! /media/0 /images/x'
```

## インストール

依存するモジュールやCLIツール等はありません。ダウンロードして `Import-Module` で読み込みます。

```
PS> Import-Module ./PSShellgeiBot/PSShellgeiBot.psm1
```

## 謝辞

[jiro4989](https://github.com/jiro4989) 様の [websh](https://github.com/jiro4989/websh) APIを利用しています。
素晴らしいサービスをありがとうございます。

