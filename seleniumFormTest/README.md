# PowerShellでGoogle Chromeを操作するスクリプト

## 準備

### 必要なもの

- Selenium（今回はChromeのみを動かすことを想定）

### 導入方法

1. `selenium-dotnet-ver_number.zip`と`chromedriver_win32.zip`を入手する
https://docs.seleniumhq.org/download/

2. 解凍する。`nupkg`は拡張子を`zip`に変えることで解凍可能。

3. ファイルを配置

4. サンプルコードを動かしてみる

```PowerShell
Add-Type -Path "C:\selenium\WebDriver.dll"
$chrome_object = New-Object "OpenQA.Selenium.Chrome.ChromeDriver"
$chrome_object.url = "https://www.google.com"
```

### 参考

以下の通り。  
一番参考になったのは一番下の記事。

- [PowerShellでWebブラウザ(Selenium Webdriver)を動かした話](https://www.slideshare.net/hirofumitouhei/powershellwebselenium-webdriver)
- [SeleniumをPowershellから触ってみる](https://github.com/senkousya/startSeleniumOnPowershell)
- [powershellでselenium webdriverを動かした話](https://hibi-no-kioku.hatenablog.jp/entry/2018/04/18/075715)