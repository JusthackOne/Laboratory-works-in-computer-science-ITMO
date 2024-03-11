## Введение

1. Создадим репозиторий на GitHub
<image src="screenshots/1.png">

2. Клонируем репозиторий
<image src="screenshots/2.png">

3. Создадим файл и добавим текст
<image src="screenshots/3.png">

4. Сделаем коммит и отправим данные в Github с помощью `git add example.txt`, `git add example.txt`, `git push origin main`
<image src="screenshots/4.png">

5. Создаим ветку **feature-branch**:
`git branch feature-branch`
`git checkout feature-branch`
<image src="screenshots/5.png">

6. Откредатируем файл **example.txt**
<image src="screenshots/7.png">

7. Вернёмся обратно в ветку **main**
`git checkout main`

8. Слольём изменения из ветки **feature-branch** в основную ветку:
<image src="screenshots/8.png">

9. Изменения успешно слиты
<image src="screenshots/9.png">

## Работа с ветками

1. Создадим новый текстовый файл с базовой структурой книги, например:

```
# Название книги

## Глава 1: Введение
Здесь будет введение в тему книги.

## Глава 2: Основы Git
Основные понятия и команды Git.

```
<image src="screenshots/10.png">

2. Создадим ветку "feature-login" для разработки новой функциональности:

```
git checkout -b feature-login
```


3. Внесём изменения в файл:

```
# Название книги

## Глава 1: Введение
Здесь будет введение в тему книги.

## Глава 2: Основы Git
Основные понятия и команды Git.

## Глава 3: Вход в систему
Раздел по новой функциональности входа в систему.
```

4. Завершим изменения, закоммитим их и отправим ветку на GitHub:

```
git add README.md
git commit -m "Добавлена глава 3: Вход в систему"
git push origin feature-login
```
<image src="screenshots/11.png">

## Работа с удаленным репозиторием

1. Переключимся на основную ветку (main) и внесём изменения:

```
git checkout main
```

2. Внесём изменения в основной ветке (например, добавим описание книги):

```
# Название книги: Приключения в мире Git

## Глава 1: Введение
Здесь будет введение в удивительный мир Git.

## Глава 2: Основы Git
Основные понятия и команды Git.

```

3. Закоммитим изменения и отправим их на GitHub:

```
git add <filename>
git commit -m "Изменено название книги и введение"
git push origin main

```
<image src="screenshots/12.png">

## Моделирование конфликта

1. Вернёмся в ветку "feature-login" и внесём изменения в том же участке:

```
git checkout feature-login
```

2. Изменим главу 2 в файле

```
# Название книги: Приключения в мире Git

## Глава 1: Введение
Здесь будет введение в удивительный мир Git.

## Глава 2: Основы Git и магия конфликтов
Основные понятия и команды Git, а также волшебство разрешения конфликтов.

```
<image src="screenshots/13.png">

3. Закоммитим изменения и отправим их на GitHub:

```
git add README.md
git commit -m "Добавлен раздел о магии конфликтов"
git push origin feature-login

```
<image src="screenshots/14.png">

## Разрешение конфликта

1. Вернёмся в основную ветку и попробуем слить изменения:

```
git checkout main
git pull origin main
```


2. Возникнет конфликт. Разрешим его в файле

<image src="screenshots/18.png">
<image src="screenshots/15.png">

3. Разрешим конфликт, удалив метки и оставив нужные изменения:

```
# Название книги: Приключения в мире Git

## Глава 1: Введение
Здесь будет введение в удивительный мир Git.

## Глава 2: Основы Git и магия конфликтов
Основные понятия и команды Git, а также волшебство разрешения конфликтов.
```
<image src="screenshots/16.png">

4. Закоммитим разрешение конфликта и отправим изменения на GitHub:

<image src="screenshots/19.png">
<image src="screenshots/17.png">

## Автоматизация проверки формата файлов при коммите

