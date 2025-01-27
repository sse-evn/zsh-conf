# Загружаем необходимые библиотеки
library(ggplot2)
library(dplyr)

# Генерация случайных данных
set.seed(123)  # Для воспроизводимости результатов
data <- data.frame(
  ID = 1:100,
  Age = sample(18:80, 100, replace = TRUE),
  Salary = sample(30000:100000, 100, replace = TRUE),
  Gender = sample(c("Male", "Female"), 100, replace = TRUE)
)

# Просмотр первых нескольких строк данных
head(data)

# Подсчёт среднего возраста и зарплаты по полу
summary_data <- data %>%
  group_by(Gender) %>%
  summarise(
    Avg_Age = mean(Age),
    Avg_Salary = mean(Salary)
  )

# Выводим результаты
print(summary_data)

# Построение графика распределения зарплаты по полу
ggplot(data, aes(x = Salary, fill = Gender)) +
  geom_histogram(binwidth = 5000, alpha = 0.6, position = "identity") +
  labs(title = "Распределение зарплаты по полу", x = "Зарплата", y = "Частота") +
  theme_minimal() +
  scale_fill_manual(values = c("Male" = "blue", "Female" = "pink"))

# Построение графика зависимости возраста от зарплаты
ggplot(data, aes(x = Age, y = Salary, color = Gender)) +
  geom_point(alpha = 0.7) +
  labs(title = "Зависимость возраста от зарплаты", x = "Возраст", y = "Зарплата") +
  theme_minimal() +
  scale_color_manual(values = c("Male" = "blue", "Female" = "pink"))
