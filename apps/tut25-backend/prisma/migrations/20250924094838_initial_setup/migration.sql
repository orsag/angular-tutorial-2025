-- CreateEnum
CREATE TYPE "public"."sex_type" AS ENUM ('M', 'F');

-- CreateTable
CREATE TABLE "public"."customer" (
    "first_name" VARCHAR(30) NOT NULL,
    "last_name" VARCHAR(30) NOT NULL,
    "email" VARCHAR(60) NOT NULL,
    "company" VARCHAR(60),
    "street" VARCHAR(50) NOT NULL,
    "city" VARCHAR(40) NOT NULL,
    "state" CHAR(2) NOT NULL DEFAULT 'PA',
    "zip" INTEGER NOT NULL,
    "phone" VARCHAR(20) NOT NULL,
    "birth_date" DATE,
    "sex" "public"."sex_type" NOT NULL,
    "date_entered" TIMESTAMP(6) NOT NULL,
    "id" SERIAL NOT NULL,

    CONSTRAINT "customer_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "public"."item" (
    "product_id" INTEGER,
    "size" INTEGER NOT NULL,
    "color" VARCHAR(30) NOT NULL,
    "picture" VARCHAR(256) NOT NULL,
    "price" DECIMAL(6,2) NOT NULL,
    "id" SERIAL NOT NULL,

    CONSTRAINT "item_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "public"."product" (
    "type_id" INTEGER,
    "name" VARCHAR(30) NOT NULL,
    "supplier" VARCHAR(30) NOT NULL,
    "description" TEXT NOT NULL,
    "id" SERIAL NOT NULL,

    CONSTRAINT "product_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "public"."product_type" (
    "name" VARCHAR(30) NOT NULL,
    "id" SERIAL NOT NULL,

    CONSTRAINT "product_type_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "public"."sales_item" (
    "item_id" INTEGER,
    "sales_order_id" INTEGER,
    "quantity" INTEGER NOT NULL,
    "discount" DECIMAL(3,2) DEFAULT 0,
    "taxable" BOOLEAN NOT NULL DEFAULT false,
    "sales_tax_rate" DECIMAL(5,2) NOT NULL DEFAULT 0,
    "id" SERIAL NOT NULL,

    CONSTRAINT "sales_item_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "public"."sales_order" (
    "cust_id" INTEGER,
    "sales_person_id" INTEGER,
    "time_order_taken" TIMESTAMP(6) NOT NULL,
    "purchase_order_number" BIGINT NOT NULL,
    "credit_card_number" VARCHAR(16) NOT NULL,
    "credit_card_exper_month" SMALLINT NOT NULL,
    "credit_card_exper_day" SMALLINT NOT NULL,
    "credit_card_secret_code" SMALLINT NOT NULL,
    "name_on_card" VARCHAR(100) NOT NULL,
    "id" SERIAL NOT NULL,

    CONSTRAINT "sales_order_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "public"."sales_person" (
    "first_name" VARCHAR(30) NOT NULL,
    "last_name" VARCHAR(30) NOT NULL,
    "email" VARCHAR(60) NOT NULL,
    "street" VARCHAR(50) NOT NULL,
    "city" VARCHAR(40) NOT NULL,
    "state" CHAR(2) NOT NULL DEFAULT 'PA',
    "zip" INTEGER NOT NULL,
    "phone" VARCHAR(20) NOT NULL,
    "birth_date" DATE,
    "sex" "public"."sex_type" NOT NULL,
    "date_hired" TIMESTAMP(6) NOT NULL,
    "id" SERIAL NOT NULL,

    CONSTRAINT "sales_person_pkey" PRIMARY KEY ("id")
);

-- AddForeignKey
ALTER TABLE "public"."item" ADD CONSTRAINT "item_product_id_fkey" FOREIGN KEY ("product_id") REFERENCES "public"."product"("id") ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE "public"."product" ADD CONSTRAINT "product_type_id_fkey" FOREIGN KEY ("type_id") REFERENCES "public"."product_type"("id") ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE "public"."sales_item" ADD CONSTRAINT "sales_item_item_id_fkey" FOREIGN KEY ("item_id") REFERENCES "public"."item"("id") ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE "public"."sales_item" ADD CONSTRAINT "sales_item_sales_order_id_fkey" FOREIGN KEY ("sales_order_id") REFERENCES "public"."sales_order"("id") ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE "public"."sales_order" ADD CONSTRAINT "sales_order_cust_id_fkey" FOREIGN KEY ("cust_id") REFERENCES "public"."customer"("id") ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE "public"."sales_order" ADD CONSTRAINT "sales_order_sales_person_id_fkey" FOREIGN KEY ("sales_person_id") REFERENCES "public"."sales_person"("id") ON DELETE NO ACTION ON UPDATE NO ACTION;
