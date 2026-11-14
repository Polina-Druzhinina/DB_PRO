# 1. Закупки продукции

## 1.1. `bm_StorageOperations` - операции склада

| Колонка | Назначение | Пример |
|---|---|---|
| `ID` | ID строки | `6326063` |
| `DocumentID` | Документ | `465980` |
| `OperationID` | Тип операции | `1` |
| `SourceID` | Строка чека `journal.transnumber` | `0` |
| `BludoID` | Блюдо | `0` |
| `ProductID` | Товар | `4377` |
| `VendorID` | Поставщик | `91` |
| `StorageID` | Склад | `41` |
| `RangeID` | Размер/диапазон | `42` |
| `Price` | Цена | `404.00` |
| `PriceCost` | Себестоимость | `0.00` |
| `Count` | Количество | `6.0000` |
| `Amount` | Сумма строки | `2424.00` |
| `Rest` | Остаток после операции | `0.0000` |
| `Period` | Период | `202312` |
| `ReasonID` | Причина списания | `NULL` |

Связаны через внешний ключ: `bm_JournalBarnetDocs`, `product`, `storages`, `bm_StorageOperationsType`.

Неявно связаны:  `vendors` -  `VendorID`, `bm_ReasonDebit` -  `ReasonID`.

## 1.2. `product` - продукты и ингредиенты

| Колонка | Назначение | Пример |
|---|---|---|
| `id` | Внутренний ID | `7719` |
| `productid` | Внешний код товара | `7427483` |
| `description` | Наименование | `Комбо 5 30 см` |
| `CategoryID` | Категория | `359` |
| `SizeID` | Единица измерения | `1` |
| `vendorid` | Основной поставщик | `0` |
| `cost` | Себестоимость | `0.00` |
| `basepurchcost` | Базовая закупочная цена | `0.00` |
| `purchcost` | Закупочная цена | `NULL` |
| `onhand` | Остаток | `NULL` |
| `closingcount` | Закрывающий остаток | `0.000` |
| `lastsold` | Последняя продажа | `NULL` |
| `IsUse` | Признак использования | `1` |

Связаны через внешний ключ: `bm_Journal_Details`, `bm_StorageOperations_Table`, `pricelist`, `recipe`, `category`.

Неявно связаны: `size` - через `SizeID`, `vendors` - через `vendorid`.

## 1.3. `vendors` - поставщики

| Колонка | Назначение | Пример |
|---|---|---|
| `id` | ID поставщика | `213` |
| `clientid` | Краткое имя/внешний код | `ООО Продбаза` |
| `firstname` | Наименование | `ООО Продбаза` |
| `clientgroup` | Группа контрагента | `31` |
| `INN` | ИНН | `""` |
| `KPP` | КПП | `""` |
| `OGRN` | ОГРН | `""` |
| `accountn` | Расчётный счёт | `""` |
| `IsUse` | Активность | `1` |

Связаны через внешний ключ: `vendorgroup`.

## 1.4. `pricelist` - цены

| Колонка | Назначение | Пример |
|---|---|---|
| `id` | ID строки | `234802` |
| `DocumentID` | Документ установки цен | `465980` |
| `productid` | Товар | `4377` |
| `groupid` | Ценовая группа | `3` |
| `basecost` | Базовая цена | `0.00` |
| `netcost` | Цена нетто | `404.00` |
| `vendorid` | Поставщик | `NULL` |
| `dateeff` | Дата действия | `NULL` |

Связаны через внешний ключ: `bm_JournalBarnetDocs`, `pricegroup`.

---

# 2. Продажи товара

## 2.1. `journal` - продажи

| Колонка | Назначение | Пример |
|---|---|---|
| `transnumber` | Номер строки транзакции | `1950755` |
| `receiptn` | Номер чека | `55133947` |
| `dater` | Дата/время | `2023-12-02 22:40:20` |
| `transtype` | Тип строки | `101` |
| `id` | Внешний код товара | `9969318` |
| `description` | Наименование | `Пицца Марио 30см (с сосисками)` |
| `quantity` | Количество | `1.000` |
| `price` | Цена | `561.00` |
| `amount` | Сумма | `561.00` |
| `discount` | Скидка, % | `15.000` |
| `discountamount` | Сумма скидки | `99.00` |
| `cost` | Себестоимость | `0.00` |
| `loginid` | Сотрудник/касса | `906` |
| `customerid` | Клиент | `12345` |
| `status` | Статус | `0` |
| `flagrefund` | Возврат | `0` |

