/*
  Warnings:

  - Added the required column `stripePriceId` to the `product` table without a default value. This is not possible if the table is not empty.

*/
-- AlterTable
ALTER TABLE "public"."product" ADD COLUMN     "stripePriceId" VARCHAR(30) NOT NULL;
