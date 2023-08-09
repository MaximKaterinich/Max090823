
#Область ОбработчикиСобытийФормы

&НаСервере
Процедура ПриСозданииНаСервере(Отказ, СтандартнаяОбработка)
	
	// СтандартныеПодсистемы.ПодключаемыеКоманды
	ПодключаемыеКоманды.ПриСозданииНаСервере(ЭтотОбъект);
	// Конец СтандартныеПодсистемы.ПодключаемыеКоманды
	
	// М.В. Катеринич, 23.05.2023 Программное добавление элементов на форму {	 
	ПрограммноеДобавлениеЭлементовНаФорму(); 
	// М.В. Катеринич, 23.05.2023 18:51:03  }
	
КонецПроцедуры

&НаКлиенте
Процедура ПриОткрытии(Отказ)
	
	// СтандартныеПодсистемы.ПодключаемыеКоманды
	ПодключаемыеКомандыКлиент.НачатьОбновлениеКоманд(ЭтотОбъект);
	// Конец СтандартныеПодсистемы.ПодключаемыеКоманды
	
КонецПроцедуры

&НаСервере
Процедура ПриЧтенииНаСервере(ТекущийОбъект)
	
	// СтандартныеПодсистемы.ПодключаемыеКоманды
	ПодключаемыеКомандыКлиентСервер.ОбновитьКоманды(ЭтотОбъект, Объект);
	// Конец СтандартныеПодсистемы.ПодключаемыеКоманды
	
КонецПроцедуры

&НаКлиенте
Процедура ПослеЗаписи(ПараметрыЗаписи)
	ПодключаемыеКомандыКлиент.ПослеЗаписи(ЭтотОбъект, Объект, ПараметрыЗаписи);
КонецПроцедуры

#КонецОбласти

#Область ОбработчикиСобытийЭлементовТаблицыФормыТовары

&НаКлиенте
Процедура ТоварыКоличествоПриИзменении(Элемент)
	
	ТекущиеДанные = Элементы.Товары.ТекущиеДанные;
	
	РассчитатьСуммуСтроки(ТекущиеДанные);
	
КонецПроцедуры

&НаКлиенте
Процедура ТоварыЦенаПриИзменении(Элемент)
	
	ТекущиеДанные = Элементы.Товары.ТекущиеДанные;
	
	РассчитатьСуммуСтроки(ТекущиеДанные);
	
КонецПроцедуры

&НаКлиенте
Процедура ТоварыСкидкаПриИзменении(Элемент)
	
	ТекущиеДанные = Элементы.Товары.ТекущиеДанные;
	
	РассчитатьСуммуСтроки(ТекущиеДанные);
	
		
КонецПроцедуры

&НаКлиенте
Процедура ТоварыПриИзменении(Элемент)
	
	РассчитатьСуммуДокумента();
	
КонецПроцедуры

#КонецОбласти

#Область ОбработчикиСобытийЭлементовТаблицыФормыУслуги

&НаКлиенте
Процедура УслугиКоличествоПриИзменении(Элемент)
	
	ТекущиеДанные = Элементы.Услуги.ТекущиеДанные;
	
	РассчитатьСуммуСтроки(ТекущиеДанные);
	
КонецПроцедуры

&НаКлиенте
Процедура УслугиЦенаПриИзменении(Элемент)
	
	ТекущиеДанные = Элементы.Услуги.ТекущиеДанные;
	
	РассчитатьСуммуСтроки(ТекущиеДанные);
	
КонецПроцедуры

&НаКлиенте
Процедура УслугиСкидкаПриИзменении(Элемент)
	
	ТекущиеДанные = Элементы.Услуги.ТекущиеДанные;
	
	РассчитатьСуммуСтроки(ТекущиеДанные);
	
КонецПроцедуры

&НаКлиенте
Процедура УслугиПриИзменении(Элемент)
	
	РассчитатьСуммуДокумента();
	
КонецПроцедуры

#КонецОбласти

#Область СлужебныеПроцедурыИФункции

&НаКлиенте
Процедура РассчитатьСуммуСтроки(ТекущиеДанные)
	
	//М.В. Катеринич 29.05.2023 удаление прошлого рассчета { 
	//КоэффициентСкидки = 1 - ТекущиеДанные.Скидка / 100;
	//ТекущиеДанные.Сумма = ТекущиеДанные.Цена * ТекущиеДанные.Количество * КоэффициентСкидки;
	//М.В. Катеринич 29.05.2023 удаление прошлого рассчета }
	
	// М.В. Катеринич, 25.05.2023 добавление к рассчету % скидки/наценки {  
	ТекущиеДанные.Сумма = ПересчитатьСумму (ТекущиеДанные.Количество, ТекущиеДанные.Цена, Объект.Макс_ПроцентСкидкиНаценки, ТекущиеДанные.Скидка); 
	// М.В. Катеринич, 25.05.2023 добавление к рассчету % скидки/наценки }  
	
	
КонецПроцедуры

&НаКлиенте
Процедура РассчитатьСуммуДокумента()
	
	Объект.СуммаДокумента = Объект.Товары.Итог("Сумма") + Объект.Услуги.Итог("Сумма");
	
КонецПроцедуры

#Область ПодключаемыеКоманды

// СтандартныеПодсистемы.ПодключаемыеКоманды
&НаКлиенте
Процедура Подключаемый_ВыполнитьКоманду(Команда)
	ПодключаемыеКомандыКлиент.НачатьВыполнениеКоманды(ЭтотОбъект, Команда, Объект);