1. Создадим bash-скрипт (например, check_format.sh), который будет выполнять проверку формата .txt файлов.

```
#!/bin/bash

# Находим все .txt файлы в репозитории
txt_files=$(git diff --cached --name-only --diff-filter=ACM | grep "\.txt$")

# Проверяем каждый .txt файл на соответствие формату
for file in $txt_files
do
  if ! grep -q "^KEY_START_WORD*" $file; then
    echo "Файл $file не соответствует определенному формату"
    exit 1
  fi
done

exit 0
```

2. Поместим скрипт в папку, например, в .git/hooks и назовём его pre-commit. Убедимся, что у него есть права на выполнение.

```
cp check_format.sh .git/hooks/pre-commit
chmod +x .git/hooks/pre-commit
```

3. В моём случае, каждая строка должна начинаться с **KEY_START_WORD**, поэтому выходит ошибка при при коммите:

<image src="screenshots/20.png">

4. Изменим файл с **.txt**

<image src="screenshots/21.png">

5. Теперь коммит доступен!

<image src="screenshots/22.png">

## Использование Git Flow в проекте

1. Убедимся, что Git Flow установлен на локальной машине:

```
sudo apt-get install git-flow
```

2. В корне репозитория выполним инициализацию Git Flow.

```
git flow init
```

3. Создаём ветку для новой функциональности "task-management":

```
git flow feature start task-management
```

4. Внеситём изменения в код для добавления функционала управления задачами (например, в файл task_manager.py):

```
import os

def create_task(task_name):
    with open('tasks.txt', 'a') as file:
        file.write(task_name + '\n')

def read_tasks():
    with open('tasks.txt', 'r') as file:
        tasks = file.readlines()
        for task in tasks:
            print(task.strip())

def delete_task(task_name):
    with open('tasks.txt', 'r') as file:
        lines = file.readlines()
    with open('tasks.txt', 'w') as file:
        for line in lines:
            if line.strip() != task_name:
                file.write(line)

if __name__ == "__main__":
    print("Welcome to Task Manager")
    while True:
        print("1. Create Task")
        print("2. Read Tasks")
        print("3. Delete Task")
        print("4. Exit")
        choice = int(input("Enter your choice: "))

        if choice == 1:
            task_name = input("Enter the task name: ")
            create_task(task_name)
        elif choice == 2:
            read_tasks()
        elif choice == 3:
            task_name = input("Enter the task name to delete: ")
            delete_task(task_name)
        elif choice == 4:
            print("Goodbye!")
            break
```

Выполним коммит изменения по мере разработки:

```
git add task_manager.py
git commit -m "Добавлен функционал управления задачами"


```

5. После завершения разработки функции завершим фичу и объединим ее с основной веткой:

```
git flow feature finish task-management

```
<image src="screenshots/23.png">
<image src="screenshots/24.png">

6. Переключимся на ветку "develop" и начнём создание релиза:

```
git checkout develop
git flow release start v1.0.0
```
<image src="screenshots/25.png">


7. Внесём изменения, связанные с релизом:

```
echo "v1.0.0" > version.txt
git add version.txt
git commit -m "Обновлена версия для релиза v1.0.0"

```

8. Завершим релиз и объединим его с ветками "develop" и "main":

```
git flow release finish v1.0.0
```
<image src="screenshots/26.png">

9. В процессе возникла ошибка, поэтому создадим hotfix:

```
git flow hotfix start hotfix-1.0.1
```

10. Внесём изменения для исправления ошибки и коммитите:

```
# Исправление ошибки
git add file_with_error.py
git commit -m "Исправлена критическая ошибка"
```

11. Завершим hotfix и объедините его с ветками "develop" и "main":

```
git flow hotfix finish hotfix-1.0.1
```
<image src="screenshots/27.png">

12. Завершим работы и отправки изменений на удаленный репозиторий. Отправим изменения на удаленный репозиторий:

```
git push origin develop
git push origin main

```

<image src="screenshots/28.png">