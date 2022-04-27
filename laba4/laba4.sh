n=1
while [ $n != 4 ]
do
clear
echo -----------------------
echo Меню:
echo 1. ФИО
echo 2. Файл-список в указанном месте
echo 3. Пакетный файл для перехода 
echo 4. Выход
echo -----------------------
echo Выберите действие 
read n
echo -----------------------
case $n in
  1)
    echo Бородина Елизавета 
    ;;
  2)
    echo Введите расширение файла 
read ext
ext="*"${ext}
echo Куда сохранить файл?
read path
path=${path}"/file.txt"
find /**/ -type f -name $ext > $path
;;
3)
  echo В какой каталог необходимо перейти?
  read path
  path=${path}"/"
  echo $path
  if [ -d $path ]; then
     cd $path
     path=${path}"**"
     zip -r arch.zip $path
  else
     echo Такого каталога нет
  fi
;;
4)
;;
*)
  echo Проверьте правильность ввода 
  n=0
;;
esac
echo Нажмите любую клавишу
read
done