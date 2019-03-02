Add-Type -Path "C:\user\selenium\WebDriver.dll"

$chrome_object = New-Object "OpenQA.Selenium.Chrome.Chromedriver"
$chrome_object.url = "https://itsumoonazicode.github.io/play_website/demo_form/index.html"

$input_name = $chrome_object.FindElementsById("name")
$input_name.SendKeys("テスト太郎")
$input_name.Submit()