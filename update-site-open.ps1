# Путь к проекту на рабочем столе
$projectPath = "$env:USERPROFILE\Desktop\MOY_site_prizvanie"

# Проверяем, существует ли папка
if (-Not (Test-Path $projectPath)) {
    Write-Host "Папка проекта не найдена: $projectPath"
    exit
}

# Переходим в папку проекта
Set-Location $projectPath

# Проверяем изменения
$changes = git status --porcelain

if ($changes) {
    # Добавляем все изменения
    git add .

    # Создаём коммит с текущей датой и временем
    $commitMessage = "Update site - " + (Get-Date -Format "yyyy-MM-dd HH:mm:ss")
    git commit -m $commitMessage

    # Пушим на GitHub
    git push origin main

    Write-Host "Сайт обновлён! Изменения загружены на GitHub Pages:"
} else {
    Write-Host "Нет изменений для коммита. Сайт уже актуален:"
}

# Открываем сайт в браузере
Start-Process "https://Aslanbek-AFK.github.io/my_site/"
