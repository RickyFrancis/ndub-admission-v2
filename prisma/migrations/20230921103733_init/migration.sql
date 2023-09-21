-- CreateEnum
CREATE TYPE "Roles" AS ENUM ('APPLICANT', 'ADMIN', 'SUPERADMIN');

-- CreateEnum
CREATE TYPE "PaymentStatus" AS ENUM ('UNPAID', 'PENDING', 'PAID');

-- CreateEnum
CREATE TYPE "PaymentMethods" AS ENUM ('BKASH', 'BANK');

-- CreateEnum
CREATE TYPE "Genders" AS ENUM ('MALE', 'FEMALE', 'OTHER');

-- CreateEnum
CREATE TYPE "Religions" AS ENUM ('Christianity', 'Islam', 'Hinduism', 'Buddhism', 'Other');

-- CreateEnum
CREATE TYPE "Trimesters" AS ENUM ('SPRING', 'SUMMER', 'FALL');

-- CreateEnum
CREATE TYPE "ProgramTypes" AS ENUM ('UNDERGRADUATE', 'GRADUATE');

-- CreateEnum
CREATE TYPE "MaritalStatuses" AS ENUM ('MARRIED', 'UNMARRIED', 'DIVORCED');

-- CreateEnum
CREATE TYPE "SSCHSCGroups" AS ENUM ('SCIENCE', 'COMMERCE', 'HUMANITIES');

-- CreateEnum
CREATE TYPE "BloodGroups" AS ENUM ('A_POSITIVE', 'A_NEGATIVE', 'B_POSITIVE', 'B_NEGATIVE', 'O_POSITIVE', 'O_NEGATIVE', 'AB_POSITIVE', 'AB_NEGATIVE');

-- CreateEnum
CREATE TYPE "Nationalities" AS ENUM ('Afghan', 'Albanian', 'Algerian', 'American', 'Andorran', 'Angolan', 'Antiguans', 'Argentinean', 'Armenian', 'Australian', 'Austrian', 'Azerbaijani', 'Bahamian', 'Bahraini', 'Bangladeshi', 'Barbadian', 'Barbudans', 'Batswana', 'Belarusian', 'Belgian', 'Belizean', 'Beninese', 'Bhutanese', 'Bolivian', 'Bosnian', 'Brazilian', 'British', 'Bruneian', 'Bulgarian', 'Burkinabe', 'Burmese', 'Burundian', 'Cambodian', 'Cameroonian', 'Canadian', 'CapeVerdean', 'CentralAfrican', 'Chadian', 'Chilean', 'Chinese', 'Colombian', 'Comoran', 'Congolese', 'CostaRican', 'Croatian', 'Cuban', 'Cypriot', 'Czech', 'Danish', 'Djibouti', 'Dominican', 'Dutch', 'Dutchman', 'Dutchwoman', 'EastTimorese', 'Ecuadorean', 'Egyptian', 'Emirian', 'EquatorialGuinean', 'Eritrean', 'Estonian', 'Ethiopian', 'Fijian', 'Filipino', 'Finnish', 'French', 'Gabonese', 'Gambian', 'Georgian', 'German', 'Ghanaian', 'Greek', 'Grenadian', 'Guatemalan', 'GuineaBissauan', 'Guinean', 'Guyanese', 'Haitian', 'Herzegovinian', 'Honduran', 'Hungarian', 'IKiribati', 'Icelander', 'Indian', 'Indonesian', 'Iranian', 'Iraqi', 'Irish', 'Israeli', 'Italian', 'Ivorian', 'Jamaican', 'Japanese', 'Jordanian', 'Kazakhstani', 'Kenyan', 'KittianandNevisian', 'Kuwaiti', 'Kyrgyz', 'Laotian', 'Latvian', 'Lebanese', 'Liberian', 'Libyan', 'Liechtensteiner', 'Lithuanian', 'Luxembourger', 'Macedonian', 'Malagasy', 'Malawian', 'Malaysian', 'Maldivan', 'Malian', 'Maltese', 'Marshallese', 'Mauritanian', 'Mauritian', 'Mexican', 'Micronesian', 'Moldovan', 'Monacan', 'Mongolian', 'Moroccan', 'Mosotho', 'Motswana', 'Mozambican', 'Namibian', 'Nauruan', 'Nepalese', 'Netherlander', 'NewZealander', 'NiVanuatu', 'Nicaraguan', 'Nigerian', 'Nigerien', 'NorthKorean', 'NorthernIrish', 'Norwegian', 'Omani', 'Pakistani', 'Palauan', 'Panamanian', 'PapuaNewGuinean', 'Paraguayan', 'Peruvian', 'Polish', 'Portuguese', 'Qatari', 'Romanian', 'Russian', 'Rwandan', 'SaintLucian', 'Salvadoran', 'Samoan', 'SanMarinese', 'SaoTomean', 'Saudi', 'Scottish', 'Senegalese', 'Serbian', 'Seychellois', 'SierraLeonean', 'Singaporean', 'Slovakian', 'Slovenian', 'SolomonIslander', 'Somali', 'SouthAfrican', 'SouthKorean', 'Spanish', 'SriLankan', 'Sudanese', 'Surinamer', 'Swazi', 'Swedish', 'Swiss', 'Syrian', 'Taiwanese', 'Tajik', 'Tanzanian', 'Thai', 'Togolese', 'Tongan', 'TrinidadianorTobagonian', 'Tunisian', 'Turkish', 'Tuvaluan', 'Ugandan', 'Ukrainian', 'Uruguayan', 'Uzbekistani', 'Venezuelan', 'Vietnamese', 'Welsh', 'Yemenite', 'Zambian', 'Zimbabwean');

