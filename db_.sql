-- phpMyAdmin SQL Dump
-- version 4.8.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Sep 23, 2018 at 03:30 PM
-- Server version: 10.1.34-MariaDB
-- PHP Version: 7.0.31

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `db_tortilla`
--

-- --------------------------------------------------------

--
-- Table structure for table `uii_accounts`
--

CREATE TABLE `uii_accounts` (
  `id` int(10) UNSIGNED NOT NULL,
  `company_id` int(11) NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `number` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `currency_code` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `opening_balance` double(15,4) NOT NULL DEFAULT '0.0000',
  `bank_name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `bank_phone` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `bank_address` text COLLATE utf8mb4_unicode_ci,
  `enabled` tinyint(1) NOT NULL DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `uii_accounts`
--

INSERT INTO `uii_accounts` (`id`, `company_id`, `name`, `number`, `currency_code`, `opening_balance`, `bank_name`, `bank_phone`, `bank_address`, `enabled`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 1, 'Cash', '1', 'USD', 0.0000, 'Cash', NULL, NULL, 1, '2018-08-28 08:29:22', '2018-08-28 08:29:22', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `uii_bills`
--

CREATE TABLE `uii_bills` (
  `id` int(10) UNSIGNED NOT NULL,
  `company_id` int(11) NOT NULL,
  `bill_number` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `order_number` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `bill_status_code` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `billed_at` datetime NOT NULL,
  `due_at` datetime NOT NULL,
  `amount` double(15,4) NOT NULL,
  `currency_code` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `currency_rate` double(15,8) NOT NULL,
  `vendor_id` int(11) NOT NULL,
  `vendor_name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `vendor_email` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `vendor_tax_number` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `vendor_phone` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `vendor_address` text COLLATE utf8mb4_unicode_ci,
  `notes` text COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `category_id` int(11) NOT NULL DEFAULT '1',
  `parent_id` int(11) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `uii_bill_histories`
--

CREATE TABLE `uii_bill_histories` (
  `id` int(10) UNSIGNED NOT NULL,
  `company_id` int(11) NOT NULL,
  `bill_id` int(11) NOT NULL,
  `status_code` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `notify` tinyint(1) NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `uii_bill_items`
--

CREATE TABLE `uii_bill_items` (
  `id` int(10) UNSIGNED NOT NULL,
  `company_id` int(11) NOT NULL,
  `bill_id` int(11) NOT NULL,
  `item_id` int(11) DEFAULT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `sku` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `quantity` double(7,2) NOT NULL,
  `price` double(15,4) NOT NULL,
  `total` double(15,4) NOT NULL,
  `tax` double(15,4) NOT NULL DEFAULT '0.0000',
  `tax_id` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `uii_bill_payments`
--

CREATE TABLE `uii_bill_payments` (
  `id` int(10) UNSIGNED NOT NULL,
  `company_id` int(11) NOT NULL,
  `bill_id` int(11) NOT NULL,
  `account_id` int(11) NOT NULL,
  `paid_at` datetime NOT NULL,
  `amount` double(15,4) NOT NULL,
  `currency_code` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `currency_rate` double(15,8) NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci,
  `payment_method` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `reference` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `uii_bill_statuses`
--

CREATE TABLE `uii_bill_statuses` (
  `id` int(10) UNSIGNED NOT NULL,
  `company_id` int(11) NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `code` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `uii_bill_statuses`
--

INSERT INTO `uii_bill_statuses` (`id`, `company_id`, `name`, `code`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 1, 'Draft', 'draft', '2018-08-28 08:29:23', '2018-08-28 08:29:23', NULL),
(2, 1, 'Received', 'received', '2018-08-28 08:29:23', '2018-08-28 08:29:23', NULL),
(3, 1, 'Partial', 'partial', '2018-08-28 08:29:23', '2018-08-28 08:29:23', NULL),
(4, 1, 'Paid', 'paid', '2018-08-28 08:29:23', '2018-08-28 08:29:23', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `uii_bill_totals`
--

CREATE TABLE `uii_bill_totals` (
  `id` int(10) UNSIGNED NOT NULL,
  `company_id` int(11) NOT NULL,
  `bill_id` int(11) NOT NULL,
  `code` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `amount` double(15,4) NOT NULL,
  `sort_order` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `uii_categories`
--

CREATE TABLE `uii_categories` (
  `id` int(10) UNSIGNED NOT NULL,
  `company_id` int(11) NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `color` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `enabled` tinyint(1) NOT NULL DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `uii_categories`
--

INSERT INTO `uii_categories` (`id`, `company_id`, `name`, `type`, `color`, `enabled`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 1, 'Transfer', 'other', '#605ca8', 1, '2018-08-28 08:29:23', '2018-08-28 08:29:23', NULL),
(2, 1, 'Deposit', 'income', '#f39c12', 1, '2018-08-28 08:29:23', '2018-08-28 08:29:23', NULL),
(3, 1, 'Sales', 'income', '#6da252', 1, '2018-08-28 08:29:23', '2018-08-28 08:29:23', NULL),
(4, 1, 'Other', 'expense', '#d2d6de', 1, '2018-08-28 08:29:23', '2018-08-28 08:29:23', NULL),
(5, 1, 'General', 'item', '#00c0ef', 1, '2018-08-28 08:29:23', '2018-08-28 08:29:23', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `uii_companies`
--

CREATE TABLE `uii_companies` (
  `id` int(10) UNSIGNED NOT NULL,
  `domain` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `enabled` tinyint(1) NOT NULL DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `uii_companies`
--

INSERT INTO `uii_companies` (`id`, `domain`, `enabled`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, '', 1, '2018-08-28 08:29:22', '2018-08-28 08:29:22', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `uii_currencies`
--

CREATE TABLE `uii_currencies` (
  `id` int(10) UNSIGNED NOT NULL,
  `company_id` int(11) NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `code` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `rate` double(15,8) NOT NULL,
  `enabled` tinyint(1) NOT NULL DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `precision` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `symbol` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `symbol_first` int(11) NOT NULL DEFAULT '1',
  `decimal_mark` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `thousands_separator` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `uii_currencies`
--

INSERT INTO `uii_currencies` (`id`, `company_id`, `name`, `code`, `rate`, `enabled`, `created_at`, `updated_at`, `deleted_at`, `precision`, `symbol`, `symbol_first`, `decimal_mark`, `thousands_separator`) VALUES
(1, 1, 'US Dollar', 'USD', 1.00000000, 1, '2018-08-28 08:29:23', '2018-08-28 08:29:23', NULL, '2', '$', 1, '.', ','),
(2, 1, 'Euro', 'EUR', 1.25000000, 1, '2018-08-28 08:29:23', '2018-08-28 08:29:23', NULL, '2', '€', 1, ',', '.'),
(3, 1, 'British Pound', 'GBP', 1.60000000, 1, '2018-08-28 08:29:23', '2018-08-28 08:29:23', NULL, '2', '£', 1, '.', ','),
(4, 1, 'Turkish Lira', 'TRY', 0.80000000, 1, '2018-08-28 08:29:23', '2018-08-28 08:29:23', NULL, '2', '₺', 1, ',', '.');

-- --------------------------------------------------------

--
-- Table structure for table `uii_customers`
--

CREATE TABLE `uii_customers` (
  `id` int(10) UNSIGNED NOT NULL,
  `company_id` int(11) NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `tax_number` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `phone` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `address` text COLLATE utf8mb4_unicode_ci,
  `website` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `currency_code` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `enabled` tinyint(1) NOT NULL DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `uii_failed_jobs`
--

CREATE TABLE `uii_failed_jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `connection` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `uii_invoices`
--

CREATE TABLE `uii_invoices` (
  `id` int(10) UNSIGNED NOT NULL,
  `company_id` int(11) NOT NULL,
  `invoice_number` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `order_number` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `invoice_status_code` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `invoiced_at` datetime NOT NULL,
  `due_at` datetime NOT NULL,
  `amount` double(15,4) NOT NULL,
  `currency_code` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `currency_rate` double(15,8) NOT NULL,
  `customer_id` int(11) NOT NULL,
  `customer_name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `customer_email` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `customer_tax_number` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `customer_phone` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `customer_address` text COLLATE utf8mb4_unicode_ci,
  `notes` text COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `category_id` int(11) NOT NULL DEFAULT '1',
  `parent_id` int(11) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `uii_invoice_histories`
--

CREATE TABLE `uii_invoice_histories` (
  `id` int(10) UNSIGNED NOT NULL,
  `company_id` int(11) NOT NULL,
  `invoice_id` int(11) NOT NULL,
  `status_code` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `notify` tinyint(1) NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `uii_invoice_items`
--

CREATE TABLE `uii_invoice_items` (
  `id` int(10) UNSIGNED NOT NULL,
  `company_id` int(11) NOT NULL,
  `invoice_id` int(11) NOT NULL,
  `item_id` int(11) DEFAULT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `sku` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `quantity` double(7,2) NOT NULL,
  `price` double(15,4) NOT NULL,
  `total` double(15,4) NOT NULL,
  `tax` double(15,4) NOT NULL DEFAULT '0.0000',
  `tax_id` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `uii_invoice_payments`
--

CREATE TABLE `uii_invoice_payments` (
  `id` int(10) UNSIGNED NOT NULL,
  `company_id` int(11) NOT NULL,
  `invoice_id` int(11) NOT NULL,
  `account_id` int(11) NOT NULL,
  `paid_at` datetime NOT NULL,
  `amount` double(15,4) NOT NULL,
  `currency_code` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `currency_rate` double(15,8) NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci,
  `payment_method` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `reference` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `uii_invoice_statuses`
--

CREATE TABLE `uii_invoice_statuses` (
  `id` int(10) UNSIGNED NOT NULL,
  `company_id` int(11) NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `code` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `uii_invoice_statuses`
--

INSERT INTO `uii_invoice_statuses` (`id`, `company_id`, `name`, `code`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 1, 'Draft', 'draft', '2018-08-28 08:29:23', '2018-08-28 08:29:23', NULL),
(2, 1, 'Sent', 'sent', '2018-08-28 08:29:23', '2018-08-28 08:29:23', NULL),
(3, 1, 'Viewed', 'viewed', '2018-08-28 08:29:23', '2018-08-28 08:29:23', NULL),
(4, 1, 'Approved', 'approved', '2018-08-28 08:29:23', '2018-08-28 08:29:23', NULL),
(5, 1, 'Partial', 'partial', '2018-08-28 08:29:23', '2018-08-28 08:29:23', NULL),
(6, 1, 'Paid', 'paid', '2018-08-28 08:29:23', '2018-08-28 08:29:23', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `uii_invoice_totals`
--

CREATE TABLE `uii_invoice_totals` (
  `id` int(10) UNSIGNED NOT NULL,
  `company_id` int(11) NOT NULL,
  `invoice_id` int(11) NOT NULL,
  `code` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `amount` double(15,4) NOT NULL,
  `sort_order` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `uii_items`
--

CREATE TABLE `uii_items` (
  `id` int(10) UNSIGNED NOT NULL,
  `company_id` int(11) NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `sku` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci,
  `sale_price` double(15,4) NOT NULL,
  `purchase_price` double(15,4) NOT NULL,
  `quantity` int(11) NOT NULL,
  `category_id` int(11) DEFAULT NULL,
  `tax_id` int(11) DEFAULT NULL,
  `enabled` tinyint(1) NOT NULL DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `uii_jobs`
--

CREATE TABLE `uii_jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `queue` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `attempts` tinyint(3) UNSIGNED NOT NULL,
  `reserved_at` int(10) UNSIGNED DEFAULT NULL,
  `available_at` int(10) UNSIGNED NOT NULL,
  `created_at` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `uii_media`
--

CREATE TABLE `uii_media` (
  `id` int(10) UNSIGNED NOT NULL,
  `disk` varchar(32) COLLATE utf8mb4_unicode_ci NOT NULL,
  `directory` varchar(68) COLLATE utf8mb4_unicode_ci NOT NULL,
  `filename` varchar(121) COLLATE utf8mb4_unicode_ci NOT NULL,
  `extension` varchar(28) COLLATE utf8mb4_unicode_ci NOT NULL,
  `mime_type` varchar(128) COLLATE utf8mb4_unicode_ci NOT NULL,
  `aggregate_type` varchar(32) COLLATE utf8mb4_unicode_ci NOT NULL,
  `size` int(10) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `uii_mediables`
--

CREATE TABLE `uii_mediables` (
  `media_id` int(10) UNSIGNED NOT NULL,
  `mediable_type` varchar(152) COLLATE utf8mb4_unicode_ci NOT NULL,
  `mediable_id` int(10) UNSIGNED NOT NULL,
  `tag` varchar(68) COLLATE utf8mb4_unicode_ci NOT NULL,
  `order` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `uii_migrations`
--

CREATE TABLE `uii_migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `uii_migrations`
--

INSERT INTO `uii_migrations` (`id`, `migration`, `batch`) VALUES
(1, '2017_09_01_000000_create_accounts_table', 1),
(2, '2017_09_01_000000_create_bills_table', 1),
(3, '2017_09_01_000000_create_categories_table', 1),
(4, '2017_09_01_000000_create_companies_table', 1),
(5, '2017_09_01_000000_create_currencies_table', 1),
(6, '2017_09_01_000000_create_customers_table', 1),
(7, '2017_09_01_000000_create_invoices_table', 1),
(8, '2017_09_01_000000_create_items_table', 1),
(9, '2017_09_01_000000_create_jobs_table', 1),
(10, '2017_09_01_000000_create_modules_table', 1),
(11, '2017_09_01_000000_create_notifications_table', 1),
(12, '2017_09_01_000000_create_password_resets_table', 1),
(13, '2017_09_01_000000_create_payments_table', 1),
(14, '2017_09_01_000000_create_revenues_table', 1),
(15, '2017_09_01_000000_create_roles_table', 1),
(16, '2017_09_01_000000_create_sessions_table', 1),
(17, '2017_09_01_000000_create_settings_table', 1),
(18, '2017_09_01_000000_create_taxes_table', 1),
(19, '2017_09_01_000000_create_transfers_table', 1),
(20, '2017_09_01_000000_create_users_table', 1),
(21, '2017_09_01_000000_create_vendors_table', 1),
(22, '2017_09_19_delete_offline_file', 1),
(23, '2017_10_11_000000_create_bill_totals_table', 1),
(24, '2017_10_11_000000_create_invoice_totals_table', 1),
(25, '2017_11_16_000000_create_failed_jobs_table', 1),
(26, '2017_12_09_000000_add_currency_columns', 1),
(27, '2017_12_30_000000_create_mediable_tables', 1),
(28, '2018_01_03_000000_drop_attachment_column_bill_payments_table', 1),
(29, '2018_01_03_000000_drop_attachment_column_bills_table', 1),
(30, '2018_01_03_000000_drop_attachment_column_invoice_payments_table', 1),
(31, '2018_01_03_000000_drop_attachment_column_invoices_table', 1),
(32, '2018_01_03_000000_drop_attachment_column_payments_table', 1),
(33, '2018_01_03_000000_drop_attachment_column_revenues_table', 1),
(34, '2018_01_03_000000_drop_picture_column_items_table', 1),
(35, '2018_01_03_000000_drop_picture_column_users_table', 1),
(36, '2018_04_23_000000_add_category_column_invoices_bills', 1),
(37, '2018_04_26_000000_create_recurring_table', 1),
(38, '2018_04_30_000000_add_parent_column', 1),
(39, '2018_06_23_000000_modify_email_column', 1),
(40, '2018_06_30_000000_modify_enabled_column', 1),
(41, '2018_07_07_000000_modify_date_column', 1),
(42, '2020_01_01_000000_add_locale_column', 1);

-- --------------------------------------------------------

--
-- Table structure for table `uii_modules`
--

CREATE TABLE `uii_modules` (
  `id` int(10) UNSIGNED NOT NULL,
  `company_id` int(11) NOT NULL,
  `alias` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `uii_modules`
--

INSERT INTO `uii_modules` (`id`, `company_id`, `alias`, `status`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 1, 'offlinepayment', 1, '2018-08-28 08:29:23', '2018-08-28 08:29:23', NULL),
(2, 1, 'paypalstandard', 1, '2018-08-28 08:29:24', '2018-08-28 08:29:24', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `uii_module_histories`
--

CREATE TABLE `uii_module_histories` (
  `id` int(10) UNSIGNED NOT NULL,
  `company_id` int(11) NOT NULL,
  `module_id` int(11) NOT NULL,
  `category` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `version` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `uii_module_histories`
--

INSERT INTO `uii_module_histories` (`id`, `company_id`, `module_id`, `category`, `version`, `description`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 1, 1, 'payment-gateways', '1.0.0', 'OfflinePayment installed', '2018-08-28 08:29:23', '2018-08-28 08:29:23', NULL),
(2, 1, 2, 'payment-gateways', '1.0.0', 'PaypalStandard installed', '2018-08-28 08:29:24', '2018-08-28 08:29:24', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `uii_notifications`
--

CREATE TABLE `uii_notifications` (
  `id` char(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `notifiable_id` int(10) UNSIGNED NOT NULL,
  `notifiable_type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `data` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `read_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `uii_password_resets`
--

CREATE TABLE `uii_password_resets` (
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `uii_payments`
--

CREATE TABLE `uii_payments` (
  `id` int(10) UNSIGNED NOT NULL,
  `company_id` int(11) NOT NULL,
  `account_id` int(11) NOT NULL,
  `paid_at` datetime NOT NULL,
  `amount` double(15,4) NOT NULL,
  `currency_code` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `currency_rate` double(15,8) NOT NULL,
  `vendor_id` int(11) DEFAULT NULL,
  `description` text COLLATE utf8mb4_unicode_ci,
  `category_id` int(11) NOT NULL,
  `payment_method` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `reference` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `parent_id` int(11) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `uii_permissions`
--

CREATE TABLE `uii_permissions` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `display_name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `uii_permissions`
--

INSERT INTO `uii_permissions` (`id`, `name`, `display_name`, `description`, `created_at`, `updated_at`) VALUES
(1, 'read-admin-panel', 'Read Admin Panel', 'Read Admin Panel', '2018-08-28 08:27:36', '2018-08-28 08:27:36'),
(2, 'read-api', 'Read Api', 'Read Api', '2018-08-28 08:27:36', '2018-08-28 08:27:36'),
(3, 'create-auth-users', 'Create Auth Users', 'Create Auth Users', '2018-08-28 08:27:36', '2018-08-28 08:27:36'),
(4, 'read-auth-users', 'Read Auth Users', 'Read Auth Users', '2018-08-28 08:27:37', '2018-08-28 08:27:37'),
(5, 'update-auth-users', 'Update Auth Users', 'Update Auth Users', '2018-08-28 08:27:37', '2018-08-28 08:27:37'),
(6, 'delete-auth-users', 'Delete Auth Users', 'Delete Auth Users', '2018-08-28 08:27:37', '2018-08-28 08:27:37'),
(7, 'create-auth-roles', 'Create Auth Roles', 'Create Auth Roles', '2018-08-28 08:27:37', '2018-08-28 08:27:37'),
(8, 'read-auth-roles', 'Read Auth Roles', 'Read Auth Roles', '2018-08-28 08:27:37', '2018-08-28 08:27:37'),
(9, 'update-auth-roles', 'Update Auth Roles', 'Update Auth Roles', '2018-08-28 08:27:37', '2018-08-28 08:27:37'),
(10, 'delete-auth-roles', 'Delete Auth Roles', 'Delete Auth Roles', '2018-08-28 08:27:37', '2018-08-28 08:27:37'),
(11, 'create-auth-permissions', 'Create Auth Permissions', 'Create Auth Permissions', '2018-08-28 08:27:37', '2018-08-28 08:27:37'),
(12, 'read-auth-permissions', 'Read Auth Permissions', 'Read Auth Permissions', '2018-08-28 08:27:38', '2018-08-28 08:27:38'),
(13, 'update-auth-permissions', 'Update Auth Permissions', 'Update Auth Permissions', '2018-08-28 08:27:38', '2018-08-28 08:27:38'),
(14, 'delete-auth-permissions', 'Delete Auth Permissions', 'Delete Auth Permissions', '2018-08-28 08:27:38', '2018-08-28 08:27:38'),
(15, 'read-auth-profile', 'Read Auth Profile', 'Read Auth Profile', '2018-08-28 08:27:38', '2018-08-28 08:27:38'),
(16, 'update-auth-profile', 'Update Auth Profile', 'Update Auth Profile', '2018-08-28 08:27:38', '2018-08-28 08:27:38'),
(17, 'create-common-companies', 'Create Common Companies', 'Create Common Companies', '2018-08-28 08:27:38', '2018-08-28 08:27:38'),
(18, 'read-common-companies', 'Read Common Companies', 'Read Common Companies', '2018-08-28 08:27:38', '2018-08-28 08:27:38'),
(19, 'update-common-companies', 'Update Common Companies', 'Update Common Companies', '2018-08-28 08:27:38', '2018-08-28 08:27:38'),
(20, 'delete-common-companies', 'Delete Common Companies', 'Delete Common Companies', '2018-08-28 08:27:38', '2018-08-28 08:27:38'),
(21, 'create-common-import', 'Create Common Import', 'Create Common Import', '2018-08-28 08:27:39', '2018-08-28 08:27:39'),
(22, 'create-common-items', 'Create Common Items', 'Create Common Items', '2018-08-28 08:27:39', '2018-08-28 08:27:39'),
(23, 'read-common-items', 'Read Common Items', 'Read Common Items', '2018-08-28 08:27:39', '2018-08-28 08:27:39'),
(24, 'update-common-items', 'Update Common Items', 'Update Common Items', '2018-08-28 08:27:39', '2018-08-28 08:27:39'),
(25, 'delete-common-items', 'Delete Common Items', 'Delete Common Items', '2018-08-28 08:27:39', '2018-08-28 08:27:39'),
(26, 'delete-common-uploads', 'Delete Common Uploads', 'Delete Common Uploads', '2018-08-28 08:27:39', '2018-08-28 08:27:39'),
(27, 'create-incomes-invoices', 'Create Incomes Invoices', 'Create Incomes Invoices', '2018-08-28 08:27:39', '2018-08-28 08:27:39'),
(28, 'read-incomes-invoices', 'Read Incomes Invoices', 'Read Incomes Invoices', '2018-08-28 08:27:39', '2018-08-28 08:27:39'),
(29, 'update-incomes-invoices', 'Update Incomes Invoices', 'Update Incomes Invoices', '2018-08-28 08:27:39', '2018-08-28 08:27:39'),
(30, 'delete-incomes-invoices', 'Delete Incomes Invoices', 'Delete Incomes Invoices', '2018-08-28 08:27:39', '2018-08-28 08:27:39'),
(31, 'create-incomes-revenues', 'Create Incomes Revenues', 'Create Incomes Revenues', '2018-08-28 08:27:40', '2018-08-28 08:27:40'),
(32, 'read-incomes-revenues', 'Read Incomes Revenues', 'Read Incomes Revenues', '2018-08-28 08:27:40', '2018-08-28 08:27:40'),
(33, 'update-incomes-revenues', 'Update Incomes Revenues', 'Update Incomes Revenues', '2018-08-28 08:27:40', '2018-08-28 08:27:40'),
(34, 'delete-incomes-revenues', 'Delete Incomes Revenues', 'Delete Incomes Revenues', '2018-08-28 08:27:40', '2018-08-28 08:27:40'),
(35, 'create-incomes-customers', 'Create Incomes Customers', 'Create Incomes Customers', '2018-08-28 08:27:40', '2018-08-28 08:27:40'),
(36, 'read-incomes-customers', 'Read Incomes Customers', 'Read Incomes Customers', '2018-08-28 08:27:40', '2018-08-28 08:27:40'),
(37, 'update-incomes-customers', 'Update Incomes Customers', 'Update Incomes Customers', '2018-08-28 08:27:40', '2018-08-28 08:27:40'),
(38, 'delete-incomes-customers', 'Delete Incomes Customers', 'Delete Incomes Customers', '2018-08-28 08:27:40', '2018-08-28 08:27:40'),
(39, 'create-expenses-bills', 'Create Expenses Bills', 'Create Expenses Bills', '2018-08-28 08:27:40', '2018-08-28 08:27:40'),
(40, 'read-expenses-bills', 'Read Expenses Bills', 'Read Expenses Bills', '2018-08-28 08:27:40', '2018-08-28 08:27:40'),
(41, 'update-expenses-bills', 'Update Expenses Bills', 'Update Expenses Bills', '2018-08-28 08:27:41', '2018-08-28 08:27:41'),
(42, 'delete-expenses-bills', 'Delete Expenses Bills', 'Delete Expenses Bills', '2018-08-28 08:27:41', '2018-08-28 08:27:41'),
(43, 'create-expenses-payments', 'Create Expenses Payments', 'Create Expenses Payments', '2018-08-28 08:27:41', '2018-08-28 08:27:41'),
(44, 'read-expenses-payments', 'Read Expenses Payments', 'Read Expenses Payments', '2018-08-28 08:27:41', '2018-08-28 08:27:41'),
(45, 'update-expenses-payments', 'Update Expenses Payments', 'Update Expenses Payments', '2018-08-28 08:27:41', '2018-08-28 08:27:41'),
(46, 'delete-expenses-payments', 'Delete Expenses Payments', 'Delete Expenses Payments', '2018-08-28 08:27:41', '2018-08-28 08:27:41'),
(47, 'create-expenses-vendors', 'Create Expenses Vendors', 'Create Expenses Vendors', '2018-08-28 08:27:41', '2018-08-28 08:27:41'),
(48, 'read-expenses-vendors', 'Read Expenses Vendors', 'Read Expenses Vendors', '2018-08-28 08:27:41', '2018-08-28 08:27:41'),
(49, 'update-expenses-vendors', 'Update Expenses Vendors', 'Update Expenses Vendors', '2018-08-28 08:27:41', '2018-08-28 08:27:41'),
(50, 'delete-expenses-vendors', 'Delete Expenses Vendors', 'Delete Expenses Vendors', '2018-08-28 08:27:41', '2018-08-28 08:27:41'),
(51, 'create-banking-accounts', 'Create Banking Accounts', 'Create Banking Accounts', '2018-08-28 08:27:41', '2018-08-28 08:27:41'),
(52, 'read-banking-accounts', 'Read Banking Accounts', 'Read Banking Accounts', '2018-08-28 08:27:41', '2018-08-28 08:27:41'),
(53, 'update-banking-accounts', 'Update Banking Accounts', 'Update Banking Accounts', '2018-08-28 08:27:42', '2018-08-28 08:27:42'),
(54, 'delete-banking-accounts', 'Delete Banking Accounts', 'Delete Banking Accounts', '2018-08-28 08:27:42', '2018-08-28 08:27:42'),
(55, 'create-banking-transfers', 'Create Banking Transfers', 'Create Banking Transfers', '2018-08-28 08:27:42', '2018-08-28 08:27:42'),
(56, 'read-banking-transfers', 'Read Banking Transfers', 'Read Banking Transfers', '2018-08-28 08:27:42', '2018-08-28 08:27:42'),
(57, 'update-banking-transfers', 'Update Banking Transfers', 'Update Banking Transfers', '2018-08-28 08:27:42', '2018-08-28 08:27:42'),
(58, 'delete-banking-transfers', 'Delete Banking Transfers', 'Delete Banking Transfers', '2018-08-28 08:27:42', '2018-08-28 08:27:42'),
(59, 'read-banking-transactions', 'Read Banking Transactions', 'Read Banking Transactions', '2018-08-28 08:27:42', '2018-08-28 08:27:42'),
(60, 'create-settings-categories', 'Create Settings Categories', 'Create Settings Categories', '2018-08-28 08:27:42', '2018-08-28 08:27:42'),
(61, 'read-settings-categories', 'Read Settings Categories', 'Read Settings Categories', '2018-08-28 08:27:42', '2018-08-28 08:27:42'),
(62, 'update-settings-categories', 'Update Settings Categories', 'Update Settings Categories', '2018-08-28 08:27:42', '2018-08-28 08:27:42'),
(63, 'delete-settings-categories', 'Delete Settings Categories', 'Delete Settings Categories', '2018-08-28 08:27:42', '2018-08-28 08:27:42'),
(64, 'read-settings-settings', 'Read Settings Settings', 'Read Settings Settings', '2018-08-28 08:27:42', '2018-08-28 08:27:42'),
(65, 'update-settings-settings', 'Update Settings Settings', 'Update Settings Settings', '2018-08-28 08:27:43', '2018-08-28 08:27:43'),
(66, 'create-settings-taxes', 'Create Settings Taxes', 'Create Settings Taxes', '2018-08-28 08:27:43', '2018-08-28 08:27:43'),
(67, 'read-settings-taxes', 'Read Settings Taxes', 'Read Settings Taxes', '2018-08-28 08:27:43', '2018-08-28 08:27:43'),
(68, 'update-settings-taxes', 'Update Settings Taxes', 'Update Settings Taxes', '2018-08-28 08:27:43', '2018-08-28 08:27:43'),
(69, 'delete-settings-taxes', 'Delete Settings Taxes', 'Delete Settings Taxes', '2018-08-28 08:27:43', '2018-08-28 08:27:43'),
(70, 'create-settings-currencies', 'Create Settings Currencies', 'Create Settings Currencies', '2018-08-28 08:27:43', '2018-08-28 08:27:43'),
(71, 'read-settings-currencies', 'Read Settings Currencies', 'Read Settings Currencies', '2018-08-28 08:27:43', '2018-08-28 08:27:43'),
(72, 'update-settings-currencies', 'Update Settings Currencies', 'Update Settings Currencies', '2018-08-28 08:27:43', '2018-08-28 08:27:43'),
(73, 'delete-settings-currencies', 'Delete Settings Currencies', 'Delete Settings Currencies', '2018-08-28 08:27:43', '2018-08-28 08:27:43'),
(74, 'read-settings-modules', 'Read Settings Modules', 'Read Settings Modules', '2018-08-28 08:27:43', '2018-08-28 08:27:43'),
(75, 'update-settings-modules', 'Update Settings Modules', 'Update Settings Modules', '2018-08-28 08:27:43', '2018-08-28 08:27:43'),
(76, 'read-modules-home', 'Read Modules Home', 'Read Modules Home', '2018-08-28 08:27:44', '2018-08-28 08:27:44'),
(77, 'read-modules-tiles', 'Read Modules Tiles', 'Read Modules Tiles', '2018-08-28 08:27:44', '2018-08-28 08:27:44'),
(78, 'create-modules-item', 'Create Modules Item', 'Create Modules Item', '2018-08-28 08:27:44', '2018-08-28 08:27:44'),
(79, 'read-modules-item', 'Read Modules Item', 'Read Modules Item', '2018-08-28 08:27:44', '2018-08-28 08:27:44'),
(80, 'update-modules-item', 'Update Modules Item', 'Update Modules Item', '2018-08-28 08:27:44', '2018-08-28 08:27:44'),
(81, 'delete-modules-item', 'Delete Modules Item', 'Delete Modules Item', '2018-08-28 08:27:44', '2018-08-28 08:27:44'),
(82, 'create-modules-token', 'Create Modules Token', 'Create Modules Token', '2018-08-28 08:27:44', '2018-08-28 08:27:44'),
(83, 'update-modules-token', 'Update Modules Token', 'Update Modules Token', '2018-08-28 08:27:44', '2018-08-28 08:27:44'),
(84, 'read-modules-my', 'Read Modules My', 'Read Modules My', '2018-08-28 08:27:44', '2018-08-28 08:27:44'),
(85, 'read-install-updates', 'Read Install Updates', 'Read Install Updates', '2018-08-28 08:27:44', '2018-08-28 08:27:44'),
(86, 'update-install-updates', 'Update Install Updates', 'Update Install Updates', '2018-08-28 08:27:44', '2018-08-28 08:27:44'),
(87, 'read-notifications', 'Read Notifications', 'Read Notifications', '2018-08-28 08:27:45', '2018-08-28 08:27:45'),
(88, 'update-notifications', 'Update Notifications', 'Update Notifications', '2018-08-28 08:27:45', '2018-08-28 08:27:45'),
(89, 'read-reports-income-summary', 'Read Reports Income Summary', 'Read Reports Income Summary', '2018-08-28 08:27:45', '2018-08-28 08:27:45'),
(90, 'read-reports-expense-summary', 'Read Reports Expense Summary', 'Read Reports Expense Summary', '2018-08-28 08:27:45', '2018-08-28 08:27:45'),
(91, 'read-reports-income-expense-summary', 'Read Reports Income Expense Summary', 'Read Reports Income Expense Summary', '2018-08-28 08:27:45', '2018-08-28 08:27:45'),
(92, 'read-reports-profit-loss', 'Read Reports Profit Loss', 'Read Reports Profit Loss', '2018-08-28 08:27:45', '2018-08-28 08:27:45'),
(93, 'read-reports-tax-summary', 'Read Reports Tax Summary', 'Read Reports Tax Summary', '2018-08-28 08:27:45', '2018-08-28 08:27:45'),
(94, 'read-customer-panel', 'Read Customer Panel', 'Read Customer Panel', '2018-08-28 08:27:49', '2018-08-28 08:27:49'),
(95, 'read-customers-invoices', 'Read Customers Invoices', 'Read Customers Invoices', '2018-08-28 08:27:49', '2018-08-28 08:27:49'),
(96, 'update-customers-invoices', 'Update Customers Invoices', 'Update Customers Invoices', '2018-08-28 08:27:49', '2018-08-28 08:27:49'),
(97, 'read-customers-payments', 'Read Customers Payments', 'Read Customers Payments', '2018-08-28 08:27:49', '2018-08-28 08:27:49'),
(98, 'update-customers-payments', 'Update Customers Payments', 'Update Customers Payments', '2018-08-28 08:27:49', '2018-08-28 08:27:49'),
(99, 'read-customers-transactions', 'Read Customers Transactions', 'Read Customers Transactions', '2018-08-28 08:27:49', '2018-08-28 08:27:49'),
(100, 'read-customers-profile', 'Read Customers Profile', 'Read Customers Profile', '2018-08-28 08:27:49', '2018-08-28 08:27:49'),
(101, 'update-customers-profile', 'Update Customers Profile', 'Update Customers Profile', '2018-08-28 08:27:49', '2018-08-28 08:27:49');

-- --------------------------------------------------------

--
-- Table structure for table `uii_recurring`
--

CREATE TABLE `uii_recurring` (
  `id` int(10) UNSIGNED NOT NULL,
  `company_id` int(11) NOT NULL,
  `recurable_id` int(10) UNSIGNED NOT NULL,
  `recurable_type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `frequency` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `interval` int(11) NOT NULL DEFAULT '1',
  `started_at` datetime NOT NULL,
  `count` int(11) NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `uii_revenues`
--

CREATE TABLE `uii_revenues` (
  `id` int(10) UNSIGNED NOT NULL,
  `company_id` int(11) NOT NULL,
  `account_id` int(11) NOT NULL,
  `paid_at` datetime NOT NULL,
  `amount` double(15,4) NOT NULL,
  `currency_code` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `currency_rate` double(15,8) NOT NULL,
  `customer_id` int(11) DEFAULT NULL,
  `description` text COLLATE utf8mb4_unicode_ci,
  `category_id` int(11) NOT NULL,
  `payment_method` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `reference` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `parent_id` int(11) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `uii_roles`
--

CREATE TABLE `uii_roles` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `display_name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `uii_roles`
--

INSERT INTO `uii_roles` (`id`, `name`, `display_name`, `description`, `created_at`, `updated_at`) VALUES
(1, 'admin', 'Admin', 'Admin', '2018-08-28 08:27:36', '2018-08-28 08:27:36'),
(2, 'manager', 'Manager', 'Manager', '2018-08-28 08:27:45', '2018-08-28 08:27:45'),
(3, 'customer', 'Customer', 'Customer', '2018-08-28 08:27:49', '2018-08-28 08:27:49');

-- --------------------------------------------------------

--
-- Table structure for table `uii_role_permissions`
--

CREATE TABLE `uii_role_permissions` (
  `role_id` int(10) UNSIGNED NOT NULL,
  `permission_id` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `uii_role_permissions`
--

INSERT INTO `uii_role_permissions` (`role_id`, `permission_id`) VALUES
(1, 1),
(1, 2),
(1, 3),
(1, 4),
(1, 5),
(1, 6),
(1, 7),
(1, 8),
(1, 9),
(1, 10),
(1, 11),
(1, 12),
(1, 13),
(1, 14),
(1, 15),
(1, 16),
(1, 17),
(1, 18),
(1, 19),
(1, 20),
(1, 21),
(1, 22),
(1, 23),
(1, 24),
(1, 25),
(1, 26),
(1, 27),
(1, 28),
(1, 29),
(1, 30),
(1, 31),
(1, 32),
(1, 33),
(1, 34),
(1, 35),
(1, 36),
(1, 37),
(1, 38),
(1, 39),
(1, 40),
(1, 41),
(1, 42),
(1, 43),
(1, 44),
(1, 45),
(1, 46),
(1, 47),
(1, 48),
(1, 49),
(1, 50),
(1, 51),
(1, 52),
(1, 53),
(1, 54),
(1, 55),
(1, 56),
(1, 57),
(1, 58),
(1, 59),
(1, 60),
(1, 61),
(1, 62),
(1, 63),
(1, 64),
(1, 65),
(1, 66),
(1, 67),
(1, 68),
(1, 69),
(1, 70),
(1, 71),
(1, 72),
(1, 73),
(1, 74),
(1, 75),
(1, 76),
(1, 77),
(1, 78),
(1, 79),
(1, 80),
(1, 81),
(1, 82),
(1, 83),
(1, 84),
(1, 85),
(1, 86),
(1, 87),
(1, 88),
(1, 89),
(1, 90),
(1, 91),
(1, 92),
(1, 93),
(2, 1),
(2, 15),
(2, 16),
(2, 17),
(2, 18),
(2, 19),
(2, 20),
(2, 21),
(2, 22),
(2, 23),
(2, 24),
(2, 25),
(2, 27),
(2, 28),
(2, 29),
(2, 30),
(2, 31),
(2, 32),
(2, 33),
(2, 34),
(2, 35),
(2, 36),
(2, 37),
(2, 38),
(2, 39),
(2, 40),
(2, 41),
(2, 42),
(2, 43),
(2, 44),
(2, 45),
(2, 46),
(2, 47),
(2, 48),
(2, 49),
(2, 50),
(2, 51),
(2, 52),
(2, 53),
(2, 54),
(2, 55),
(2, 56),
(2, 57),
(2, 58),
(2, 59),
(2, 60),
(2, 61),
(2, 62),
(2, 63),
(2, 64),
(2, 65),
(2, 66),
(2, 67),
(2, 68),
(2, 69),
(2, 70),
(2, 71),
(2, 72),
(2, 73),
(2, 74),
(2, 75),
(2, 85),
(2, 86),
(2, 87),
(2, 88),
(2, 89),
(2, 90),
(2, 91),
(2, 92),
(2, 93),
(3, 94),
(3, 95),
(3, 96),
(3, 97),
(3, 98),
(3, 99),
(3, 100),
(3, 101);

-- --------------------------------------------------------

--
-- Table structure for table `uii_sessions`
--

CREATE TABLE `uii_sessions` (
  `id` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` int(10) UNSIGNED DEFAULT NULL,
  `ip_address` varchar(45) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `user_agent` text COLLATE utf8mb4_unicode_ci,
  `payload` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `last_activity` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `uii_settings`
--

CREATE TABLE `uii_settings` (
  `id` int(10) UNSIGNED NOT NULL,
  `company_id` int(11) NOT NULL,
  `key` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `value` text COLLATE utf8mb4_unicode_ci
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `uii_settings`
--

INSERT INTO `uii_settings` (`id`, `company_id`, `key`, `value`) VALUES
(1, 1, 'general.default_account', '1'),
(2, 1, 'general.date_format', 'd M Y'),
(3, 1, 'general.date_separator', 'space'),
(4, 1, 'general.timezone', 'Europe/London'),
(5, 1, 'general.percent_position', 'after'),
(6, 1, 'general.invoice_number_prefix', 'INV-'),
(7, 1, 'general.invoice_number_digit', '5'),
(8, 1, 'general.invoice_number_next', '1'),
(9, 1, 'general.default_payment_method', 'offlinepayment.cash.1'),
(10, 1, 'general.email_protocol', 'mail'),
(11, 1, 'general.email_sendmail_path', '/usr/sbin/sendmail -bs'),
(12, 1, 'general.send_invoice_reminder', '0'),
(13, 1, 'general.schedule_invoice_days', '1,3,5,10'),
(14, 1, 'general.send_bill_reminder', '0'),
(15, 1, 'general.schedule_bill_days', '10,5,3,1'),
(16, 1, 'general.schedule_time', '09:00'),
(17, 1, 'general.admin_theme', 'skin-green-light'),
(18, 1, 'general.list_limit', '25'),
(19, 1, 'general.use_gravatar', '0'),
(20, 1, 'general.session_handler', 'file'),
(21, 1, 'general.session_lifetime', '30'),
(22, 1, 'general.file_size', '2'),
(23, 1, 'general.file_types', 'pdf,jpeg,jpg,png'),
(24, 1, 'general.company_name', 'Tortilla ERP Pte Ltd'),
(25, 1, 'general.company_email', 'company@mail.com'),
(26, 1, 'general.default_currency', 'USD'),
(27, 1, 'general.default_locale', 'en-GB'),
(28, 1, 'offlinepayment.methods', '[{\"code\":\"offlinepayment.cash.1\",\"name\":\"Cash\",\"order\":\"1\",\"description\":null},{\"code\":\"offlinepayment.bank_transfer.2\",\"name\":\"Bank Transfer\",\"order\":\"2\",\"description\":null}]');

-- --------------------------------------------------------

--
-- Table structure for table `uii_taxes`
--

CREATE TABLE `uii_taxes` (
  `id` int(10) UNSIGNED NOT NULL,
  `company_id` int(11) NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `rate` double(15,4) NOT NULL,
  `enabled` tinyint(1) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `uii_taxes`
--

INSERT INTO `uii_taxes` (`id`, `company_id`, `name`, `rate`, `enabled`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 1, 'Tax Exempt', 0.0000, 1, '2018-08-28 08:29:24', '2018-08-28 08:29:24', NULL),
(2, 1, 'Normal Tax', 5.0000, 1, '2018-08-28 08:29:24', '2018-08-28 08:29:24', NULL),
(3, 1, 'Sales Tax', 15.0000, 1, '2018-08-28 08:29:24', '2018-08-28 08:29:24', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `uii_transfers`
--

CREATE TABLE `uii_transfers` (
  `id` int(10) UNSIGNED NOT NULL,
  `company_id` int(11) NOT NULL,
  `payment_id` int(11) NOT NULL,
  `revenue_id` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `uii_users`
--

CREATE TABLE `uii_users` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `last_logged_in_at` timestamp NULL DEFAULT NULL,
  `enabled` tinyint(1) NOT NULL DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `locale` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'en-GB'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `uii_users`
--

INSERT INTO `uii_users` (`id`, `name`, `email`, `password`, `remember_token`, `last_logged_in_at`, `enabled`, `created_at`, `updated_at`, `deleted_at`, `locale`) VALUES
(1, '', 'admin@mail.com', '$2y$10$qpJ7sdUWLQwSB5KML3x21uooEvcJG/hOP9re0.TpUEqpH25CwsCri', NULL, '2018-09-10 08:24:06', 1, '2018-08-28 08:29:24', '2018-09-10 08:24:06', NULL, 'en-GB');

-- --------------------------------------------------------

--
-- Table structure for table `uii_user_companies`
--

CREATE TABLE `uii_user_companies` (
  `user_id` int(10) UNSIGNED NOT NULL,
  `company_id` int(10) UNSIGNED NOT NULL,
  `user_type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `uii_user_companies`
--

INSERT INTO `uii_user_companies` (`user_id`, `company_id`, `user_type`) VALUES
(1, 1, 'users');

-- --------------------------------------------------------

--
-- Table structure for table `uii_user_permissions`
--

CREATE TABLE `uii_user_permissions` (
  `user_id` int(10) UNSIGNED NOT NULL,
  `permission_id` int(10) UNSIGNED NOT NULL,
  `user_type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `uii_user_roles`
--

CREATE TABLE `uii_user_roles` (
  `user_id` int(10) UNSIGNED NOT NULL,
  `role_id` int(10) UNSIGNED NOT NULL,
  `user_type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `uii_user_roles`
--

INSERT INTO `uii_user_roles` (`user_id`, `role_id`, `user_type`) VALUES
(1, 1, 'users');

-- --------------------------------------------------------

--
-- Table structure for table `uii_vendors`
--

CREATE TABLE `uii_vendors` (
  `id` int(10) UNSIGNED NOT NULL,
  `company_id` int(11) NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `tax_number` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `phone` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `address` text COLLATE utf8mb4_unicode_ci,
  `website` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `currency_code` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `enabled` tinyint(1) NOT NULL DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `uii_accounts`
--
ALTER TABLE `uii_accounts`
  ADD PRIMARY KEY (`id`),
  ADD KEY `accounts_company_id_index` (`company_id`);

--
-- Indexes for table `uii_bills`
--
ALTER TABLE `uii_bills`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `bills_company_id_bill_number_deleted_at_unique` (`company_id`,`bill_number`,`deleted_at`),
  ADD KEY `bills_company_id_index` (`company_id`);

--
-- Indexes for table `uii_bill_histories`
--
ALTER TABLE `uii_bill_histories`
  ADD PRIMARY KEY (`id`),
  ADD KEY `bill_histories_company_id_index` (`company_id`);

--
-- Indexes for table `uii_bill_items`
--
ALTER TABLE `uii_bill_items`
  ADD PRIMARY KEY (`id`),
  ADD KEY `bill_items_company_id_index` (`company_id`);

--
-- Indexes for table `uii_bill_payments`
--
ALTER TABLE `uii_bill_payments`
  ADD PRIMARY KEY (`id`),
  ADD KEY `bill_payments_company_id_index` (`company_id`);

--
-- Indexes for table `uii_bill_statuses`
--
ALTER TABLE `uii_bill_statuses`
  ADD PRIMARY KEY (`id`),
  ADD KEY `bill_statuses_company_id_index` (`company_id`);

--
-- Indexes for table `uii_bill_totals`
--
ALTER TABLE `uii_bill_totals`
  ADD PRIMARY KEY (`id`),
  ADD KEY `bill_totals_company_id_index` (`company_id`);

--
-- Indexes for table `uii_categories`
--
ALTER TABLE `uii_categories`
  ADD PRIMARY KEY (`id`),
  ADD KEY `categories_company_id_index` (`company_id`);

--
-- Indexes for table `uii_companies`
--
ALTER TABLE `uii_companies`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `uii_currencies`
--
ALTER TABLE `uii_currencies`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `currencies_company_id_code_deleted_at_unique` (`company_id`,`code`,`deleted_at`),
  ADD KEY `currencies_company_id_index` (`company_id`);

--
-- Indexes for table `uii_customers`
--
ALTER TABLE `uii_customers`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `customers_company_id_email_deleted_at_unique` (`company_id`,`email`,`deleted_at`),
  ADD KEY `customers_company_id_index` (`company_id`);

--
-- Indexes for table `uii_failed_jobs`
--
ALTER TABLE `uii_failed_jobs`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `uii_invoices`
--
ALTER TABLE `uii_invoices`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `invoices_company_id_invoice_number_deleted_at_unique` (`company_id`,`invoice_number`,`deleted_at`),
  ADD KEY `invoices_company_id_index` (`company_id`);

--
-- Indexes for table `uii_invoice_histories`
--
ALTER TABLE `uii_invoice_histories`
  ADD PRIMARY KEY (`id`),
  ADD KEY `invoice_histories_company_id_index` (`company_id`);

--
-- Indexes for table `uii_invoice_items`
--
ALTER TABLE `uii_invoice_items`
  ADD PRIMARY KEY (`id`),
  ADD KEY `invoice_items_company_id_index` (`company_id`);

--
-- Indexes for table `uii_invoice_payments`
--
ALTER TABLE `uii_invoice_payments`
  ADD PRIMARY KEY (`id`),
  ADD KEY `invoice_payments_company_id_index` (`company_id`);

--
-- Indexes for table `uii_invoice_statuses`
--
ALTER TABLE `uii_invoice_statuses`
  ADD PRIMARY KEY (`id`),
  ADD KEY `invoice_statuses_company_id_index` (`company_id`);

--
-- Indexes for table `uii_invoice_totals`
--
ALTER TABLE `uii_invoice_totals`
  ADD PRIMARY KEY (`id`),
  ADD KEY `invoice_totals_company_id_index` (`company_id`);

--
-- Indexes for table `uii_items`
--
ALTER TABLE `uii_items`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `items_company_id_sku_deleted_at_unique` (`company_id`,`sku`,`deleted_at`),
  ADD KEY `items_company_id_index` (`company_id`);

--
-- Indexes for table `uii_jobs`
--
ALTER TABLE `uii_jobs`
  ADD PRIMARY KEY (`id`),
  ADD KEY `jobs_queue_reserved_at_index` (`queue`,`reserved_at`);

--
-- Indexes for table `uii_media`
--
ALTER TABLE `uii_media`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `media_disk_directory_filename_extension_unique` (`disk`,`directory`,`filename`,`extension`),
  ADD KEY `media_disk_directory_index` (`disk`,`directory`),
  ADD KEY `media_aggregate_type_index` (`aggregate_type`);

--
-- Indexes for table `uii_mediables`
--
ALTER TABLE `uii_mediables`
  ADD PRIMARY KEY (`media_id`,`mediable_type`,`mediable_id`,`tag`),
  ADD KEY `mediables_mediable_id_mediable_type_index` (`mediable_id`,`mediable_type`),
  ADD KEY `mediables_tag_index` (`tag`),
  ADD KEY `mediables_order_index` (`order`);

--
-- Indexes for table `uii_migrations`
--
ALTER TABLE `uii_migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `uii_modules`
--
ALTER TABLE `uii_modules`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `modules_company_id_alias_deleted_at_unique` (`company_id`,`alias`,`deleted_at`),
  ADD KEY `modules_company_id_index` (`company_id`);

--
-- Indexes for table `uii_module_histories`
--
ALTER TABLE `uii_module_histories`
  ADD PRIMARY KEY (`id`),
  ADD KEY `module_histories_company_id_module_id_index` (`company_id`,`module_id`);

--
-- Indexes for table `uii_notifications`
--
ALTER TABLE `uii_notifications`
  ADD PRIMARY KEY (`id`),
  ADD KEY `notifications_notifiable_id_notifiable_type_index` (`notifiable_id`,`notifiable_type`);

--
-- Indexes for table `uii_password_resets`
--
ALTER TABLE `uii_password_resets`
  ADD KEY `password_resets_email_index` (`email`);

--
-- Indexes for table `uii_payments`
--
ALTER TABLE `uii_payments`
  ADD PRIMARY KEY (`id`),
  ADD KEY `payments_company_id_index` (`company_id`);

--
-- Indexes for table `uii_permissions`
--
ALTER TABLE `uii_permissions`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `permissions_name_unique` (`name`);

--
-- Indexes for table `uii_recurring`
--
ALTER TABLE `uii_recurring`
  ADD PRIMARY KEY (`id`),
  ADD KEY `recurring_recurable_id_recurable_type_index` (`recurable_id`,`recurable_type`);

--
-- Indexes for table `uii_revenues`
--
ALTER TABLE `uii_revenues`
  ADD PRIMARY KEY (`id`),
  ADD KEY `revenues_company_id_index` (`company_id`);

--
-- Indexes for table `uii_roles`
--
ALTER TABLE `uii_roles`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `roles_name_unique` (`name`);

--
-- Indexes for table `uii_role_permissions`
--
ALTER TABLE `uii_role_permissions`
  ADD PRIMARY KEY (`role_id`,`permission_id`),
  ADD KEY `role_permissions_permission_id_foreign` (`permission_id`);

--
-- Indexes for table `uii_sessions`
--
ALTER TABLE `uii_sessions`
  ADD UNIQUE KEY `sessions_id_unique` (`id`);

--
-- Indexes for table `uii_settings`
--
ALTER TABLE `uii_settings`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `settings_company_id_key_unique` (`company_id`,`key`),
  ADD KEY `settings_company_id_index` (`company_id`);

--
-- Indexes for table `uii_taxes`
--
ALTER TABLE `uii_taxes`
  ADD PRIMARY KEY (`id`),
  ADD KEY `taxes_company_id_index` (`company_id`);

--
-- Indexes for table `uii_transfers`
--
ALTER TABLE `uii_transfers`
  ADD PRIMARY KEY (`id`),
  ADD KEY `transfers_company_id_index` (`company_id`);

--
-- Indexes for table `uii_users`
--
ALTER TABLE `uii_users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_deleted_at_unique` (`email`,`deleted_at`);

--
-- Indexes for table `uii_user_companies`
--
ALTER TABLE `uii_user_companies`
  ADD PRIMARY KEY (`user_id`,`company_id`,`user_type`);

--
-- Indexes for table `uii_user_permissions`
--
ALTER TABLE `uii_user_permissions`
  ADD PRIMARY KEY (`user_id`,`permission_id`,`user_type`),
  ADD KEY `user_permissions_permission_id_foreign` (`permission_id`);

--
-- Indexes for table `uii_user_roles`
--
ALTER TABLE `uii_user_roles`
  ADD PRIMARY KEY (`user_id`,`role_id`,`user_type`),
  ADD KEY `user_roles_role_id_foreign` (`role_id`);

--
-- Indexes for table `uii_vendors`
--
ALTER TABLE `uii_vendors`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `vendors_company_id_email_deleted_at_unique` (`company_id`,`email`,`deleted_at`),
  ADD KEY `vendors_company_id_index` (`company_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `uii_accounts`
--
ALTER TABLE `uii_accounts`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `uii_bills`
--
ALTER TABLE `uii_bills`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `uii_bill_histories`
--
ALTER TABLE `uii_bill_histories`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `uii_bill_items`
--
ALTER TABLE `uii_bill_items`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `uii_bill_payments`
--
ALTER TABLE `uii_bill_payments`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `uii_bill_statuses`
--
ALTER TABLE `uii_bill_statuses`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `uii_bill_totals`
--
ALTER TABLE `uii_bill_totals`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `uii_categories`
--
ALTER TABLE `uii_categories`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `uii_companies`
--
ALTER TABLE `uii_companies`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `uii_currencies`
--
ALTER TABLE `uii_currencies`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `uii_customers`
--
ALTER TABLE `uii_customers`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `uii_failed_jobs`
--
ALTER TABLE `uii_failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `uii_invoices`
--
ALTER TABLE `uii_invoices`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `uii_invoice_histories`
--
ALTER TABLE `uii_invoice_histories`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `uii_invoice_items`
--
ALTER TABLE `uii_invoice_items`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `uii_invoice_payments`
--
ALTER TABLE `uii_invoice_payments`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `uii_invoice_statuses`
--
ALTER TABLE `uii_invoice_statuses`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `uii_invoice_totals`
--
ALTER TABLE `uii_invoice_totals`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `uii_items`
--
ALTER TABLE `uii_items`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `uii_jobs`
--
ALTER TABLE `uii_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `uii_media`
--
ALTER TABLE `uii_media`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `uii_migrations`
--
ALTER TABLE `uii_migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=43;

--
-- AUTO_INCREMENT for table `uii_modules`
--
ALTER TABLE `uii_modules`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `uii_module_histories`
--
ALTER TABLE `uii_module_histories`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `uii_payments`
--
ALTER TABLE `uii_payments`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `uii_permissions`
--
ALTER TABLE `uii_permissions`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=102;

--
-- AUTO_INCREMENT for table `uii_recurring`
--
ALTER TABLE `uii_recurring`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `uii_revenues`
--
ALTER TABLE `uii_revenues`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `uii_roles`
--
ALTER TABLE `uii_roles`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `uii_settings`
--
ALTER TABLE `uii_settings`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=29;

--
-- AUTO_INCREMENT for table `uii_taxes`
--
ALTER TABLE `uii_taxes`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `uii_transfers`
--
ALTER TABLE `uii_transfers`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `uii_users`
--
ALTER TABLE `uii_users`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `uii_vendors`
--
ALTER TABLE `uii_vendors`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `uii_mediables`
--
ALTER TABLE `uii_mediables`
  ADD CONSTRAINT `mediables_media_id_foreign` FOREIGN KEY (`media_id`) REFERENCES `uii_media` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `uii_role_permissions`
--
ALTER TABLE `uii_role_permissions`
  ADD CONSTRAINT `role_permissions_permission_id_foreign` FOREIGN KEY (`permission_id`) REFERENCES `uii_permissions` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `role_permissions_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `uii_roles` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `uii_user_permissions`
--
ALTER TABLE `uii_user_permissions`
  ADD CONSTRAINT `user_permissions_permission_id_foreign` FOREIGN KEY (`permission_id`) REFERENCES `uii_permissions` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `uii_user_roles`
--
ALTER TABLE `uii_user_roles`
  ADD CONSTRAINT `user_roles_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `uii_roles` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