КонецПроцедуры

&НаКлиенте
Процедура Подключаемый_ПродолжитьВыполнениеКомандыНаСервере(ПараметрыВыполнения, ДополнительныеПараметры) Экспорт
	ВыполнитьКомандуНаСервере(ПараметрыВыполнения);
КонецПроцедуры

&НаСервере
Процедура ВыполнитьКомандуНаСервере(ПараметрыВыполнения)
	ПодключаемыеКоманды.ВыполнитьКоманду(ЭтотОбъект, ПараметрыВыполнения, Объект);
КонецПроцедуры

&НаКлиенте
Процедура Подключаемый_ОбновитьКоманды()
	ПодключаемыеКомандыКлиентСервер.ОбновитьКоманды(ЭтотОбъект, Объект);
КонецПроцедуры
// Конец СтандартныеПодсистемы.ПодключаемыеКоманды

#КонецОбласти

#КонецОбласти   

#Область Макс_ДоработкаФормы    

// М.В. Катеринич, 24.05.2023 19:53:34 {  

&НаСервере
Процедура ПрограммноеДобавлениеЭлементовНаФорму() 
	
	//М.В. Катеринич Добавление команды пересчета суммы {
	НоваяКоманда = Команды.Добавить("ПересчитатьСуммуСУчетомСкидкиНаценки"); 
	НоваяКоманда.Заголовок = "Пересчитать с учетом скидки?"; 
	НоваяКоманда.Действие ="ПересчитатьСуммуСУчетомСкидкиНаценки"; 
	Кнопка = Элементы.Вставить("КнопкаРассчитатьСоСкидкой",Тип("КнопкаФормы"), Элементы.ГруппаШапкаЛево); 
	Кнопка.ИмяКоманды = "ПересчитатьСуммуСУчетомСкидкиНаценки";    
	Кнопка.ЦветФона = Новый Цвет(255, 255, 153);
	Кнопка.Шрифт = Новый Шрифт(, 12, Истина, , , );      
	//М.В. Катеринич Добавление команды пересчета суммы }
	
КонецПроцедуры       

&НаКлиенте
Процедура  Макс_ПроцентСкидкиНаценкиПриИзменении (Элемент)  
	
	ДиалоговоеОкноДаНет(); 
	
КонецПроцедуры  

&НаКлиенте
Процедура ПересчитатьСуммуСУчетомСкидкиНаценки(Команда)  
	
	ДиалоговоеОкноДаНет(); 

КонецПроцедуры   

&НаКлиенте
Процедура ДиалоговоеОкноДаНет()
	
	//М.В. Катеринич Диалоговое окно "Да/нет" {
	Режим = РежимДиалогаВопрос.ДаНет; 
	Оповещение = Новый ОписаниеОповещения("ПослеОтветаНаВопрос",ЭтотОбъект, Параметры); 
	ПоказатьВопрос(Оповещение, "Пересчитать с учетом скидки/наценки?", Режим, 0); 
	//М.В. Катеринич Диалоговое окно "Да/нет" }
	
КонецПроцедуры	


&НаКлиенте
Процедура ПослеОтветаНаВопрос(Результат, Параметры) Экспорт     
	
	//М.В. Катеринич пересчет строк после ответа на вопрос {
	Если Результат = КодВозвратаДиалога.Да Тогда    
		
		Для каждого ТекТовар Из Объект.Товары Цикл
			
			ТекТовар.Сумма =   ПересчитатьСумму (ТекТовар.Количество, ТекТовар.Цена, Объект.Макс_ПроцентСкидкиНаценки, ТекТовар.Скидка); 
			
		КонецЦикла;   
		
		Для каждого ТекУслуга Из Объект.Услуги Цикл
			
			ТекУслуга.Сумма =   ПересчитатьСумму (ТекУслуга.Количество, ТекУслуга.Цена, Объект.Макс_ПроцентСкидкиНаценки, ТекУслуга.Скидка); 
			
		КонецЦикла;   
		
		Объект.СуммаДокумента = Объект.Товары.Итог("Сумма") + Объект.Услуги.Итог("Сумма");
		
	КонецЕсли;
	//М.В. Катеринич пересчет строк после ответа на вопрос }
	
КонецПроцедуры     

&НаКлиенте
Функция ПересчитатьСумму (Количество, Цена, СкидкаНаценка, Скидка) 
	
	//М.В. Катеринич Изменение суммы на % скидки/наценки {
	//Изменение суммы на % скидки/наценки 
	//Наценка: плюсовое значение
	//Скидка: минусовое значение     
	
	ОбщаяСкидка = СкидкаНаценка + Скидка;  
	Доля = СкидкаНаценка/100;   
	ДоляТек = Скидка/100;
	ОбщаяДоля = Доля + ДоляТек; 
	Коэфициент = 1 - ОбщаяДоля;  

	Если ОбщаяСкидка > 100 Тогда
		Сумма = 0; 
		Сообщить  ("Суммарная скидка не может быть больше 100%!");   
	Иначе
	    Сумма = Количество * Цена * Коэфициент;  
    КонецЕсли; 
			
	Возврат  Сумма; 
	
	//М.В. Катеринич Изменение суммы на % скидки/наценки }
	
КонецФункции  

// М.В. Катеринич, 24.05.2023 19:53:34  }

#КонецОбласти   

