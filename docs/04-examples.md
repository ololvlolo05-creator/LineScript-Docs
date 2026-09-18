# 04. Примеры практических сценариев

В данном разделе представлены законченные примеры сценариев LineScript для автоматизации задач разработки, отладки и деплоя.

---

## 1. Инициализация и проверка окружения нового проекта

```text
[DS_BRIDGE_START]
[1] -cd- C:\Projects\WebService -/-
[2] -ps- dotnet --version -/-
[3] -ps- git status -/-
[4] -file-up- README.md
# WebService
Автоматически развернутая служба с поддержкой LineScript v1.1.
-/-
[DS_BRIDGE_GATHER]
```

---

## 2. Безопасный рефакторинг метода с откатом при ошибке

Сценарий модифицирует метод, запускает тесты и, при необходимости, позволяет откатить изменение:

```text
-cd- E:\Projects\Calculators -/-

-patch- src/MathCore.cs
<<<<<<< SEARCH
        public double Divide(double a, double b)
        {
            return a / b;
        }
=======
        public double Divide(double a, double b)
        {
            if (Math.Abs(b) < 1e-9)
                throw new DivideByZeroException("Деление на ноль запрещено.");
            return a / b;
        }
>>>>>>> REPLACE
-/-

-cmd- dotnet test -/-
```

Если тесты провалятся, пользователь или агент отправляет:
```text
-undo- src/MathCore.cs -/-
```

---

## 3. Передача конфигурации и бинарного ассета (v1.1)

```text
-cd- E:\Projects\AppAssets -/-

-file-up- config/theme.json
{
  "theme": "dark",
  "accent": "#4ECDC4"
}
-/-

-file-bin-
write
assets/favicon.ico
AAABAAEAEBAAAAEAIABoBAAAFgAAACgAAAAQAAAAIAAAAAEAIAAAAAAAAAQAAAAAAAAAAAAAAAAA...
-/-

-ps- Get-ChildItem -Recurse -/-
```

---

## 4. Комплексная сборка с кастомной командой

```text
-add-command- deploy-test
template: dotnet publish -c Release -o ./dist && Write-Host "Готово!"
environment: PS
-/-

-deploy-test- -/-
```
