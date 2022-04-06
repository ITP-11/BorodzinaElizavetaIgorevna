Dim s
do
WScript.StdOut.WriteLine "МЕНЮ:"
WScript.StdOut.WriteLine "----------------------------"
WScript.StdOut.WriteLine "1. Информация об авторе:"
WScript.StdOut.WriteLine "2. Удаление содержимого заданной папки."
WScript.StdOut.WriteLine "3. Создание ссылки на заданый сетевой ресурс и помещение его на рабочий стол."
WScript.StdOut.WriteLine "4. Выход из программы."
WScript.StdOut.Write "Выберите пункт меню:"
s = WScript.StdIn.ReadLine
Dim FSO, papka, WshShell, oUrlLink, WshFldrs, p
Set WshShell = WScript.CreateObject("WScript.Shell")

if (s="1") Then
WScript.StdOut.WriteLine "Бородина Елизавета Игоревна, ИТП-11"

elseif(s="2") Then
WScript.StdOut.Write "Введите имя папки. "
WScript.StdOut.WriteLine "Пример: C:\User\*.*"
papka = WScript.StdIn.ReadLine
Set FSO = CreateObject("Scripting.FileSystemObject")
FSO.DeleteFile papka

'создание ссылки и ярлыка 
elseif(s="3") Then
WScript.StdOut.Write "Введите имя ярлыка:"
f = WScript.StdIn.ReadLine
Set oUrlLink = WshShell.CreateShortcut(f+".URL")
WScript.StdOut.Write "Введите имя ресурса:"
f = WScript.StdIn.ReadLine
'устанавливаем юрл
oUrlLink.TargetPath = f
'сохраняем ярлык
oUrlLink.Save
'создаем объект FileSystemObject
Set FSO = WScript.CreateObject("Scripting.FileSystemObject")
'создаем объект WshSpecialFolders
Set WshFldrs = WshShell.SpecialFolders
'определяем путь к рабочему столу
PathCopy = WshFldrs.item("Desktop")+"\"
'создаем объект для ссылки
Set p = FSO.GetFile(oUrlLink)
'копируем файл на рабоий стол
p.Copy PathCopy

End if
loop until (s="4")