-- CreateTable
CREATE TABLE "Role" (
    "id" SERIAL NOT NULL,
    "role" "Roles" NOT NULL DEFAULT 'APPLICANT',

    CONSTRAINT "Role_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "User" (
    "id" TEXT NOT NULL,
    "phone" TEXT NOT NULL,
    "isPhoneVerified" BOOLEAN NOT NULL DEFAULT false,
    "email" TEXT NOT NULL,
    "password" TEXT NOT NULL,
    "date" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "roleId" INTEGER NOT NULL,

    CONSTRAINT "User_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "PhoneVerificationCode" (
    "id" SERIAL NOT NULL,
    "code" TEXT NOT NULL,
    "date" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "isVerified" BOOLEAN NOT NULL DEFAULT false,
    "userId" TEXT NOT NULL,

    CONSTRAINT "PhoneVerificationCode_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "EmailVerificationCode" (
    "id" SERIAL NOT NULL,
    "code" TEXT NOT NULL,
    "date" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "isVerified" BOOLEAN NOT NULL DEFAULT false,
    "userId" TEXT NOT NULL,

    CONSTRAINT "EmailVerificationCode_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "Profile" (
    "id" SERIAL NOT NULL,
    "date" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "userId" TEXT NOT NULL,
    "religion" "Religions" NOT NULL,
    "gender" "Genders" NOT NULL,
    "nationality" "Nationalities" NOT NULL DEFAULT 'Bangladeshi',
    "dob" TIMESTAMP(3) NOT NULL,
    "bloodgroup" "BloodGroups" NOT NULL,
    "maritalStatus" "MaritalStatuses" NOT NULL,
    "birthCertificateNumber" TEXT,
    "nidNumber" TEXT,
    "secondaryPhoneNumber" TEXT,
    "fathersName" TEXT NOT NULL,
    "fathersOccupation" TEXT,
    "fathersPhoneNumber" TEXT NOT NULL,
    "fathersNid" TEXT,
    "mothersName" TEXT NOT NULL,
    "mothersOccupation" TEXT,
    "mothersPhoneNumber" TEXT NOT NULL,
    "mothersNid" TEXT,
    "localGuardiansName" TEXT NOT NULL,
    "localGuardiansOccupation" TEXT,
    "localGuardiansPhoneNumber" TEXT NOT NULL,
    "localGuardiansNid" TEXT,
    "emergencyContactName" TEXT NOT NULL,
    "emergencyContactPhone" TEXT NOT NULL,
    "presentAddress" TEXT NOT NULL,
    "permamentAddress" TEXT NOT NULL,

    CONSTRAINT "Profile_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "Images" (
    "id" SERIAL NOT NULL,
    "userId" TEXT NOT NULL,
    "profilePicture" TEXT NOT NULL,
    "signaturePicture" TEXT NOT NULL,

    CONSTRAINT "Images_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "SSC" (
    "id" SERIAL NOT NULL,
    "userId" TEXT NOT NULL,
    "institution" TEXT NOT NULL,
    "group" "SSCHSCGroups" NOT NULL,
    "year" TIMESTAMP(3) NOT NULL,
    "gpa" DOUBLE PRECISION NOT NULL,
    "subjects" TEXT[],

    CONSTRAINT "SSC_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "HSC" (
    "id" SERIAL NOT NULL,
    "userId" TEXT NOT NULL,
    "institution" TEXT NOT NULL,
    "group" "SSCHSCGroups" NOT NULL,
    "year" TIMESTAMP(3) NOT NULL,
    "gpa" DOUBLE PRECISION NOT NULL,
    "subjects" TEXT[],

    CONSTRAINT "HSC_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "Bachelor" (
    "id" SERIAL NOT NULL,
    "userId" TEXT NOT NULL,
    "course" TEXT NOT NULL,
    "institution" TEXT NOT NULL,
    "major" TEXT,
    "degreeStartYear" TIMESTAMP(3) NOT NULL,
    "degreeEndYear" TIMESTAMP(3) NOT NULL,
    "cgpa" DOUBLE PRECISION NOT NULL,

    CONSTRAINT "Bachelor_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "Master" (
    "id" SERIAL NOT NULL,
    "userId" TEXT NOT NULL,
    "course" TEXT NOT NULL,
    "institution" TEXT NOT NULL,
    "major" TEXT,
    "degreeStartYear" TIMESTAMP(3) NOT NULL,
    "degreeEndYear" TIMESTAMP(3) NOT NULL,
    "cgpa" DOUBLE PRECISION NOT NULL,

    CONSTRAINT "Master_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "Experience" (
    "id" SERIAL NOT NULL,
    "userId" TEXT NOT NULL,
    "company" TEXT NOT NULL,
    "position" TEXT NOT NULL,
    "startYear" TIMESTAMP(3) NOT NULL,
    "endYear" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "Experience_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "AdmissionTestMarks" (
    "id" SERIAL NOT NULL,
    "profilePicture" TEXT NOT NULL,
    "signaturePicture" TEXT NOT NULL,

    CONSTRAINT "AdmissionTestMarks_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "Department" (
    "id" SERIAL NOT NULL,
    "name" TEXT NOT NULL,
    "shortCode" TEXT NOT NULL,
    "details" TEXT,
    "url" TEXT,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,
    "createdByUserId" TEXT NOT NULL,
    "updatedByUserId" TEXT NOT NULL,
    "createdFrom" TEXT,
    "updatedFrom" TEXT,

    CONSTRAINT "Department_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "Program" (
    "id" SERIAL NOT NULL,
    "name" TEXT NOT NULL,
    "shortCode" TEXT NOT NULL,
    "details" TEXT,
    "url" TEXT,
    "credit" INTEGER NOT NULL,
    "type" "ProgramTypes" NOT NULL,
    "departmentId" INTEGER NOT NULL,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,
    "createdByUserId" TEXT NOT NULL,
    "updatedByUserId" TEXT NOT NULL,
    "createdFrom" TEXT,
    "updatedFrom" TEXT,

    CONSTRAINT "Program_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "Exam" (
    "id" SERIAL NOT NULL,
    "title" TEXT NOT NULL,
    "description" TEXT,
    "batch" INTEGER NOT NULL,
    "trimester" "Trimesters" NOT NULL,
    "year" TEXT NOT NULL,
    "examDate" TIMESTAMP(3) NOT NULL,
    "conducted" BOOLEAN NOT NULL,
    "programId" INTEGER NOT NULL,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,
    "createdByUserId" TEXT NOT NULL,
    "updatedByUserId" TEXT,
    "createdFrom" TEXT,
    "updatedFrom" TEXT,

    CONSTRAINT "Exam_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "Registration" (
    "id" SERIAL NOT NULL,
    "userId" TEXT NOT NULL,
    "examId" INTEGER NOT NULL,
    "applicantId" TEXT NOT NULL,
    "date" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,

    CONSTRAINT "Registration_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "Result" (
    "id" SERIAL NOT NULL,
    "written" INTEGER NOT NULL,
    "viva" INTEGER NOT NULL,
    "total" INTEGER,
    "position" INTEGER,
    "remarks" TEXT,
    "registrationId" INTEGER NOT NULL,
    "date" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,

    CONSTRAINT "Result_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "Payment" (
    "id" SERIAL NOT NULL,
    "status" "PaymentStatus" NOT NULL DEFAULT 'UNPAID',
    "method" "PaymentMethods" NOT NULL,
    "details" JSONB,
    "registrationId" INTEGER NOT NULL,
    "date" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,

    CONSTRAINT "Payment_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "Notice" (
    "id" SERIAL NOT NULL,
    "title" TEXT NOT NULL,
    "body" TEXT NOT NULL,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,
    "createdByUserId" TEXT NOT NULL,
    "updatedByUserId" TEXT,
    "createdFrom" TEXT,
    "updatedFrom" TEXT,

    CONSTRAINT "Notice_pkey" PRIMARY KEY ("id")
);

