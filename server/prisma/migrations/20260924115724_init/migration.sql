-- CreateTable
CREATE TABLE "Person" (
    "id" INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
    "firstName" TEXT NOT NULL,
    "lastName" TEXT NOT NULL,
    "birthDate" DATETIME NOT NULL,
    "email" TEXT NOT NULL,
    "customerNumber" TEXT,
    "createdAt" DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" DATETIME NOT NULL
);

-- CreateTable
CREATE TABLE "Case" (
    "id" INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
    "caseNumber" TEXT NOT NULL,
    "type" TEXT NOT NULL,
    "status" TEXT NOT NULL,
    "submittedAt" DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" DATETIME NOT NULL,
    "personId" INTEGER NOT NULL,
    "caseworkerId" INTEGER,
    CONSTRAINT "Case_personId_fkey" FOREIGN KEY ("personId") REFERENCES "Person" ("id") ON DELETE RESTRICT ON UPDATE CASCADE,
    CONSTRAINT "Case_caseworkerId_fkey" FOREIGN KEY ("caseworkerId") REFERENCES "Caseworker" ("id") ON DELETE SET NULL ON UPDATE CASCADE
);

-- CreateTable
CREATE TABLE "DataChangeRequest" (
    "id" INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
    "changeType" TEXT NOT NULL,
    "newStreet" TEXT,
    "newHouseNumber" TEXT,
    "newPostalCode" TEXT,
    "newCity" TEXT,
    "newPhone" TEXT,
    "newEmail" TEXT,
    "newIban" TEXT,
    "effectiveDate" DATETIME,
    "caseId" INTEGER NOT NULL,
    CONSTRAINT "DataChangeRequest_caseId_fkey" FOREIGN KEY ("caseId") REFERENCES "Case" ("id") ON DELETE RESTRICT ON UPDATE CASCADE
);

-- CreateTable
CREATE TABLE "DamageReport" (
    "id" INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
    "category" TEXT NOT NULL,
    "affectedItem" TEXT,
    "incidentDate" DATETIME,
    "description" TEXT NOT NULL,
    "caseId" INTEGER NOT NULL,
    CONSTRAINT "DamageReport_caseId_fkey" FOREIGN KEY ("caseId") REFERENCES "Case" ("id") ON DELETE RESTRICT ON UPDATE CASCADE
);

-- CreateTable
CREATE TABLE "GeneralInquiry" (
    "id" INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
    "subject" TEXT,
    "message" TEXT NOT NULL,
    "referencedCaseNumber" TEXT,
    "caseId" INTEGER NOT NULL,
    CONSTRAINT "GeneralInquiry_caseId_fkey" FOREIGN KEY ("caseId") REFERENCES "Case" ("id") ON DELETE RESTRICT ON UPDATE CASCADE
);

-- CreateTable
CREATE TABLE "CaseHistoryEntry" (
    "id" INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
    "createdAt" DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "title" TEXT NOT NULL,
    "description" TEXT,
    "caseId" INTEGER NOT NULL,
    CONSTRAINT "CaseHistoryEntry_caseId_fkey" FOREIGN KEY ("caseId") REFERENCES "Case" ("id") ON DELETE RESTRICT ON UPDATE CASCADE
);

-- CreateTable
CREATE TABLE "Document" (
    "id" INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
    "fileName" TEXT NOT NULL,
    "filePath" TEXT NOT NULL,
    "uploadedAt" DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "status" TEXT NOT NULL DEFAULT 'SUBMITTED',
    "caseId" INTEGER NOT NULL,
    CONSTRAINT "Document_caseId_fkey" FOREIGN KEY ("caseId") REFERENCES "Case" ("id") ON DELETE RESTRICT ON UPDATE CASCADE
);

-- CreateTable
CREATE TABLE "DocumentRequest" (
    "id" INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
    "description" TEXT NOT NULL,
    "requestedAt" DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "fulfilledAt" DATETIME,
    "caseId" INTEGER NOT NULL,
    "caseworkerId" INTEGER,
    CONSTRAINT "DocumentRequest_caseId_fkey" FOREIGN KEY ("caseId") REFERENCES "Case" ("id") ON DELETE RESTRICT ON UPDATE CASCADE,
    CONSTRAINT "DocumentRequest_caseworkerId_fkey" FOREIGN KEY ("caseworkerId") REFERENCES "Caseworker" ("id") ON DELETE SET NULL ON UPDATE CASCADE
);

-- CreateTable
CREATE TABLE "Caseworker" (
    "id" INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
    "name" TEXT NOT NULL,
    "email" TEXT NOT NULL,
    "passwordHash" TEXT NOT NULL
);

-- CreateTable
CREATE TABLE "ReferenceRecord" (
    "id" INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
    "customerNumber" TEXT NOT NULL,
    "firstName" TEXT NOT NULL,
    "lastName" TEXT NOT NULL,
    "birthDate" DATETIME NOT NULL,
    "knownAddress" TEXT,
    "knownIban" TEXT,
    "knownEmail" TEXT NOT NULL
);

-- CreateIndex
CREATE UNIQUE INDEX "Case_caseNumber_key" ON "Case"("caseNumber");

-- CreateIndex
CREATE UNIQUE INDEX "DataChangeRequest_caseId_key" ON "DataChangeRequest"("caseId");

-- CreateIndex
CREATE UNIQUE INDEX "DamageReport_caseId_key" ON "DamageReport"("caseId");

-- CreateIndex
CREATE UNIQUE INDEX "GeneralInquiry_caseId_key" ON "GeneralInquiry"("caseId");

-- CreateIndex
CREATE UNIQUE INDEX "Caseworker_email_key" ON "Caseworker"("email");

-- CreateIndex
CREATE UNIQUE INDEX "ReferenceRecord_customerNumber_key" ON "ReferenceRecord"("customerNumber");
