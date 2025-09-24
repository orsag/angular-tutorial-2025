/*
  Warnings:

  - Added the required column `image` to the `product` table without a default value. This is not possible if the table is not empty.

*/
-- AlterTable
ALTER TABLE "public"."product" ADD COLUMN     "image" VARCHAR(30) NOT NULL;
