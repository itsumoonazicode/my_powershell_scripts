# Script to fill in inputbox with argument.

## :octocat: How to run

```PowerShell
PS> .\runVba.ps1 arg1
```

## このスクリプトでできること

- スクリプト実行時に渡した引数を、HTMLのinput要素内に書き込める（IEで動きます）

## このスクリプトをつくった経緯

- 会社内でIEでしか正常動作しないシステムがあり、それに極力関わりたくないために自動化できる作業を増やそうとしたため


## 検証環境

- IE11
- Windows10
- Excel2016

## 補足

- これを使う際には、拡張子`bca`のファイルを`VBE`内でインポートする必要があります。