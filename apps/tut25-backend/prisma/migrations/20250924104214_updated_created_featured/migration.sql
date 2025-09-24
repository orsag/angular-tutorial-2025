/*
  Warnings:

  - Added the required column `createdAt` to the `product` table without a default value. This is not possible if the table is not empty.
  - Added the required column `isFeatured` to the `product` table without a default value. This is not possible if the table is not empty.
  - Added the required column `updatedAt` to the `product` table without a default value. This is not possible if the table is not empty.

*/
-- AlterTable
ALTER TABLE "public"."product" ADD COLUMN     "createdAt" TIMESTAMP(6) NOT NULL,
ADD COLUMN     "isFeatured" BOOLEAN NOT NULL,
ADD COLUMN     "updatedAt" TIMESTAMP(6) NOT NULL;
