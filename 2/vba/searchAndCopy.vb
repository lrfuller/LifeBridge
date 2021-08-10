Sub copySearch()
Dim sh1 As Worksheet, sh2 As Worksheet, rng As Range
Dim strSearch1 As String
Dim counter As Long

strSearch1 = ""
Set sh1 = ActiveSheet
Set sh2 = Worksheets("Sheet1")
counter = 2
 
For j = 2 To 2049
 strSearch1 = sh1.Range("M2").Offset(j - 2)
    For Each rng In sh2.Range("K2:K1778")
        If rng.Value = strSearch1 Then
            sh2.Range("H2").Offset(counter - 2).Copy sh1.Range("D2").Offset(j - 2)
            sh2.Range("AH2").Offset(counter - 2).Copy sh1.Range("F2").Offset(j - 2)
        End If
        counter = counter + 1
    Next
 counter = 2
Next j

End Sub