-- CreateIndex
CREATE UNIQUE INDEX "User_phone_key" ON "User"("phone");

-- CreateIndex
CREATE UNIQUE INDEX "User_email_key" ON "User"("email");

-- CreateIndex
CREATE UNIQUE INDEX "PhoneVerificationCode_userId_key" ON "PhoneVerificationCode"("userId");

-- CreateIndex
CREATE UNIQUE INDEX "EmailVerificationCode_userId_key" ON "EmailVerificationCode"("userId");

-- CreateIndex
CREATE UNIQUE INDEX "Profile_userId_key" ON "Profile"("userId");

-- CreateIndex
CREATE UNIQUE INDEX "Images_userId_key" ON "Images"("userId");

-- CreateIndex
CREATE UNIQUE INDEX "SSC_userId_key" ON "SSC"("userId");

-- CreateIndex
CREATE UNIQUE INDEX "HSC_userId_key" ON "HSC"("userId");

-- CreateIndex
CREATE UNIQUE INDEX "Bachelor_userId_key" ON "Bachelor"("userId");

-- CreateIndex
CREATE UNIQUE INDEX "Master_userId_key" ON "Master"("userId");

-- CreateIndex
CREATE UNIQUE INDEX "Experience_userId_key" ON "Experience"("userId");

-- CreateIndex
CREATE UNIQUE INDEX "Department_shortCode_key" ON "Department"("shortCode");

