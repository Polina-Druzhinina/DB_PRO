# 1 Закупки продукции
## 1.1 `bm_StorageOperations` - операции склада

| Колонка | Назначение | Пример |
|---|---|---|
| `ID` | ID строки | `4780421` |
| `DocumentID` | Документ | `388235` |
| `OperationID` | Тип операции | `1` |
| `SourceID` | Строка чека `journal.transnumber` | `0` |
| `BludoID` | Блюдо | `0` |
| `ProductID` | Товар | `4368` |
| `VendorID` | Поставщик | `200` |
| `StorageID` | Склад | `41` |
| `RangeID` | Размер | `42` |
| `Price` | Цена | `323.00` |
| `PriceCost` | Себестоимость | `0.00` |
| `Count` | Количество | `2.7640` |
| `Amount` | Сумма | `892.77` |
| `Rest` | Остаток после операции | `0.0000` |
| `Period` | Период | `202011` |
| `ReasonID` | Причина списания | `NULL` |

Связаны через внешний ключ: `bm_JournalBarnetDocs`, `product`, `storages`, `bm_StorageOperationsType`

Неявно связаны:  `vendors` -  `VendorID`, `bm_ReasonDebit` -  `ReasonID`

## 1.2 `product` - продукты и ингредиенты

| Колонка | Назначение | Пример |
|---|---|---|
| `id` | ID | `4337` |
| `productid` | Внешний код товара | `1204073` |
| `description` | Наименование | `Бананы` |
| `CategoryID` | Категория | `200` |
| `SizeID` | Единица измерения | `42` |
| `vendorid` | Основной поставщик | `107` |
| `cost` | Себестоимость | `0.00` |
| `basepurchcost` | Базовая закупочная цена | `0.00` |
| `purchcost` | Закупочная цена | `NULL` |
| `onhand` | Остаток | `NULL` |
| `closingcount` | Закрывающий остаток | `0.000` |
| `lastsold` | Последняя продажа | `NULL` |
| `IsUse` | Признак использования | `0` |

Связаны через внешний ключ: `bm_Journal_Details`, `bm_StorageOperations_Table`, `pricelist`, `recipe`, `category`, `bm_ManufactureOrders`, `productinfo`, `closingcount`, `bm_StorageOperations`

Неявно связаны: `size` через `SizeID`

## 1.3 `vendors` - поставщики

| Колонка | Назначение | Пример |
|---|---|---|
| `id` | ID поставщика | `90` |
| `clientid` | Краткое имя/внешний код | `Габур` |
| `firstname` | Наименование | `ИП Габур` |
| `clientgroup` | Группа контрагента | `32` |
| `INN` | ИНН | `""` |
| `KPP` | КПП | `""` |
| `OGRN` | ОГРН | `""` |
| `accountn` | Расчётный счёт | `""` |
| `IsUse` | Активность | `0` |

Связаны через внешний ключ: `vendorgroup`

## 1.4 `pricelist` - цены

| Колонка | Назначение | Пример |
|---|---|---|
| `id` | ID строки | `113681` |
| `DocumentID` | Документ установки цен | `142417` |
| `productid` | Товар | `4544` |
| `groupid` | Ценовая группа | `2` |
| `basecost` | Базовая цена | `140.00` |
| `netcost` | Цена нетто | `NULL` |
| `vendorid` | Поставщик | `NULL` |
| `dateeff` | Дата действия | `NULL` |

Связаны через внешний ключ: `bm_JournalBarnetDocs`, `pricegroup`

---

# 2 Продажи товара

## 2.1 `journal` - продажи

| Колонка | Назначение | Пример |
|---|---|---|
| `transnumber` | Номер строки транзакции | `1675584` |
| `receiptn` | Номер чека | `0` |
| `dater` | Дата/время | `2020-11-10 09:49:09` |
| `transtype` | Тип строки | `301` |
| `id` | Внешний код товара | `906` |
| `description` | Наименование | `Доставка` |
| `quantity` | Количество | `0.000` |
| `price` | Цена | `0.00` |
| `amount` | Сумма | `0.00` |
| `discount` | Скидка, % | `0.000` |
| `discountamount` | Сумма скидки | `0.00` |
| `cost` | Себестоимость | `0.00` |
| `loginid` | Сотрудник | `906` |
| `customerid` | Клиент | `""` |
| `status` | Статус | `0` |
| `flagrefund` | Возврат | `0` |

Связаны через внешний ключ: `transtype`, `bm_Journal_Details`

Неявно связаны:  `personnel` через  `loginid`

## 2.2 `bm_Journal_Details` - детализация продаж

| Колонка | Назначение | Пример |
|---|---|---|
| `ID` | ID строки | `11530445` |
| `SourceID` | Строка чека `journal.transnumber` | `1675591` |
| `ProductID` | Товар | `4407` |
| `BludoID` | Блюдо | `4451` |
| `sBrutto` | Брутто | `400.000` |
| `Quantity` | Количество порций | `1.0000` |
| `Count` | Количество ингредиента | `0.4000` |
| `TicketNumber` | Номер чека | `14740696` |
| `RangeID` | Размер | `42` |
| `SizeID` | Единица | `163` |
| `StorageID` | Склад | `41` |

Связаны через внешний ключ: `journal`, `product`, `size`, `storages`

## 2.3 `bm_StorageOperations_Table` - себестоимость продаж

