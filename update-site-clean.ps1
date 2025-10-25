# Проверяем изменения в репозитории
$changes = git status --porcelain

if ($changes) {
    # Добавляем все изменения
    git add .

    # Создаём коммит с текущей датой и временем
    $commitMessage = "Update site - " + (Get-Date -Format "yyyy-MM-dd HH:mm:ss")
    git commit -m $commitMessage

    # Отправляем на GitHub
    git push origin main

    Write-Host "Сайт обновлён! Изменения загружены на GitHub Pages:"
    Write-Host "https://Aslanbek-AFK.github.io/my_site/"
} else {
    Write-Host "Нет изменений для коммита. Сайт уже актуален:"
    Write-Host "https://Aslanbek-AFK.github.io/my_site/"
}
