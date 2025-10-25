# Переходим в папку проекта
cd "C:\Users\a.kashezhev\Desktop\MOY_site_prizvanie"

# Добавляем все изменённые файлы
git add .

# Создаём коммит с текущей датой и временем
$commitMessage = "Update site - " + (Get-Date -Format "yyyy-MM-dd HH:mm:ss")
git commit -m $commitMessage

# Отправляем изменения на GitHub
git push origin main

Write-Host "Сайт обновлён! Через минуту изменения будут видны на GitHub Pages:"
Write-Host "https://Aslanbek-AFK.github.io/my_site/"
