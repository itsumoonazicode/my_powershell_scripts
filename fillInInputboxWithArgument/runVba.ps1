$excel = New-Object -ComObject Excel.Application

# excelファイルのパス
$filePath = "C:\Users\Dying\Desktop\test.xlsm"
$workbook = $excel.Workbooks.Open($filePath)

$excel.Visible = $true

$sheet = $excel.Worksheets.Item("Sheet1")

# 実行時の引数を取得する
$arg = $Args[0]

$sheet.Range("A1") = $arg


$app = $excel.Application

# モジュール名を引数に取る
$app.Run("getCell")
