Function GetFiles(FolderName, index, TraversalSubDirectory)
    On Error Resume Next
    Dim ObjFolder
    Dim ObjSubFolders
    Dim ObjSubFolder
    Dim ObjFiles
    Dim ObjFile
    Set ObjFolder = fso.GetFolder(FolderName)
    Set ObjFiles = ObjFolder.Files
    'Write all files to output files
    For Each ObjFile In ObjFiles
        '''ObjOutFile.WriteLine("File," & ObjFile.Name & "," & ObjFile.Path)
        ObjOutFile.WriteLine("add" & index & "=" & ObjFile.Path)
        index = index + 1
    Next
    If TraversalSubDirectory <> 0 Then
        'Getting all subfolders
        Set ObjSubFolders = ObjFolder.SubFolders
        For Each ObjFolder In ObjSubFolders
            'Writing SubFolder Name and Path
            '''ObjOutFile.WriteLine("Folder," & ObjFolder.Name & "," & ObjFolder.Path)
            'Getting all Files from subfolder
            GetFiles ObjFolder.Path, index, TraversalSubDirectory
        Next
    End If
End Function

Dim fso
Dim ObjOutFile
Set fso = CreateObject("Scripting.FileSystemObject")
Set ObjOutFile = fso.CreateTextFile("D:\FileList.ini")
'Writing CSV headers
'''ObjOutFile.WriteLine("Type,File Name,File Path")

'Call the GetFile function to get all files
GetFiles "S:\", 1, 1

ObjOutFile.Close
WScript.Echo("Completed!")
Wscript.Quit

