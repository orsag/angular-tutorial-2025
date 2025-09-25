-- CreateEnum
CREATE TYPE "public"."Availability" AS ENUM ('IN_STORE', 'ONLINE');

-- CreateTable
CREATE TABLE "public"."Product" (
    "id" SERIAL NOT NULL,
    "type_id" INTEGER,
    "name" VARCHAR(30) NOT NULL,
    "supplier" VARCHAR(30),
    "description" TEXT NOT NULL,
    "availability" "public"."Availability" NOT NULL,
    "price" DECIMAL(10,2) NOT NULL,
    "stripePriceId" VARCHAR(30) NOT NULL,
    "image" VARCHAR(60) NOT NULL,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,
    "isFeatured" BOOLEAN NOT NULL,

    CONSTRAINT "Product_pkey" PRIMARY KEY ("id")
);

-- CreateIndex
CREATE UNIQUE INDEX "Product_name_key" ON "public"."Product"("name");