Связаны через внешний ключ: `transtype`.

Неявно связаны: `product` - через `id`, `personnel` -  `loginid`, `clients` - `customerid`, `bm_Journal_Details` - `SourceID`, `bm_JournalBarnetDocs` - `TicketNumber`, `bm_StorageOperations_Table` - `SourceID`.

## 2.2. `bm_Journal_Details` - детализация продаж

| Колонка | Назначение | Пример |
|---|---|---|
| `ID` | ID строки | `225297748` |
| `SourceID` | Строка чека `journal.transnumber` | `1950990` |
| `ProductID` | Товар | `7650` |
| `BludoID` | Блюдо | `4822` |
| `sBrutto` | Брутто | `80.000` |
| `Quantity` | Количество порций | `1.0000` |
| `Count` | Количество ингредиента | `0.0800` |
| `TicketNumber` | Номер чека | `52169561` |
| `RangeID` | Размер | `42` |
| `SizeID` | Единица | `163` |
| `StorageID` | Склад | `41` |

Связаны через внешний ключ: `journal`, `product`, `size`, `storages`.

## 2.3. `bm_StorageOperations_Table` - себестоимость продаж

| Колонка | Назначение | Пример |
|---|---|---|
| `ID` | ID строки | `165000` |
| `DocumentID` | Документ | `465974` |
| `OperationID` | Тип операции | `2` |
| `SourceID` | Строка чека | `1950928` |
| `BludoID` | Блюдо | `4529` |
| `ProductID` | Товар | `4382` |
| `Price` | Цена | `275.30` |
| `PriceCost` | Себестоимость | `275.30` |
| `Count` | Количество | `-0.0500` |
| `Amount` | Сумма | `-13.77` |
| `ClientID` | Клиент | `0` |
| `ReasonID` | Причина | `122` |

Связаны через внешний ключ: `bm_JournalBarnetDocs`, `product`, `storages`, `bm_StorageOperationsType`.

Неявно связаны: `journal` - через `SourceID`, `bm_ReasonDebit` - `ReasonID`.

## 2.4. `clients` - клиенты

| Колонка | Назначение | Пример |
|---|---|---|
| `id` | Внутренний ID | `4022` |
| `clientid` | Внешний код/телефон | `824646725595` |
| `lastname` | Фамилия | `Силаева` |
| `firstname` | Имя | `Владислава` |
| `clientgroup` | Группа | `203` |
| `points` | Баллы | `150.00` |
| `bonus` | Бонус | `0.000` |
| `discount` | Скидка | `0.000` |
| `personid` | Сотрудник | `906` |
| `paymenttypeid` | Тип оплаты | `0` |

Связаны через внешний ключ: `clientgroup`.

Неявно связаны: `bm_BonusHistory` - через `ClientID`.

---

# 3. Взаимоотношения с поставщиками

## 3.1. `vendors` - поставщики

Колонки - п. 1.3. Связи - п. 1.1, 1.3.

## 3.2. Документы поступления

Колонки - п. 1.1, 1.4, 1.5.

## 3.3. `vendorgroup` - группы поставщиков

| Колонка | Назначение | Пример |
|---|---|---|
| `vendorgroupid` | ID группы | `31` |
| `description` | Название | `Поставщики` |
| `flag` | Признак | `0` |

---

# 4. Работа персонала

## 4.1. `personnel` - сотрудники

| Колонка | Назначение | Пример |
|---|---|---|
| `personid` | ID сотрудника | `897` |
| `firstname` | Имя/роль | `Администратор Barnet` |
| `lastname` | Фамилия | `""` |
| `securityaccess` | Уровень доступа | `9` |
| `flagpos` | Доступ к POS | `1` |
| `usepassword` | Пароль включён | `1` |
| `percent` | Процент | `0.000` |
| `deleteflag` | Признак удаления | `1` |
| `cardid` | Карта | `0` |

Связаны через внешний ключ: `bm_BonusHistory`.

Неявно связаны: `journal` - через `loginid`, `bm_JournalBarnetDocs` - через `PersonID`, `bm_JournalSessions` - через `PersonID`, `bm_PersonnelSecurity` - через `PersonID`, `bm_SecurityObjects_Info` - через `ManagerID`, `securityaccess` - через `securityaccess`, `storages` - через `ResponsibleID`.

## 4.2. `bm_BonusHistory` - история бонусов