-- CreateIndex
CREATE UNIQUE INDEX "Department_createdByUserId_key" ON "Department"("createdByUserId");

-- CreateIndex
CREATE UNIQUE INDEX "Department_updatedByUserId_key" ON "Department"("updatedByUserId");

-- CreateIndex
CREATE UNIQUE INDEX "Program_shortCode_key" ON "Program"("shortCode");

-- CreateIndex
CREATE UNIQUE INDEX "Program_createdByUserId_key" ON "Program"("createdByUserId");

-- CreateIndex
CREATE UNIQUE INDEX "Program_updatedByUserId_key" ON "Program"("updatedByUserId");

-- CreateIndex
CREATE UNIQUE INDEX "Exam_createdByUserId_key" ON "Exam"("createdByUserId");

-- CreateIndex
CREATE UNIQUE INDEX "Exam_updatedByUserId_key" ON "Exam"("updatedByUserId");

-- CreateIndex
CREATE UNIQUE INDEX "Result_registrationId_key" ON "Result"("registrationId");

-- CreateIndex
CREATE UNIQUE INDEX "Payment_registrationId_key" ON "Payment"("registrationId");

-- CreateIndex
CREATE UNIQUE INDEX "Notice_createdByUserId_key" ON "Notice"("createdByUserId");

