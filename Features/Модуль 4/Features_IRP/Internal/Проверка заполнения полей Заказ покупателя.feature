﻿#language: ru

@tree

Функционал: проверка заполненности полей в документе Заказ покупателя

Как Тестировщик я хочу
проверить заполнение полей 
чтобы поля заполнялись корректно 

Контекст:
Дано Я открыл новый сеанс TestClient или подключил уже существующий

Сценарий: загрузка первоначальных данных
когда экспорт основных данных

Сценарий: проверка заполнения полей Партнер, Соглашение
*Создание документа Заказ покупателя
	И В командном интерфейсе я выбираю 'Продажи' 'Заказы покупателей'
	Тогда открылось окно 'Заказы покупателей'
	И я нажимаю на кнопку с именем 'FormCreate'
	Тогда открылось окно 'Заказ покупателя (создание)'
*Выбор партера
	И я нажимаю кнопку выбора у поля с именем "Partner"
	Тогда открылось окно 'Партнеры'
	И в таблице "List" я перехожу к строке:
		| 'Код' | 'Наименование'            |
		| '2'   | 'Клиент 2 (2 соглашения)' |
	И в таблице "List" я активизирую поле с именем "Description"
	И в таблице "List" я выбираю текущую строку
*Выбор соглашения	
	И я нажимаю кнопку выбора у поля с именем "Agreement"
	Тогда открылось окно 'Соглашения'
	И в таблице "List" я перехожу к строке:
		| 'Вид'     | 'Вид взаиморасчетов' | 'Код' | 'Наименование'                                        |
		| 'Обычное' | 'По соглашениям'     | '2'   | 'Индивидуальное соглашение 1 (расчет по соглашениям)' |
	И в таблице "List" я активизирую поле с именем "Description"
	И в таблице "List" я выбираю текущую строку
*Проверка заполнения полей Партнер, Соглашение	
	Тогда элемент формы с именем "Partner" стал равен 'Клиент 2 (2 соглашения)'
	Тогда элемент формы с именем "Agreement" стал равен 'Индивидуальное соглашение 1 (расчет по соглашениям)'
	
	И я закрываю все окна клиентского приложения

Сценарий: проверка блокировки поля Контрагент
*Создание документа Заказ покупателя
	И В командном интерфейсе я выбираю 'Продажи' 'Заказы покупателей'
	Тогда открылось окно 'Заказы покупателей'
	И я нажимаю на кнопку с именем 'FormCreate'
	Тогда открылось окно 'Заказ покупателя (создание)'
*Проверка доступности элементов формы
	И элемент формы "Партнер" присутствует на форме
	И элемент формы "Партнер" доступен
	И элемент формы "Контрагент" присутствует на форме
	И элемент формы "Контрагент" не доступен
	
	И я закрываю все окна клиентского приложения