| Колонка | Назначение | Пример |
|---|---|---|
| `ID` | ID записи | `84860` |
| `ClientID` | Клиент | `255` |
| `ActionName` | Тип действия | `Journal` |
| `BonusValue` | Значение бонуса | `13542789.74` |
| `Period` | Дата | `2023-12-06 10:31:54` |
| `TicketNumber` | Номер чека | `59368651` |
| `PersonID` | Сотрудник | `906` |
| `IsCalc` | Признак расчёта | `1` |

Связаны через внешний ключ: `personnel`.

Неявно связаны: `journal` - через `TicketNumber`.

`BonusValue` - снимок баланса, не начисление.

## 4.3. `journal` - действия сотрудников

Колонки - п. 2.1. `loginid = 906` («Доставка») - 94,8% чеков, при анализе продаж исключать.

## 4.4. `bm_JournalSessions` - журнал событий ПО

| Колонка | Назначение | Пример |
|---|---|---|
| `ID` | ID записи | `174072` |
| `Type` | Источник события | `barnetbc.ru` |
| `Message` | Текст | `Ошибка … SSL/TLS` |
| `IsError` | Ошибка | `1` |
| `DateAdd` | Дата | `2023-12-06 14:18:08` |
| `PersonID` | Сотрудник | `897` |

Неявно связаны: `personnel` - через `PersonID`.

## 4.5. `bm_PersonnelSecurity` - права сотрудников

| Колонка | Назначение | Пример |
|---|---|---|
| `ID` | ID записи | `2798` |
| `PersonID` | Сотрудник | `1004` |
| `ObjectID` | Объект доступа | `50` |
| `IsUse` | Включено | `0` |

Связаны через внешний ключ: `bm_SecurityObjects`.

Неявно связаны: `personnel` - через `PersonID`.

## 4.6. `bm_SecurityObjects` - объекты доступа

| Колонка | Назначение | Пример |
|---|---|---|
| `ID` | ID объекта | `274` |
| `ParentSystem` | Система | `NULL` |
| `SecurityGroup` | Группа | `""` |
| `ObjectName` | Код объекта | `frmReferensCashTypes` |
| `Description` | Описание | `** Новый объект доступа` |

Неявно связаны: `bm_SecurityObjects_Info` - через `ParentID`.

## 4.7. `bm_SecurityObjects_Info` - настройки объектов

| Колонка | Назначение | Пример |
|---|---|---|
| `ID` | ID записи | `1602` |
| `ParentID` | Объект | `77` |
| `KeyName` | Параметр | `PreviewDetails` |
| `KeyValue` | Значение | `0` |
| `ManagerID` | Сотрудник | `897` |

## 4.8. Мелочь

| Таблица | Назначение | Колонки (пример) |
|---|---|---|
| `securityaccess` | Уровни доступа | `securityaccessid` `3`, `description` `Manager/Adm` |
| `bm_ShiftsOperations` | Смены | `ID` `65`, `ShiftNumber` `1`, `Amount` `0.00`, `DateAdd` `2015-07-14` |
| `webclients` | Веб-роли | `webclientid` `20`, `login` `0`, `firstname` `Повар` |

---

# 5. Остатки

## 5.1. `bm_StorageOperations` - движения склада

Колонки и связи - п. 1.1.

| Операция | Сумма |
|---|---|
| `1` поступление | +20 018 690,28 |
| `2` списание | -86 096 814,10 |

## 5.2. `bm_StorageOperationsType` - типы операций

| Колонка | Назначение | Пример |
|---|---|---|
| `ID` | ID типа | `5` |
| `Description` | Название | `Возврат` |
| `Factor` | Знак движения | `1` |

Используются только `1` и `2`.

## 5.3. `bm_ReasonDebit` - причины списания

| Колонка | Назначение | Пример |
|---|---|---|
| `ID` | ID причины | `208` |
| `ParentID` | Родитель | `7` |
| `Description` | Название | `Путина Екатерина` |
| `IsUse` | Активность | `1` |

## 5.4. `bm_StorageOperations_Table` - сводные списания

Колонки - п. 2.3. Сумма -2 650 291,85, покрыто 3 405 чеков из 44 838.

## 5.5. `product` и `storages`

Колонки - п. 1.2.

| Поле | Значение |
|---|---|
| `product.onhand` | `NULL` у всех |
| `product.closingcount` | `0` у всех |
| `product.cost`, `purchcost` | `0` / `NULL` |
| `product.basepurchcost` | заполнен у 63 товаров |
| `storages` | один склад `id = 41` |

## 5.6. `bm_Journal_Details` и `recipe`

Колонки - п. 1.2, 2.2.

