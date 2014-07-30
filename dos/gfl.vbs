Dim infile
Dim proj
Dim outfile
Set args = WScript.Arguments
If args.Count = 3 Then
    proj = args.Item(0)
    file = args.Item(1)
    outfile = args.Item(2)
Else
    Wscript.Echo "Usage: gfl.vbs [ProjectName] ListFilePath OutFilePath"
    Wscript.Quit
End If

ServerName = args.Item(0)
Set fso = CreateObject("Scripting.FileSystemObject")

If Not (fso.FileExists(file)) Then
    WScript.Echo(file & " Not Exists!")
    WScript.Quit
End If

Dim bArrived
Dim bLeft
Set out = fso.CreateTextFile(outfile)
Set inf = fso.OpenTextFile(file)
Do Until bLeft = 1 Or inf.AtEndOfStream
    line = Trim(inf.ReadLine)
    If  bArrived = 1 Then
        If  Left(line, 3) <> "add" Then
            If StrComp(line, proj, 1) <> 0 Then
                bLeft = 1
            End If
        Else
            out.WriteLine(Mid(line, 11))
        End If
    ElseIf StrComp(line, proj, 1) = 0  Then
        bArrived = 1
    End If
Loop

out.Close
inf.Close
WScript.Quit