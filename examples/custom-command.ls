# Регистрация пользовательской команды с шаблоном аргументов
-add-command- my-echo
template: Write-Host "Вывод кастомной команды: {args}" -ForegroundColor Cyan
environment: PS
-/-

# Вызов зарегистрированной команды
-my-echo- Тестирование динамического макроса LineScript -/-
