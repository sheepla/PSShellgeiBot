
# PSShellgeiBot

PSShellgeiBot PowerShellから [websh] (https://github.com/jiro4989/websh) のAPIを使ってシェル芸を実行します。

## 環境・バージョン

```
Windows 10 Pro [64bit] (10.0.19041)
```

```
PS> pwsh.exe -version
PowerShell 7.0.3
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
PS> Invoke-ShellGeiBot -Code 'uname -a'

Linux e9b38cbb8ec8 4.15.0-55-generic #60-Ubuntu SMP Tue Jul 2 18:22:20 UTC 2019 x86_64 x86_64 x86_64 GNU/Linux

PS> 'uname -a' | Invoke-ShellGeiBot

Linux d643fdbf8022 4.15.0-55-generic #60-Ubuntu SMP Tue Jul 2 18:22:20 UTC 2019 x86_64 x86_64 x86_64 GNU/Linux
```

`-Code` パラメータを指定しない場合はプロンプトが表示されます。

```pwsh
PS> Invoke-ShellGeiBot

cmdlet Invoke-ShellGeiBot at command pipeline position 1

Supply values for the following parameters:

Code: echo hello

hello
```

### 実行結果の画像を保存

シェル芸bot上の `/images/` に保存した画像は、ローカルのtempディレクトリ( `%APPDATA%\Local\Temp` )に保存されます。
保存した画像が不要になったら適宜削除してください。

`-ShowImage` スイッチを付けると、保存した画像をデフォルトの画像ビューアで開きます。

```pwsh
PS> 'screenfetch | textimg -s' | Invoke-ShellGeiBot -ShowImage
```


### 画像を投稿

`-ImagePath` パラメータを指定します。

```
PS> Invoke-ShellGeiBot -ImagePath ./hoge.png -Code 'convert -resize x500! /media/0 /images/x'
```

## インストール

依存するモジュールやCLIツール等は今のところありません。ダウンロードしてドットソースで読み込みます。

```
PS> . ./PSShellgeiBot/Invoke-ShellGeiBot.ps1
```

## TODO

- Module化して配布しやすくする
- 不具合を直す

## 謝辞

[jiro4989](https://github.com/jiro4989) 様の [websh](https://github.com/jiro4989/websh) APIを利用しています。
素晴らしいサービスをありがとうございます。

