Dim s
do
WScript.StdOut.WriteLine "����:"
WScript.StdOut.WriteLine "----------------------------"
WScript.StdOut.WriteLine "1. ���������� �� ������:"
WScript.StdOut.WriteLine "2. �������� ����������� �������� �����."
WScript.StdOut.WriteLine "3. �������� ������ �� ������� ������� ������ � ��������� ��� �� ������� ����."
WScript.StdOut.WriteLine "4. ����� �� ���������."
WScript.StdOut.Write "�������� ����� ����:"
s = WScript.StdIn.ReadLine
Dim FSO, papka, WshShell, oUrlLink, WshFldrs, p
Set WshShell = WScript.CreateObject("WScript.Shell")

if (s="1") Then
WScript.StdOut.WriteLine "�������� ��������� ��������, ���-11"

elseif(s="2") Then
WScript.StdOut.Write "������� ��� �����. "
WScript.StdOut.WriteLine "������: C:\User\*.*"
papka = WScript.StdIn.ReadLine
Set FSO = CreateObject("Scripting.FileSystemObject")
FSO.DeleteFile papka

'�������� ������ � ������
elseif(s="3") Then
WScript.StdOut.Write "������� ��� ������:"
f = WScript.StdIn.ReadLine
Set oUrlLink = WshShell.CreateShortcut(f+".URL")
WScript.StdOut.Write "������� ��� �������:"
f = WScript.StdIn.ReadLine
'������������� ���
oUrlLink.TargetPath = f
'��������� �����
oUrlLink.Save
'������� ������ FileSystemObject
Set FSO = WScript.CreateObject("Scripting.FileSystemObject")
'������� ������ WshSpecialFolders
Set WshFldrs = WshShell.SpecialFolders
'���������� ���� � �������� �����
PathCopy = WshFldrs.item("Desktop")+"\"
'������� ������ ��� ������
Set p = FSO.GetFile(oUrlLink)
'�������� ���� �� ������ ����
p.Copy PathCopy

End if
loop until (s="4")