-- CreateIndex
CREATE UNIQUE INDEX "Notice_updatedByUserId_key" ON "Notice"("updatedByUserId");

-- AddForeignKey
ALTER TABLE "User" ADD CONSTRAINT "User_roleId_fkey" FOREIGN KEY ("roleId") REFERENCES "Role"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "PhoneVerificationCode" ADD CONSTRAINT "PhoneVerificationCode_userId_fkey" FOREIGN KEY ("userId") REFERENCES "User"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "EmailVerificationCode" ADD CONSTRAINT "EmailVerificationCode_userId_fkey" FOREIGN KEY ("userId") REFERENCES "User"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Profile" ADD CONSTRAINT "Profile_userId_fkey" FOREIGN KEY ("userId") REFERENCES "User"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Images" ADD CONSTRAINT "Images_userId_fkey" FOREIGN KEY ("userId") REFERENCES "User"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "SSC" ADD CONSTRAINT "SSC_userId_fkey" FOREIGN KEY ("userId") REFERENCES "User"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "HSC" ADD CONSTRAINT "HSC_userId_fkey" FOREIGN KEY ("userId") REFERENCES "User"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Bachelor" ADD CONSTRAINT "Bachelor_userId_fkey" FOREIGN KEY ("userId") REFERENCES "User"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Master" ADD CONSTRAINT "Master_userId_fkey" FOREIGN KEY ("userId") REFERENCES "User"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Experience" ADD CONSTRAINT "Experience_userId_fkey" FOREIGN KEY ("userId") REFERENCES "User"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Department" ADD CONSTRAINT "Department_createdByUserId_fkey" FOREIGN KEY ("createdByUserId") REFERENCES "User"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Department" ADD CONSTRAINT "Department_updatedByUserId_fkey" FOREIGN KEY ("updatedByUserId") REFERENCES "User"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Program" ADD CONSTRAINT "Program_departmentId_fkey" FOREIGN KEY ("departmentId") REFERENCES "Department"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Program" ADD CONSTRAINT "Program_createdByUserId_fkey" FOREIGN KEY ("createdByUserId") REFERENCES "User"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Program" ADD CONSTRAINT "Program_updatedByUserId_fkey" FOREIGN KEY ("updatedByUserId") REFERENCES "User"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Exam" ADD CONSTRAINT "Exam_programId_fkey" FOREIGN KEY ("programId") REFERENCES "Program"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Exam" ADD CONSTRAINT "Exam_createdByUserId_fkey" FOREIGN KEY ("createdByUserId") REFERENCES "User"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Exam" ADD CONSTRAINT "Exam_updatedByUserId_fkey" FOREIGN KEY ("updatedByUserId") REFERENCES "User"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Registration" ADD CONSTRAINT "Registration_userId_fkey" FOREIGN KEY ("userId") REFERENCES "User"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Registration" ADD CONSTRAINT "Registration_examId_fkey" FOREIGN KEY ("examId") REFERENCES "Exam"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Result" ADD CONSTRAINT "Result_registrationId_fkey" FOREIGN KEY ("registrationId") REFERENCES "Registration"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Payment" ADD CONSTRAINT "Payment_registrationId_fkey" FOREIGN KEY ("registrationId") REFERENCES "Registration"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Notice" ADD CONSTRAINT "Notice_createdByUserId_fkey" FOREIGN KEY ("createdByUserId") REFERENCES "User"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Notice" ADD CONSTRAINT "Notice_updatedByUserId_fkey" FOREIGN KEY ("updatedByUserId") REFERENCES "User"("id") ON DELETE SET NULL ON UPDATE CASCADE;