| Колонка | Назначение | Пример |
|---|---|---|
| `ID` | ID строки | `134198` |
| `DocumentID` | Документ | `388540` |
| `OperationID` | Тип операции | `2` |
| `SourceID` | Строка чека | `200634` |
| `BludoID` | Блюдо | `4641` |
| `ProductID` | Товар | `4345` |
| `Price` | Цена | `0.00` |
| `PriceCost` | Себестоимость | `0.00` |
| `Count` | Количество | `0.0000` |
| `Amount` | Сумма | `0.0000` |
| `ReasonID` | Причина | `24` |

Связаны через внешний ключ: `bm_JournalBarnetDocs`, `product`, `storages`, `bm_StorageOperationsType`

Неявно связаны: `journal` - через `SourceID`, `bm_ReasonDebit` - `ReasonID`

---

# 3 Взаимоотношения с поставщиками

## 3.1 `vendors` - поставщики

Колонки и связи - п. 1.3

## 3.2 `bm_JournalBarnetDocs` - документы поступления

| Колонка | Назначение | Пример |
|---|---|---|
| `ID` | ID документа | `1216` |
| `JournalID` | Журнал | `1` |
| `ShiftID` | Смена | `65` |
| `DocumentTypeID` | Тип документа, `4` - поступление | `1` |
| `DocumentNumber` | Номер документа | `1` |
| `Period` | Дата документа | `2013-07-23 10:00:00` |
| `CompanyID` | Юрлицо | `6` |
| `TicketNumber` | Номер чека | `NULL` |
| `Amount` | Сумма документа | `0.00` |
| `PersonID` | Автор документа | `897` |
| `IsUse` | Признак использования | `1` |

Связаны через внешний ключ: `bm_JournalTypeDocuments`, `bm_JournalType`, `bm_Companies`, `bm_ShiftsOperations`.

Неявно связаны: `journal` - через `TicketNumber`.

## 3.3 `vendorgroup` - группы поставщиков

| Колонка | Назначение | Пример |
|---|---|---|
| `vendorgroupid` | ID группы | `31` |
| `description` | Название | `Поставщики` |
| `flag` | Признак | `0` |

---

# 4 Работа персонала

## 4.1 `personnel` - сотрудники

| Колонка | Назначение | Пример |
|---|---|---|
| `personid` | ID сотрудника | `897` |
| `firstname` | Имя | `Администратор Barnet` |
| `lastname` | Фамилия | `""` |
| `securityaccess` | Уровень доступа | `9` |
| `flagpos` | Доступ к POS | `1` |
| `usepassword` | Пароль включён | `1` |
| `percent` | Процент | `0.000` |
| `deleteflag` | Признак удаления | `1` |
| `cardid` | Карта | `0` |

Связаны через внешний ключ: `bm_BonusHistory`.

Неявно связаны: `journal` - через `loginid`, `bm_JournalBarnetDocs` - через `PersonID`, `bm_JournalSessions` - через `PersonID`, `bm_PersonnelSecurity` - через `PersonID`

## 4.2 `bm_BonusHistory` - история бонусов

| Колонка | Назначение | Пример |
|---|---|---|
| `ID` | ID записи | `1` |
| `ClientID` | Клиент | `3352` |
| `ActionName` | Тип действия | `User` |
| `BonusValue` | Значение бонуса | `0.00` |
| `Period` | Дата | `2016-04-05 11:31:10` |
| `TicketNumber` | Номер чека | `NULL` |
| `PersonID` | Сотрудник | `897` |
| `IsCalc` | Признак расчёта | `NULL` |

Связаны через внешний ключ: `personnel`

Неявно связаны: `journal` - через `TicketNumber`

`BonusValue` - снимок баланса, не начисление

## 4.3 `journal` - продажи 

Колонки - п. 2.1

## 4.4 `bm_JournalSessions` - журнал событий 

| Колонка | Назначение | Пример |
|---|---|---|
| `ID` | ID записи | `1` |
| `Type` | Источник события | `Система` |
| `Message` | Текст | `Произведена очистка журнала системных сообщений.` |
| `IsError` | Ошибка | `0` |
| `DateAdd` | Дата | `2019-10-10 10:09:48` |
| `PersonID` | Сотрудник | `897` |

Неявно связаны: `personnel` - через `PersonID`

## 4.5 `bm_PersonnelSecurity` - права сотрудников

| Колонка | Назначение | Пример |
|---|---|---|
| `ID` | ID записи | `1397` |
| `PersonID` | Сотрудник | `906` |
| `ObjectID` | Объект доступа | `36` |
| `IsUse` | Включено | `1` |

Связаны через внешний ключ: `bm_SecurityObjects`

Неявно связаны: `personnel` - через `PersonID`

---

# 5 Остатки

## 5.1 `bm_StorageOperations` - движения склада

Колонки и связи - п. 1.1.

## 5.2 `bm_StorageOperationsType` - типы операций

| Колонка | Назначение | Пример |
|---|---|---|
| `ID` | ID типа | `1` |
| `Description` | Название | `Поступление` |
| `Factor` | Знак движения | `1` |

Связаны через внешний ключ: `bm_StorageOperations`, `bm_StorageOperations_Table`

## 5.3 `bm_ReasonDebit` - причины списания

| Колонка | Назначение | Пример |
|---|---|---|
| `ID` | ID причины | `1` |
| `ParentID` | Родитель | `0` |
| `Description` | Название | `Порча продукта` |
| `IsUse` | Активность | `1` |

Неявно связаны: `bm_StorageOperations` через `ReasonID`

## 5.4 `bm_StorageOperations_Table` -  списания

Колонки - п. 2.3