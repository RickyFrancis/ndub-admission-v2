/*
  Warnings:

  - You are about to drop the column `bloodgroup` on the `Profile` table. All the data in the column will be lost.
  - You are about to drop the column `permamentAddress` on the `Profile` table. All the data in the column will be lost.
  - You are about to drop the column `isPhoneVerified` on the `User` table. All the data in the column will be lost.
  - Added the required column `bloodGroup` to the `Profile` table without a default value. This is not possible if the table is not empty.
  - Added the required column `permanentAddress` to the `Profile` table without a default value. This is not possible if the table is not empty.

*/
-- AlterTable
ALTER TABLE "Profile" DROP COLUMN "bloodgroup",
DROP COLUMN "permamentAddress",
ADD COLUMN     "bloodGroup" "BloodGroups" NOT NULL,
ADD COLUMN     "permanentAddress" TEXT NOT NULL;

-- AlterTable
ALTER TABLE "User" DROP COLUMN "isPhoneVerified";
