-- `bm_StorageOperations` связан с `vendors` -  `VendorID`
SELECT COUNT(*) AS Всего,
       COUNT(v.id) AS Нашлось
FROM dbo.bm_StorageOperations s
LEFT JOIN dbo.vendors v ON v.id = s.VendorID
WHERE s.VendorID <> 0;

-- `bm_StorageOperations` связан с `bm_ReasonDebit` -  `ReasonID`.
SELECT COUNT(*) AS Всего,
       COUNT(v.id) AS Нашлось
FROM dbo.bm_StorageOperations s
LEFT JOIN dbo.bm_ReasonDebit v ON v.id = s.ReasonID
WHERE s.ReasonID <> 0;

-- `product` связан с `size` через `SideID`
SELECT COUNT(*) AS Всего,
       COUNT(z.ID) AS Нашлось
FROM dbo.product p
LEFT JOIN dbo.size z ON z.ID = p.SizeID;

-- `journal` связан с `personnel` через `loginid`
SELECT COUNT(*) AS Всего, COUNT(per.personid) AS Нашлось
FROM dbo.journal j
LEFT JOIN dbo.personnel per ON per.personid = j.loginid;


--  `bm_StorageOperations_Table` с `journal` через `SourceID`
SELECT COUNT(*) AS Всего, COUNT(j.transnumber) AS Нашлось
FROM dbo.bm_StorageOperations_Table t
LEFT JOIN dbo.journal j ON j.transnumber = t.SourceID;

--  `bm_StorageOperations_Table` с `bm_ReasonDebit` через `ReasonID`
SELECT COUNT(*) AS Всего, COUNT(r.ID) AS Нашлось
FROM dbo.bm_StorageOperations_Table t
LEFT JOIN dbo.bm_ReasonDebit r ON r.ID = t.ReasonID;

--`bm_JournalBarnetDocs` с  `journal` через `TicketNumber`
SELECT COUNT(*) AS Всего, COUNT(j.receiptn) AS Нашлось
FROM dbo.bm_JournalBarnetDocs b
LEFT JOIN dbo.journal j ON j.receiptn = b.TicketNumber;

-- `personnel` с `journal` через `loginid`
SELECT COUNT(*) AS Всего, COUNT(p.personid) AS Нашлось
FROM dbo.journal j
LEFT JOIN dbo.personnel p ON p.personid = j.loginid;

-- `personnel` с `bm_JournalBarnetDocs` через `PersonID`
SELECT COUNT(*) AS Всего, COUNT(p.personid) AS Нашлось
FROM dbo.bm_JournalBarnetDocs b
LEFT JOIN dbo.personnel p ON p.personid = b.PersonID;

-- `personnel` с `bm_JournalSessions` через `PersonID`
SELECT COUNT(*) AS Всего, COUNT(p.personid) AS Нашлось
FROM dbo.bm_JournalSessions s
LEFT JOIN dbo.personnel p ON p.personid = s.PersonID;

-- `personnel` с `bm_PersonnelSecurity` через `PersonID`
SELECT COUNT(*) AS Всего, COUNT(p.personid) AS Нашлось
FROM dbo.bm_PersonnelSecurity x
LEFT JOIN dbo.personnel p ON p.personid = x.PersonID;

-- `bm_BonusHistory` с `journal` через `TicketNumber`
SELECT COUNT(*) AS Всего, COUNT(j.receiptn) AS Нашлось
FROM dbo.bm_BonusHistory b
LEFT JOIN dbo.journal j ON j.receiptn = b.TicketNumber;

-- `bm_StorageOperations` с `bm_ReasonDebit` через `ReasonID`
SELECT COUNT(*) AS Всего, COUNT(r.ID) AS Нашлось
FROM dbo.bm_StorageOperations s
LEFT JOIN dbo.bm_ReasonDebit r ON r.ID = s.ReasonID;

-- `bm_StorageOperations_Table` с `bm_ReasonDebit` через `ReasonID`
SELECT COUNT(*) AS Всего, COUNT(r.ID) AS Нашлось
FROM dbo.bm_StorageOperations_Table o
LEFT JOIN dbo.bm_ReasonDebit r ON r.ID = o.ReasonID;
