Attribute VB_Name = "fillInYahooInput"
Declare Sub Sleep Lib "kernel32" (ByVal dwMilliseconds As Long)
Sub getCell()
    Dim str As String
    str = Range("A1").Value
    
    Dim ie As InternetExplorer
    Set ie = CreateObject("InternetExplorer.Application")
    ie.Visible = True
    
    ie.navigate "https://yahoo.co.jp/"
    
    Do While ie.Busy Or ie.readyState < READYSTATE_COMPLETE
        DoEvents
    Loop
    
    Dim inputStr As HTMLInputElement
    Dim submitBtn As HTMLInputElement
    
    Set inputStr = ie.document.getElementById("srchtxt")
    Set submitBtn = ie.document.getElementById("srchbtn")
    
    inputStr.Value = str
    Sleep 2000
    
    submitBtn.Click
    
End Sub
