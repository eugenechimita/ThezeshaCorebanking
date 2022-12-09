-- phpMyAdmin SQL Dump
-- version 4.9.5deb2
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Dec 09, 2022 at 07:19 AM
-- Server version: 5.7.40
-- PHP Version: 7.4.3

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `fineract_default`
--

-- --------------------------------------------------------

--
-- Table structure for table `acc_accounting_rule`
--

CREATE TABLE `acc_accounting_rule` (
  `id` bigint(20) NOT NULL,
  `name` varchar(100) DEFAULT NULL,
  `office_id` bigint(20) DEFAULT NULL,
  `debit_account_id` bigint(20) DEFAULT NULL,
  `allow_multiple_debits` tinyint(4) NOT NULL DEFAULT '0',
  `credit_account_id` bigint(20) DEFAULT NULL,
  `allow_multiple_credits` tinyint(4) NOT NULL DEFAULT '0',
  `description` varchar(500) DEFAULT NULL,
  `system_defined` tinyint(4) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `acc_gl_account`
--

CREATE TABLE `acc_gl_account` (
  `id` bigint(20) NOT NULL,
  `name` varchar(200) NOT NULL,
  `parent_id` bigint(20) DEFAULT NULL,
  `hierarchy` varchar(50) DEFAULT NULL,
  `gl_code` varchar(45) NOT NULL,
  `disabled` tinyint(4) NOT NULL DEFAULT '0',
  `manual_journal_entries_allowed` tinyint(4) NOT NULL DEFAULT '1',
  `account_usage` tinyint(4) NOT NULL DEFAULT '2',
  `classification_enum` smallint(6) NOT NULL,
  `tag_id` int(11) DEFAULT NULL,
  `description` varchar(500) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `acc_gl_account`
--

INSERT INTO `acc_gl_account` (`id`, `name`, `parent_id`, `hierarchy`, `gl_code`, `disabled`, `manual_journal_entries_allowed`, `account_usage`, `classification_enum`, `tag_id`, `description`) VALUES
(1, 'Deposit Accounts Portfolio', NULL, '.', '10100', 0, 1, 2, 2, NULL, NULL),
(2, 'Overpayment Liability', NULL, '.', '10200', 0, 1, 1, 2, NULL, NULL),
(3, 'Interest Payable', NULL, '.', '10300', 0, 1, 2, 2, NULL, NULL),
(4, 'Pass-Through Collections', NULL, '.', '10400', 0, 1, 2, 2, NULL, NULL),
(5, 'External Credits and Borrowings', NULL, '.', '10500', 0, 1, 2, 2, NULL, NULL),
(6, 'Accrued Expenses and Provisions', NULL, '.', '10600', 0, 1, 2, 2, NULL, NULL),
(7, 'Other Liabilities', NULL, '.', '10700', 0, 1, 2, 2, NULL, NULL),
(8, 'Fixed Assets', NULL, '.', '20100', 0, 1, 2, 1, NULL, NULL),
(9, 'Investments', NULL, '.', '20200', 0, 1, 2, 1, NULL, NULL),
(10, 'Cash', NULL, '.', '20300', 0, 1, 2, 1, NULL, NULL),
(11, 'Bank Accounts', NULL, '.', '20400', 0, 1, 2, 1, NULL, NULL),
(12, 'Lending Portfolio', NULL, '.', '20500', 0, 1, 2, 1, NULL, NULL),
(13, 'Interest and Fees Receivable', NULL, '.', '20600', 0, 1, 2, 1, NULL, NULL),
(14, 'Advance Payments', NULL, '.', '20700', 0, 1, 2, 1, NULL, NULL),
(15, 'Reserves for Possible Losses', NULL, '.', '20800', 0, 1, 2, 1, NULL, NULL),
(16, 'Accrued Income', NULL, '.', '20900', 0, 1, 2, 1, NULL, NULL),
(17, 'Suspense Account', NULL, '.', '9999', 0, 1, 1, 1, NULL, NULL),
(18, 'Portfolio Earnings', NULL, '.', '30100', 0, 1, 2, 4, NULL, NULL),
(19, 'Non Portfolio Income', NULL, '.', '30200', 0, 1, 2, 4, NULL, NULL),
(20, 'Portfolio Expenses', NULL, '.', '40100', 0, 1, 2, 5, NULL, NULL),
(21, 'General And Administrative Expenses', NULL, '.', '40200', 0, 1, 2, 5, NULL, NULL),
(22, 'Sundry Expenses', NULL, '.', '40800', 0, 1, 2, 5, NULL, NULL),
(23, 'Repairs and Maintenance', NULL, '.', '40900', 0, 1, 2, 5, NULL, NULL),
(24, 'Depreciation and Amortization', NULL, '.', '41000', 0, 1, 2, 5, NULL, NULL),
(25, 'Equity and Share Capital', NULL, '.', '50100', 0, 1, 2, 3, NULL, NULL),
(26, 'Opening Balances Contra Account', NULL, '.', '50200', 0, 1, 2, 3, NULL, NULL),
(27, 'Voluntary Savings', 1, '.1.', '10101', 0, 1, 2, 2, NULL, NULL),
(28, 'Mandatory Savings', 1, '.1.', '10102', 0, 1, 2, 2, NULL, NULL),
(29, 'Term Deposits', 1, '.1.', '10103', 0, 1, 2, 2, NULL, NULL),
(30, 'Recurring Deposits', 1, '.1.', '10104', 0, 1, 1, 2, NULL, NULL),
(31, 'Furniture and Fixtures', 8, '.8.', '20101', 0, 1, 1, 1, NULL, NULL),
(32, 'Cash In Hand', 10, '.10.', '20301', 0, 1, 1, 1, NULL, NULL),
(33, 'Petty Cash', 10, '.10.', '20302', 0, 1, 1, 1, NULL, NULL),
(34, 'Loans to Customers', 12, '.12.', '20501', 0, 1, 1, 1, NULL, NULL),
(35, 'Current Account Overdrafts', 12, '.12.', '20502', 0, 1, 1, 1, NULL, NULL),
(36, 'Fees and Charges', 18, '.18.', '30101', 0, 1, 1, 4, NULL, NULL),
(37, 'Penalties', 18, '.18.', '30102', 0, 1, 1, 4, NULL, NULL),
(38, 'Interest Received from Borrowers', 18, '.18.', '30103', 0, 1, 1, 4, NULL, NULL),
(39, 'Insurance Charges', 18, '.18.', '30104', 0, 1, 1, 4, NULL, NULL),
(40, 'Other Operating Income', 18, '.18.', '30105', 0, 1, 1, 4, NULL, NULL),
(41, 'Losses Written Off', 20, '.20.', '40101', 0, 1, 1, 5, NULL, NULL),
(42, 'Interest Paid To Depositors', 20, '.20.', '40102', 0, 1, 1, 5, NULL, NULL),
(43, 'Loan Collection Expenses', 20, '.20.', '40103', 0, 1, 1, 5, NULL, NULL),
(44, 'Salaries and Wages', 21, '.21.', '40300', 0, 1, 1, 5, NULL, NULL),
(45, 'Professional Expenses', 21, '.21.', '40400', 0, 1, 1, 5, NULL, NULL),
(46, 'Travel and Conveyance Expenses', 21, '.21.', '40500', 0, 1, 1, 5, NULL, NULL),
(47, 'Training Expenses', 21, '.21.', '40600', 0, 1, 1, 5, NULL, NULL),
(48, 'Office Expenses', 21, '.21.', '40700', 0, 1, 2, 5, NULL, NULL),
(49, 'Printing and Stationery', 48, '.21.48.', '40701', 0, 1, 1, 5, NULL, NULL),
(50, 'Telephone Charges', 48, '.21.48.', '40702', 0, 1, 1, 5, NULL, NULL),
(51, 'Electricity Charges', 48, '.21.48.', '40703', 0, 1, 1, 5, NULL, NULL),
(52, 'Rent Paid', 48, '.21.48.', '40704', 0, 1, 1, 5, NULL, NULL),
(53, 'Internet Charges', 48, '.21.48.', '40705', 0, 1, 1, 5, NULL, NULL),
(54, 'Recovery Repayments', 18, '.18.', '30110', 0, 1, 1, 4, NULL, NULL),
(55, 'Interest Receivable', NULL, '.', '20601', 0, 1, 1, 1, NULL, NULL),
(56, 'Fees Receivable', NULL, '.', '20602', 0, 1, 1, 1, NULL, NULL),
(57, 'Penalties Receivable', NULL, '.', '20603', 0, 1, 1, 1, NULL, NULL),
(58, 'Additional investment', 26, '.58.', '50201', 0, 1, 1, 3, NULL, 'This Describes the money Initially invested into the business');

-- --------------------------------------------------------

--
-- Table structure for table `acc_gl_closure`
--

CREATE TABLE `acc_gl_closure` (
  `id` bigint(20) NOT NULL,
  `office_id` bigint(20) NOT NULL,
  `closing_date` date NOT NULL,
  `is_deleted` int(11) NOT NULL DEFAULT '0',
  `createdby_id` bigint(20) DEFAULT NULL,
  `lastmodifiedby_id` bigint(20) DEFAULT NULL,
  `created_date` datetime DEFAULT NULL,
  `lastmodified_date` datetime DEFAULT NULL,
  `comments` varchar(500) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `acc_gl_financial_activity_account`
--

CREATE TABLE `acc_gl_financial_activity_account` (
  `id` bigint(20) NOT NULL,
  `gl_account_id` bigint(20) NOT NULL DEFAULT '0',
  `financial_activity_type` smallint(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `acc_gl_financial_activity_account`
--

INSERT INTO `acc_gl_financial_activity_account` (`id`, `gl_account_id`, `financial_activity_type`) VALUES
(1, 58, 300);

-- --------------------------------------------------------

--
-- Table structure for table `acc_gl_journal_entry`
--

CREATE TABLE `acc_gl_journal_entry` (
  `id` bigint(20) NOT NULL,
  `account_id` bigint(20) NOT NULL,
  `office_id` bigint(20) NOT NULL,
  `reversal_id` bigint(20) DEFAULT NULL,
  `currency_code` varchar(3) NOT NULL,
  `transaction_id` varchar(50) NOT NULL,
  `loan_transaction_id` bigint(20) DEFAULT NULL,
  `savings_transaction_id` bigint(20) DEFAULT NULL,
  `client_transaction_id` bigint(20) DEFAULT NULL,
  `reversed` tinyint(4) NOT NULL DEFAULT '0',
  `ref_num` varchar(100) DEFAULT NULL,
  `manual_entry` tinyint(4) NOT NULL DEFAULT '0',
  `entry_date` date NOT NULL,
  `type_enum` smallint(6) NOT NULL,
  `amount` decimal(19,6) NOT NULL,
  `description` varchar(500) DEFAULT NULL,
  `entity_type_enum` smallint(6) DEFAULT NULL,
  `entity_id` bigint(20) DEFAULT NULL,
  `createdby_id` bigint(20) NOT NULL,
  `lastmodifiedby_id` bigint(20) NOT NULL,
  `created_date` datetime NOT NULL,
  `lastmodified_date` datetime NOT NULL,
  `is_running_balance_calculated` tinyint(4) NOT NULL DEFAULT '0',
  `office_running_balance` decimal(19,6) NOT NULL DEFAULT '0.000000',
  `organization_running_balance` decimal(19,6) NOT NULL DEFAULT '0.000000',
  `payment_details_id` bigint(20) DEFAULT NULL,
  `share_transaction_id` bigint(20) DEFAULT NULL,
  `transaction_date` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `acc_product_mapping`
--

CREATE TABLE `acc_product_mapping` (
  `id` bigint(20) NOT NULL,
  `gl_account_id` bigint(20) DEFAULT NULL,
  `product_id` bigint(20) DEFAULT NULL,
  `product_type` smallint(6) DEFAULT NULL,
  `payment_type` int(11) DEFAULT NULL,
  `charge_id` bigint(20) DEFAULT NULL,
  `financial_account_type` smallint(6) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `acc_product_mapping`
--

INSERT INTO `acc_product_mapping` (`id`, `gl_account_id`, `product_id`, `product_type`, `payment_type`, `charge_id`, `financial_account_type`) VALUES
(1, 32, 1, 2, NULL, NULL, 1),
(2, 34, 1, 2, NULL, NULL, 11),
(3, 36, 1, 2, NULL, NULL, 4),
(4, 36, 1, 2, NULL, NULL, 5),
(5, 36, 1, 2, NULL, NULL, 12),
(6, 42, 1, 2, NULL, NULL, 3),
(7, 41, 1, 2, NULL, NULL, 13),
(8, 30, 1, 2, NULL, NULL, 2),
(9, 30, 1, 2, NULL, NULL, 10);

-- --------------------------------------------------------

--
-- Table structure for table `acc_rule_tags`
--

CREATE TABLE `acc_rule_tags` (
  `id` bigint(20) NOT NULL,
  `acc_rule_id` bigint(20) NOT NULL,
  `tag_id` int(11) NOT NULL,
  `acc_type_enum` smallint(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `client_device_registration`
--

CREATE TABLE `client_device_registration` (
  `id` bigint(20) NOT NULL,
  `client_id` bigint(20) NOT NULL,
  `updatedon_date` datetime NOT NULL,
  `registration_id` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `c_account_number_format`
--

CREATE TABLE `c_account_number_format` (
  `id` bigint(20) NOT NULL,
  `account_type_enum` smallint(6) NOT NULL,
  `prefix_type_enum` smallint(6) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `c_cache`
--

CREATE TABLE `c_cache` (
  `id` bigint(20) NOT NULL,
  `cache_type_enum` tinyint(4) NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `c_cache`
--

INSERT INTO `c_cache` (`id`, `cache_type_enum`) VALUES
(1, 1);

-- --------------------------------------------------------

--
-- Table structure for table `c_configuration`
--

CREATE TABLE `c_configuration` (
  `id` bigint(20) NOT NULL,
  `name` varchar(100) DEFAULT NULL,
  `value` int(11) DEFAULT NULL,
  `date_value` date DEFAULT NULL,
  `enabled` tinyint(4) NOT NULL DEFAULT '0',
  `is_trap_door` tinyint(1) NOT NULL DEFAULT '0',
  `description` varchar(300) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `c_configuration`
--

INSERT INTO `c_configuration` (`id`, `name`, `value`, `date_value`, `enabled`, `is_trap_door`, `description`) VALUES
(1, 'maker-checker', NULL, NULL, 0, 0, NULL),
(4, 'amazon-S3', NULL, NULL, 0, 0, NULL),
(5, 'reschedule-future-repayments', NULL, NULL, 1, 0, NULL),
(6, 'reschedule-repayments-on-holidays', NULL, NULL, 0, 0, NULL),
(7, 'allow-transactions-on-holiday', NULL, NULL, 0, 0, NULL),
(8, 'allow-transactions-on-non_workingday', NULL, NULL, 0, 0, NULL),
(9, 'constraint_approach_for_datatables', NULL, NULL, 0, 0, NULL),
(10, 'penalty-wait-period', 2, NULL, 1, 0, NULL),
(11, 'force-password-reset-days', 0, NULL, 0, 0, NULL),
(12, 'grace-on-penalty-posting', 0, NULL, 1, 0, NULL),
(15, 'savings-interest-posting-current-period-end', NULL, NULL, 0, 0, 'Recommended to be changed only once during start of production. When set as false(default), interest will be posted on the first date of next period. If set as true, interest will be posted on last date of current period. There is no difference in the interest amount posted.'),
(16, 'financial-year-beginning-month', 1, NULL, 1, 0, 'Recommended to be changed only once during start of production. Allowed values 1 - 12 (January - December). Interest posting periods are evaluated based on this configuration.'),
(17, 'min-clients-in-group', 5, NULL, 0, 0, 'Minimum number of Clients that a Group should have'),
(18, 'max-clients-in-group', 5, NULL, 0, 0, 'Maximum number of Clients that a Group can have'),
(19, 'meetings-mandatory-for-jlg-loans', NULL, NULL, 0, 0, 'Enforces all JLG loans to follow a meeting schedule belonging to parent group or Center'),
(20, 'office-specific-products-enabled', 0, NULL, 0, 0, 'Whether products and fees should be office specific or not? This property should NOT be changed once Mifos is Live.'),
(21, 'restrict-products-to-user-office', 0, NULL, 0, 0, 'This should be enabled only if, products & fees are office specific (i.e. office-specific-products-enabled is enabled). This property specifies if the products should be auto-restricted to office of the user who created the proudct? Note: This property should NOT be changed once Mifos is Live.'),
(22, 'office-opening-balances-contra-account', 0, NULL, 1, 0, NULL),
(23, 'rounding-mode', 6, NULL, 1, 1, '0 - UP, 1 - DOWN, 2- CEILING, 3- FLOOR, 4- HALF_UP, 5- HALF_DOWN, 6 - HALF_EVEN'),
(24, 'backdate-penalties-enabled', 0, NULL, 1, 0, 'If this parameter is disabled penalties will only be added to instalments due moving forward, any old overdue instalments will not be affected.'),
(25, 'organisation-start-date', 0, NULL, 0, 0, NULL),
(26, 'paymenttype-applicable-for-disbursement-charges', NULL, NULL, 0, 0, 'Is the Disbursement Entry need to be considering the fund source of the paymnet type'),
(27, 'interest-charged-from-date-same-as-disbursal-date', 0, NULL, 0, 0, NULL),
(28, 'skip-repayment-on-first-day-of-month', 14, NULL, 0, 0, 'skipping repayment on first day of month'),
(29, 'change-emi-if-repaymentdate-same-as-disbursementdate', 0, NULL, 1, 0, 'In tranche loans, if repayment date is same as tranche disbursement date then allow to change the emi amount'),
(30, 'daily-tpt-limit', 0, NULL, 0, 0, 'Daily limit for third party transfers'),
(31, 'Enable-Address', NULL, NULL, 0, 0, NULL),
(32, 'sub-rates', 0, NULL, 0, 0, 'Enable Rates Module'),
(33, 'loan-reschedule-is-first-payday-allowed-on-holiday', 0, NULL, 0, 0, 'If enabled, while loan reschedule the first repayment date can be on a holiday/non working day'),
(34, 'is-interest-to-be-appropriated-equally-when-greater-than-emi', 0, NULL, 0, 0, 'If enabled, while loan reschedule when interest amount is greater than EMI, the additional interest is spread equally over remaining installments');

-- --------------------------------------------------------

--
-- Table structure for table `c_external_service`
--

CREATE TABLE `c_external_service` (
  `id` bigint(20) NOT NULL,
  `name` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `c_external_service`
--

INSERT INTO `c_external_service` (`id`, `name`) VALUES
(3, 'MESSAGE_GATEWAY'),
(4, 'NOTIFICATION'),
(1, 'S3'),
(2, 'SMTP_Email_Account');

-- --------------------------------------------------------

--
-- Table structure for table `c_external_service_properties`
--

CREATE TABLE `c_external_service_properties` (
  `name` varchar(150) NOT NULL,
  `value` varchar(250) DEFAULT NULL,
  `external_service_id` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `c_external_service_properties`
--

INSERT INTO `c_external_service_properties` (`name`, `value`, `external_service_id`) VALUES
('s3_access_key', NULL, 1),
('s3_bucket_name', NULL, 1),
('s3_secret_key', NULL, 1),
('username', 'eugenechimita41@gmail.com', 2),
('password', 'XXXX', 2),
('host', 'smtp.gmail.com', 2),
('port', '587', 2),
('useTLS', 'false', 2),
('host_name', 'localhost', 3),
('port_number', '9191', 3),
('end_point', '/', 3),
('tenant_app_key', NULL, 3),
('server_key', 'AAAAToBmqQQ:APA91bEodkE12CwFl8VHqanUbeJYg1E05TiheVz59CZZYrBnCq3uM40UYhHfdP-JfeTQ0L0zoLqS8orjvW_ze0_VF8DSuyyqkrDibflhtUainsI0lwgVz5u1YP3q3c3erqjlySEuRShS', 4),
('gcm_end_point', 'https://gcm-http.googleapis.com/gcm/send', 4),
('fcm_end_point', 'https://fcm.googleapis.com/fcm/send', 4),
('fromEmail', 'eugenechimita41@gmail.com', 2),
('fromName', 'eugenechimita41@gmail.com', 2);

-- --------------------------------------------------------

--
-- Table structure for table `glim_accounts`
--

CREATE TABLE `glim_accounts` (
  `id` bigint(20) NOT NULL,
  `group_id` bigint(20) NOT NULL DEFAULT '0',
  `account_number` varchar(50) NOT NULL,
  `principal_amount` decimal(19,6) NOT NULL DEFAULT '0.000000',
  `child_accounts_count` int(11) NOT NULL,
  `accepting_child` tinyint(4) NOT NULL DEFAULT '0',
  `loan_status_id` smallint(6) NOT NULL DEFAULT '0',
  `application_id` decimal(10,0) DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `gsim_accounts`
--

CREATE TABLE `gsim_accounts` (
  `id` bigint(20) NOT NULL,
  `group_id` bigint(20) NOT NULL DEFAULT '0',
  `account_number` varchar(50) NOT NULL,
  `parent_deposit` decimal(19,6) NOT NULL DEFAULT '0.000000',
  `child_accounts_count` int(11) NOT NULL,
  `accepting_child` tinyint(4) NOT NULL DEFAULT '0',
  `savings_status_id` smallint(6) NOT NULL DEFAULT '0',
  `application_id` decimal(10,0) DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `interop_identifier`
--

CREATE TABLE `interop_identifier` (
  `id` bigint(20) NOT NULL,
  `account_id` bigint(20) NOT NULL,
  `type` varchar(32) NOT NULL,
  `a_value` varchar(128) NOT NULL,
  `sub_value_or_type` varchar(128) DEFAULT NULL,
  `created_by` varchar(32) NOT NULL,
  `created_on` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `modified_by` varchar(32) DEFAULT NULL,
  `modified_on` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `job`
--

CREATE TABLE `job` (
  `id` bigint(20) NOT NULL,
  `name` varchar(100) NOT NULL,
  `display_name` varchar(100) NOT NULL,
  `cron_expression` varchar(20) CHARACTER SET latin1 NOT NULL,
  `create_time` datetime NOT NULL,
  `task_priority` smallint(6) NOT NULL DEFAULT '5',
  `group_name` varchar(50) CHARACTER SET latin1 DEFAULT NULL,
  `previous_run_start_time` datetime DEFAULT NULL,
  `next_run_time` datetime DEFAULT NULL,
  `job_key` varchar(500) DEFAULT NULL,
  `initializing_errorlog` text,
  `is_active` tinyint(4) NOT NULL DEFAULT '1',
  `currently_running` tinyint(4) NOT NULL DEFAULT '0',
  `updates_allowed` tinyint(4) NOT NULL DEFAULT '1',
  `scheduler_group` smallint(6) NOT NULL DEFAULT '0',
  `is_misfired` tinyint(4) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `job`
--

INSERT INTO `job` (`id`, `name`, `display_name`, `cron_expression`, `create_time`, `task_priority`, `group_name`, `previous_run_start_time`, `next_run_time`, `job_key`, `initializing_errorlog`, `is_active`, `currently_running`, `updates_allowed`, `scheduler_group`, `is_misfired`) VALUES
(1, 'Update loan Summary', 'Update loan Summary', '0 0 22 1/1 * ? *', '2022-11-01 17:13:56', 5, NULL, '2022-12-06 22:21:39', '2022-12-07 19:30:00', 'Update loan SummaryJobDetail1 _ DEFAULT', NULL, 1, 0, 1, 0, 0),
(2, 'Update Loan Arrears Ageing', 'Update Loan Arrears Ageing', '0 1 0 1/1 * ? *', '2022-11-01 17:13:56', 5, NULL, '2022-12-06 22:21:40', '2022-12-07 21:31:00', 'Update Loan Arrears AgeingJobDetail1 _ DEFAULT', NULL, 1, 0, 1, 0, 0),
(3, 'Update Loan Paid In Advance', 'Update Loan Paid In Advance', '0 5 0 1/1 * ? *', '2022-11-01 17:13:56', 5, NULL, '2022-12-06 22:21:40', '2022-12-07 21:35:00', 'Update Loan Paid In AdvanceJobDetail1 _ DEFAULT', NULL, 1, 0, 1, 0, 0),
(4, 'Apply Annual Fee For Savings', 'Apply Annual Fee For Savings', '0 20 22 1/1 * ? *', '2022-11-01 17:13:56', 5, NULL, '2022-12-06 22:21:39', '2022-12-07 19:50:00', 'Apply Annual Fee For SavingsJobDetail1 _ DEFAULT', NULL, 1, 0, 1, 0, 0),
(5, 'Apply Holidays To Loans', 'Apply Holidays To Loans', '0 0 12 * * ?', '2022-11-01 17:13:56', 5, NULL, '2022-11-03 13:10:12', '2022-12-07 09:30:00', 'Apply Holidays To LoansJobDetail1 _ DEFAULT', NULL, 1, 0, 1, 0, 0),
(6, 'Post Interest For Savings', 'Post Interest For Savings', '0 0 0 1/1 * ? *', '2022-11-01 17:14:22', 5, NULL, '2022-12-06 22:21:41', '2022-12-07 21:30:00', 'Post Interest For SavingsJobDetail1 _ DEFAULT', NULL, 1, 0, 1, 1, 0),
(7, 'Transfer Fee For Loans From Savings', 'Transfer Fee For Loans From Savings', '0 1 0 1/1 * ? *', '2022-11-01 17:16:08', 5, NULL, '2022-12-06 22:21:40', '2022-12-07 21:31:00', 'Transfer Fee For Loans From SavingsJobDetail1 _ DEFAULT', NULL, 1, 0, 1, 0, 0),
(8, 'Pay Due Savings Charges', 'Pay Due Savings Charges', '0 0 12 * * ?', '2013-09-23 00:00:00', 5, NULL, '2022-11-03 13:10:14', '2022-12-07 09:30:00', 'Pay Due Savings ChargesJobDetail1 _ DEFAULT', NULL, 1, 0, 1, 0, 0),
(9, 'Update Accounting Running Balances', 'Update Accounting Running Balances', '0 1 0 1/1 * ? *', '2022-11-01 17:16:31', 5, NULL, '2022-12-06 22:21:40', '2022-12-07 21:31:00', 'Update Accounting Running BalancesJobDetail1 _ DEFAULT', NULL, 1, 0, 1, 0, 0),
(10, 'Execute Standing Instruction', 'Execute Standing Instruction', '0 0 0 1/1 * ? *', '2022-11-01 17:18:58', 5, NULL, '2022-12-06 22:21:39', '2022-12-07 21:30:00', 'Execute Standing InstructionJobDetail1 _ DEFAULT', NULL, 1, 0, 1, 0, 0),
(11, 'Add Accrual Transactions', 'Add Accrual Transactions', '0 1 0 1/1 * ? *', '2022-11-01 17:19:03', 3, NULL, '2022-12-06 22:21:35', '2022-12-07 21:31:00', 'Add Accrual TransactionsJobDetail1 _ DEFAULT', NULL, 1, 0, 1, 3, 0),
(12, 'Apply penalty to overdue loans', 'Apply penalty to overdue loans', '0 0 0 1/1 * ? *', '2022-11-01 17:19:03', 5, NULL, '2022-12-06 22:21:39', '2022-12-07 21:30:00', 'Apply penalty to overdue loansJobDetail1 _ DEFAULT', NULL, 1, 0, 1, 0, 0),
(13, 'Update Non Performing Assets', 'Update Non Performing Assets', '0 0 0 1/1 * ? *', '2022-11-01 17:19:10', 6, NULL, '2022-12-06 22:21:31', '2022-12-07 21:30:00', 'Update Non Performing AssetsJobDetail1 _ DEFAULT', NULL, 1, 0, 1, 3, 0),
(14, 'Transfer Interest To Savings', 'Transfer Interest To Savings', '0 2 0 1/1 * ? *', '2022-11-01 17:19:45', 4, NULL, '2022-12-06 22:21:42', '2022-12-07 21:32:00', 'Transfer Interest To SavingsJobDetail1 _ DEFAULT', NULL, 1, 0, 1, 1, 0),
(15, 'Update Deposit Accounts Maturity details', 'Update Deposit Accounts Maturity details', '0 0 0 1/1 * ? *', '2022-11-01 17:19:46', 5, NULL, '2022-12-06 22:21:40', '2022-12-07 21:30:00', 'Update Deposit Accounts Maturity detailsJobDetail1 _ DEFAULT', NULL, 1, 0, 1, 0, 0),
(16, 'Add Periodic Accrual Transactions', 'Add Periodic Accrual Transactions', '0 2 0 1/1 * ? *', '2022-11-01 17:20:44', 2, NULL, '2022-12-06 22:21:35', '2022-12-07 21:32:00', 'Add Periodic Accrual TransactionsJobDetail1 _ DEFAULT', NULL, 1, 0, 1, 3, 0),
(17, 'Recalculate Interest For Loans', 'Recalculate Interest For Loans', '0 1 0 1/1 * ? *', '2022-11-01 17:21:04', 4, NULL, '2022-12-06 22:21:34', '2022-12-07 21:31:00', 'Recalculate Interest For LoansJobDetail1 _ DEFAULT', NULL, 1, 0, 1, 3, 0),
(18, 'Generate Mandatory Savings Schedule', 'Generate Mandatory Savings Schedule', '0 5 0 1/1 * ? *', '2022-11-01 17:24:15', 5, NULL, '2022-12-06 22:21:40', '2022-12-07 21:35:00', 'Generate Mandatory Savings ScheduleJobDetail1 _ DEFAULT', NULL, 1, 0, 1, 0, 0),
(19, 'Generate Loan Loss Provisioning', 'Generate Loan Loss Provisioning', '0 0 0 1/1 * ? *', '2022-11-01 17:25:13', 5, NULL, '2022-12-06 22:21:40', '2022-12-07 21:30:00', 'Generate Loan Loss ProvisioningJobDetail1 _ DEFAULT', NULL, 1, 0, 1, 0, 0),
(20, 'Post Dividends For Shares', 'Post Dividends For Shares', '0 0 0 1/1 * ? *', '2022-11-01 17:26:09', 5, NULL, '2022-12-06 22:21:40', '2022-12-07 21:30:00', 'Post Dividends For SharesJobDetail1 _ DEFAULT', NULL, 1, 0, 1, 0, 0),
(21, 'Update Savings Dormant Accounts', 'Update Savings Dormant Accounts', '0 0 0 1/1 * ? *', '2022-11-01 17:26:19', 3, NULL, '2022-12-06 22:21:42', '2022-12-07 21:30:00', 'Update Savings Dormant AccountsJobDetail1 _ DEFAULT', NULL, 1, 0, 1, 1, 0),
(22, 'Add Accrual Transactions For Loans With Income Posted As Transactions', 'Add Accrual Transactions For Loans With Income Posted As Transactions', '0 1 0 1/1 * ? *', '2022-11-01 17:26:27', 5, NULL, '2022-12-06 22:21:33', '2022-12-07 21:31:00', 'Add Accrual Transactions For Loans With Income Posted As TransactionsJobDetail1 _ DEFAULT', NULL, 1, 0, 1, 3, 0),
(23, 'Execute Report Mailing Jobs', 'Execute Report Mailing Jobs', '0 0/15 * * * ?', '2022-11-01 17:26:53', 5, NULL, '2022-12-06 22:21:39', '2022-12-06 22:30:00', 'Execute Report Mailing JobsJobDetail1 _ DEFAULT', NULL, 1, 0, 1, 0, 0),
(24, 'Update SMS Outbound with Campaign Message', 'Update SMS Outbound with Campaign Message', '0 0 5 1/1 * ? *', '2022-11-01 17:27:04', 3, NULL, '2022-11-03 13:10:21', '2022-12-07 02:30:00', 'Update SMS Outbound with Campaign MessageJobDetail1 _ DEFAULT', NULL, 1, 0, 1, 4, 0),
(25, 'Send Messages to SMS Gateway', 'Send Messages to SMS Gateway', '0 0 5 1/1 * ? *', '2022-11-01 17:27:04', 2, NULL, '2022-11-03 13:10:22', '2022-12-07 02:30:00', 'Send Messages to SMS GatewayJobDetail1 _ DEFAULT', NULL, 1, 0, 1, 4, 0),
(26, 'Get Delivery Reports from SMS Gateway', 'Get Delivery Reports from SMS Gateway', '0 0 5 1/1 * ? *', '2022-11-01 17:27:04', 1, NULL, '2022-11-03 13:10:23', '2022-12-07 02:30:00', 'Get Delivery Reports from SMS GatewayJobDetail1 _ DEFAULT', NULL, 1, 0, 1, 4, 0),
(27, 'Execute Email', 'Execute Email', '0 0/10 * * * ?', '2022-11-01 17:27:12', 5, NULL, '2022-12-06 22:21:39', '2022-12-06 22:30:00', 'Execute EmailJobDetail1 _ DEFAULT', NULL, 1, 0, 1, 0, 0),
(28, 'Update Email Outbound with campaign message', 'Update Email Outbound with campaign message', '0 0/15 * * * ?', '2022-11-01 17:27:12', 5, NULL, '2022-12-06 22:21:39', '2022-12-06 22:30:00', 'Update Email Outbound with campaign messageJobDetail1 _ DEFAULT', NULL, 1, 0, 1, 0, 0),
(29, 'Generate AdhocClient Schedule', 'Generate AdhocClient Schedule', '0 0 12 1/1 * ? *', '2022-11-01 17:27:34', 5, NULL, '2022-11-03 13:10:12', '2022-12-07 09:30:00', 'Generate AdhocClient ScheduleJobDetail1 _ DEFAULT', NULL, 1, 0, 1, 0, 0),
(30, 'Update Trial Balance Details', 'Update Trial Balance Details', '0 1 0 1/1 * ? *', '2022-11-01 17:27:58', 5, NULL, '2022-12-06 22:21:40', '2022-12-07 21:31:00', 'Update Trial Balance DetailsJobDetail1 _ DEFAULT', NULL, 1, 0, 1, 0, 0);

-- --------------------------------------------------------

--
-- Table structure for table `job_parameters`
--

CREATE TABLE `job_parameters` (
  `id` bigint(20) NOT NULL,
  `job_id` bigint(20) NOT NULL,
  `parameter_name` varchar(100) NOT NULL,
  `parameter_value` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `job_parameters`
--

INSERT INTO `job_parameters` (`id`, `job_id`, `parameter_name`, `parameter_value`) VALUES
(1, 17, 'thread-pool-size', 10),
(2, 17, 'batch-size', 100),
(3, 17, 'officeId', 1);

-- --------------------------------------------------------

--
-- Table structure for table `job_run_history`
--

CREATE TABLE `job_run_history` (
  `id` bigint(20) NOT NULL,
  `job_id` bigint(20) NOT NULL,
  `version` bigint(20) NOT NULL,
  `start_time` datetime NOT NULL,
  `end_time` datetime NOT NULL,
  `status` varchar(10) CHARACTER SET latin1 NOT NULL,
  `error_message` text,
  `trigger_type` varchar(25) NOT NULL,
  `error_log` text
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `job_run_history`
--

INSERT INTO `job_run_history` (`id`, `job_id`, `version`, `start_time`, `end_time`, `status`, `error_message`, `trigger_type`, `error_log`) VALUES
(1, 28, 1, '2022-11-01 17:30:00', '2022-11-01 17:30:00', 'success', NULL, 'cron', NULL),
(2, 23, 1, '2022-11-01 17:30:00', '2022-11-01 17:30:00', 'success', NULL, 'cron', NULL),
(3, 27, 1, '2022-11-01 17:30:00', '2022-11-01 17:30:00', 'success', NULL, 'cron', NULL),
(4, 27, 2, '2022-11-01 17:40:00', '2022-11-01 17:40:00', 'success', NULL, 'cron', NULL),
(5, 28, 2, '2022-11-01 17:45:00', '2022-11-01 17:45:00', 'success', NULL, 'cron', NULL),
(6, 23, 2, '2022-11-01 17:45:00', '2022-11-01 17:45:00', 'success', NULL, 'cron', NULL),
(7, 27, 3, '2022-11-01 17:50:00', '2022-11-01 17:50:00', 'success', NULL, 'cron', NULL),
(8, 23, 3, '2022-11-01 18:00:00', '2022-11-01 18:00:00', 'success', NULL, 'cron', NULL),
(9, 28, 3, '2022-11-01 18:00:00', '2022-11-01 18:00:01', 'success', NULL, 'cron', NULL),
(10, 27, 4, '2022-11-01 18:00:00', '2022-11-01 18:00:01', 'success', NULL, 'cron', NULL),
(11, 27, 5, '2022-11-01 18:10:00', '2022-11-01 18:10:00', 'success', NULL, 'cron', NULL),
(12, 23, 4, '2022-11-01 18:15:00', '2022-11-01 18:15:00', 'success', NULL, 'cron', NULL),
(13, 28, 4, '2022-11-01 18:15:00', '2022-11-01 18:15:00', 'success', NULL, 'cron', NULL),
(14, 27, 6, '2022-11-01 18:20:00', '2022-11-01 18:20:00', 'success', NULL, 'cron', NULL),
(15, 27, 7, '2022-11-01 18:30:00', '2022-11-01 18:30:00', 'success', NULL, 'cron', NULL),
(16, 28, 5, '2022-11-01 18:30:00', '2022-11-01 18:30:00', 'success', NULL, 'cron', NULL),
(17, 23, 5, '2022-11-01 18:30:00', '2022-11-01 18:30:00', 'success', NULL, 'cron', NULL),
(18, 27, 8, '2022-11-01 18:40:00', '2022-11-01 18:40:00', 'success', NULL, 'cron', NULL),
(19, 23, 6, '2022-11-01 18:45:00', '2022-11-01 18:45:00', 'success', NULL, 'cron', NULL),
(20, 28, 6, '2022-11-01 18:45:00', '2022-11-01 18:45:00', 'success', NULL, 'cron', NULL),
(21, 27, 9, '2022-11-01 18:50:00', '2022-11-01 18:50:00', 'success', NULL, 'cron', NULL),
(22, 27, 10, '2022-11-01 19:00:00', '2022-11-01 19:00:00', 'success', NULL, 'cron', NULL),
(23, 28, 7, '2022-11-01 19:00:00', '2022-11-01 19:00:00', 'success', NULL, 'cron', NULL),
(24, 23, 7, '2022-11-01 19:00:00', '2022-11-01 19:00:00', 'success', NULL, 'cron', NULL),
(25, 27, 11, '2022-11-01 19:10:00', '2022-11-01 19:10:00', 'success', NULL, 'cron', NULL),
(26, 23, 8, '2022-11-01 19:15:00', '2022-11-01 19:15:00', 'success', NULL, 'cron', NULL),
(27, 28, 8, '2022-11-01 19:15:00', '2022-11-01 19:15:00', 'success', NULL, 'cron', NULL),
(28, 27, 12, '2022-11-01 19:20:00', '2022-11-01 19:20:00', 'success', NULL, 'cron', NULL),
(29, 27, 13, '2022-11-01 19:30:00', '2022-11-01 19:30:00', 'success', NULL, 'cron', NULL),
(30, 28, 9, '2022-11-01 19:30:00', '2022-11-01 19:30:00', 'success', NULL, 'cron', NULL),
(31, 23, 9, '2022-11-01 19:30:00', '2022-11-01 19:30:00', 'success', NULL, 'cron', NULL),
(32, 1, 1, '2022-11-01 19:30:00', '2022-11-01 19:30:00', 'success', NULL, 'cron', NULL),
(33, 27, 14, '2022-11-01 19:40:00', '2022-11-01 19:40:00', 'success', NULL, 'cron', NULL),
(34, 28, 10, '2022-11-01 19:45:00', '2022-11-01 19:45:00', 'success', NULL, 'cron', NULL),
(35, 23, 10, '2022-11-01 19:45:00', '2022-11-01 19:45:00', 'success', NULL, 'cron', NULL),
(36, 4, 1, '2022-11-01 19:50:00', '2022-11-01 19:50:00', 'success', NULL, 'cron', NULL),
(37, 27, 15, '2022-11-01 19:50:00', '2022-11-01 19:50:00', 'success', NULL, 'cron', NULL),
(38, 27, 16, '2022-11-01 20:00:00', '2022-11-01 20:00:00', 'success', NULL, 'cron', NULL),
(39, 28, 11, '2022-11-01 20:00:00', '2022-11-01 20:00:00', 'success', NULL, 'cron', NULL),
(40, 23, 11, '2022-11-01 20:00:00', '2022-11-01 20:00:00', 'success', NULL, 'cron', NULL),
(41, 27, 17, '2022-11-01 20:10:00', '2022-11-01 20:10:00', 'success', NULL, 'cron', NULL),
(42, 23, 12, '2022-11-01 20:15:00', '2022-11-01 20:15:00', 'success', NULL, 'cron', NULL),
(43, 28, 12, '2022-11-01 20:15:00', '2022-11-01 20:15:00', 'success', NULL, 'cron', NULL),
(44, 27, 18, '2022-11-01 20:20:00', '2022-11-01 20:20:00', 'success', NULL, 'cron', NULL),
(45, 27, 19, '2022-11-01 20:30:00', '2022-11-01 20:30:00', 'success', NULL, 'cron', NULL),
(46, 28, 13, '2022-11-01 20:30:00', '2022-11-01 20:30:00', 'success', NULL, 'cron', NULL),
(47, 23, 13, '2022-11-01 20:30:00', '2022-11-01 20:30:00', 'success', NULL, 'cron', NULL),
(48, 27, 20, '2022-11-01 20:40:00', '2022-11-01 20:40:00', 'success', NULL, 'cron', NULL),
(49, 23, 14, '2022-11-01 20:45:00', '2022-11-01 20:45:00', 'success', NULL, 'cron', NULL),
(50, 28, 14, '2022-11-01 20:45:00', '2022-11-01 20:45:00', 'success', NULL, 'cron', NULL),
(51, 27, 21, '2022-11-01 20:50:00', '2022-11-01 20:50:00', 'success', NULL, 'cron', NULL),
(52, 27, 22, '2022-11-01 21:00:00', '2022-11-01 21:00:00', 'success', NULL, 'cron', NULL),
(53, 28, 15, '2022-11-01 21:00:00', '2022-11-01 21:00:00', 'success', NULL, 'cron', NULL),
(54, 23, 15, '2022-11-01 21:00:00', '2022-11-01 21:00:00', 'success', NULL, 'cron', NULL),
(55, 27, 23, '2022-11-01 21:10:00', '2022-11-01 21:10:00', 'success', NULL, 'cron', NULL),
(56, 23, 16, '2022-11-01 21:15:00', '2022-11-01 21:15:00', 'success', NULL, 'cron', NULL),
(57, 28, 16, '2022-11-01 21:15:00', '2022-11-01 21:15:00', 'success', NULL, 'cron', NULL),
(58, 27, 24, '2022-11-01 21:20:00', '2022-11-01 21:20:00', 'success', NULL, 'cron', NULL),
(59, 13, 1, '2022-11-01 21:30:00', '2022-11-01 21:30:00', 'success', NULL, 'cron', NULL),
(60, 27, 25, '2022-11-01 21:30:00', '2022-11-01 21:30:00', 'success', NULL, 'cron', NULL),
(61, 23, 17, '2022-11-01 21:30:00', '2022-11-01 21:30:00', 'success', NULL, 'cron', NULL),
(62, 19, 1, '2022-11-01 21:30:00', '2022-11-01 21:30:00', 'success', NULL, 'cron', NULL),
(63, 15, 1, '2022-11-01 21:30:00', '2022-11-01 21:30:00', 'success', NULL, 'cron', NULL),
(64, 20, 1, '2022-11-01 21:30:00', '2022-11-01 21:30:00', 'success', NULL, 'cron', NULL),
(65, 10, 1, '2022-11-01 21:30:00', '2022-11-01 21:30:00', 'success', NULL, 'cron', NULL),
(66, 12, 1, '2022-11-01 21:30:00', '2022-11-01 21:30:00', 'success', NULL, 'cron', NULL),
(67, 6, 1, '2022-11-01 21:30:00', '2022-11-01 21:30:00', 'success', NULL, 'cron', NULL),
(68, 28, 17, '2022-11-01 21:30:01', '2022-11-01 21:30:01', 'success', NULL, 'cron', NULL),
(69, 21, 1, '2022-11-01 21:30:01', '2022-11-01 21:30:01', 'success', NULL, 'cron', NULL),
(70, 9, 1, '2022-11-01 21:31:00', '2022-11-01 21:31:00', 'success', NULL, 'cron', NULL),
(71, 22, 1, '2022-11-01 21:31:00', '2022-11-01 21:31:00', 'success', NULL, 'cron', NULL),
(72, 7, 1, '2022-11-01 21:31:00', '2022-11-01 21:31:00', 'success', NULL, 'cron', NULL),
(73, 30, 1, '2022-11-01 21:31:00', '2022-11-01 21:31:00', 'success', NULL, 'cron', NULL),
(74, 17, 1, '2022-11-01 21:31:00', '2022-11-01 21:31:01', 'success', NULL, 'cron', NULL),
(75, 2, 1, '2022-11-01 21:31:00', '2022-11-01 21:31:01', 'success', NULL, 'cron', NULL),
(76, 11, 1, '2022-11-01 21:31:01', '2022-11-01 21:31:01', 'success', NULL, 'cron', NULL),
(77, 16, 1, '2022-11-01 21:32:00', '2022-11-01 21:32:00', 'success', NULL, 'cron', NULL),
(78, 14, 1, '2022-11-01 21:32:00', '2022-11-01 21:32:00', 'success', NULL, 'cron', NULL),
(79, 18, 1, '2022-11-01 21:35:00', '2022-11-01 21:35:00', 'success', NULL, 'cron', NULL),
(80, 3, 1, '2022-11-01 21:35:00', '2022-11-01 21:35:00', 'success', NULL, 'cron', NULL),
(81, 27, 26, '2022-11-01 21:40:00', '2022-11-01 21:40:00', 'success', NULL, 'cron', NULL),
(82, 23, 18, '2022-11-01 21:45:00', '2022-11-01 21:45:00', 'success', NULL, 'cron', NULL),
(83, 28, 18, '2022-11-01 21:45:00', '2022-11-01 21:45:00', 'success', NULL, 'cron', NULL),
(84, 27, 27, '2022-11-01 21:50:00', '2022-11-01 21:50:00', 'success', NULL, 'cron', NULL),
(85, 27, 28, '2022-11-01 22:00:00', '2022-11-01 22:00:00', 'success', NULL, 'cron', NULL),
(86, 28, 19, '2022-11-01 22:00:00', '2022-11-01 22:00:00', 'success', NULL, 'cron', NULL),
(87, 23, 19, '2022-11-01 22:00:00', '2022-11-01 22:00:00', 'success', NULL, 'cron', NULL),
(88, 27, 29, '2022-11-01 22:10:00', '2022-11-01 22:10:00', 'success', NULL, 'cron', NULL),
(89, 23, 20, '2022-11-01 22:15:00', '2022-11-01 22:15:00', 'success', NULL, 'cron', NULL),
(90, 28, 20, '2022-11-01 22:15:00', '2022-11-01 22:15:00', 'success', NULL, 'cron', NULL),
(91, 27, 30, '2022-11-01 22:20:00', '2022-11-01 22:20:00', 'success', NULL, 'cron', NULL),
(92, 23, 21, '2022-11-01 22:30:00', '2022-11-01 22:30:00', 'success', NULL, 'cron', NULL),
(93, 28, 21, '2022-11-01 22:30:00', '2022-11-01 22:30:00', 'success', NULL, 'cron', NULL),
(94, 27, 31, '2022-11-01 22:30:00', '2022-11-01 22:30:00', 'success', NULL, 'cron', NULL),
(95, 27, 32, '2022-11-01 22:40:00', '2022-11-01 22:40:00', 'success', NULL, 'cron', NULL),
(96, 23, 22, '2022-11-01 22:45:00', '2022-11-01 22:45:00', 'success', NULL, 'cron', NULL),
(97, 28, 22, '2022-11-01 22:45:00', '2022-11-01 22:45:00', 'success', NULL, 'cron', NULL),
(98, 27, 33, '2022-11-01 22:50:00', '2022-11-01 22:50:00', 'success', NULL, 'cron', NULL),
(99, 27, 34, '2022-11-01 23:00:00', '2022-11-01 23:00:00', 'success', NULL, 'cron', NULL),
(100, 23, 23, '2022-11-01 23:00:00', '2022-11-01 23:00:00', 'success', NULL, 'cron', NULL),
(101, 28, 23, '2022-11-01 23:00:00', '2022-11-01 23:00:00', 'success', NULL, 'cron', NULL),
(102, 27, 35, '2022-11-01 23:10:00', '2022-11-01 23:10:00', 'success', NULL, 'cron', NULL),
(103, 23, 24, '2022-11-01 23:15:00', '2022-11-01 23:15:00', 'success', NULL, 'cron', NULL),
(104, 28, 24, '2022-11-01 23:15:00', '2022-11-01 23:15:00', 'success', NULL, 'cron', NULL),
(105, 27, 36, '2022-11-01 23:20:00', '2022-11-01 23:20:01', 'success', NULL, 'cron', NULL),
(106, 27, 37, '2022-11-01 23:30:00', '2022-11-01 23:30:00', 'success', NULL, 'cron', NULL),
(107, 28, 25, '2022-11-01 23:30:00', '2022-11-01 23:30:00', 'success', NULL, 'cron', NULL),
(108, 23, 25, '2022-11-01 23:30:00', '2022-11-01 23:30:00', 'success', NULL, 'cron', NULL),
(109, 27, 38, '2022-11-01 23:40:00', '2022-11-01 23:40:00', 'success', NULL, 'cron', NULL),
(110, 23, 26, '2022-11-01 23:45:00', '2022-11-01 23:45:00', 'success', NULL, 'cron', NULL),
(111, 28, 26, '2022-11-01 23:45:00', '2022-11-01 23:45:00', 'success', NULL, 'cron', NULL),
(112, 27, 39, '2022-11-01 23:50:00', '2022-11-01 23:50:00', 'success', NULL, 'cron', NULL),
(113, 27, 40, '2022-11-02 00:00:00', '2022-11-02 00:00:00', 'success', NULL, 'cron', NULL),
(114, 28, 27, '2022-11-02 00:00:00', '2022-11-02 00:00:00', 'success', NULL, 'cron', NULL),
(115, 23, 27, '2022-11-02 00:00:00', '2022-11-02 00:00:00', 'success', NULL, 'cron', NULL),
(116, 27, 41, '2022-11-02 00:10:00', '2022-11-02 00:10:00', 'success', NULL, 'cron', NULL),
(117, 23, 28, '2022-11-02 00:15:00', '2022-11-02 00:15:00', 'success', NULL, 'cron', NULL),
(118, 28, 28, '2022-11-02 00:15:00', '2022-11-02 00:15:00', 'success', NULL, 'cron', NULL),
(119, 27, 42, '2022-11-02 00:20:00', '2022-11-02 00:20:00', 'success', NULL, 'cron', NULL),
(120, 27, 43, '2022-11-02 00:30:00', '2022-11-02 00:30:00', 'success', NULL, 'cron', NULL),
(121, 28, 29, '2022-11-02 00:30:00', '2022-11-02 00:30:00', 'success', NULL, 'cron', NULL),
(122, 23, 29, '2022-11-02 00:30:00', '2022-11-02 00:30:00', 'success', NULL, 'cron', NULL),
(123, 27, 44, '2022-11-02 00:40:00', '2022-11-02 00:40:00', 'success', NULL, 'cron', NULL),
(124, 23, 30, '2022-11-02 00:45:00', '2022-11-02 00:45:00', 'success', NULL, 'cron', NULL),
(125, 28, 30, '2022-11-02 00:45:00', '2022-11-02 00:45:00', 'success', NULL, 'cron', NULL),
(126, 27, 45, '2022-11-02 00:50:00', '2022-11-02 00:50:00', 'success', NULL, 'cron', NULL),
(127, 23, 31, '2022-11-02 10:24:38', '2022-11-02 10:24:39', 'success', NULL, 'cron', NULL),
(128, 28, 31, '2022-11-02 10:24:38', '2022-11-02 10:24:39', 'success', NULL, 'cron', NULL),
(129, 5, 1, '2022-11-02 10:24:38', '2022-11-02 10:24:39', 'success', NULL, 'cron', NULL),
(130, 8, 1, '2022-11-02 10:24:38', '2022-11-02 10:24:39', 'success', NULL, 'cron', NULL),
(131, 27, 46, '2022-11-02 10:24:38', '2022-11-02 10:24:39', 'success', NULL, 'cron', NULL),
(132, 29, 1, '2022-11-02 10:24:38', '2022-11-02 10:24:39', 'success', NULL, 'cron', NULL),
(133, 24, 1, '2022-11-02 10:24:52', '2022-11-02 10:24:53', 'success', NULL, 'cron', NULL),
(134, 25, 1, '2022-11-02 10:24:54', '2022-11-02 10:24:54', 'success', NULL, 'cron', NULL),
(135, 26, 1, '2022-11-02 10:24:54', '2022-11-02 10:24:55', 'success', NULL, 'cron', NULL),
(136, 27, 47, '2022-11-02 10:30:00', '2022-11-02 10:30:01', 'success', NULL, 'cron', NULL),
(137, 28, 32, '2022-11-02 10:30:00', '2022-11-02 10:30:01', 'success', NULL, 'cron', NULL),
(138, 23, 32, '2022-11-02 10:30:00', '2022-11-02 10:30:01', 'success', NULL, 'cron', NULL),
(139, 27, 48, '2022-11-02 10:40:00', '2022-11-02 10:40:00', 'success', NULL, 'cron', NULL),
(140, 28, 33, '2022-11-02 10:45:00', '2022-11-02 10:45:00', 'success', NULL, 'cron', NULL),
(141, 23, 33, '2022-11-02 10:45:00', '2022-11-02 10:45:00', 'success', NULL, 'cron', NULL),
(142, 27, 49, '2022-11-02 10:50:00', '2022-11-02 10:50:00', 'success', NULL, 'cron', NULL),
(143, 27, 50, '2022-11-02 11:00:00', '2022-11-02 11:00:00', 'success', NULL, 'cron', NULL),
(144, 28, 34, '2022-11-02 11:00:00', '2022-11-02 11:00:00', 'success', NULL, 'cron', NULL),
(145, 23, 34, '2022-11-02 11:00:00', '2022-11-02 11:00:00', 'success', NULL, 'cron', NULL),
(146, 27, 51, '2022-11-02 11:10:00', '2022-11-02 11:10:00', 'success', NULL, 'cron', NULL),
(147, 23, 35, '2022-11-02 11:15:00', '2022-11-02 11:15:00', 'success', NULL, 'cron', NULL),
(148, 28, 35, '2022-11-02 11:15:00', '2022-11-02 11:15:00', 'success', NULL, 'cron', NULL),
(149, 27, 52, '2022-11-02 11:20:00', '2022-11-02 11:20:00', 'success', NULL, 'cron', NULL),
(150, 27, 53, '2022-11-02 11:30:00', '2022-11-02 11:30:00', 'success', NULL, 'cron', NULL),
(151, 28, 36, '2022-11-02 11:30:00', '2022-11-02 11:30:00', 'success', NULL, 'cron', NULL),
(152, 23, 36, '2022-11-02 11:30:00', '2022-11-02 11:30:00', 'success', NULL, 'cron', NULL),
(153, 27, 54, '2022-11-02 12:15:16', '2022-11-02 12:15:16', 'success', NULL, 'cron', NULL),
(154, 28, 37, '2022-11-02 12:15:16', '2022-11-02 12:15:16', 'success', NULL, 'cron', NULL),
(155, 23, 37, '2022-11-02 12:15:16', '2022-11-02 12:15:16', 'success', NULL, 'cron', NULL),
(156, 27, 55, '2022-11-02 12:20:00', '2022-11-02 12:20:00', 'success', NULL, 'cron', NULL),
(157, 27, 56, '2022-11-02 12:30:00', '2022-11-02 12:30:00', 'success', NULL, 'cron', NULL),
(158, 23, 38, '2022-11-02 12:30:00', '2022-11-02 12:30:00', 'success', NULL, 'cron', NULL),
(159, 28, 38, '2022-11-02 12:30:00', '2022-11-02 12:30:00', 'success', NULL, 'cron', NULL),
(160, 27, 57, '2022-11-02 12:40:00', '2022-11-02 12:40:00', 'success', NULL, 'cron', NULL),
(161, 23, 39, '2022-11-02 12:45:00', '2022-11-02 12:45:00', 'success', NULL, 'cron', NULL),
(162, 28, 39, '2022-11-02 12:45:00', '2022-11-02 12:45:00', 'success', NULL, 'cron', NULL),
(163, 27, 58, '2022-11-02 13:32:35', '2022-11-02 13:32:36', 'success', NULL, 'cron', NULL),
(164, 28, 40, '2022-11-02 13:32:35', '2022-11-02 13:32:36', 'success', NULL, 'cron', NULL),
(165, 23, 40, '2022-11-02 13:32:35', '2022-11-02 13:32:36', 'success', NULL, 'cron', NULL),
(166, 27, 59, '2022-11-02 13:40:00', '2022-11-02 13:40:00', 'success', NULL, 'cron', NULL),
(167, 23, 41, '2022-11-02 13:45:00', '2022-11-02 13:45:00', 'success', NULL, 'cron', NULL),
(168, 28, 41, '2022-11-02 13:45:00', '2022-11-02 13:45:00', 'success', NULL, 'cron', NULL),
(169, 27, 60, '2022-11-02 13:50:00', '2022-11-02 13:50:00', 'success', NULL, 'cron', NULL),
(170, 13, 2, '2022-11-03 13:10:08', '2022-11-03 13:10:09', 'success', NULL, 'cron', NULL),
(171, 6, 2, '2022-11-03 13:10:09', '2022-11-03 13:10:10', 'success', NULL, 'cron', NULL),
(172, 27, 61, '2022-11-03 13:10:10', '2022-11-03 13:10:11', 'success', NULL, 'cron', NULL),
(173, 28, 42, '2022-11-03 13:10:10', '2022-11-03 13:10:11', 'success', NULL, 'cron', NULL),
(174, 23, 42, '2022-11-03 13:10:10', '2022-11-03 13:10:11', 'success', NULL, 'cron', NULL),
(175, 1, 2, '2022-11-03 13:10:10', '2022-11-03 13:10:11', 'success', NULL, 'cron', NULL),
(176, 12, 2, '2022-11-03 13:10:10', '2022-11-03 13:10:11', 'success', NULL, 'cron', NULL),
(177, 4, 2, '2022-11-03 13:10:10', '2022-11-03 13:10:11', 'success', NULL, 'cron', NULL),
(178, 10, 2, '2022-11-03 13:10:10', '2022-11-03 13:10:11', 'success', NULL, 'cron', NULL),
(179, 22, 2, '2022-11-03 13:10:10', '2022-11-03 13:10:12', 'success', NULL, 'cron', NULL),
(180, 14, 2, '2022-11-03 13:10:11', '2022-11-03 13:10:12', 'success', NULL, 'cron', NULL),
(181, 5, 2, '2022-11-03 13:10:12', '2022-11-03 13:10:13', 'success', NULL, 'cron', NULL),
(182, 7, 2, '2022-11-03 13:10:12', '2022-11-03 13:10:13', 'success', NULL, 'cron', NULL),
(183, 29, 2, '2022-11-03 13:10:12', '2022-11-03 13:10:13', 'success', NULL, 'cron', NULL),
(184, 15, 2, '2022-11-03 13:10:12', '2022-11-03 13:10:13', 'success', NULL, 'cron', NULL),
(185, 20, 2, '2022-11-03 13:10:12', '2022-11-03 13:10:13', 'success', NULL, 'cron', NULL),
(186, 19, 2, '2022-11-03 13:10:12', '2022-11-03 13:10:13', 'success', NULL, 'cron', NULL),
(187, 18, 2, '2022-11-03 13:10:13', '2022-11-03 13:10:14', 'success', NULL, 'cron', NULL),
(188, 17, 2, '2022-11-03 13:10:13', '2022-11-03 13:10:14', 'success', NULL, 'cron', NULL),
(189, 21, 2, '2022-11-03 13:10:13', '2022-11-03 13:10:14', 'success', NULL, 'cron', NULL),
(190, 8, 2, '2022-11-03 13:10:14', '2022-11-03 13:10:16', 'success', NULL, 'cron', NULL),
(191, 30, 2, '2022-11-03 13:10:14', '2022-11-03 13:10:17', 'success', NULL, 'cron', NULL),
(192, 11, 2, '2022-11-03 13:10:15', '2022-11-03 13:10:17', 'success', NULL, 'cron', NULL),
(193, 9, 2, '2022-11-03 13:10:14', '2022-11-03 13:10:17', 'success', NULL, 'cron', NULL),
(194, 2, 2, '2022-11-03 13:10:14', '2022-11-03 13:10:18', 'success', NULL, 'cron', NULL),
(195, 3, 2, '2022-11-03 13:10:14', '2022-11-03 13:10:18', 'success', NULL, 'cron', NULL),
(196, 16, 2, '2022-11-03 13:10:20', '2022-11-03 13:10:20', 'success', NULL, 'cron', NULL),
(197, 24, 2, '2022-11-03 13:10:21', '2022-11-03 13:10:22', 'success', NULL, 'cron', NULL),
(198, 25, 2, '2022-11-03 13:10:22', '2022-11-03 13:10:22', 'success', NULL, 'cron', NULL),
(199, 26, 2, '2022-11-03 13:10:23', '2022-11-03 13:10:23', 'success', NULL, 'cron', NULL),
(200, 23, 43, '2022-11-03 13:15:00', '2022-11-03 13:15:00', 'success', NULL, 'cron', NULL),
(201, 28, 43, '2022-11-03 13:15:00', '2022-11-03 13:15:00', 'success', NULL, 'cron', NULL),
(202, 27, 62, '2022-11-03 13:20:00', '2022-11-03 13:20:00', 'success', NULL, 'cron', NULL),
(203, 28, 44, '2022-11-03 13:30:00', '2022-11-03 13:30:00', 'success', NULL, 'cron', NULL),
(204, 27, 63, '2022-11-03 13:30:00', '2022-11-03 13:30:00', 'success', NULL, 'cron', NULL),
(205, 23, 44, '2022-11-03 13:30:00', '2022-11-03 13:30:00', 'success', NULL, 'cron', NULL),
(206, 27, 64, '2022-11-03 13:40:00', '2022-11-03 13:40:00', 'success', NULL, 'cron', NULL),
(207, 23, 45, '2022-11-03 13:45:00', '2022-11-03 13:45:00', 'success', NULL, 'cron', NULL),
(208, 28, 45, '2022-11-03 13:45:00', '2022-11-03 13:45:00', 'success', NULL, 'cron', NULL),
(209, 27, 65, '2022-11-03 13:50:00', '2022-11-03 13:50:00', 'success', NULL, 'cron', NULL),
(210, 27, 66, '2022-11-03 14:00:00', '2022-11-03 14:00:00', 'success', NULL, 'cron', NULL),
(211, 28, 46, '2022-11-03 14:00:00', '2022-11-03 14:00:00', 'success', NULL, 'cron', NULL),
(212, 23, 46, '2022-11-03 14:00:00', '2022-11-03 14:00:00', 'success', NULL, 'cron', NULL),
(213, 23, 47, '2022-11-03 15:22:37', '2022-11-03 15:22:38', 'success', NULL, 'cron', NULL),
(214, 27, 67, '2022-11-03 15:22:37', '2022-11-03 15:22:38', 'success', NULL, 'cron', NULL),
(215, 28, 47, '2022-11-03 15:22:37', '2022-11-03 15:22:38', 'success', NULL, 'cron', NULL),
(216, 23, 48, '2022-11-03 15:30:00', '2022-11-03 15:30:00', 'success', NULL, 'cron', NULL),
(217, 27, 68, '2022-11-03 15:30:00', '2022-11-03 15:30:00', 'success', NULL, 'cron', NULL),
(218, 28, 48, '2022-11-03 15:30:00', '2022-11-03 15:30:00', 'success', NULL, 'cron', NULL),
(219, 27, 69, '2022-11-03 15:40:00', '2022-11-03 15:40:00', 'success', NULL, 'cron', NULL),
(220, 28, 49, '2022-11-03 15:45:00', '2022-11-03 15:45:00', 'success', NULL, 'cron', NULL),
(221, 23, 49, '2022-11-03 15:45:00', '2022-11-03 15:45:00', 'success', NULL, 'cron', NULL),
(222, 27, 70, '2022-11-03 15:50:00', '2022-11-03 15:50:00', 'success', NULL, 'cron', NULL),
(223, 23, 50, '2022-11-03 16:00:00', '2022-11-03 16:00:00', 'success', NULL, 'cron', NULL),
(224, 27, 71, '2022-11-03 16:00:00', '2022-11-03 16:00:00', 'success', NULL, 'cron', NULL),
(225, 28, 50, '2022-11-03 16:00:00', '2022-11-03 16:00:00', 'success', NULL, 'cron', NULL),
(226, 27, 72, '2022-11-03 16:10:00', '2022-11-03 16:10:00', 'success', NULL, 'cron', NULL),
(227, 23, 51, '2022-11-03 16:15:00', '2022-11-03 16:15:00', 'success', NULL, 'cron', NULL),
(228, 28, 51, '2022-11-03 16:15:00', '2022-11-03 16:15:00', 'success', NULL, 'cron', NULL),
(229, 27, 73, '2022-11-03 16:20:00', '2022-11-03 16:20:00', 'success', NULL, 'cron', NULL),
(230, 28, 52, '2022-11-03 16:30:00', '2022-11-03 16:30:00', 'success', NULL, 'cron', NULL),
(231, 27, 74, '2022-11-03 16:30:00', '2022-11-03 16:30:00', 'success', NULL, 'cron', NULL),
(232, 23, 52, '2022-11-03 16:30:00', '2022-11-03 16:30:00', 'success', NULL, 'cron', NULL),
(233, 4, 3, '2022-11-03 20:04:29', '2022-11-03 20:04:30', 'success', NULL, 'cron', NULL),
(234, 23, 53, '2022-11-03 20:04:29', '2022-11-03 20:04:30', 'success', NULL, 'cron', NULL),
(235, 28, 53, '2022-11-03 20:04:29', '2022-11-03 20:04:30', 'success', NULL, 'cron', NULL),
(236, 27, 75, '2022-11-03 20:04:29', '2022-11-03 20:04:30', 'success', NULL, 'cron', NULL),
(237, 1, 3, '2022-11-03 20:04:29', '2022-11-03 20:04:30', 'success', NULL, 'cron', NULL),
(238, 27, 76, '2022-11-03 20:10:00', '2022-11-03 20:10:00', 'success', NULL, 'cron', NULL),
(239, 23, 54, '2022-11-03 20:15:00', '2022-11-03 20:15:00', 'success', NULL, 'cron', NULL),
(240, 28, 54, '2022-11-03 20:15:00', '2022-11-03 20:15:00', 'success', NULL, 'cron', NULL),
(241, 27, 77, '2022-11-03 20:20:00', '2022-11-03 20:20:00', 'success', NULL, 'cron', NULL),
(242, 28, 55, '2022-11-03 20:30:00', '2022-11-03 20:30:00', 'success', NULL, 'cron', NULL),
(243, 27, 78, '2022-11-03 20:30:00', '2022-11-03 20:30:00', 'success', NULL, 'cron', NULL),
(244, 23, 55, '2022-11-03 20:30:00', '2022-11-03 20:30:00', 'success', NULL, 'cron', NULL),
(245, 27, 79, '2022-11-03 20:40:00', '2022-11-03 20:40:00', 'success', NULL, 'cron', NULL),
(246, 23, 56, '2022-11-03 20:45:00', '2022-11-03 20:45:00', 'success', NULL, 'cron', NULL),
(247, 28, 56, '2022-11-03 20:45:00', '2022-11-03 20:45:00', 'success', NULL, 'cron', NULL),
(248, 27, 80, '2022-11-03 20:50:00', '2022-11-03 20:50:00', 'success', NULL, 'cron', NULL),
(249, 23, 57, '2022-11-03 21:00:00', '2022-11-03 21:00:00', 'success', NULL, 'cron', NULL),
(250, 27, 81, '2022-11-03 21:00:00', '2022-11-03 21:00:00', 'success', NULL, 'cron', NULL),
(251, 28, 57, '2022-11-03 21:00:00', '2022-11-03 21:00:00', 'success', NULL, 'cron', NULL),
(252, 27, 82, '2022-11-03 21:10:00', '2022-11-03 21:10:00', 'success', NULL, 'cron', NULL),
(253, 23, 58, '2022-11-03 21:15:00', '2022-11-03 21:15:00', 'success', NULL, 'cron', NULL),
(254, 28, 58, '2022-11-03 21:15:00', '2022-11-03 21:15:00', 'success', NULL, 'cron', NULL),
(255, 27, 83, '2022-11-03 21:20:00', '2022-11-03 21:20:00', 'success', NULL, 'cron', NULL),
(256, 12, 3, '2022-11-03 21:30:00', '2022-11-03 21:30:00', 'success', NULL, 'cron', NULL),
(257, 19, 3, '2022-11-03 21:30:00', '2022-11-03 21:30:00', 'success', NULL, 'cron', NULL),
(258, 15, 3, '2022-11-03 21:30:00', '2022-11-03 21:30:00', 'success', NULL, 'cron', NULL),
(259, 23, 59, '2022-11-03 21:30:00', '2022-11-03 21:30:00', 'success', NULL, 'cron', NULL),
(260, 10, 3, '2022-11-03 21:30:00', '2022-11-03 21:30:00', 'success', NULL, 'cron', NULL),
(261, 27, 84, '2022-11-03 21:30:00', '2022-11-03 21:30:00', 'success', NULL, 'cron', NULL),
(262, 20, 3, '2022-11-03 21:30:00', '2022-11-03 21:30:00', 'success', NULL, 'cron', NULL),
(263, 13, 3, '2022-11-03 21:30:00', '2022-11-03 21:30:00', 'success', NULL, 'cron', NULL),
(264, 6, 3, '2022-11-03 21:30:00', '2022-11-03 21:30:00', 'success', NULL, 'cron', NULL),
(265, 28, 59, '2022-11-03 21:30:00', '2022-11-03 21:30:00', 'success', NULL, 'cron', NULL),
(266, 21, 3, '2022-11-03 21:30:00', '2022-11-03 21:30:01', 'success', NULL, 'cron', NULL),
(267, 30, 3, '2022-11-03 21:31:00', '2022-11-03 21:31:00', 'success', NULL, 'cron', NULL),
(268, 22, 3, '2022-11-03 21:31:00', '2022-11-03 21:31:00', 'success', NULL, 'cron', NULL),
(269, 9, 3, '2022-11-03 21:31:00', '2022-11-03 21:31:00', 'success', NULL, 'cron', NULL),
(270, 7, 3, '2022-11-03 21:31:00', '2022-11-03 21:31:00', 'success', NULL, 'cron', NULL),
(271, 2, 3, '2022-11-03 21:31:00', '2022-11-03 21:31:01', 'success', NULL, 'cron', NULL),
(272, 17, 3, '2022-11-03 21:31:00', '2022-11-03 21:31:02', 'success', NULL, 'cron', NULL),
(273, 11, 3, '2022-11-03 21:31:02', '2022-11-03 21:31:02', 'success', NULL, 'cron', NULL),
(274, 14, 3, '2022-11-03 21:32:00', '2022-11-03 21:32:00', 'success', NULL, 'cron', NULL),
(275, 16, 3, '2022-11-03 21:32:00', '2022-11-03 21:32:00', 'success', NULL, 'cron', NULL),
(276, 18, 3, '2022-11-03 21:35:00', '2022-11-03 21:35:00', 'success', NULL, 'cron', NULL),
(277, 3, 3, '2022-11-03 21:35:00', '2022-11-03 21:35:01', 'success', NULL, 'cron', NULL),
(278, 27, 85, '2022-11-03 21:40:00', '2022-11-03 21:40:00', 'success', NULL, 'cron', NULL),
(279, 28, 60, '2022-11-03 21:45:00', '2022-11-03 21:45:00', 'success', NULL, 'cron', NULL),
(280, 23, 60, '2022-11-03 21:45:00', '2022-11-03 21:45:00', 'success', NULL, 'cron', NULL),
(281, 27, 86, '2022-11-03 21:50:00', '2022-11-03 21:50:00', 'success', NULL, 'cron', NULL),
(282, 27, 87, '2022-11-03 22:00:00', '2022-11-03 22:00:00', 'success', NULL, 'cron', NULL),
(283, 28, 61, '2022-11-03 22:00:00', '2022-11-03 22:00:00', 'success', NULL, 'cron', NULL),
(284, 23, 61, '2022-11-03 22:00:00', '2022-11-03 22:00:00', 'success', NULL, 'cron', NULL),
(285, 27, 88, '2022-11-03 22:10:00', '2022-11-03 22:10:00', 'success', NULL, 'cron', NULL),
(286, 23, 62, '2022-11-03 22:15:00', '2022-11-03 22:15:00', 'success', NULL, 'cron', NULL),
(287, 28, 62, '2022-11-03 22:15:00', '2022-11-03 22:15:00', 'success', NULL, 'cron', NULL),
(288, 27, 89, '2022-11-03 22:20:00', '2022-11-03 22:20:00', 'success', NULL, 'cron', NULL),
(289, 27, 90, '2022-11-03 22:30:00', '2022-11-03 22:30:00', 'success', NULL, 'cron', NULL),
(290, 28, 63, '2022-11-03 22:30:00', '2022-11-03 22:30:00', 'success', NULL, 'cron', NULL),
(291, 23, 63, '2022-11-03 22:30:00', '2022-11-03 22:30:00', 'success', NULL, 'cron', NULL),
(292, 27, 91, '2022-11-03 22:40:00', '2022-11-03 22:40:00', 'success', NULL, 'cron', NULL),
(293, 23, 64, '2022-11-03 22:45:00', '2022-11-03 22:45:00', 'success', NULL, 'cron', NULL),
(294, 28, 64, '2022-11-03 22:45:00', '2022-11-03 22:45:00', 'success', NULL, 'cron', NULL),
(295, 27, 92, '2022-11-03 22:50:00', '2022-11-03 22:50:00', 'success', NULL, 'cron', NULL),
(296, 27, 93, '2022-11-03 23:00:00', '2022-11-03 23:00:00', 'success', NULL, 'cron', NULL),
(297, 28, 65, '2022-11-03 23:00:00', '2022-11-03 23:00:00', 'success', NULL, 'cron', NULL),
(298, 23, 65, '2022-11-03 23:00:00', '2022-11-03 23:00:00', 'success', NULL, 'cron', NULL),
(299, 27, 94, '2022-11-03 23:10:00', '2022-11-03 23:10:00', 'success', NULL, 'cron', NULL),
(300, 28, 66, '2022-11-03 23:15:00', '2022-11-03 23:15:00', 'success', NULL, 'cron', NULL),
(301, 23, 66, '2022-11-03 23:15:00', '2022-11-03 23:15:00', 'success', NULL, 'cron', NULL),
(302, 27, 95, '2022-11-03 23:20:00', '2022-11-03 23:20:00', 'success', NULL, 'cron', NULL),
(303, 28, 67, '2022-11-03 23:30:00', '2022-11-03 23:30:00', 'success', NULL, 'cron', NULL),
(304, 27, 96, '2022-11-03 23:30:00', '2022-11-03 23:30:00', 'success', NULL, 'cron', NULL),
(305, 23, 67, '2022-11-03 23:30:00', '2022-11-03 23:30:00', 'success', NULL, 'cron', NULL),
(306, 27, 97, '2022-11-03 23:40:00', '2022-11-03 23:40:00', 'success', NULL, 'cron', NULL),
(307, 23, 68, '2022-11-03 23:45:00', '2022-11-03 23:45:00', 'success', NULL, 'cron', NULL),
(308, 28, 68, '2022-11-03 23:45:00', '2022-11-03 23:45:00', 'success', NULL, 'cron', NULL),
(309, 27, 98, '2022-11-03 23:50:00', '2022-11-03 23:50:00', 'success', NULL, 'cron', NULL),
(310, 28, 69, '2022-11-04 00:00:00', '2022-11-04 00:00:00', 'success', NULL, 'cron', NULL),
(311, 23, 69, '2022-11-04 00:00:00', '2022-11-04 00:00:01', 'success', NULL, 'cron', NULL),
(312, 27, 99, '2022-11-04 00:00:00', '2022-11-04 00:00:01', 'success', NULL, 'cron', NULL),
(313, 27, 100, '2022-11-04 00:10:00', '2022-11-04 00:10:51', 'success', NULL, 'cron', NULL),
(314, 27, 101, '2022-11-04 00:24:01', '2022-11-04 00:57:44', 'success', NULL, 'cron', NULL),
(315, 27, 102, '2022-11-22 11:50:00', '2022-11-22 11:50:01', 'success', NULL, 'cron', NULL),
(316, 27, 103, '2022-11-22 12:10:00', '2022-11-22 12:10:00', 'success', NULL, 'cron', NULL),
(317, 23, 70, '2022-11-22 12:15:00', '2022-11-22 12:15:00', 'success', NULL, 'cron', NULL),
(318, 28, 70, '2022-11-22 12:15:00', '2022-11-22 12:15:00', 'success', NULL, 'cron', NULL),
(319, 27, 104, '2022-11-22 12:20:00', '2022-11-22 12:20:00', 'success', NULL, 'cron', NULL),
(320, 27, 105, '2022-11-22 12:30:00', '2022-11-22 12:30:00', 'success', NULL, 'cron', NULL),
(321, 28, 71, '2022-11-22 12:30:00', '2022-11-22 12:30:00', 'success', NULL, 'cron', NULL),
(322, 23, 71, '2022-11-22 12:30:00', '2022-11-22 12:30:00', 'success', NULL, 'cron', NULL),
(323, 27, 106, '2022-11-22 12:40:00', '2022-11-22 12:40:00', 'success', NULL, 'cron', NULL),
(324, 28, 72, '2022-11-22 12:45:00', '2022-11-22 12:45:00', 'success', NULL, 'cron', NULL),
(325, 23, 72, '2022-11-22 12:45:00', '2022-11-22 12:45:00', 'success', NULL, 'cron', NULL),
(326, 27, 107, '2022-11-22 12:50:00', '2022-11-22 12:50:00', 'success', NULL, 'cron', NULL),
(327, 23, 73, '2022-11-22 13:00:00', '2022-11-22 13:00:00', 'success', NULL, 'cron', NULL),
(328, 27, 108, '2022-11-22 13:00:00', '2022-11-22 13:00:00', 'success', NULL, 'cron', NULL),
(329, 28, 73, '2022-11-22 13:00:00', '2022-11-22 13:00:00', 'success', NULL, 'cron', NULL),
(330, 27, 109, '2022-11-22 13:10:00', '2022-11-22 13:10:00', 'success', NULL, 'cron', NULL),
(331, 23, 74, '2022-11-22 13:15:00', '2022-11-22 13:15:00', 'success', NULL, 'cron', NULL),
(332, 28, 74, '2022-11-22 13:15:00', '2022-11-22 13:15:00', 'success', NULL, 'cron', NULL),
(333, 27, 110, '2022-11-22 13:20:00', '2022-11-22 13:20:00', 'success', NULL, 'cron', NULL),
(334, 27, 111, '2022-11-22 13:30:00', '2022-11-22 13:30:00', 'success', NULL, 'cron', NULL),
(335, 28, 75, '2022-11-22 13:30:00', '2022-11-22 13:30:00', 'success', NULL, 'cron', NULL),
(336, 23, 75, '2022-11-22 13:30:00', '2022-11-22 13:30:00', 'success', NULL, 'cron', NULL),
(337, 27, 112, '2022-11-22 13:40:00', '2022-11-22 13:40:00', 'success', NULL, 'cron', NULL),
(338, 23, 76, '2022-11-22 13:45:00', '2022-11-22 13:45:00', 'success', NULL, 'cron', NULL),
(339, 28, 76, '2022-11-22 13:45:00', '2022-11-22 13:45:00', 'success', NULL, 'cron', NULL),
(340, 27, 113, '2022-11-22 13:50:00', '2022-11-22 13:50:00', 'success', NULL, 'cron', NULL),
(341, 27, 114, '2022-11-22 14:00:00', '2022-11-22 14:00:00', 'success', NULL, 'cron', NULL),
(342, 28, 77, '2022-11-22 14:00:00', '2022-11-22 14:00:00', 'success', NULL, 'cron', NULL),
(343, 23, 77, '2022-11-22 14:00:00', '2022-11-22 14:00:00', 'success', NULL, 'cron', NULL),
(344, 27, 115, '2022-11-22 14:10:00', '2022-11-22 14:10:00', 'success', NULL, 'cron', NULL),
(345, 23, 78, '2022-11-22 14:15:00', '2022-11-22 14:15:00', 'success', NULL, 'cron', NULL),
(346, 28, 78, '2022-11-22 14:15:00', '2022-11-22 14:15:00', 'success', NULL, 'cron', NULL),
(347, 27, 116, '2022-11-22 14:20:00', '2022-11-22 14:20:00', 'success', NULL, 'cron', NULL),
(348, 27, 117, '2022-11-22 14:30:00', '2022-11-22 14:30:00', 'success', NULL, 'cron', NULL),
(349, 28, 79, '2022-11-22 14:30:00', '2022-11-22 14:30:00', 'success', NULL, 'cron', NULL),
(350, 23, 79, '2022-11-22 14:30:00', '2022-11-22 14:30:00', 'success', NULL, 'cron', NULL),
(351, 27, 118, '2022-11-22 14:40:00', '2022-11-22 14:40:00', 'success', NULL, 'cron', NULL),
(352, 23, 80, '2022-11-22 14:45:00', '2022-11-22 14:45:00', 'success', NULL, 'cron', NULL),
(353, 28, 80, '2022-11-22 14:45:00', '2022-11-22 14:45:00', 'success', NULL, 'cron', NULL),
(354, 27, 119, '2022-11-22 14:50:00', '2022-11-22 14:50:00', 'success', NULL, 'cron', NULL),
(355, 28, 81, '2022-11-22 15:00:00', '2022-11-22 15:00:00', 'success', NULL, 'cron', NULL),
(356, 27, 120, '2022-11-22 15:00:00', '2022-11-22 15:00:00', 'success', NULL, 'cron', NULL),
(357, 23, 81, '2022-11-22 15:00:00', '2022-11-22 15:00:00', 'success', NULL, 'cron', NULL),
(358, 27, 121, '2022-11-22 16:14:32', '2022-11-22 16:14:32', 'success', NULL, 'cron', NULL),
(359, 23, 82, '2022-11-22 16:14:32', '2022-11-22 16:14:33', 'success', NULL, 'cron', NULL),
(360, 28, 82, '2022-11-22 16:14:32', '2022-11-22 16:14:33', 'success', NULL, 'cron', NULL),
(361, 28, 83, '2022-11-22 16:15:00', '2022-11-22 16:15:00', 'success', NULL, 'cron', NULL),
(362, 23, 83, '2022-11-22 16:15:00', '2022-11-22 16:15:00', 'success', NULL, 'cron', NULL),
(363, 27, 122, '2022-11-22 16:20:00', '2022-11-22 16:20:00', 'success', NULL, 'cron', NULL),
(364, 28, 84, '2022-11-22 16:30:00', '2022-11-22 16:30:00', 'success', NULL, 'cron', NULL),
(365, 27, 123, '2022-11-22 16:30:00', '2022-11-22 16:30:00', 'success', NULL, 'cron', NULL),
(366, 23, 84, '2022-11-22 16:30:00', '2022-11-22 16:30:00', 'success', NULL, 'cron', NULL),
(367, 27, 124, '2022-11-22 16:40:00', '2022-11-22 16:40:00', 'success', NULL, 'cron', NULL),
(368, 23, 85, '2022-11-22 16:45:00', '2022-11-22 16:45:00', 'success', NULL, 'cron', NULL),
(369, 28, 85, '2022-11-22 16:45:00', '2022-11-22 16:45:00', 'success', NULL, 'cron', NULL),
(370, 27, 125, '2022-11-22 16:50:00', '2022-11-22 16:50:00', 'success', NULL, 'cron', NULL),
(371, 27, 126, '2022-11-22 17:00:00', '2022-11-22 17:00:00', 'success', NULL, 'cron', NULL),
(372, 28, 86, '2022-11-22 17:00:00', '2022-11-22 17:00:00', 'success', NULL, 'cron', NULL),
(373, 23, 86, '2022-11-22 17:00:00', '2022-11-22 17:00:00', 'success', NULL, 'cron', NULL),
(374, 27, 127, '2022-11-22 17:10:00', '2022-11-22 17:10:00', 'success', NULL, 'cron', NULL),
(375, 23, 87, '2022-11-22 17:15:00', '2022-11-22 17:15:00', 'success', NULL, 'cron', NULL),
(376, 28, 87, '2022-11-22 17:15:00', '2022-11-22 17:15:00', 'success', NULL, 'cron', NULL),
(377, 27, 128, '2022-11-22 17:20:00', '2022-11-22 17:20:00', 'success', NULL, 'cron', NULL),
(378, 27, 129, '2022-11-22 17:30:00', '2022-11-22 17:30:00', 'success', NULL, 'cron', NULL),
(379, 28, 88, '2022-11-22 17:30:00', '2022-11-22 17:30:00', 'success', NULL, 'cron', NULL),
(380, 23, 88, '2022-11-22 17:30:00', '2022-11-22 17:30:00', 'success', NULL, 'cron', NULL),
(381, 27, 130, '2022-11-22 17:40:00', '2022-11-22 17:40:00', 'success', NULL, 'cron', NULL),
(382, 23, 89, '2022-11-22 17:45:00', '2022-11-22 17:45:00', 'success', NULL, 'cron', NULL),
(383, 28, 89, '2022-11-22 17:45:00', '2022-11-22 17:45:00', 'success', NULL, 'cron', NULL),
(384, 27, 131, '2022-11-22 17:50:00', '2022-11-22 17:50:00', 'success', NULL, 'cron', NULL),
(385, 23, 90, '2022-11-22 18:00:00', '2022-11-22 18:00:00', 'success', NULL, 'cron', NULL),
(386, 27, 132, '2022-11-22 18:00:00', '2022-11-22 18:00:00', 'success', NULL, 'cron', NULL),
(387, 28, 90, '2022-11-22 18:00:00', '2022-11-22 18:00:00', 'success', NULL, 'cron', NULL),
(388, 27, 133, '2022-11-22 18:10:00', '2022-11-22 18:10:00', 'success', NULL, 'cron', NULL),
(389, 23, 91, '2022-11-22 18:15:00', '2022-11-22 18:15:00', 'success', NULL, 'cron', NULL),
(390, 28, 91, '2022-11-22 18:15:00', '2022-11-22 18:15:00', 'success', NULL, 'cron', NULL),
(391, 27, 134, '2022-11-22 18:20:00', '2022-11-22 18:20:00', 'success', NULL, 'cron', NULL),
(392, 23, 92, '2022-11-22 18:30:00', '2022-11-22 18:30:00', 'success', NULL, 'cron', NULL),
(393, 27, 135, '2022-11-22 18:30:00', '2022-11-22 18:30:00', 'success', NULL, 'cron', NULL),
(394, 28, 92, '2022-11-22 18:30:00', '2022-11-22 18:30:00', 'success', NULL, 'cron', NULL),
(395, 27, 136, '2022-11-22 18:40:00', '2022-11-22 18:40:00', 'success', NULL, 'cron', NULL),
(396, 23, 93, '2022-11-22 18:45:00', '2022-11-22 18:45:00', 'success', NULL, 'cron', NULL),
(397, 28, 93, '2022-11-22 18:45:00', '2022-11-22 18:45:00', 'success', NULL, 'cron', NULL),
(398, 27, 137, '2022-11-22 18:50:00', '2022-11-22 18:50:00', 'success', NULL, 'cron', NULL),
(399, 27, 138, '2022-11-22 19:00:00', '2022-11-22 19:00:00', 'success', NULL, 'cron', NULL),
(400, 28, 94, '2022-11-22 19:00:00', '2022-11-22 19:00:00', 'success', NULL, 'cron', NULL),
(401, 23, 94, '2022-11-22 19:00:00', '2022-11-22 19:00:00', 'success', NULL, 'cron', NULL),
(402, 27, 139, '2022-11-22 19:10:00', '2022-11-22 19:10:00', 'success', NULL, 'cron', NULL),
(403, 23, 95, '2022-11-22 19:15:00', '2022-11-22 19:15:00', 'success', NULL, 'cron', NULL),
(404, 28, 95, '2022-11-22 19:15:00', '2022-11-22 19:15:00', 'success', NULL, 'cron', NULL),
(405, 27, 140, '2022-11-22 19:20:00', '2022-11-22 19:20:00', 'success', NULL, 'cron', NULL),
(406, 27, 141, '2022-11-22 19:30:00', '2022-11-22 19:30:00', 'success', NULL, 'cron', NULL),
(407, 28, 96, '2022-11-22 19:30:00', '2022-11-22 19:30:00', 'success', NULL, 'cron', NULL),
(408, 23, 96, '2022-11-22 19:30:00', '2022-11-22 19:30:00', 'success', NULL, 'cron', NULL),
(409, 1, 4, '2022-11-22 19:30:00', '2022-11-22 19:30:00', 'success', NULL, 'cron', NULL),
(410, 27, 142, '2022-11-22 19:40:00', '2022-11-22 19:40:00', 'success', NULL, 'cron', NULL),
(411, 23, 97, '2022-11-22 19:45:00', '2022-11-22 19:45:00', 'success', NULL, 'cron', NULL),
(412, 28, 97, '2022-11-22 19:45:00', '2022-11-22 19:45:00', 'success', NULL, 'cron', NULL),
(413, 27, 143, '2022-11-22 19:50:00', '2022-11-22 19:50:00', 'success', NULL, 'cron', NULL),
(414, 4, 4, '2022-11-22 19:50:00', '2022-11-22 19:50:00', 'success', NULL, 'cron', NULL),
(415, 27, 144, '2022-11-22 20:00:00', '2022-11-22 20:00:00', 'success', NULL, 'cron', NULL),
(416, 28, 98, '2022-11-22 20:00:00', '2022-11-22 20:00:00', 'success', NULL, 'cron', NULL),
(417, 23, 98, '2022-11-22 20:00:00', '2022-11-22 20:00:00', 'success', NULL, 'cron', NULL),
(418, 27, 145, '2022-11-22 20:10:00', '2022-11-22 20:10:00', 'success', NULL, 'cron', NULL),
(419, 23, 99, '2022-11-22 20:15:00', '2022-11-22 20:15:00', 'success', NULL, 'cron', NULL),
(420, 28, 99, '2022-11-22 20:15:00', '2022-11-22 20:15:00', 'success', NULL, 'cron', NULL),
(421, 27, 146, '2022-11-22 20:20:00', '2022-11-22 20:20:00', 'success', NULL, 'cron', NULL),
(422, 28, 100, '2022-11-22 20:30:00', '2022-11-22 20:30:00', 'success', NULL, 'cron', NULL),
(423, 27, 147, '2022-11-22 20:30:00', '2022-11-22 20:30:00', 'success', NULL, 'cron', NULL),
(424, 23, 100, '2022-11-22 20:30:00', '2022-11-22 20:30:00', 'success', NULL, 'cron', NULL),
(425, 27, 148, '2022-11-22 20:40:00', '2022-11-22 20:40:00', 'success', NULL, 'cron', NULL),
(426, 23, 101, '2022-11-22 20:45:00', '2022-11-22 20:45:00', 'success', NULL, 'cron', NULL),
(427, 28, 101, '2022-11-22 20:45:00', '2022-11-22 20:45:00', 'success', NULL, 'cron', NULL),
(428, 27, 149, '2022-11-22 20:50:00', '2022-11-22 20:50:00', 'success', NULL, 'cron', NULL),
(429, 27, 150, '2022-11-22 21:00:00', '2022-11-22 21:00:00', 'success', NULL, 'cron', NULL),
(430, 28, 102, '2022-11-22 21:00:00', '2022-11-22 21:00:01', 'success', NULL, 'cron', NULL),
(431, 23, 102, '2022-11-22 21:00:00', '2022-11-22 21:00:01', 'success', NULL, 'cron', NULL),
(432, 27, 151, '2022-11-22 21:10:00', '2022-11-22 21:10:00', 'success', NULL, 'cron', NULL),
(433, 23, 103, '2022-11-22 21:15:00', '2022-11-22 21:15:00', 'success', NULL, 'cron', NULL),
(434, 28, 103, '2022-11-22 21:15:00', '2022-11-22 21:15:00', 'success', NULL, 'cron', NULL),
(435, 27, 152, '2022-11-22 21:20:00', '2022-11-22 21:20:00', 'success', NULL, 'cron', NULL),
(436, 6, 4, '2022-11-22 21:30:00', '2022-11-22 21:30:00', 'success', NULL, 'cron', NULL),
(437, 19, 4, '2022-11-22 21:30:00', '2022-11-22 21:30:00', 'success', NULL, 'cron', NULL),
(438, 15, 4, '2022-11-22 21:30:00', '2022-11-22 21:30:00', 'success', NULL, 'cron', NULL),
(439, 23, 104, '2022-11-22 21:30:00', '2022-11-22 21:30:00', 'success', NULL, 'cron', NULL),
(440, 27, 153, '2022-11-22 21:30:00', '2022-11-22 21:30:00', 'success', NULL, 'cron', NULL),
(441, 13, 4, '2022-11-22 21:30:00', '2022-11-22 21:30:00', 'success', NULL, 'cron', NULL),
(442, 20, 4, '2022-11-22 21:30:00', '2022-11-22 21:30:00', 'success', NULL, 'cron', NULL),
(443, 10, 4, '2022-11-22 21:30:00', '2022-11-22 21:30:00', 'success', NULL, 'cron', NULL),
(444, 12, 4, '2022-11-22 21:30:00', '2022-11-22 21:30:00', 'success', NULL, 'cron', NULL),
(445, 21, 4, '2022-11-22 21:30:00', '2022-11-22 21:30:02', 'success', NULL, 'cron', NULL),
(446, 28, 104, '2022-11-22 21:30:00', '2022-11-22 21:30:03', 'success', NULL, 'cron', NULL),
(447, 7, 4, '2022-11-22 21:31:00', '2022-11-22 21:31:00', 'success', NULL, 'cron', NULL),
(448, 30, 4, '2022-11-22 21:31:00', '2022-11-22 21:31:00', 'success', NULL, 'cron', NULL),
(449, 22, 4, '2022-11-22 21:31:00', '2022-11-22 21:31:00', 'success', NULL, 'cron', NULL),
(450, 9, 4, '2022-11-22 21:31:00', '2022-11-22 21:31:00', 'success', NULL, 'cron', NULL),
(451, 2, 4, '2022-11-22 21:31:00', '2022-11-22 21:31:01', 'success', NULL, 'cron', NULL),
(452, 17, 4, '2022-11-22 21:31:01', '2022-11-22 21:31:01', 'success', NULL, 'cron', NULL),
(453, 11, 4, '2022-11-22 21:31:01', '2022-11-22 21:31:01', 'success', NULL, 'cron', NULL),
(454, 16, 4, '2022-11-22 21:32:00', '2022-11-22 21:32:00', 'success', NULL, 'cron', NULL),
(455, 14, 4, '2022-11-22 21:32:00', '2022-11-22 21:32:00', 'success', NULL, 'cron', NULL),
(456, 18, 4, '2022-11-22 21:35:00', '2022-11-22 21:35:00', 'success', NULL, 'cron', NULL),
(457, 3, 4, '2022-11-22 21:35:00', '2022-11-22 21:35:01', 'success', NULL, 'cron', NULL),
(458, 28, 105, '2022-11-22 21:45:00', '2022-11-22 21:45:00', 'success', NULL, 'cron', NULL),
(459, 23, 105, '2022-11-22 21:45:00', '2022-11-22 21:45:00', 'success', NULL, 'cron', NULL),
(460, 27, 154, '2022-11-22 21:50:00', '2022-11-22 21:50:00', 'success', NULL, 'cron', NULL),
(461, 23, 106, '2022-11-22 22:00:00', '2022-11-22 22:00:00', 'success', NULL, 'cron', NULL),
(462, 27, 155, '2022-11-22 22:00:00', '2022-11-22 22:00:00', 'success', NULL, 'cron', NULL),
(463, 28, 106, '2022-11-22 22:00:00', '2022-11-22 22:00:00', 'success', NULL, 'cron', NULL),
(464, 27, 156, '2022-11-22 22:10:00', '2022-11-22 22:10:01', 'success', NULL, 'cron', NULL),
(465, 23, 107, '2022-11-22 22:15:00', '2022-11-22 22:15:00', 'success', NULL, 'cron', NULL),
(466, 28, 107, '2022-11-22 22:15:00', '2022-11-22 22:15:00', 'success', NULL, 'cron', NULL),
(467, 27, 157, '2022-11-22 22:20:00', '2022-11-22 22:20:00', 'success', NULL, 'cron', NULL),
(468, 27, 158, '2022-11-22 22:30:00', '2022-11-22 22:30:00', 'success', NULL, 'cron', NULL),
(469, 28, 108, '2022-11-22 22:30:00', '2022-11-22 22:30:00', 'success', NULL, 'cron', NULL),
(470, 23, 108, '2022-11-22 22:30:00', '2022-11-22 22:30:00', 'success', NULL, 'cron', NULL),
(471, 27, 159, '2022-11-22 22:40:00', '2022-11-22 22:40:01', 'success', NULL, 'cron', NULL),
(472, 23, 109, '2022-11-22 22:45:00', '2022-11-22 22:45:00', 'success', NULL, 'cron', NULL),
(473, 28, 109, '2022-11-22 22:45:00', '2022-11-22 22:45:00', 'success', NULL, 'cron', NULL),
(474, 27, 160, '2022-11-22 22:50:00', '2022-11-22 22:50:00', 'success', NULL, 'cron', NULL),
(475, 23, 110, '2022-11-22 23:00:00', '2022-11-22 23:00:00', 'success', NULL, 'cron', NULL),
(476, 27, 161, '2022-11-22 23:00:00', '2022-11-22 23:00:00', 'success', NULL, 'cron', NULL),
(477, 28, 110, '2022-11-22 23:00:00', '2022-11-22 23:00:00', 'success', NULL, 'cron', NULL),
(478, 27, 162, '2022-11-22 23:10:00', '2022-11-22 23:10:00', 'success', NULL, 'cron', NULL),
(479, 28, 111, '2022-11-22 23:15:00', '2022-11-22 23:15:01', 'success', NULL, 'cron', NULL),
(480, 23, 111, '2022-11-22 23:15:00', '2022-11-22 23:15:01', 'success', NULL, 'cron', NULL),
(481, 27, 163, '2022-11-22 23:20:00', '2022-11-22 23:20:01', 'success', NULL, 'cron', NULL),
(482, 27, 164, '2022-12-06 15:10:00', '2022-12-06 15:10:00', 'success', NULL, 'cron', NULL),
(483, 23, 112, '2022-12-06 15:15:00', '2022-12-06 15:15:00', 'success', NULL, 'cron', NULL),
(484, 28, 112, '2022-12-06 15:15:00', '2022-12-06 15:15:00', 'success', NULL, 'cron', NULL),
(485, 27, 165, '2022-12-06 15:20:00', '2022-12-06 15:20:00', 'success', NULL, 'cron', NULL),
(486, 23, 113, '2022-12-06 15:30:00', '2022-12-06 15:30:00', 'success', NULL, 'cron', NULL),
(487, 28, 113, '2022-12-06 15:30:00', '2022-12-06 15:30:00', 'success', NULL, 'cron', NULL),
(488, 27, 166, '2022-12-06 15:30:00', '2022-12-06 15:30:00', 'success', NULL, 'cron', NULL),
(489, 13, 5, '2022-12-06 22:21:31', '2022-12-06 22:21:32', 'success', NULL, 'cron', NULL),
(490, 22, 5, '2022-12-06 22:21:33', '2022-12-06 22:21:33', 'success', NULL, 'cron', NULL),
(491, 17, 5, '2022-12-06 22:21:34', '2022-12-06 22:21:34', 'success', NULL, 'cron', NULL),
(492, 11, 5, '2022-12-06 22:21:35', '2022-12-06 22:21:35', 'success', NULL, 'cron', NULL),
(493, 16, 5, '2022-12-06 22:21:35', '2022-12-06 22:21:36', 'success', NULL, 'cron', NULL),
(494, 27, 167, '2022-12-06 22:21:39', '2022-12-06 22:21:39', 'success', NULL, 'cron', NULL),
(495, 23, 114, '2022-12-06 22:21:39', '2022-12-06 22:21:39', 'success', NULL, 'cron', NULL),
(496, 12, 5, '2022-12-06 22:21:39', '2022-12-06 22:21:40', 'success', NULL, 'cron', NULL),
(497, 28, 114, '2022-12-06 22:21:39', '2022-12-06 22:21:40', 'success', NULL, 'cron', NULL),
(498, 4, 5, '2022-12-06 22:21:39', '2022-12-06 22:21:40', 'success', NULL, 'cron', NULL),
(499, 10, 5, '2022-12-06 22:21:39', '2022-12-06 22:21:40', 'success', NULL, 'cron', NULL),
(500, 1, 5, '2022-12-06 22:21:39', '2022-12-06 22:21:40', 'success', NULL, 'cron', NULL),
(501, 19, 5, '2022-12-06 22:21:40', '2022-12-06 22:21:40', 'success', NULL, 'cron', NULL),
(502, 20, 5, '2022-12-06 22:21:40', '2022-12-06 22:21:40', 'success', NULL, 'cron', NULL),
(503, 15, 5, '2022-12-06 22:21:40', '2022-12-06 22:21:40', 'success', NULL, 'cron', NULL),
(504, 18, 5, '2022-12-06 22:21:40', '2022-12-06 22:21:40', 'success', NULL, 'cron', NULL),
(505, 7, 5, '2022-12-06 22:21:40', '2022-12-06 22:21:40', 'success', NULL, 'cron', NULL),
(506, 30, 5, '2022-12-06 22:21:40', '2022-12-06 22:21:41', 'success', NULL, 'cron', NULL),
(507, 2, 5, '2022-12-06 22:21:40', '2022-12-06 22:21:41', 'success', NULL, 'cron', NULL),
(508, 9, 5, '2022-12-06 22:21:40', '2022-12-06 22:21:41', 'success', NULL, 'cron', NULL),
(509, 3, 5, '2022-12-06 22:21:40', '2022-12-06 22:21:42', 'success', NULL, 'cron', NULL),
(510, 6, 5, '2022-12-06 22:21:41', '2022-12-06 22:21:42', 'success', NULL, 'cron', NULL),
(511, 14, 5, '2022-12-06 22:21:42', '2022-12-06 22:21:42', 'success', NULL, 'cron', NULL),
(512, 21, 5, '2022-12-06 22:21:42', '2022-12-06 22:21:42', 'success', NULL, 'cron', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `mix_taxonomy`
--

CREATE TABLE `mix_taxonomy` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(100) DEFAULT NULL,
  `namespace_id` int(11) DEFAULT NULL,
  `dimension` varchar(100) DEFAULT NULL,
  `type` int(11) DEFAULT NULL,
  `description` varchar(1000) DEFAULT NULL,
  `need_mapping` tinyint(4) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `mix_taxonomy`
--

INSERT INTO `mix_taxonomy` (`id`, `name`, `namespace_id`, `dimension`, `type`, `description`, `need_mapping`) VALUES
(1, 'AdministrativeExpense', 1, NULL, 3, NULL, 1),
(2, 'Assets', 3, NULL, 1, 'All outstanding principals due for all outstanding client loans. This includes current, delinquent, and renegotiated loans, but not loans that have been written off. It does not include interest receivable.', 1),
(3, 'Assets', 3, 'MaturityDimension:LessThanOneYearMember', 1, 'Segmentation based on the life of an asset or liability.', 1),
(4, 'Assets', 3, 'MaturityDimension:MoreThanOneYearMember', 1, 'Segmentation based on the life of an asset or liability.', 1),
(5, 'CashAndCashEquivalents', 1, NULL, 1, NULL, 1),
(6, 'Deposits', 3, NULL, 1, 'The total value of funds placed in an account with an MFI that are payable to a depositor. This item includes any current, checking, or savings accounts that are payable on demand. It also includes time deposits which have a fixed maturity date and compulsory deposits.', 1),
(7, 'Deposits', 3, 'DepositProductsDimension:CompulsoryMember', 1, 'The value of deposits that an MFI\'s clients are required to  maintain as a condition of an existing or future loan.', NULL),
(8, 'Deposits', 3, 'DepositProductsDimension:VoluntaryMember', 1, 'The value of deposits that an MFI\'s clients are not required to  maintain as a condition of an existing or future loan.', NULL),
(9, 'Deposits', 3, 'LocationDimension:RuralMember', 1, 'Located in rural areas. Segmentation based on location.', NULL),
(10, 'Deposits', 3, 'LocationDimension:UrbanMember', 1, 'Located in urban areas. Segmentation based on location.', NULL),
(11, 'Deposits', 3, 'MaturityDimension:LessThanOneYearMember', 1, 'Segmentation based on the life of an asset or liability.', NULL),
(12, 'Deposits', 3, 'MaturityDimension:MoreThanOneYearMember', 1, 'Segmentation based on the life of an asset or liability.', NULL),
(13, 'EmployeeBenefitsExpense', 1, NULL, 3, NULL, NULL),
(14, 'Equity', 1, NULL, 1, NULL, NULL),
(15, 'Expense', 1, NULL, 3, NULL, NULL),
(16, 'FinancialExpense', 3, NULL, 3, 'All costs All costs incurred in raising funds from third parties, fee expenses from non-financial services, net gains (losses) due to changes in fair value of financial liabilities, impairment losses net of reversals of financial assets other than loan portfolio and net gains (losses) from restatement of financial statements in terms of the measuring unit current at the end of the reporting period.', NULL),
(17, 'FinancialRevenueOnLoans', 3, NULL, 2, 'Interest and non-interest income generated by the provision of credit services to the clients. Fees and commissions for late payment are also included.', NULL),
(18, 'ImpairmentLossAllowanceGrossLoanPortfolio', 3, NULL, 2, 'An allowance for the risk of losses in the gross loan portfolio due to default .', NULL),
(19, 'Liabilities', 1, NULL, 1, NULL, NULL),
(20, 'Liabilities', 3, 'MaturityDimension:LessThanOneYearMember', 1, 'Segmentation based on the life of an asset or liability.', NULL),
(21, 'Liabilities', 3, 'MaturityDimension:MoreThanOneYearMember', 1, 'Segmentation based on the life of an asset or liability.', NULL),
(22, 'LoanPortfolioGross', 3, NULL, 2, 'All outstanding principals due for all outstanding client loans. This includes current, delinquent, and renegotiated loans, but not loans that have been written off. It does not include interest receivable.', NULL),
(23, 'LoanPortfolioGross', 3, 'CreditProductsDimension:MicroenterpriseMember', 2, 'Loans that finance the production or trade of goods and  services for an individual\'s microenterprise, whether or not the microenterprise is legally registered. Segmentation based on loan product.', NULL),
(24, 'LoanPortfolioGross', 3, 'DelinquencyDimension:OneMonthOrMoreMember', 2, 'Segmentation based on the principal balance of all loans outstanding that have one or more installments of principal  past due or renegotiated. Segmentation based on the  principal balance of all loans outstanding that have one or  more installments of principal past due or renegotiated.', NULL),
(25, 'LoanPortfolioGross', 3, 'DelinquencyDimension:ThreeMonthsOrMoreMember', 2, 'Segmentation based on the principal balance of all loans outstanding that have one or more installments of principal  past due or renegotiated.? Segmentation based on the  principal balance of all loans outstanding that have one or  more installments of principal past due or renegotiated.', NULL),
(26, 'LoanPortfolioGross', 3, 'LocationDimension:RuralMember', 2, 'Located in rural areas. Segmentation based on geographic location.', NULL),
(27, 'LoanPortfolioGross', 3, 'LocationDimension:UrbanMember', 2, 'Located in urbal areas. Segmentation based on geographic location.', NULL),
(28, 'LoanPortfolioGross', 3, 'MaturityDimension:LessThanOneYearMember', 2, 'Segmentation based on the life of an asset or liability.', NULL),
(29, 'LoanPortfolioGross', 3, 'MaturityDimension:MoreThanOneYearMember', 2, 'Segmentation based on the life of an asset or liability.', NULL),
(30, 'NetLoanLoss', 3, '', 3, 'Referred to the value of delinquency loans written off net of any principal recovery.', NULL),
(31, 'NetLoanLossProvisionExpense', 3, NULL, 3, 'Represent the net value of loan portfolio impairment loss considering any reversal on impairment loss and any recovery on loans written off recognized as a income during the accounting period.', NULL),
(32, 'NetOperatingIncome', 3, NULL, 2, 'Total operating revenue less all expenses related to the MFI\'s core financial service operation including total financial expense, impairment loss and operating expense. Donations are excluded.', NULL),
(33, 'NetOperatingIncomeNetOfTaxExpense', 3, NULL, 3, 'Net operating income reported incorporating the effect of taxes. Taxes include all domestic and foreign taxes which are based on taxable profits, other taxes related to personnel, financial transactions or value-added taxes are not considered in calculation of this value.', NULL),
(34, 'NumberOfActiveBorrowers', 3, NULL, 0, 'The number of individuals who currently have an outstanding loan balance with the MFI or are primarily responsible for repaying any portion of the gross loan portfolio. Individuals who have multiple loans with an MFI should be counted as a single borrower.', NULL),
(35, 'NumberOfActiveBorrowers', 3, 'GenderDimension:FemaleMember', 0, 'The number of individuals who currently have an outstanding loan balance with the MFI or are primarily responsible for repaying any portion of the gross loan portfolio. Individuals who have multiple loans with an MFI should be counted as a single borrower.', NULL),
(36, 'NumberOfBoardMembers', 3, 'GenderDimension:FemaleMember', 0, 'The number of members that comprise the board of directors at the end of the reporting period who are female.', NULL),
(37, 'NumberOfDepositAccounts', 3, NULL, 0, 'The number of individuals who currently have funds on deposit with the MFI on a voluntary basis; i.e., they are not required to maintain the deposit account to access a loan. This number applies only to deposits held by an MFI, not to those deposits held in other institutions by the MFI\'s clients. The number should be based on the number of individuals rather than the number of groups. A single deposit account may represent multiple depositors.', NULL),
(38, 'NumberOfDepositors', 3, '', 0, 'The number of deposit accounts, both voluntary and compulsory, opened at the MFI whose balances the institution is liable to repay. The number should be based on the number of individual accounts rather than on the number of groups.', NULL),
(39, 'NumberOfEmployees', 3, NULL, 0, 'The number of individuals who are actively employed by an entity. This number includes contract employees or advisors who dedicate a substantial portion of their time to the entity, even if they are not on the entity\'s employees roster.', NULL),
(40, 'NumberOfEmployees', 3, 'GenderDimension:FemaleMember', 0, 'The number of individuals who are actively employed by an entity. This number includes contract employees or advisors who dedicate a substantial portion of their time to the entity, even if they are not on the entity\'s employees roster.', NULL),
(41, 'NumberOfLoanOfficers', 3, NULL, 0, 'The number of employees whose main activity is to manage a portion of the gross loan portfolio. A loan officer is a staff member of record who is directly responsible for arranging and monitoring client loans.', NULL),
(42, 'NumberOfLoanOfficers', 3, 'GenderDimension:FemaleMember', 0, 'The number of employees whose main activity is to manage a portion of the gross loan portfolio. A loan officer is a staff member of record who is directly responsible for arranging and monitoring client loans.', NULL),
(43, 'NumberOfManagers', 3, 'GenderDimension:FemaleMember', 0, 'The number of members that comprise the management of the institution who are female.', NULL),
(44, 'NumberOfOffices', 3, NULL, 0, 'The number of staffed points of service and administrative sites used to deliver or support the delivery of financial services to microfinance clients.', NULL),
(45, 'NumberOfOutstandingLoans', 3, NULL, 0, 'The number of loans in the gross loan portfolio. For MFIs using a group lending methodology, the number of loans should refer to the number of individuals receiving loans as part of a group or as part of a group loan.', NULL),
(46, 'OperatingExpense', 3, NULL, 3, 'Includes expenses not related to financial and credit loss impairment, such as personnel expenses, depreciation, amortization and administrative expenses.', NULL),
(47, 'OperatingIncome', 3, NULL, 2, 'Includes all financial income and other operating revenue which is generated from non-financial services. Operating income also includes net gains (losses) from holding financial assets (changes on their values during the period and foreign exchange differences). Donations or any revenue not related with an MFI\'s core business of making loans and providing financial services are not considered under this category.', NULL),
(48, 'WriteOffsOnGrossLoanPortfolio', 3, NULL, 2, 'The value of loans that have been recognized as uncollectible for accounting purposes. A write-off is an accounting procedure that removes the outstanding balance of the loan from the gross loan portfolio and impairment loss allowance. Thus, the write-off does not affect the net loan portfolio, total assets, or any equity account. If the impairment loss allowance is insufficient to cover the amount written off, the excess amount will result in an additional impairment loss on loans recognised in profit or loss of the period.', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `mix_taxonomy_mapping`
--

CREATE TABLE `mix_taxonomy_mapping` (
  `id` int(10) UNSIGNED NOT NULL,
  `identifier` varchar(50) NOT NULL DEFAULT '',
  `config` varchar(200) DEFAULT NULL,
  `last_update_date` datetime DEFAULT NULL,
  `currency` varchar(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `mix_taxonomy_mapping`
--

INSERT INTO `mix_taxonomy_mapping` (`id`, `identifier`, `config`, `last_update_date`, `currency`) VALUES
(1, 'default', NULL, NULL, '');

-- --------------------------------------------------------

--
-- Table structure for table `mix_xbrl_namespace`
--

CREATE TABLE `mix_xbrl_namespace` (
  `id` int(10) UNSIGNED NOT NULL,
  `prefix` varchar(20) NOT NULL DEFAULT '',
  `url` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `mix_xbrl_namespace`
--

INSERT INTO `mix_xbrl_namespace` (`id`, `prefix`, `url`) VALUES
(1, 'ifrs', 'http://xbrl.iasb.org/taxonomy/2009-04-01/ifrs'),
(2, 'iso4217', 'http://www.xbrl.org/2003/iso4217'),
(3, 'mix', 'http://www.themix.org/INT/fr/ifrs/basi/YYYY-MM-DD/mx-cor'),
(4, 'xbrldi', 'http://xbrl.org/2006/xbrldi'),
(5, 'xbrli', 'http://www.xbrl.org/2003/instance'),
(6, 'link', 'http://www.xbrl.org/2003/linkbase'),
(7, 'dc-all', 'http://www.themix.org/INT/fr/ifrs/basi/2010-08-31/dc-all');

-- --------------------------------------------------------

--
-- Table structure for table `m_account_transfer_details`
--

CREATE TABLE `m_account_transfer_details` (
  `id` bigint(20) NOT NULL,
  `from_office_id` bigint(20) NOT NULL,
  `to_office_id` bigint(20) NOT NULL,
  `from_client_id` bigint(20) DEFAULT NULL,
  `to_client_id` bigint(20) DEFAULT NULL,
  `from_savings_account_id` bigint(20) DEFAULT NULL,
  `to_savings_account_id` bigint(20) DEFAULT NULL,
  `from_loan_account_id` bigint(20) DEFAULT NULL,
  `to_loan_account_id` bigint(20) DEFAULT NULL,
  `transfer_type` smallint(6) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `m_account_transfer_standing_instructions`
--

CREATE TABLE `m_account_transfer_standing_instructions` (
  `id` bigint(20) NOT NULL,
  `name` varchar(250) NOT NULL,
  `account_transfer_details_id` bigint(20) NOT NULL,
  `priority` tinyint(4) NOT NULL,
  `status` tinyint(4) NOT NULL,
  `instruction_type` tinyint(4) NOT NULL,
  `amount` decimal(19,6) DEFAULT NULL,
  `valid_from` date NOT NULL,
  `valid_till` date DEFAULT NULL,
  `recurrence_type` tinyint(4) NOT NULL,
  `recurrence_frequency` smallint(6) DEFAULT NULL,
  `recurrence_interval` smallint(6) DEFAULT NULL,
  `recurrence_on_day` smallint(6) DEFAULT NULL,
  `recurrence_on_month` smallint(6) DEFAULT NULL,
  `last_run_date` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `m_account_transfer_standing_instructions_history`
--

CREATE TABLE `m_account_transfer_standing_instructions_history` (
  `id` bigint(20) NOT NULL,
  `standing_instruction_id` bigint(20) NOT NULL,
  `status` varchar(20) NOT NULL,
  `execution_time` datetime NOT NULL,
  `amount` decimal(19,6) NOT NULL,
  `error_log` varchar(500) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `m_account_transfer_transaction`
--

CREATE TABLE `m_account_transfer_transaction` (
  `id` bigint(20) NOT NULL,
  `account_transfer_details_id` bigint(20) NOT NULL,
  `from_savings_transaction_id` bigint(20) DEFAULT NULL,
  `from_loan_transaction_id` bigint(20) DEFAULT NULL,
  `to_savings_transaction_id` bigint(20) DEFAULT NULL,
  `to_loan_transaction_id` bigint(20) DEFAULT NULL,
  `is_reversed` tinyint(4) NOT NULL,
  `transaction_date` date NOT NULL,
  `currency_code` varchar(3) NOT NULL,
  `currency_digits` smallint(6) NOT NULL,
  `currency_multiplesof` smallint(6) DEFAULT NULL,
  `amount` decimal(19,6) NOT NULL,
  `description` varchar(200) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `m_address`
--

CREATE TABLE `m_address` (
  `id` bigint(20) NOT NULL,
  `street` varchar(100) DEFAULT NULL,
  `address_line_1` varchar(100) DEFAULT NULL,
  `address_line_2` varchar(100) DEFAULT NULL,
  `address_line_3` varchar(100) DEFAULT NULL,
  `town_village` varchar(100) DEFAULT NULL,
  `city` varchar(100) DEFAULT NULL,
  `county_district` varchar(100) DEFAULT NULL,
  `state_province_id` int(11) DEFAULT NULL,
  `country_id` int(11) DEFAULT NULL,
  `postal_code` varchar(10) DEFAULT NULL,
  `latitude` decimal(10,8) DEFAULT '0.00000000',
  `longitude` decimal(10,8) DEFAULT '0.00000000',
  `created_by` varchar(100) DEFAULT NULL,
  `created_on` date DEFAULT NULL,
  `updated_by` varchar(100) DEFAULT NULL,
  `updated_on` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `m_adhoc`
--

CREATE TABLE `m_adhoc` (
  `id` bigint(20) NOT NULL,
  `name` varchar(100) DEFAULT NULL,
  `query` varchar(2000) DEFAULT NULL,
  `table_name` varchar(100) DEFAULT NULL,
  `table_fields` varchar(1000) DEFAULT NULL,
  `email` varchar(500) DEFAULT NULL,
  `IsActive` tinyint(4) NOT NULL DEFAULT '0',
  `created_date` datetime DEFAULT NULL,
  `createdby_id` bigint(20) NOT NULL,
  `lastmodifiedby_id` bigint(20) NOT NULL,
  `lastmodified_date` datetime DEFAULT NULL,
  `report_run_frequency_code` int(11) DEFAULT NULL,
  `report_run_every` int(11) DEFAULT NULL,
  `last_run` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `m_appuser`
--

CREATE TABLE `m_appuser` (
  `id` bigint(20) NOT NULL,
  `is_deleted` tinyint(4) NOT NULL DEFAULT '0',
  `office_id` bigint(20) DEFAULT NULL,
  `staff_id` bigint(20) DEFAULT NULL,
  `username` varchar(100) NOT NULL,
  `firstname` varchar(100) NOT NULL,
  `lastname` varchar(100) NOT NULL,
  `password` varchar(255) NOT NULL,
  `email` varchar(100) NOT NULL,
  `firsttime_login_remaining` bit(1) NOT NULL,
  `nonexpired` bit(1) NOT NULL,
  `nonlocked` bit(1) NOT NULL,
  `nonexpired_credentials` bit(1) NOT NULL,
  `enabled` bit(1) NOT NULL,
  `last_time_password_updated` date NOT NULL DEFAULT '1970-01-01',
  `password_never_expires` tinyint(4) NOT NULL DEFAULT '0' COMMENT 'define if the password, should be check for validity period or not',
  `is_self_service_user` bit(1) NOT NULL DEFAULT b'0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `m_appuser`
--

INSERT INTO `m_appuser` (`id`, `is_deleted`, `office_id`, `staff_id`, `username`, `firstname`, `lastname`, `password`, `email`, `firsttime_login_remaining`, `nonexpired`, `nonlocked`, `nonexpired_credentials`, `enabled`, `last_time_password_updated`, `password_never_expires`, `is_self_service_user`) VALUES
(1, 0, 1, NULL, 'mifos', 'App', 'Administrator', '{SHA-256}{1}5787039480429368bf94732aacc771cd0a3ea02bcf504ffe1185ab94213bc63a', 'demomfi@mifos.org', b'0', b'1', b'1', b'1', b'1', '2022-11-01', 0, b'0'),
(2, 0, 1, NULL, 'system', 'system', 'system', '{SHA-256}{2}5787039480429368bf94732aacc771cd0a3ea02bcf504ffe1185ab94213bc63a', 'demomfi@mifos.org', b'0', b'1', b'1', b'1', b'1', '2014-03-07', 0, b'0'),
(3, 0, 1, NULL, 'interopUser', 'Interop', 'User', '{SHA-256}{3}5787039480429368bf94732aacc771cd0a3ea02bcf504ffe1185ab94213bc63a', 'email@email.com', b'0', b'1', b'1', b'1', b'1', '2022-11-01', 0, b'0'),
(11, 0, 1, 1, 'machette', 'machette', 'leo', '{bcrypt}$2a$10$8247eCPcLFLm/gjJVNfdjO83JiIGCSBrBKJlnNeK6q16QJqWfhpJm', 'eugenechiita@gmail.com', b'0', b'1', b'1', b'1', b'1', '2022-11-21', 0, b'0'),
(12, 0, 1, NULL, 'eugene', 'Eugene', 'Mutswenje', '{bcrypt}$2a$10$wtFCWocAHnYMiwdpfBw14OvgRQvEZ0mD4iWKxHXXWy40KeuD1FGkC', '', b'0', b'1', b'1', b'1', b'1', '2022-11-21', 0, b'1');

-- --------------------------------------------------------

--
-- Table structure for table `m_appuser_previous_password`
--

CREATE TABLE `m_appuser_previous_password` (
  `id` bigint(20) NOT NULL,
  `user_id` bigint(20) NOT NULL,
  `password` varchar(255) NOT NULL,
  `removal_date` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `m_appuser_role`
--

CREATE TABLE `m_appuser_role` (
  `appuser_id` bigint(20) NOT NULL,
  `role_id` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `m_appuser_role`
--

INSERT INTO `m_appuser_role` (`appuser_id`, `role_id`) VALUES
(1, 1),
(3, 1),
(11, 3),
(12, 2);

-- --------------------------------------------------------

--
-- Table structure for table `m_calendar`
--

CREATE TABLE `m_calendar` (
  `id` bigint(20) NOT NULL,
  `title` varchar(70) NOT NULL,
  `description` varchar(100) DEFAULT NULL,
  `location` varchar(50) DEFAULT NULL,
  `start_date` date NOT NULL,
  `end_date` date DEFAULT NULL,
  `duration` smallint(6) DEFAULT NULL,
  `calendar_type_enum` smallint(6) NOT NULL,
  `repeating` tinyint(4) NOT NULL DEFAULT '0',
  `recurrence` varchar(100) DEFAULT NULL,
  `remind_by_enum` smallint(6) DEFAULT NULL,
  `first_reminder` smallint(6) DEFAULT NULL,
  `second_reminder` smallint(6) DEFAULT NULL,
  `createdby_id` bigint(20) DEFAULT NULL,
  `lastmodifiedby_id` bigint(20) DEFAULT NULL,
  `created_date` datetime DEFAULT NULL,
  `lastmodified_date` datetime DEFAULT NULL,
  `meeting_time` time DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `m_calendar_history`
--

CREATE TABLE `m_calendar_history` (
  `id` bigint(20) NOT NULL,
  `calendar_id` bigint(20) NOT NULL,
  `title` varchar(70) NOT NULL,
  `description` varchar(100) DEFAULT NULL,
  `location` varchar(50) DEFAULT NULL,
  `start_date` date NOT NULL,
  `end_date` date DEFAULT NULL,
  `duration` smallint(6) DEFAULT NULL,
  `calendar_type_enum` smallint(6) NOT NULL,
  `repeating` tinyint(4) NOT NULL DEFAULT '0',
  `recurrence` varchar(100) DEFAULT NULL,
  `remind_by_enum` smallint(6) DEFAULT NULL,
  `first_reminder` smallint(6) DEFAULT NULL,
  `second_reminder` smallint(6) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `m_calendar_instance`
--

CREATE TABLE `m_calendar_instance` (
  `id` bigint(20) NOT NULL,
  `calendar_id` bigint(20) NOT NULL,
  `entity_id` bigint(20) NOT NULL,
  `entity_type_enum` smallint(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `m_cashiers`
--

CREATE TABLE `m_cashiers` (
  `id` bigint(20) NOT NULL,
  `staff_id` bigint(20) DEFAULT NULL,
  `teller_id` bigint(20) DEFAULT NULL,
  `description` varchar(100) DEFAULT NULL,
  `start_date` date DEFAULT NULL,
  `end_date` date DEFAULT NULL,
  `start_time` varchar(10) DEFAULT NULL,
  `end_time` varchar(10) DEFAULT NULL,
  `full_day` tinyint(4) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `m_cashier_transactions`
--

CREATE TABLE `m_cashier_transactions` (
  `id` bigint(20) NOT NULL,
  `cashier_id` bigint(20) NOT NULL,
  `txn_type` smallint(6) NOT NULL,
  `txn_amount` decimal(19,6) NOT NULL,
  `txn_date` date NOT NULL,
  `created_date` datetime NOT NULL,
  `entity_type` varchar(50) DEFAULT NULL,
  `entity_id` bigint(20) DEFAULT NULL,
  `txn_note` varchar(200) DEFAULT NULL,
  `currency_code` varchar(3) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `m_charge`
--

CREATE TABLE `m_charge` (
  `id` bigint(20) NOT NULL,
  `name` varchar(100) DEFAULT NULL,
  `currency_code` varchar(3) NOT NULL,
  `charge_applies_to_enum` smallint(6) NOT NULL,
  `charge_time_enum` smallint(6) NOT NULL,
  `charge_calculation_enum` smallint(6) NOT NULL,
  `charge_payment_mode_enum` smallint(6) DEFAULT NULL,
  `amount` decimal(19,6) NOT NULL,
  `fee_on_day` smallint(6) DEFAULT NULL,
  `fee_interval` smallint(6) DEFAULT NULL,
  `fee_on_month` smallint(6) DEFAULT NULL,
  `is_penalty` tinyint(4) NOT NULL DEFAULT '0',
  `is_active` tinyint(4) NOT NULL,
  `is_deleted` tinyint(4) NOT NULL DEFAULT '0',
  `min_cap` decimal(19,6) DEFAULT NULL,
  `max_cap` decimal(19,6) DEFAULT NULL,
  `fee_frequency` smallint(6) DEFAULT NULL,
  `income_or_liability_account_id` bigint(20) DEFAULT NULL,
  `tax_group_id` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `m_client`
--

CREATE TABLE `m_client` (
  `id` bigint(20) NOT NULL,
  `account_no` varchar(20) NOT NULL,
  `external_id` varchar(100) DEFAULT NULL,
  `status_enum` int(11) NOT NULL DEFAULT '300',
  `sub_status` int(11) DEFAULT NULL,
  `activation_date` date DEFAULT NULL,
  `office_joining_date` date DEFAULT NULL,
  `office_id` bigint(20) NOT NULL,
  `transfer_to_office_id` bigint(20) DEFAULT NULL,
  `staff_id` bigint(20) DEFAULT NULL,
  `firstname` varchar(50) DEFAULT NULL,
  `middlename` varchar(50) DEFAULT NULL,
  `lastname` varchar(50) DEFAULT NULL,
  `fullname` varchar(100) DEFAULT NULL,
  `display_name` varchar(100) NOT NULL,
  `mobile_no` varchar(50) DEFAULT NULL,
  `is_staff` tinyint(4) NOT NULL DEFAULT '0',
  `gender_cv_id` int(11) DEFAULT NULL,
  `date_of_birth` date DEFAULT NULL,
  `image_id` bigint(20) DEFAULT NULL,
  `closure_reason_cv_id` int(11) DEFAULT NULL,
  `closedon_date` date DEFAULT NULL,
  `updated_by` bigint(20) DEFAULT NULL,
  `updated_on` date DEFAULT NULL,
  `submittedon_date` date DEFAULT NULL,
  `submittedon_userid` bigint(20) DEFAULT NULL,
  `activatedon_userid` bigint(20) DEFAULT NULL,
  `closedon_userid` bigint(20) DEFAULT NULL,
  `default_savings_product` bigint(20) DEFAULT NULL,
  `default_savings_account` bigint(20) DEFAULT NULL,
  `client_type_cv_id` int(11) DEFAULT NULL,
  `client_classification_cv_id` int(11) DEFAULT NULL,
  `reject_reason_cv_id` int(11) DEFAULT NULL,
  `rejectedon_date` date DEFAULT NULL,
  `rejectedon_userid` bigint(20) DEFAULT NULL,
  `withdraw_reason_cv_id` int(11) DEFAULT NULL,
  `withdrawn_on_date` date DEFAULT NULL,
  `withdraw_on_userid` bigint(20) DEFAULT NULL,
  `reactivated_on_date` date DEFAULT NULL,
  `reactivated_on_userid` bigint(20) DEFAULT NULL,
  `legal_form_enum` int(11) DEFAULT NULL,
  `reopened_on_date` date DEFAULT NULL,
  `reopened_by_userid` bigint(20) DEFAULT NULL,
  `email_address` varchar(150) DEFAULT NULL,
  `proposed_transfer_date` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `m_client`
--

INSERT INTO `m_client` (`id`, `account_no`, `external_id`, `status_enum`, `sub_status`, `activation_date`, `office_joining_date`, `office_id`, `transfer_to_office_id`, `staff_id`, `firstname`, `middlename`, `lastname`, `fullname`, `display_name`, `mobile_no`, `is_staff`, `gender_cv_id`, `date_of_birth`, `image_id`, `closure_reason_cv_id`, `closedon_date`, `updated_by`, `updated_on`, `submittedon_date`, `submittedon_userid`, `activatedon_userid`, `closedon_userid`, `default_savings_product`, `default_savings_account`, `client_type_cv_id`, `client_classification_cv_id`, `reject_reason_cv_id`, `rejectedon_date`, `rejectedon_userid`, `withdraw_reason_cv_id`, `withdrawn_on_date`, `withdraw_on_userid`, `reactivated_on_date`, `reactivated_on_userid`, `legal_form_enum`, `reopened_on_date`, `reopened_by_userid`, `email_address`, `proposed_transfer_date`) VALUES
(1, '000000001', NULL, 300, NULL, '2022-11-21', '2022-11-21', 1, NULL, NULL, 'Eugene', NULL, 'Mutswenje', NULL, 'Eugene Mutswenje', '254714290788', 0, NULL, '2001-01-31', NULL, NULL, NULL, NULL, NULL, '2022-11-21', 1, 1, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `m_client_address`
--

CREATE TABLE `m_client_address` (
  `id` bigint(20) NOT NULL,
  `client_id` bigint(20) NOT NULL DEFAULT '0',
  `address_id` bigint(20) NOT NULL DEFAULT '0',
  `address_type_id` int(11) NOT NULL DEFAULT '0',
  `is_active` tinyint(4) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `m_client_attendance`
--

CREATE TABLE `m_client_attendance` (
  `id` bigint(20) NOT NULL,
  `client_id` bigint(20) NOT NULL DEFAULT '0',
  `meeting_id` bigint(20) NOT NULL,
  `attendance_type_enum` smallint(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `m_client_charge`
--

CREATE TABLE `m_client_charge` (
  `id` bigint(20) NOT NULL,
  `client_id` bigint(20) NOT NULL,
  `charge_id` bigint(20) NOT NULL,
  `is_penalty` tinyint(4) NOT NULL,
  `charge_time_enum` smallint(6) NOT NULL,
  `charge_due_date` date DEFAULT NULL,
  `charge_calculation_enum` smallint(6) NOT NULL,
  `amount` decimal(19,6) NOT NULL,
  `amount_paid_derived` decimal(19,6) DEFAULT NULL,
  `amount_waived_derived` decimal(19,6) DEFAULT NULL,
  `amount_writtenoff_derived` decimal(19,6) DEFAULT NULL,
  `amount_outstanding_derived` decimal(19,6) NOT NULL,
  `is_paid_derived` tinyint(4) DEFAULT NULL,
  `waived` tinyint(4) DEFAULT NULL,
  `is_active` tinyint(4) DEFAULT NULL,
  `inactivated_on_date` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `m_client_charge_paid_by`
--

CREATE TABLE `m_client_charge_paid_by` (
  `id` bigint(20) NOT NULL,
  `client_transaction_id` bigint(20) NOT NULL,
  `client_charge_id` bigint(20) NOT NULL,
  `amount` decimal(19,6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `m_client_identifier`
--

CREATE TABLE `m_client_identifier` (
  `id` bigint(20) NOT NULL,
  `client_id` bigint(20) NOT NULL,
  `document_type_id` int(11) NOT NULL,
  `document_key` varchar(50) NOT NULL,
  `status` int(11) NOT NULL DEFAULT '300',
  `active` int(11) DEFAULT NULL,
  `description` varchar(500) DEFAULT NULL,
  `createdby_id` bigint(20) DEFAULT NULL,
  `lastmodifiedby_id` bigint(20) DEFAULT NULL,
  `created_date` datetime DEFAULT NULL,
  `lastmodified_date` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `m_client_non_person`
--

CREATE TABLE `m_client_non_person` (
  `id` bigint(20) NOT NULL,
  `client_id` bigint(20) NOT NULL,
  `constitution_cv_id` int(11) NOT NULL,
  `incorp_no` varchar(50) DEFAULT NULL,
  `incorp_validity_till` datetime DEFAULT NULL,
  `main_business_line_cv_id` int(11) DEFAULT NULL,
  `remarks` varchar(150) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `m_client_transaction`
--

CREATE TABLE `m_client_transaction` (
  `id` bigint(20) NOT NULL,
  `client_id` bigint(20) NOT NULL,
  `office_id` bigint(20) NOT NULL,
  `currency_code` varchar(3) NOT NULL,
  `payment_detail_id` bigint(20) DEFAULT NULL,
  `is_reversed` tinyint(4) NOT NULL,
  `external_id` varchar(50) DEFAULT NULL,
  `transaction_date` date NOT NULL,
  `transaction_type_enum` smallint(6) NOT NULL,
  `amount` decimal(19,6) NOT NULL,
  `created_date` datetime NOT NULL,
  `appuser_id` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `m_client_transfer_details`
--

CREATE TABLE `m_client_transfer_details` (
  `id` bigint(20) NOT NULL,
  `client_id` bigint(20) NOT NULL,
  `from_office_id` bigint(20) NOT NULL,
  `to_office_id` bigint(20) NOT NULL,
  `proposed_transfer_date` date DEFAULT NULL,
  `transfer_type` tinyint(4) NOT NULL,
  `submitted_on` date NOT NULL,
  `submitted_by` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `m_code`
--

CREATE TABLE `m_code` (
  `id` int(11) NOT NULL,
  `code_name` varchar(100) DEFAULT NULL,
  `is_system_defined` tinyint(4) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `m_code`
--

INSERT INTO `m_code` (`id`, `code_name`, `is_system_defined`) VALUES
(1, 'Customer Identifier', 1),
(2, 'LoanCollateral', 1),
(3, 'LoanPurpose', 1),
(4, 'Gender', 1),
(5, 'YesNo', 1),
(6, 'GuarantorRelationship', 1),
(7, 'AssetAccountTags', 1),
(8, 'LiabilityAccountTags', 1),
(9, 'EquityAccountTags', 1),
(10, 'IncomeAccountTags', 1),
(11, 'ExpenseAccountTags', 1),
(13, 'GROUPROLE', 1),
(14, 'ClientClosureReason', 1),
(15, 'GroupClosureReason', 1),
(16, 'ClientType', 1),
(17, 'ClientClassification', 1),
(18, 'ClientSubStatus', 1),
(19, 'ClientRejectReason', 1),
(20, 'ClientWithdrawReason', 1),
(21, 'Entity to Entity Access Types', 1),
(22, 'CenterClosureReason', 1),
(23, 'LoanRescheduleReason', 1),
(24, 'Constitution', 1),
(25, 'Main Business Line', 1),
(26, 'WriteOffReasons', 1),
(27, 'STATE', 1),
(28, 'COUNTRY', 1),
(29, 'ADDRESS_TYPE', 1),
(30, 'MARITAL STATUS', 1),
(31, 'RELATIONSHIP', 1),
(32, 'PROFESSION', 1),
(33, 'PaymentType', 1);

-- --------------------------------------------------------

--
-- Table structure for table `m_code_value`
--

CREATE TABLE `m_code_value` (
  `id` int(11) NOT NULL,
  `code_id` int(11) NOT NULL,
  `code_value` varchar(100) DEFAULT NULL,
  `code_description` varchar(500) DEFAULT NULL,
  `order_position` int(11) NOT NULL DEFAULT '0',
  `code_score` int(11) DEFAULT NULL,
  `is_active` tinyint(4) NOT NULL DEFAULT '1',
  `is_mandatory` tinyint(4) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `m_code_value`
--

INSERT INTO `m_code_value` (`id`, `code_id`, `code_value`, `code_description`, `order_position`, `code_score`, `is_active`, `is_mandatory`) VALUES
(1, 1, 'Passport', NULL, 1, NULL, 1, 0),
(2, 1, 'Id', NULL, 2, NULL, 1, 0),
(3, 1, 'Drivers License', NULL, 3, NULL, 1, 0),
(4, 1, 'Any Other Id Type', NULL, 4, NULL, 1, 0),
(5, 6, 'Spouse', NULL, 0, NULL, 1, 0),
(6, 6, 'Parent', NULL, 0, NULL, 1, 0),
(7, 6, 'Sibling', NULL, 0, NULL, 1, 0),
(8, 6, 'Business Associate', NULL, 0, NULL, 1, 0),
(9, 6, 'Other', NULL, 0, NULL, 1, 0),
(10, 21, 'Office Access to Loan Products', NULL, 0, NULL, 1, 0),
(11, 21, 'Office Access to Savings Products', NULL, 0, NULL, 1, 0),
(12, 21, 'Office Access to Fees/Charges', NULL, 0, NULL, 1, 0),
(13, 13, 'Leader', 'Group Leader Role', 1, NULL, 1, 0),
(14, 33, 'Money Transfer', NULL, 1, NULL, 1, 0);

-- --------------------------------------------------------

--
-- Table structure for table `m_creditbureau`
--

CREATE TABLE `m_creditbureau` (
  `id` bigint(20) NOT NULL,
  `name` varchar(100) NOT NULL,
  `product` varchar(100) NOT NULL,
  `country` varchar(100) NOT NULL,
  `implementationKey` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `m_creditbureau`
--

INSERT INTO `m_creditbureau` (`id`, `name`, `product`, `country`, `implementationKey`) VALUES
(1, 'THITSAWORKS', '1', 'Myanmar', '1');

-- --------------------------------------------------------

--
-- Table structure for table `m_creditbureau_configuration`
--

CREATE TABLE `m_creditbureau_configuration` (
  `id` bigint(20) NOT NULL,
  `configkey` varchar(50) DEFAULT NULL,
  `value` longtext,
  `organisation_creditbureau_id` bigint(20) DEFAULT NULL,
  `description` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `m_creditbureau_configuration`
--

INSERT INTO `m_creditbureau_configuration` (`id`, `configkey`, `value`, `organisation_creditbureau_id`, `description`) VALUES
(1, 'Password', '', 1, ''),
(2, 'SubscriptionId', '', 1, ''),
(3, 'SubscriptionKey', '', 1, ''),
(4, 'Username', '', 1, ''),
(5, 'tokenurl', '', 1, ''),
(6, 'searchurl', '', 1, ''),
(7, 'creditReporturl', '', 1, ''),
(8, 'addCreditReporturl', '', 1, '');

-- --------------------------------------------------------

--
-- Table structure for table `m_creditbureau_loanproduct_mapping`
--

CREATE TABLE `m_creditbureau_loanproduct_mapping` (
  `id` bigint(20) NOT NULL,
  `organisation_creditbureau_id` bigint(20) NOT NULL,
  `loan_product_id` bigint(20) NOT NULL,
  `is_creditcheck_mandatory` tinyint(4) DEFAULT NULL,
  `skip_creditcheck_in_failure` tinyint(4) DEFAULT NULL,
  `stale_period` int(11) DEFAULT NULL,
  `isActive` tinyint(4) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `m_creditbureau_token`
--

CREATE TABLE `m_creditbureau_token` (
  `id` int(128) NOT NULL,
  `username` varchar(128) DEFAULT NULL,
  `token` mediumtext,
  `tokenType` varchar(128) DEFAULT NULL,
  `expiresIn` varchar(128) DEFAULT NULL,
  `issued` varchar(128) DEFAULT NULL,
  `expiryDate` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `m_creditreport`
--

CREATE TABLE `m_creditreport` (
  `id` int(128) NOT NULL,
  `creditBureauId` bigint(128) DEFAULT NULL,
  `nationalId` varchar(128) DEFAULT NULL,
  `creditReports` blob
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `m_currency`
--

CREATE TABLE `m_currency` (
  `id` bigint(20) NOT NULL,
  `code` varchar(3) NOT NULL,
  `decimal_places` smallint(6) NOT NULL,
  `currency_multiplesof` smallint(6) DEFAULT NULL,
  `display_symbol` varchar(10) DEFAULT NULL,
  `name` varchar(50) NOT NULL,
  `internationalized_name_code` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `m_currency`
--

INSERT INTO `m_currency` (`id`, `code`, `decimal_places`, `currency_multiplesof`, `display_symbol`, `name`, `internationalized_name_code`) VALUES
(1, 'AED', 2, NULL, NULL, 'UAE Dirham', 'currency.AED'),
(2, 'AFN', 2, NULL, NULL, 'Afghanistan Afghani', 'currency.AFN'),
(3, 'ALL', 2, NULL, NULL, 'Albanian Lek', 'currency.ALL'),
(4, 'AMD', 2, NULL, NULL, 'Armenian Dram', 'currency.AMD'),
(5, 'ANG', 2, NULL, NULL, 'Netherlands Antillian Guilder', 'currency.ANG'),
(6, 'AOA', 2, NULL, NULL, 'Angolan Kwanza', 'currency.AOA'),
(7, 'ARS', 2, NULL, '$', 'Argentine Peso', 'currency.ARS'),
(8, 'AUD', 2, NULL, 'A$', 'Australian Dollar', 'currency.AUD'),
(9, 'AWG', 2, NULL, NULL, 'Aruban Guilder', 'currency.AWG'),
(10, 'AZM', 2, NULL, NULL, 'Azerbaijanian Manat', 'currency.AZM'),
(11, 'BAM', 2, NULL, NULL, 'Bosnia and Herzegovina Convertible Marks', 'currency.BAM'),
(12, 'BBD', 2, NULL, NULL, 'Barbados Dollar', 'currency.BBD'),
(13, 'BDT', 2, NULL, NULL, 'Bangladesh Taka', 'currency.BDT'),
(14, 'BGN', 2, NULL, NULL, 'Bulgarian Lev', 'currency.BGN'),
(15, 'BHD', 3, NULL, NULL, 'Bahraini Dinar', 'currency.BHD'),
(16, 'BIF', 0, NULL, NULL, 'Burundi Franc', 'currency.BIF'),
(17, 'BMD', 2, NULL, NULL, 'Bermudian Dollar', 'currency.BMD'),
(18, 'BND', 2, NULL, 'B$', 'Brunei Dollar', 'currency.BND'),
(19, 'BOB', 2, NULL, 'Bs.', 'Bolivian Boliviano', 'currency.BOB'),
(20, 'BRL', 2, NULL, 'R$', 'Brazilian Real', 'currency.BRL'),
(21, 'BSD', 2, NULL, NULL, 'Bahamian Dollar', 'currency.BSD'),
(22, 'BTN', 2, NULL, NULL, 'Bhutan Ngultrum', 'currency.BTN'),
(23, 'BWP', 2, NULL, NULL, 'Botswana Pula', 'currency.BWP'),
(24, 'BYR', 0, NULL, NULL, 'Belarussian Ruble', 'currency.BYR'),
(25, 'BZD', 2, NULL, 'BZ$', 'Belize Dollar', 'currency.BZD'),
(26, 'CAD', 2, NULL, NULL, 'Canadian Dollar', 'currency.CAD'),
(27, 'CDF', 2, NULL, NULL, 'Franc Congolais', 'currency.CDF'),
(28, 'CHF', 2, NULL, NULL, 'Swiss Franc', 'currency.CHF'),
(29, 'CLP', 0, NULL, '$', 'Chilean Peso', 'currency.CLP'),
(30, 'CNY', 2, NULL, NULL, 'Chinese Yuan Renminbi', 'currency.CNY'),
(31, 'COP', 2, NULL, '$', 'Colombian Peso', 'currency.COP'),
(32, 'CRC', 2, NULL, '₡', 'Costa Rican Colon', 'currency.CRC'),
(33, 'CSD', 2, NULL, NULL, 'Serbian Dinar', 'currency.CSD'),
(34, 'CUP', 2, NULL, '$MN', 'Cuban Peso', 'currency.CUP'),
(35, 'CVE', 2, NULL, NULL, 'Cape Verde Escudo', 'currency.CVE'),
(36, 'CYP', 2, NULL, NULL, 'Cyprus Pound', 'currency.CYP'),
(37, 'CZK', 2, NULL, NULL, 'Czech Koruna', 'currency.CZK'),
(38, 'DJF', 0, NULL, NULL, 'Djibouti Franc', 'currency.DJF'),
(39, 'DKK', 2, NULL, NULL, 'Danish Krone', 'currency.DKK'),
(40, 'DOP', 2, NULL, 'RD$', 'Dominican Peso', 'currency.DOP'),
(41, 'DZD', 2, NULL, NULL, 'Algerian Dinar', 'currency.DZD'),
(42, 'EEK', 2, NULL, NULL, 'Estonian Kroon', 'currency.EEK'),
(43, 'EGP', 2, NULL, NULL, 'Egyptian Pound', 'currency.EGP'),
(44, 'ERN', 2, NULL, NULL, 'Eritrea Nafka', 'currency.ERN'),
(45, 'ETB', 2, NULL, NULL, 'Ethiopian Birr', 'currency.ETB'),
(46, 'EUR', 2, NULL, '€', 'Euro', 'currency.EUR'),
(47, 'FJD', 2, NULL, NULL, 'Fiji Dollar', 'currency.FJD'),
(48, 'FKP', 2, NULL, NULL, 'Falkland Islands Pound', 'currency.FKP'),
(49, 'GBP', 2, NULL, NULL, 'Pound Sterling', 'currency.GBP'),
(50, 'GEL', 2, NULL, NULL, 'Georgian Lari', 'currency.GEL'),
(51, 'GHC', 2, NULL, 'GHc', 'Ghana Cedi', 'currency.GHC'),
(52, 'GIP', 2, NULL, NULL, 'Gibraltar Pound', 'currency.GIP'),
(53, 'GMD', 2, NULL, NULL, 'Gambian Dalasi', 'currency.GMD'),
(54, 'GNF', 0, NULL, NULL, 'Guinea Franc', 'currency.GNF'),
(55, 'GTQ', 2, NULL, 'Q', 'Guatemala Quetzal', 'currency.GTQ'),
(56, 'GYD', 2, NULL, NULL, 'Guyana Dollar', 'currency.GYD'),
(57, 'HKD', 2, NULL, NULL, 'Hong Kong Dollar', 'currency.HKD'),
(58, 'HNL', 2, NULL, 'L', 'Honduras Lempira', 'currency.HNL'),
(59, 'HRK', 2, NULL, NULL, 'Croatian Kuna', 'currency.HRK'),
(60, 'HTG', 2, NULL, 'G', 'Haiti Gourde', 'currency.HTG'),
(61, 'HUF', 2, NULL, NULL, 'Hungarian Forint', 'currency.HUF'),
(62, 'IDR', 2, NULL, NULL, 'Indonesian Rupiah', 'currency.IDR'),
(63, 'ILS', 2, NULL, NULL, 'New Israeli Shekel', 'currency.ILS'),
(64, 'INR', 2, NULL, '₹', 'Indian Rupee', 'currency.INR'),
(65, 'IQD', 3, NULL, NULL, 'Iraqi Dinar', 'currency.IQD'),
(66, 'IRR', 2, NULL, NULL, 'Iranian Rial', 'currency.IRR'),
(67, 'ISK', 0, NULL, NULL, 'Iceland Krona', 'currency.ISK'),
(68, 'JMD', 2, NULL, NULL, 'Jamaican Dollar', 'currency.JMD'),
(69, 'JOD', 3, NULL, NULL, 'Jordanian Dinar', 'currency.JOD'),
(70, 'JPY', 0, NULL, NULL, 'Japanese Yen', 'currency.JPY'),
(71, 'KES', 2, NULL, 'KSh', 'Kenyan Shilling', 'currency.KES'),
(72, 'KGS', 2, NULL, NULL, 'Kyrgyzstan Som', 'currency.KGS'),
(73, 'KHR', 2, NULL, NULL, 'Cambodia Riel', 'currency.KHR'),
(74, 'KMF', 0, NULL, NULL, 'Comoro Franc', 'currency.KMF'),
(75, 'KPW', 2, NULL, NULL, 'North Korean Won', 'currency.KPW'),
(76, 'KRW', 0, NULL, NULL, 'Korean Won', 'currency.KRW'),
(77, 'KWD', 3, NULL, NULL, 'Kuwaiti Dinar', 'currency.KWD'),
(78, 'KYD', 2, NULL, NULL, 'Cayman Islands Dollar', 'currency.KYD'),
(79, 'KZT', 2, NULL, NULL, 'Kazakhstan Tenge', 'currency.KZT'),
(80, 'LAK', 2, NULL, NULL, 'Lao Kip', 'currency.LAK'),
(81, 'LBP', 2, NULL, 'L£', 'Lebanese Pound', 'currency.LBP'),
(82, 'LKR', 2, NULL, NULL, 'Sri Lanka Rupee', 'currency.LKR'),
(83, 'LRD', 2, NULL, NULL, 'Liberian Dollar', 'currency.LRD'),
(84, 'LSL', 2, NULL, NULL, 'Lesotho Loti', 'currency.LSL'),
(85, 'LTL', 2, NULL, NULL, 'Lithuanian Litas', 'currency.LTL'),
(86, 'LVL', 2, NULL, NULL, 'Latvian Lats', 'currency.LVL'),
(87, 'LYD', 3, NULL, NULL, 'Libyan Dinar', 'currency.LYD'),
(88, 'MAD', 2, NULL, NULL, 'Moroccan Dirham', 'currency.MAD'),
(89, 'MDL', 2, NULL, NULL, 'Moldovan Leu', 'currency.MDL'),
(90, 'MGA', 2, NULL, NULL, 'Malagasy Ariary', 'currency.MGA'),
(91, 'MKD', 2, NULL, NULL, 'Macedonian Denar', 'currency.MKD'),
(92, 'MMK', 2, NULL, 'K', 'Myanmar Kyat', 'currency.MMK'),
(93, 'MNT', 2, NULL, NULL, 'Mongolian Tugrik', 'currency.MNT'),
(94, 'MOP', 2, NULL, NULL, 'Macau Pataca', 'currency.MOP'),
(95, 'MRO', 2, NULL, NULL, 'Mauritania Ouguiya', 'currency.MRO'),
(96, 'MTL', 2, NULL, NULL, 'Maltese Lira', 'currency.MTL'),
(97, 'MUR', 2, NULL, NULL, 'Mauritius Rupee', 'currency.MUR'),
(98, 'MVR', 2, NULL, NULL, 'Maldives Rufiyaa', 'currency.MVR'),
(99, 'MWK', 2, NULL, NULL, 'Malawi Kwacha', 'currency.MWK'),
(100, 'MXN', 2, NULL, '$', 'Mexican Peso', 'currency.MXN'),
(101, 'MYR', 2, NULL, NULL, 'Malaysian Ringgit', 'currency.MYR'),
(102, 'MZM', 2, NULL, NULL, 'Mozambique Metical', 'currency.MZM'),
(103, 'NAD', 2, NULL, NULL, 'Namibia Dollar', 'currency.NAD'),
(104, 'NGN', 2, NULL, NULL, 'Nigerian Naira', 'currency.NGN'),
(105, 'NIO', 2, NULL, 'C$', 'Nicaragua Cordoba Oro', 'currency.NIO'),
(106, 'NOK', 2, NULL, NULL, 'Norwegian Krone', 'currency.NOK'),
(107, 'NPR', 2, NULL, NULL, 'Nepalese Rupee', 'currency.NPR'),
(108, 'NZD', 2, NULL, NULL, 'New Zealand Dollar', 'currency.NZD'),
(109, 'OMR', 3, NULL, NULL, 'Rial Omani', 'currency.OMR'),
(110, 'PAB', 2, NULL, 'B/.', 'Panama Balboa', 'currency.PAB'),
(111, 'PEN', 2, NULL, 'S/.', 'Peruvian Nuevo Sol', 'currency.PEN'),
(112, 'PGK', 2, NULL, NULL, 'Papua New Guinea Kina', 'currency.PGK'),
(113, 'PHP', 2, NULL, NULL, 'Philippine Peso', 'currency.PHP'),
(114, 'PKR', 2, NULL, NULL, 'Pakistan Rupee', 'currency.PKR'),
(115, 'PLN', 2, NULL, NULL, 'Polish Zloty', 'currency.PLN'),
(116, 'PYG', 0, NULL, '₲', 'Paraguayan Guarani', 'currency.PYG'),
(117, 'QAR', 2, NULL, NULL, 'Qatari Rial', 'currency.QAR'),
(118, 'RON', 2, NULL, NULL, 'Romanian Leu', 'currency.RON'),
(119, 'RUB', 2, NULL, NULL, 'Russian Ruble', 'currency.RUB'),
(120, 'RWF', 0, NULL, NULL, 'Rwanda Franc', 'currency.RWF'),
(121, 'SAR', 2, NULL, NULL, 'Saudi Riyal', 'currency.SAR'),
(122, 'SBD', 2, NULL, NULL, 'Solomon Islands Dollar', 'currency.SBD'),
(123, 'SCR', 2, NULL, NULL, 'Seychelles Rupee', 'currency.SCR'),
(124, 'SDD', 2, NULL, NULL, 'Sudanese Dinar', 'currency.SDD'),
(125, 'SEK', 2, NULL, NULL, 'Swedish Krona', 'currency.SEK'),
(126, 'SGD', 2, NULL, NULL, 'Singapore Dollar', 'currency.SGD'),
(127, 'SHP', 2, NULL, NULL, 'St Helena Pound', 'currency.SHP'),
(128, 'SIT', 2, NULL, NULL, 'Slovenian Tolar', 'currency.SIT'),
(129, 'SKK', 2, NULL, NULL, 'Slovak Koruna', 'currency.SKK'),
(130, 'SLL', 2, NULL, NULL, 'Sierra Leone Leone', 'currency.SLL'),
(131, 'SOS', 2, NULL, NULL, 'Somali Shilling', 'currency.SOS'),
(132, 'SRD', 2, NULL, NULL, 'Surinam Dollar', 'currency.SRD'),
(133, 'STD', 2, NULL, NULL, 'Sao Tome and Principe Dobra', 'currency.STD'),
(134, 'SVC', 2, NULL, NULL, 'El Salvador Colon', 'currency.SVC'),
(135, 'SYP', 2, NULL, NULL, 'Syrian Pound', 'currency.SYP'),
(136, 'SZL', 2, NULL, NULL, 'Swaziland Lilangeni', 'currency.SZL'),
(137, 'THB', 2, NULL, NULL, 'Thai Baht', 'currency.THB'),
(138, 'TJS', 2, NULL, NULL, 'Tajik Somoni', 'currency.TJS'),
(139, 'TMM', 2, NULL, NULL, 'Turkmenistan Manat', 'currency.TMM'),
(140, 'TND', 3, NULL, 'DT', 'Tunisian Dinar', 'currency.TND'),
(141, 'TOP', 2, NULL, NULL, 'Tonga Pa\'anga', 'currency.TOP'),
(142, 'TRY', 2, NULL, NULL, 'Turkish Lira', 'currency.TRY'),
(143, 'TTD', 2, NULL, NULL, 'Trinidad and Tobago Dollar', 'currency.TTD'),
(144, 'TWD', 2, NULL, NULL, 'New Taiwan Dollar', 'currency.TWD'),
(145, 'TZS', 2, NULL, NULL, 'Tanzanian Shilling', 'currency.TZS'),
(146, 'UAH', 2, NULL, NULL, 'Ukraine Hryvnia', 'currency.UAH'),
(147, 'UGX', 2, NULL, 'USh', 'Uganda Shilling', 'currency.UGX'),
(148, 'USD', 2, NULL, '$', 'US Dollar', 'currency.USD'),
(149, 'UYU', 2, NULL, '$U', 'Peso Uruguayo', 'currency.UYU'),
(150, 'UZS', 2, NULL, NULL, 'Uzbekistan Sum', 'currency.UZS'),
(151, 'VEB', 2, NULL, 'Bs.F.', 'Venezuelan Bolivar', 'currency.VEB'),
(152, 'VND', 2, NULL, NULL, 'Vietnamese Dong', 'currency.VND'),
(153, 'VUV', 0, NULL, NULL, 'Vanuatu Vatu', 'currency.VUV'),
(154, 'WST', 2, NULL, NULL, 'Samoa Tala', 'currency.WST'),
(155, 'XAF', 0, NULL, NULL, 'CFA Franc BEAC', 'currency.XAF'),
(156, 'XCD', 2, NULL, NULL, 'East Caribbean Dollar', 'currency.XCD'),
(157, 'XDR', 5, NULL, NULL, 'SDR (Special Drawing Rights)', 'currency.XDR'),
(158, 'XOF', 0, NULL, 'CFA', 'CFA Franc BCEAO', 'currency.XOF'),
(159, 'XPF', 0, NULL, NULL, 'CFP Franc', 'currency.XPF'),
(160, 'YER', 2, NULL, NULL, 'Yemeni Rial', 'currency.YER'),
(161, 'ZAR', 2, NULL, 'R', 'South African Rand', 'currency.ZAR'),
(162, 'ZMK', 2, NULL, NULL, 'Zambian Kwacha', 'currency.ZMK'),
(163, 'ZWD', 2, NULL, NULL, 'Zimbabwe Dollar', 'currency.ZWD');

-- --------------------------------------------------------

--
-- Table structure for table `m_deposit_account_on_hold_transaction`
--

CREATE TABLE `m_deposit_account_on_hold_transaction` (
  `id` bigint(20) NOT NULL,
  `savings_account_id` bigint(20) NOT NULL,
  `amount` decimal(19,6) NOT NULL,
  `transaction_type_enum` smallint(6) NOT NULL,
  `transaction_date` date NOT NULL,
  `is_reversed` tinyint(4) NOT NULL DEFAULT '0',
  `created_date` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `m_deposit_account_recurring_detail`
--

CREATE TABLE `m_deposit_account_recurring_detail` (
  `id` bigint(20) NOT NULL,
  `savings_account_id` bigint(20) NOT NULL DEFAULT '0',
  `mandatory_recommended_deposit_amount` decimal(19,6) DEFAULT NULL,
  `is_mandatory` tinyint(4) NOT NULL DEFAULT '0',
  `allow_withdrawal` tinyint(4) NOT NULL DEFAULT '0',
  `adjust_advance_towards_future_payments` tinyint(4) NOT NULL DEFAULT '1',
  `is_calendar_inherited` tinyint(4) NOT NULL DEFAULT '0',
  `total_overdue_amount` decimal(19,6) DEFAULT NULL,
  `no_of_overdue_installments` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `m_deposit_account_term_and_preclosure`
--

CREATE TABLE `m_deposit_account_term_and_preclosure` (
  `id` bigint(20) NOT NULL,
  `savings_account_id` bigint(20) NOT NULL DEFAULT '0',
  `min_deposit_term` int(11) DEFAULT NULL,
  `max_deposit_term` int(11) DEFAULT NULL,
  `min_deposit_term_type_enum` smallint(6) DEFAULT NULL,
  `max_deposit_term_type_enum` smallint(6) DEFAULT NULL,
  `in_multiples_of_deposit_term` int(11) DEFAULT NULL,
  `in_multiples_of_deposit_term_type_enum` smallint(6) DEFAULT NULL,
  `pre_closure_penal_applicable` smallint(6) DEFAULT NULL,
  `pre_closure_penal_interest` decimal(19,6) DEFAULT NULL,
  `pre_closure_penal_interest_on_enum` smallint(6) DEFAULT NULL,
  `deposit_period` int(11) DEFAULT NULL,
  `deposit_period_frequency_enum` smallint(6) DEFAULT NULL,
  `deposit_amount` decimal(19,6) DEFAULT NULL,
  `maturity_amount` decimal(19,6) DEFAULT NULL,
  `maturity_date` date DEFAULT NULL,
  `on_account_closure_enum` smallint(6) DEFAULT NULL,
  `expected_firstdepositon_date` date DEFAULT NULL,
  `transfer_interest_to_linked_account` tinyint(4) NOT NULL DEFAULT '0',
  `transfer_to_savings_account_id` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `m_deposit_product_interest_rate_chart`
--

CREATE TABLE `m_deposit_product_interest_rate_chart` (
  `deposit_product_id` bigint(20) NOT NULL,
  `interest_rate_chart_id` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `m_deposit_product_recurring_detail`
--

CREATE TABLE `m_deposit_product_recurring_detail` (
  `id` bigint(20) NOT NULL,
  `savings_product_id` bigint(20) NOT NULL DEFAULT '0',
  `is_mandatory` tinyint(4) NOT NULL DEFAULT '1',
  `allow_withdrawal` tinyint(4) NOT NULL DEFAULT '0',
  `adjust_advance_towards_future_payments` tinyint(4) NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `m_deposit_product_term_and_preclosure`
--

CREATE TABLE `m_deposit_product_term_and_preclosure` (
  `id` bigint(20) NOT NULL,
  `savings_product_id` bigint(20) NOT NULL DEFAULT '0',
  `min_deposit_term` int(11) DEFAULT NULL,
  `max_deposit_term` int(11) DEFAULT NULL,
  `min_deposit_term_type_enum` smallint(6) DEFAULT NULL,
  `max_deposit_term_type_enum` smallint(6) DEFAULT NULL,
  `in_multiples_of_deposit_term` int(11) DEFAULT NULL,
  `in_multiples_of_deposit_term_type_enum` smallint(6) DEFAULT NULL,
  `pre_closure_penal_applicable` smallint(6) DEFAULT NULL,
  `pre_closure_penal_interest` decimal(19,6) DEFAULT NULL,
  `pre_closure_penal_interest_on_enum` smallint(6) DEFAULT NULL,
  `min_deposit_amount` decimal(19,6) DEFAULT NULL,
  `max_deposit_amount` decimal(19,6) DEFAULT NULL,
  `deposit_amount` decimal(19,6) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `m_document`
--

CREATE TABLE `m_document` (
  `id` int(11) NOT NULL,
  `parent_entity_type` varchar(50) NOT NULL,
  `parent_entity_id` int(11) NOT NULL DEFAULT '0',
  `name` varchar(250) NOT NULL,
  `file_name` varchar(250) NOT NULL,
  `size` int(11) DEFAULT '0',
  `type` varchar(500) DEFAULT NULL,
  `description` varchar(1000) DEFAULT NULL,
  `location` varchar(500) NOT NULL DEFAULT '0',
  `storage_type_enum` smallint(6) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `m_entity_datatable_check`
--

CREATE TABLE `m_entity_datatable_check` (
  `id` int(11) NOT NULL,
  `application_table_name` varchar(200) NOT NULL,
  `x_registered_table_name` varchar(50) NOT NULL,
  `status_enum` int(11) NOT NULL,
  `system_defined` tinyint(4) NOT NULL DEFAULT '0',
  `product_id` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `m_entity_relation`
--

CREATE TABLE `m_entity_relation` (
  `id` bigint(20) NOT NULL,
  `from_entity_type` int(11) NOT NULL,
  `to_entity_type` int(11) NOT NULL,
  `code_name` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `m_entity_relation`
--

INSERT INTO `m_entity_relation` (`id`, `from_entity_type`, `to_entity_type`, `code_name`) VALUES
(1, 1, 2, 'office_access_to_loan_products'),
(2, 1, 3, 'office_access_to_savings_products'),
(3, 1, 4, 'office_access_to_fees/charges'),
(4, 5, 2, 'role_access_to_loan_products'),
(5, 5, 3, 'role_access_to_savings_products');

-- --------------------------------------------------------

--
-- Table structure for table `m_entity_to_entity_access`
--

CREATE TABLE `m_entity_to_entity_access` (
  `id` bigint(20) NOT NULL,
  `entity_type` varchar(50) NOT NULL,
  `entity_id` bigint(20) NOT NULL,
  `access_type_code_value_id` int(11) NOT NULL,
  `second_entity_type` varchar(50) NOT NULL,
  `second_entity_id` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `m_entity_to_entity_mapping`
--

CREATE TABLE `m_entity_to_entity_mapping` (
  `id` bigint(20) NOT NULL,
  `rel_id` bigint(20) NOT NULL DEFAULT '0',
  `from_id` bigint(20) NOT NULL DEFAULT '0',
  `to_id` bigint(20) UNSIGNED NOT NULL,
  `start_date` date DEFAULT NULL,
  `end_date` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `m_family_members`
--

CREATE TABLE `m_family_members` (
  `id` bigint(20) NOT NULL,
  `client_id` bigint(20) NOT NULL,
  `firstname` varchar(50) NOT NULL,
  `middlename` varchar(50) DEFAULT NULL,
  `lastname` varchar(50) DEFAULT NULL,
  `qualification` varchar(50) DEFAULT NULL,
  `relationship_cv_id` int(11) NOT NULL,
  `marital_status_cv_id` int(11) DEFAULT NULL,
  `gender_cv_id` int(11) DEFAULT NULL,
  `date_of_birth` date DEFAULT NULL,
  `age` int(11) DEFAULT NULL,
  `profession_cv_id` int(11) DEFAULT NULL,
  `mobile_number` varchar(50) DEFAULT NULL,
  `is_dependent` tinyint(4) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `m_field_configuration`
--

CREATE TABLE `m_field_configuration` (
  `id` bigint(20) NOT NULL,
  `entity` varchar(100) NOT NULL,
  `subentity` varchar(100) NOT NULL,
  `field` varchar(100) NOT NULL,
  `is_enabled` tinyint(4) NOT NULL,
  `is_mandatory` tinyint(4) NOT NULL,
  `validation_regex` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `m_field_configuration`
--

INSERT INTO `m_field_configuration` (`id`, `entity`, `subentity`, `field`, `is_enabled`, `is_mandatory`, `validation_regex`) VALUES
(1, 'ADDRESS', 'CLIENT', 'addressType', 1, 0, ''),
(3, 'ADDRESS', 'CLIENT', 'addressLine1', 1, 0, ''),
(4, 'ADDRESS', 'CLIENT', 'addressLine2', 1, 0, ''),
(5, 'ADDRESS', 'CLIENT', 'addressLine3', 1, 0, ''),
(6, 'ADDRESS', 'CLIENT', 'townVillage', 0, 0, ''),
(7, 'ADDRESS', 'CLIENT', 'city', 1, 0, ''),
(8, 'ADDRESS', 'CLIENT', 'countyDistrict', 0, 0, ''),
(9, 'ADDRESS', 'CLIENT', 'stateProvinceId', 1, 0, ''),
(10, 'ADDRESS', 'CLIENT', 'countryId', 1, 0, ''),
(11, 'ADDRESS', 'CLIENT', 'postalCode', 1, 0, ''),
(12, 'ADDRESS', 'CLIENT', 'latitude', 0, 0, ''),
(13, 'ADDRESS', 'CLIENT', 'longitude', 0, 0, ''),
(14, 'ADDRESS', 'CLIENT', 'createdBy', 1, 0, ''),
(15, 'ADDRESS', 'CLIENT', 'createdOn', 1, 0, ''),
(16, 'ADDRESS', 'CLIENT', 'updatedBy', 1, 0, ''),
(17, 'ADDRESS', 'CLIENT', 'updatedOn', 1, 0, ''),
(18, 'ADDRESS', 'CLIENT', 'isActive', 1, 0, '');

-- --------------------------------------------------------

--
-- Table structure for table `m_floating_rates`
--

CREATE TABLE `m_floating_rates` (
  `id` bigint(20) NOT NULL,
  `name` varchar(200) NOT NULL,
  `is_base_lending_rate` bit(1) NOT NULL DEFAULT b'0',
  `is_active` bit(1) NOT NULL DEFAULT b'1',
  `createdby_id` bigint(20) NOT NULL,
  `created_date` datetime NOT NULL,
  `lastmodifiedby_id` bigint(20) NOT NULL,
  `lastmodified_date` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `m_floating_rates_periods`
--

CREATE TABLE `m_floating_rates_periods` (
  `id` bigint(20) NOT NULL,
  `floating_rates_id` bigint(20) NOT NULL,
  `from_date` datetime NOT NULL,
  `interest_rate` decimal(19,6) NOT NULL,
  `is_differential_to_base_lending_rate` bit(1) NOT NULL DEFAULT b'0',
  `is_active` bit(1) NOT NULL DEFAULT b'1',
  `createdby_id` bigint(20) NOT NULL,
  `created_date` datetime NOT NULL,
  `lastmodifiedby_id` bigint(20) NOT NULL,
  `lastmodified_date` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `m_fund`
--

CREATE TABLE `m_fund` (
  `id` bigint(20) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `external_id` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `m_group`
--

CREATE TABLE `m_group` (
  `id` bigint(20) NOT NULL,
  `external_id` varchar(100) DEFAULT NULL,
  `status_enum` int(11) NOT NULL DEFAULT '300',
  `activation_date` date DEFAULT NULL,
  `office_id` bigint(20) NOT NULL,
  `staff_id` bigint(20) DEFAULT NULL,
  `parent_id` bigint(20) DEFAULT NULL,
  `level_id` int(11) NOT NULL,
  `display_name` varchar(100) NOT NULL,
  `hierarchy` varchar(100) DEFAULT NULL,
  `closure_reason_cv_id` int(11) DEFAULT NULL,
  `closedon_date` date DEFAULT NULL,
  `activatedon_userid` bigint(20) DEFAULT NULL,
  `submittedon_date` date DEFAULT NULL,
  `submittedon_userid` bigint(20) DEFAULT NULL,
  `closedon_userid` bigint(20) DEFAULT NULL,
  `account_no` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `m_group_client`
--

CREATE TABLE `m_group_client` (
  `group_id` bigint(20) NOT NULL,
  `client_id` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `m_group_level`
--

CREATE TABLE `m_group_level` (
  `id` int(11) NOT NULL,
  `parent_id` int(11) DEFAULT NULL,
  `super_parent` tinyint(4) NOT NULL,
  `level_name` varchar(100) NOT NULL,
  `recursable` tinyint(4) NOT NULL,
  `can_have_clients` tinyint(4) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `m_group_level`
--

INSERT INTO `m_group_level` (`id`, `parent_id`, `super_parent`, `level_name`, `recursable`, `can_have_clients`) VALUES
(1, NULL, 1, 'Center', 1, 0),
(2, 1, 0, 'Group', 0, 1);

-- --------------------------------------------------------

--
-- Table structure for table `m_group_roles`
--

CREATE TABLE `m_group_roles` (
  `id` bigint(20) NOT NULL,
  `client_id` bigint(20) DEFAULT NULL,
  `group_id` bigint(20) DEFAULT NULL,
  `role_cv_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `m_guarantor`
--

CREATE TABLE `m_guarantor` (
  `id` bigint(20) NOT NULL,
  `loan_id` bigint(20) NOT NULL,
  `client_reln_cv_id` int(11) DEFAULT NULL,
  `type_enum` smallint(6) NOT NULL,
  `entity_id` bigint(20) DEFAULT NULL,
  `firstname` varchar(50) DEFAULT NULL,
  `lastname` varchar(50) DEFAULT NULL,
  `dob` date DEFAULT NULL,
  `address_line_1` varchar(500) DEFAULT NULL,
  `address_line_2` varchar(500) DEFAULT NULL,
  `city` varchar(50) DEFAULT NULL,
  `state` varchar(50) DEFAULT NULL,
  `country` varchar(50) DEFAULT NULL,
  `zip` varchar(20) DEFAULT NULL,
  `house_phone_number` varchar(20) DEFAULT NULL,
  `mobile_number` varchar(20) DEFAULT NULL,
  `comment` varchar(500) DEFAULT NULL,
  `is_active` tinyint(4) NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `m_guarantor_funding_details`
--

CREATE TABLE `m_guarantor_funding_details` (
  `id` bigint(20) NOT NULL,
  `guarantor_id` bigint(20) NOT NULL,
  `account_associations_id` bigint(20) NOT NULL,
  `amount` decimal(19,6) NOT NULL,
  `amount_released_derived` decimal(19,6) DEFAULT NULL,
  `amount_remaining_derived` decimal(19,6) DEFAULT NULL,
  `amount_transfered_derived` decimal(19,6) DEFAULT NULL,
  `status_enum` smallint(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `m_guarantor_transaction`
--

CREATE TABLE `m_guarantor_transaction` (
  `id` bigint(20) NOT NULL,
  `guarantor_fund_detail_id` bigint(20) NOT NULL,
  `loan_transaction_id` bigint(20) DEFAULT NULL,
  `deposit_on_hold_transaction_id` bigint(20) NOT NULL,
  `is_reversed` tinyint(4) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `m_holiday`
--

CREATE TABLE `m_holiday` (
  `id` bigint(20) NOT NULL,
  `name` varchar(100) NOT NULL,
  `from_date` datetime NOT NULL,
  `to_date` datetime NOT NULL,
  `repayments_rescheduled_to` datetime DEFAULT NULL,
  `status_enum` int(11) NOT NULL DEFAULT '100',
  `processed` tinyint(4) NOT NULL DEFAULT '0',
  `description` varchar(100) DEFAULT NULL,
  `rescheduling_type` int(11) NOT NULL DEFAULT '2'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `m_holiday_office`
--

CREATE TABLE `m_holiday_office` (
  `holiday_id` bigint(20) NOT NULL,
  `office_id` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `m_hook`
--

CREATE TABLE `m_hook` (
  `id` bigint(20) NOT NULL,
  `template_id` smallint(6) NOT NULL,
  `is_active` smallint(6) NOT NULL DEFAULT '1',
  `name` varchar(45) NOT NULL,
  `createdby_id` bigint(20) DEFAULT NULL,
  `created_date` datetime DEFAULT NULL,
  `lastmodifiedby_id` bigint(20) DEFAULT NULL,
  `lastmodified_date` datetime DEFAULT NULL,
  `ugd_template_id` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `m_hook_configuration`
--

CREATE TABLE `m_hook_configuration` (
  `id` bigint(20) NOT NULL,
  `hook_id` bigint(20) DEFAULT NULL,
  `field_type` varchar(45) NOT NULL,
  `field_name` varchar(100) NOT NULL,
  `field_value` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `m_hook_registered_events`
--

CREATE TABLE `m_hook_registered_events` (
  `id` bigint(20) NOT NULL,
  `hook_id` bigint(20) NOT NULL,
  `entity_name` varchar(45) NOT NULL,
  `action_name` varchar(45) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `m_hook_schema`
--

CREATE TABLE `m_hook_schema` (
  `id` smallint(6) NOT NULL,
  `hook_template_id` smallint(6) NOT NULL,
  `field_type` varchar(45) NOT NULL,
  `field_name` varchar(100) NOT NULL,
  `placeholder` varchar(100) DEFAULT NULL,
  `optional` tinyint(4) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `m_hook_schema`
--

INSERT INTO `m_hook_schema` (`id`, `hook_template_id`, `field_type`, `field_name`, `placeholder`, `optional`) VALUES
(1, 1, 'string', 'Payload URL', NULL, 0),
(2, 1, 'string', 'Content Type', 'json / form', 0),
(3, 2, 'string', 'Payload URL', NULL, 0),
(4, 2, 'string', 'SMS Provider', NULL, 0),
(5, 2, 'string', 'Phone Number', NULL, 0),
(6, 2, 'string', 'SMS Provider Token', NULL, 0),
(7, 2, 'string', 'SMS Provider Account Id', NULL, 0),
(8, 3, 'string', 'Payload URL', 'http://<host>/<index name>/<type name>', 0),
(9, 3, 'string', 'Content Type', 'json', 0),
(10, 3, 'string', 'Index Name', NULL, 1);

-- --------------------------------------------------------

--
-- Table structure for table `m_hook_templates`
--

CREATE TABLE `m_hook_templates` (
  `id` smallint(6) NOT NULL,
  `name` varchar(45) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `m_hook_templates`
--

INSERT INTO `m_hook_templates` (`id`, `name`) VALUES
(1, 'Web'),
(2, 'SMS Bridge'),
(3, 'Elastic Search');

-- --------------------------------------------------------

--
-- Table structure for table `m_image`
--

CREATE TABLE `m_image` (
  `id` bigint(20) NOT NULL,
  `location` varchar(500) DEFAULT NULL,
  `storage_type_enum` smallint(6) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `m_import_document`
--

CREATE TABLE `m_import_document` (
  `id` bigint(20) NOT NULL,
  `document_id` int(11) NOT NULL,
  `import_time` datetime NOT NULL,
  `end_time` datetime DEFAULT NULL,
  `entity_type` tinyint(4) NOT NULL,
  `completed` tinyint(4) DEFAULT '0',
  `total_records` bigint(20) DEFAULT '0',
  `success_count` bigint(20) DEFAULT '0',
  `failure_count` bigint(20) DEFAULT '0',
  `createdby_id` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `m_interest_incentives`
--

CREATE TABLE `m_interest_incentives` (
  `id` bigint(20) NOT NULL,
  `interest_rate_slab_id` bigint(20) NOT NULL,
  `entiry_type` smallint(6) NOT NULL,
  `attribute_name` smallint(6) NOT NULL,
  `condition_type` smallint(6) NOT NULL,
  `attribute_value` varchar(50) NOT NULL,
  `incentive_type` smallint(6) NOT NULL,
  `amount` decimal(19,6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `m_interest_rate_chart`
--

CREATE TABLE `m_interest_rate_chart` (
  `id` bigint(20) NOT NULL,
  `name` varchar(100) DEFAULT NULL,
  `description` varchar(200) DEFAULT NULL,
  `from_date` date NOT NULL,
  `end_date` date DEFAULT NULL,
  `is_primary_grouping_by_amount` tinyint(4) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `m_interest_rate_slab`
--

CREATE TABLE `m_interest_rate_slab` (
  `id` bigint(20) NOT NULL,
  `interest_rate_chart_id` bigint(20) NOT NULL,
  `description` varchar(200) DEFAULT NULL,
  `period_type_enum` smallint(6) DEFAULT NULL,
  `from_period` int(11) DEFAULT NULL,
  `to_period` int(11) DEFAULT NULL,
  `amount_range_from` decimal(19,6) DEFAULT NULL,
  `amount_range_to` decimal(19,6) DEFAULT NULL,
  `annual_interest_rate` decimal(19,6) NOT NULL,
  `currency_code` varchar(3) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `m_loan`
--

CREATE TABLE `m_loan` (
  `id` bigint(20) NOT NULL,
  `account_no` varchar(20) NOT NULL,
  `external_id` varchar(100) DEFAULT NULL,
  `client_id` bigint(20) DEFAULT NULL,
  `group_id` bigint(20) DEFAULT NULL,
  `glim_id` bigint(20) DEFAULT NULL,
  `product_id` bigint(20) DEFAULT NULL,
  `fund_id` bigint(20) DEFAULT NULL,
  `loan_officer_id` bigint(20) DEFAULT NULL,
  `loanpurpose_cv_id` int(11) DEFAULT NULL,
  `loan_status_id` smallint(6) NOT NULL,
  `loan_type_enum` smallint(6) NOT NULL,
  `currency_code` varchar(3) NOT NULL,
  `currency_digits` smallint(6) NOT NULL,
  `currency_multiplesof` smallint(6) DEFAULT NULL,
  `principal_amount_proposed` decimal(19,6) NOT NULL,
  `principal_amount` decimal(19,6) NOT NULL,
  `approved_principal` decimal(19,6) NOT NULL,
  `arrearstolerance_amount` decimal(19,6) DEFAULT NULL,
  `is_floating_interest_rate` bit(1) DEFAULT b'0',
  `interest_rate_differential` decimal(19,6) DEFAULT '0.000000',
  `nominal_interest_rate_per_period` decimal(19,6) DEFAULT NULL,
  `interest_period_frequency_enum` smallint(6) DEFAULT NULL,
  `annual_nominal_interest_rate` decimal(19,6) DEFAULT NULL,
  `interest_method_enum` smallint(6) NOT NULL,
  `interest_calculated_in_period_enum` smallint(6) NOT NULL DEFAULT '1',
  `allow_partial_period_interest_calcualtion` tinyint(4) NOT NULL DEFAULT '0',
  `term_frequency` smallint(6) NOT NULL DEFAULT '0',
  `term_period_frequency_enum` smallint(6) NOT NULL DEFAULT '2',
  `repay_every` smallint(6) NOT NULL,
  `repayment_period_frequency_enum` smallint(6) NOT NULL,
  `number_of_repayments` smallint(6) NOT NULL,
  `grace_on_principal_periods` smallint(6) DEFAULT NULL,
  `recurring_moratorium_principal_periods` smallint(6) DEFAULT NULL,
  `grace_on_interest_periods` smallint(6) DEFAULT NULL,
  `grace_interest_free_periods` smallint(6) DEFAULT NULL,
  `amortization_method_enum` smallint(6) NOT NULL,
  `submittedon_date` date DEFAULT NULL,
  `submittedon_userid` bigint(20) DEFAULT NULL,
  `approvedon_date` date DEFAULT NULL,
  `approvedon_userid` bigint(20) DEFAULT NULL,
  `expected_disbursedon_date` date DEFAULT NULL,
  `expected_firstrepaymenton_date` date DEFAULT NULL,
  `interest_calculated_from_date` date DEFAULT NULL,
  `disbursedon_date` date DEFAULT NULL,
  `disbursedon_userid` bigint(20) DEFAULT NULL,
  `expected_maturedon_date` date DEFAULT NULL,
  `maturedon_date` date DEFAULT NULL,
  `closedon_date` date DEFAULT NULL,
  `closedon_userid` bigint(20) DEFAULT NULL,
  `total_charges_due_at_disbursement_derived` decimal(19,6) DEFAULT NULL,
  `principal_disbursed_derived` decimal(19,6) NOT NULL DEFAULT '0.000000',
  `principal_repaid_derived` decimal(19,6) NOT NULL DEFAULT '0.000000',
  `principal_writtenoff_derived` decimal(19,6) NOT NULL DEFAULT '0.000000',
  `principal_outstanding_derived` decimal(19,6) NOT NULL DEFAULT '0.000000',
  `interest_charged_derived` decimal(19,6) NOT NULL DEFAULT '0.000000',
  `interest_repaid_derived` decimal(19,6) NOT NULL DEFAULT '0.000000',
  `interest_waived_derived` decimal(19,6) NOT NULL DEFAULT '0.000000',
  `interest_writtenoff_derived` decimal(19,6) NOT NULL DEFAULT '0.000000',
  `interest_outstanding_derived` decimal(19,6) NOT NULL DEFAULT '0.000000',
  `fee_charges_charged_derived` decimal(19,6) NOT NULL DEFAULT '0.000000',
  `fee_charges_repaid_derived` decimal(19,6) NOT NULL DEFAULT '0.000000',
  `fee_charges_waived_derived` decimal(19,6) NOT NULL DEFAULT '0.000000',
  `fee_charges_writtenoff_derived` decimal(19,6) NOT NULL DEFAULT '0.000000',
  `fee_charges_outstanding_derived` decimal(19,6) NOT NULL DEFAULT '0.000000',
  `penalty_charges_charged_derived` decimal(19,6) NOT NULL DEFAULT '0.000000',
  `penalty_charges_repaid_derived` decimal(19,6) NOT NULL DEFAULT '0.000000',
  `penalty_charges_waived_derived` decimal(19,6) NOT NULL DEFAULT '0.000000',
  `penalty_charges_writtenoff_derived` decimal(19,6) NOT NULL DEFAULT '0.000000',
  `penalty_charges_outstanding_derived` decimal(19,6) NOT NULL DEFAULT '0.000000',
  `total_expected_repayment_derived` decimal(19,6) NOT NULL DEFAULT '0.000000',
  `total_repayment_derived` decimal(19,6) NOT NULL DEFAULT '0.000000',
  `total_expected_costofloan_derived` decimal(19,6) NOT NULL DEFAULT '0.000000',
  `total_costofloan_derived` decimal(19,6) NOT NULL DEFAULT '0.000000',
  `total_waived_derived` decimal(19,6) NOT NULL DEFAULT '0.000000',
  `total_writtenoff_derived` decimal(19,6) NOT NULL DEFAULT '0.000000',
  `total_outstanding_derived` decimal(19,6) NOT NULL DEFAULT '0.000000',
  `total_overpaid_derived` decimal(19,6) DEFAULT NULL,
  `rejectedon_date` date DEFAULT NULL,
  `rejectedon_userid` bigint(20) DEFAULT NULL,
  `rescheduledon_date` date DEFAULT NULL,
  `rescheduledon_userid` bigint(20) DEFAULT NULL,
  `withdrawnon_date` date DEFAULT NULL,
  `withdrawnon_userid` bigint(20) DEFAULT NULL,
  `writtenoffon_date` date DEFAULT NULL,
  `loan_transaction_strategy_id` bigint(20) DEFAULT NULL,
  `sync_disbursement_with_meeting` tinyint(4) DEFAULT NULL,
  `loan_counter` smallint(6) DEFAULT NULL,
  `loan_product_counter` smallint(6) DEFAULT NULL,
  `fixed_emi_amount` decimal(19,6) DEFAULT NULL,
  `max_outstanding_loan_balance` decimal(19,6) DEFAULT NULL,
  `grace_on_arrears_ageing` smallint(6) DEFAULT NULL,
  `is_npa` tinyint(4) NOT NULL DEFAULT '0',
  `total_recovered_derived` decimal(19,6) DEFAULT NULL,
  `accrued_till` date DEFAULT NULL,
  `interest_recalcualated_on` date DEFAULT NULL,
  `days_in_month_enum` smallint(6) NOT NULL DEFAULT '1',
  `days_in_year_enum` smallint(6) NOT NULL DEFAULT '1',
  `interest_recalculation_enabled` tinyint(4) NOT NULL DEFAULT '0',
  `guarantee_amount_derived` decimal(19,6) DEFAULT NULL,
  `create_standing_instruction_at_disbursement` tinyint(4) DEFAULT NULL,
  `version` int(11) NOT NULL DEFAULT '1',
  `writeoff_reason_cv_id` int(11) DEFAULT NULL,
  `loan_sub_status_id` smallint(6) DEFAULT NULL,
  `is_topup` tinyint(4) NOT NULL DEFAULT '0',
  `is_equal_amortization` tinyint(4) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `m_loanproduct_provisioning_entry`
--

CREATE TABLE `m_loanproduct_provisioning_entry` (
  `id` bigint(20) NOT NULL,
  `history_id` bigint(20) NOT NULL,
  `criteria_id` bigint(20) NOT NULL,
  `currency_code` varchar(3) NOT NULL,
  `office_id` bigint(20) NOT NULL,
  `product_id` bigint(20) NOT NULL,
  `category_id` bigint(20) NOT NULL,
  `overdue_in_days` bigint(20) DEFAULT '0',
  `reseve_amount` decimal(20,6) DEFAULT '0.000000',
  `liability_account` bigint(20) DEFAULT NULL,
  `expense_account` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `m_loanproduct_provisioning_mapping`
--

CREATE TABLE `m_loanproduct_provisioning_mapping` (
  `id` bigint(20) NOT NULL,
  `product_id` bigint(20) NOT NULL,
  `criteria_id` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `m_loan_arrears_aging`
--

CREATE TABLE `m_loan_arrears_aging` (
  `loan_id` bigint(20) NOT NULL,
  `principal_overdue_derived` decimal(19,6) NOT NULL DEFAULT '0.000000',
  `interest_overdue_derived` decimal(19,6) NOT NULL DEFAULT '0.000000',
  `fee_charges_overdue_derived` decimal(19,6) NOT NULL DEFAULT '0.000000',
  `penalty_charges_overdue_derived` decimal(19,6) NOT NULL DEFAULT '0.000000',
  `total_overdue_derived` decimal(19,6) NOT NULL DEFAULT '0.000000',
  `overdue_since_date_derived` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `m_loan_charge`
--

CREATE TABLE `m_loan_charge` (
  `id` bigint(20) NOT NULL,
  `loan_id` bigint(20) NOT NULL,
  `charge_id` bigint(20) NOT NULL,
  `is_penalty` tinyint(4) NOT NULL DEFAULT '0',
  `charge_time_enum` smallint(6) NOT NULL,
  `due_for_collection_as_of_date` date DEFAULT NULL,
  `charge_calculation_enum` smallint(6) NOT NULL,
  `charge_payment_mode_enum` smallint(6) NOT NULL DEFAULT '0',
  `calculation_percentage` decimal(19,6) DEFAULT NULL,
  `calculation_on_amount` decimal(19,6) DEFAULT NULL,
  `charge_amount_or_percentage` decimal(19,6) DEFAULT NULL,
  `amount` decimal(19,6) NOT NULL,
  `amount_paid_derived` decimal(19,6) DEFAULT NULL,
  `amount_waived_derived` decimal(19,6) DEFAULT NULL,
  `amount_writtenoff_derived` decimal(19,6) DEFAULT NULL,
  `amount_outstanding_derived` decimal(19,6) NOT NULL DEFAULT '0.000000',
  `is_paid_derived` tinyint(4) NOT NULL DEFAULT '0',
  `waived` tinyint(4) NOT NULL DEFAULT '0',
  `min_cap` decimal(19,6) DEFAULT NULL,
  `max_cap` decimal(19,6) DEFAULT NULL,
  `is_active` tinyint(4) NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `m_loan_charge_paid_by`
--

CREATE TABLE `m_loan_charge_paid_by` (
  `id` bigint(20) NOT NULL,
  `loan_transaction_id` bigint(20) NOT NULL,
  `loan_charge_id` bigint(20) NOT NULL,
  `amount` decimal(19,6) NOT NULL,
  `installment_number` smallint(6) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `m_loan_collateral`
--

CREATE TABLE `m_loan_collateral` (
  `id` bigint(20) NOT NULL,
  `loan_id` bigint(20) NOT NULL,
  `type_cv_id` int(11) NOT NULL,
  `value` decimal(19,6) DEFAULT NULL,
  `description` varchar(500) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `m_loan_disbursement_detail`
--

CREATE TABLE `m_loan_disbursement_detail` (
  `id` bigint(20) NOT NULL,
  `loan_id` bigint(20) NOT NULL,
  `expected_disburse_date` datetime NOT NULL,
  `disbursedon_date` datetime DEFAULT NULL,
  `principal` decimal(19,6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `m_loan_installment_charge`
--

CREATE TABLE `m_loan_installment_charge` (
  `id` bigint(20) NOT NULL,
  `loan_charge_id` bigint(20) NOT NULL,
  `loan_schedule_id` bigint(20) NOT NULL,
  `due_date` date DEFAULT NULL,
  `amount` decimal(19,6) NOT NULL,
  `amount_paid_derived` decimal(19,6) DEFAULT NULL,
  `amount_waived_derived` decimal(19,6) DEFAULT NULL,
  `amount_writtenoff_derived` decimal(19,6) DEFAULT NULL,
  `amount_outstanding_derived` decimal(19,6) NOT NULL DEFAULT '0.000000',
  `is_paid_derived` tinyint(4) NOT NULL DEFAULT '0',
  `waived` tinyint(4) NOT NULL DEFAULT '0',
  `amount_through_charge_payment` decimal(19,6) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `m_loan_interest_recalculation_additional_details`
--

CREATE TABLE `m_loan_interest_recalculation_additional_details` (
  `id` bigint(20) NOT NULL,
  `loan_repayment_schedule_id` bigint(20) NOT NULL,
  `effective_date` date NOT NULL,
  `amount` decimal(19,6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `m_loan_officer_assignment_history`
--

CREATE TABLE `m_loan_officer_assignment_history` (
  `id` bigint(20) NOT NULL,
  `loan_id` bigint(20) NOT NULL,
  `loan_officer_id` bigint(20) DEFAULT NULL,
  `start_date` date NOT NULL,
  `end_date` date DEFAULT NULL,
  `createdby_id` bigint(20) DEFAULT NULL,
  `created_date` datetime DEFAULT NULL,
  `lastmodified_date` datetime DEFAULT NULL,
  `lastmodifiedby_id` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `m_loan_overdue_installment_charge`
--

CREATE TABLE `m_loan_overdue_installment_charge` (
  `id` bigint(20) NOT NULL,
  `loan_charge_id` bigint(20) NOT NULL,
  `loan_schedule_id` bigint(20) NOT NULL,
  `frequency_number` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `m_loan_paid_in_advance`
--

CREATE TABLE `m_loan_paid_in_advance` (
  `loan_id` bigint(20) NOT NULL,
  `principal_in_advance_derived` decimal(19,6) NOT NULL DEFAULT '0.000000',
  `interest_in_advance_derived` decimal(19,6) NOT NULL DEFAULT '0.000000',
  `fee_charges_in_advance_derived` decimal(19,6) NOT NULL DEFAULT '0.000000',
  `penalty_charges_in_advance_derived` decimal(19,6) NOT NULL DEFAULT '0.000000',
  `total_in_advance_derived` decimal(19,6) NOT NULL DEFAULT '0.000000'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `m_loan_rate`
--

CREATE TABLE `m_loan_rate` (
  `loan_id` bigint(20) NOT NULL,
  `rate_id` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `m_loan_recalculation_details`
--

CREATE TABLE `m_loan_recalculation_details` (
  `id` bigint(20) NOT NULL,
  `loan_id` bigint(20) NOT NULL,
  `compound_type_enum` smallint(6) NOT NULL,
  `reschedule_strategy_enum` smallint(6) NOT NULL,
  `rest_frequency_type_enum` smallint(6) NOT NULL,
  `rest_frequency_interval` smallint(6) NOT NULL DEFAULT '0',
  `compounding_frequency_type_enum` smallint(6) DEFAULT NULL,
  `compounding_frequency_interval` smallint(6) DEFAULT NULL,
  `rest_frequency_nth_day_enum` int(11) DEFAULT NULL,
  `rest_frequency_on_day` int(11) DEFAULT NULL,
  `rest_frequency_weekday_enum` int(11) DEFAULT NULL,
  `compounding_frequency_nth_day_enum` int(11) DEFAULT NULL,
  `compounding_frequency_on_day` int(11) DEFAULT NULL,
  `is_compounding_to_be_posted_as_transaction` tinyint(4) NOT NULL DEFAULT '0',
  `compounding_frequency_weekday_enum` int(11) DEFAULT NULL,
  `allow_compounding_on_eod` tinyint(4) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `m_loan_repayment_schedule`
--

CREATE TABLE `m_loan_repayment_schedule` (
  `id` bigint(20) NOT NULL,
  `loan_id` bigint(20) NOT NULL,
  `fromdate` date DEFAULT NULL,
  `duedate` date NOT NULL,
  `installment` smallint(6) NOT NULL,
  `principal_amount` decimal(19,6) DEFAULT NULL,
  `principal_completed_derived` decimal(19,6) DEFAULT NULL,
  `principal_writtenoff_derived` decimal(19,6) DEFAULT NULL,
  `interest_amount` decimal(19,6) DEFAULT NULL,
  `interest_completed_derived` decimal(19,6) DEFAULT NULL,
  `interest_writtenoff_derived` decimal(19,6) DEFAULT NULL,
  `interest_waived_derived` decimal(19,6) DEFAULT NULL,
  `accrual_interest_derived` decimal(19,6) DEFAULT NULL,
  `reschedule_interest_portion` decimal(19,6) DEFAULT NULL,
  `fee_charges_amount` decimal(19,6) DEFAULT NULL,
  `fee_charges_completed_derived` decimal(19,6) DEFAULT NULL,
  `fee_charges_writtenoff_derived` decimal(19,6) DEFAULT NULL,
  `fee_charges_waived_derived` decimal(19,6) DEFAULT NULL,
  `accrual_fee_charges_derived` decimal(19,6) DEFAULT NULL,
  `penalty_charges_amount` decimal(19,6) DEFAULT NULL,
  `penalty_charges_completed_derived` decimal(19,6) DEFAULT NULL,
  `penalty_charges_writtenoff_derived` decimal(19,6) DEFAULT NULL,
  `penalty_charges_waived_derived` decimal(19,6) DEFAULT NULL,
  `accrual_penalty_charges_derived` decimal(19,6) DEFAULT NULL,
  `total_paid_in_advance_derived` decimal(19,6) DEFAULT NULL,
  `total_paid_late_derived` decimal(19,6) DEFAULT NULL,
  `completed_derived` bit(1) NOT NULL,
  `obligations_met_on_date` date DEFAULT NULL,
  `createdby_id` bigint(20) DEFAULT NULL,
  `created_date` datetime DEFAULT NULL,
  `lastmodified_date` datetime DEFAULT NULL,
  `lastmodifiedby_id` bigint(20) DEFAULT NULL,
  `recalculated_interest_component` tinyint(4) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `m_loan_repayment_schedule_history`
--

CREATE TABLE `m_loan_repayment_schedule_history` (
  `id` bigint(20) NOT NULL,
  `loan_id` bigint(20) NOT NULL,
  `loan_reschedule_request_id` bigint(20) DEFAULT NULL,
  `fromdate` date DEFAULT NULL,
  `duedate` date NOT NULL,
  `installment` smallint(6) NOT NULL,
  `principal_amount` decimal(19,6) DEFAULT NULL,
  `interest_amount` decimal(19,6) DEFAULT NULL,
  `fee_charges_amount` decimal(19,6) DEFAULT NULL,
  `penalty_charges_amount` decimal(19,6) DEFAULT NULL,
  `createdby_id` bigint(20) DEFAULT NULL,
  `created_date` datetime DEFAULT NULL,
  `lastmodified_date` datetime DEFAULT NULL,
  `lastmodifiedby_id` bigint(20) DEFAULT NULL,
  `version` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `m_loan_reschedule_request`
--

CREATE TABLE `m_loan_reschedule_request` (
  `id` bigint(20) NOT NULL,
  `loan_id` bigint(20) NOT NULL,
  `status_enum` smallint(6) NOT NULL,
  `reschedule_from_installment` smallint(6) NOT NULL COMMENT 'Rescheduling will start from this installment',
  `reschedule_from_date` date NOT NULL COMMENT 'Rescheduling will start from the installment with due date similar to this date.',
  `recalculate_interest` tinyint(4) DEFAULT NULL COMMENT 'If set to 1, interest will be recalculated starting from the reschedule period.',
  `reschedule_reason_cv_id` int(11) DEFAULT NULL COMMENT 'ID of code value of reason for rescheduling',
  `reschedule_reason_comment` varchar(500) DEFAULT NULL COMMENT 'Text provided in addition to the reason code value',
  `submitted_on_date` date NOT NULL,
  `submitted_by_user_id` bigint(20) NOT NULL,
  `approved_on_date` date DEFAULT NULL,
  `approved_by_user_id` bigint(20) DEFAULT NULL,
  `rejected_on_date` date DEFAULT NULL,
  `rejected_by_user_id` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `m_loan_reschedule_request_term_variations_mapping`
--

CREATE TABLE `m_loan_reschedule_request_term_variations_mapping` (
  `id` bigint(20) NOT NULL,
  `loan_reschedule_request_id` bigint(20) NOT NULL,
  `loan_term_variations_id` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `m_loan_term_variations`
--

CREATE TABLE `m_loan_term_variations` (
  `id` bigint(20) NOT NULL,
  `loan_id` bigint(20) NOT NULL,
  `term_type` smallint(6) NOT NULL,
  `applicable_date` date NOT NULL,
  `decimal_value` decimal(19,6) DEFAULT NULL,
  `date_value` date DEFAULT NULL,
  `is_specific_to_installment` tinyint(4) NOT NULL DEFAULT '0',
  `applied_on_loan_status` smallint(6) NOT NULL,
  `is_active` tinyint(4) NOT NULL DEFAULT '1',
  `parent_id` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `m_loan_topup`
--

CREATE TABLE `m_loan_topup` (
  `id` bigint(20) NOT NULL,
  `loan_id` bigint(20) NOT NULL,
  `closure_loan_id` bigint(20) NOT NULL,
  `account_transfer_details_id` bigint(20) DEFAULT NULL,
  `topup_amount` decimal(19,6) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `m_loan_tranche_charges`
--

CREATE TABLE `m_loan_tranche_charges` (
  `id` bigint(20) NOT NULL,
  `loan_id` bigint(20) NOT NULL,
  `charge_id` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `m_loan_tranche_disbursement_charge`
--

CREATE TABLE `m_loan_tranche_disbursement_charge` (
  `id` bigint(20) NOT NULL,
  `loan_charge_id` bigint(20) NOT NULL,
  `disbursement_detail_id` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `m_loan_transaction`
--

CREATE TABLE `m_loan_transaction` (
  `id` bigint(20) NOT NULL,
  `loan_id` bigint(20) NOT NULL,
  `office_id` bigint(20) NOT NULL,
  `payment_detail_id` bigint(20) DEFAULT NULL,
  `is_reversed` tinyint(4) NOT NULL,
  `external_id` varchar(100) DEFAULT NULL,
  `transaction_type_enum` smallint(6) NOT NULL,
  `transaction_date` date NOT NULL,
  `amount` decimal(19,6) NOT NULL,
  `principal_portion_derived` decimal(19,6) DEFAULT NULL,
  `interest_portion_derived` decimal(19,6) DEFAULT NULL,
  `fee_charges_portion_derived` decimal(19,6) DEFAULT NULL,
  `penalty_charges_portion_derived` decimal(19,6) DEFAULT NULL,
  `overpayment_portion_derived` decimal(19,6) DEFAULT NULL,
  `unrecognized_income_portion` decimal(19,6) DEFAULT NULL,
  `outstanding_loan_balance_derived` decimal(19,6) DEFAULT NULL,
  `submitted_on_date` date NOT NULL,
  `manually_adjusted_or_reversed` tinyint(4) DEFAULT '0',
  `created_date` datetime DEFAULT NULL,
  `appuser_id` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `m_loan_transaction_repayment_schedule_mapping`
--

CREATE TABLE `m_loan_transaction_repayment_schedule_mapping` (
  `id` bigint(20) NOT NULL,
  `loan_transaction_id` bigint(20) NOT NULL,
  `loan_repayment_schedule_id` bigint(20) NOT NULL,
  `amount` decimal(19,6) NOT NULL,
  `principal_portion_derived` decimal(19,6) DEFAULT NULL,
  `interest_portion_derived` decimal(19,6) DEFAULT NULL,
  `fee_charges_portion_derived` decimal(19,6) DEFAULT NULL,
  `penalty_charges_portion_derived` decimal(19,6) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `m_mandatory_savings_schedule`
--

CREATE TABLE `m_mandatory_savings_schedule` (
  `id` bigint(20) NOT NULL,
  `savings_account_id` bigint(20) NOT NULL,
  `fromdate` date DEFAULT NULL,
  `duedate` date NOT NULL,
  `installment` smallint(6) NOT NULL,
  `deposit_amount` decimal(19,6) DEFAULT NULL,
  `deposit_amount_completed_derived` decimal(19,6) DEFAULT NULL,
  `total_paid_in_advance_derived` decimal(19,6) DEFAULT NULL,
  `total_paid_late_derived` decimal(19,6) DEFAULT NULL,
  `completed_derived` bit(1) NOT NULL,
  `obligations_met_on_date` date DEFAULT NULL,
  `createdby_id` bigint(20) DEFAULT NULL,
  `created_date` datetime DEFAULT NULL,
  `lastmodified_date` datetime DEFAULT NULL,
  `lastmodifiedby_id` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `m_meeting`
--

CREATE TABLE `m_meeting` (
  `id` bigint(20) NOT NULL,
  `calendar_instance_id` bigint(20) NOT NULL,
  `meeting_date` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `m_note`
--

CREATE TABLE `m_note` (
  `id` bigint(20) NOT NULL,
  `client_id` bigint(20) DEFAULT NULL,
  `group_id` bigint(20) DEFAULT NULL,
  `loan_id` bigint(20) DEFAULT NULL,
  `loan_transaction_id` bigint(20) DEFAULT NULL,
  `savings_account_id` bigint(20) DEFAULT NULL,
  `savings_account_transaction_id` bigint(20) DEFAULT NULL,
  `share_account_id` bigint(20) DEFAULT NULL,
  `note_type_enum` smallint(6) NOT NULL,
  `note` varchar(1000) DEFAULT NULL,
  `created_date` datetime DEFAULT NULL,
  `createdby_id` bigint(20) DEFAULT NULL,
  `lastmodified_date` datetime DEFAULT NULL,
  `lastmodifiedby_id` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `m_office`
--

CREATE TABLE `m_office` (
  `id` bigint(20) NOT NULL,
  `parent_id` bigint(20) DEFAULT NULL,
  `hierarchy` varchar(100) DEFAULT NULL,
  `external_id` varchar(100) DEFAULT NULL,
  `name` varchar(50) NOT NULL,
  `opening_date` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `m_office`
--

INSERT INTO `m_office` (`id`, `parent_id`, `hierarchy`, `external_id`, `name`, `opening_date`) VALUES
(1, NULL, '.', '1', 'Head Office', '2022-11-21'),
(2, 1, '.2.', '2', 'buruburu', '2022-10-31');

-- --------------------------------------------------------

--
-- Table structure for table `m_office_transaction`
--

CREATE TABLE `m_office_transaction` (
  `id` bigint(20) NOT NULL,
  `from_office_id` bigint(20) DEFAULT NULL,
  `to_office_id` bigint(20) DEFAULT NULL,
  `currency_code` varchar(3) NOT NULL,
  `currency_digits` int(11) NOT NULL,
  `transaction_amount` decimal(19,6) NOT NULL,
  `transaction_date` date NOT NULL,
  `description` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `m_organisation_creditbureau`
--

CREATE TABLE `m_organisation_creditbureau` (
  `id` bigint(20) NOT NULL,
  `alias` varchar(50) NOT NULL,
  `creditbureau_id` bigint(20) NOT NULL,
  `isActive` tinyint(4) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `m_organisation_currency`
--

CREATE TABLE `m_organisation_currency` (
  `id` bigint(20) NOT NULL,
  `code` varchar(3) NOT NULL,
  `decimal_places` smallint(6) NOT NULL,
  `currency_multiplesof` smallint(6) DEFAULT NULL,
  `name` varchar(50) NOT NULL,
  `display_symbol` varchar(10) DEFAULT NULL,
  `internationalized_name_code` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `m_organisation_currency`
--

INSERT INTO `m_organisation_currency` (`id`, `code`, `decimal_places`, `currency_multiplesof`, `name`, `display_symbol`, `internationalized_name_code`) VALUES
(21, 'USD', 2, NULL, 'US Dollar', '$', 'currency.USD');

-- --------------------------------------------------------

--
-- Table structure for table `m_password_validation_policy`
--

CREATE TABLE `m_password_validation_policy` (
  `id` int(11) NOT NULL,
  `regex` text NOT NULL,
  `description` text NOT NULL,
  `active` tinyint(4) NOT NULL DEFAULT '0',
  `key` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `m_password_validation_policy`
--

INSERT INTO `m_password_validation_policy` (`id`, `regex`, `description`, `active`, `key`) VALUES
(1, '^.{1,50}$', 'Password most be at least 1 character and not more that 50 characters long', 1, 'simple'),
(2, '^(?=.*\\d)(?=.*[a-z])(?=.*[A-Z])(?!.*\\s).{6,50}$', 'Password must be at least 6 characters, no more than 50 characters long, must include at least one upper case letter, one lower case letter, one numeric digit and no space', 0, 'secure');

-- --------------------------------------------------------

--
-- Table structure for table `m_payment_detail`
--

CREATE TABLE `m_payment_detail` (
  `id` bigint(20) NOT NULL,
  `payment_type_id` int(11) DEFAULT NULL,
  `account_number` varchar(100) DEFAULT NULL,
  `check_number` varchar(100) DEFAULT NULL,
  `receipt_number` varchar(100) DEFAULT NULL,
  `bank_number` varchar(100) DEFAULT NULL,
  `routing_code` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `m_payment_type`
--

CREATE TABLE `m_payment_type` (
  `id` int(11) NOT NULL,
  `value` varchar(100) DEFAULT NULL,
  `description` varchar(500) DEFAULT NULL,
  `is_cash_payment` tinyint(4) DEFAULT '0',
  `order_position` int(11) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `m_payment_type`
--

INSERT INTO `m_payment_type` (`id`, `value`, `description`, `is_cash_payment`, `order_position`) VALUES
(1, 'Money Transfer', 'Money Transfer', 0, 1);

-- --------------------------------------------------------

--
-- Table structure for table `m_permission`
--

CREATE TABLE `m_permission` (
  `id` bigint(20) NOT NULL,
  `grouping` varchar(45) DEFAULT NULL,
  `code` varchar(100) NOT NULL,
  `entity_name` varchar(100) DEFAULT NULL,
  `action_name` varchar(100) DEFAULT NULL,
  `can_maker_checker` tinyint(4) NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `m_permission`
--

INSERT INTO `m_permission` (`id`, `grouping`, `code`, `entity_name`, `action_name`, `can_maker_checker`) VALUES
(1, 'special', 'ALL_FUNCTIONS', NULL, NULL, 0),
(2, 'special', 'ALL_FUNCTIONS_READ', NULL, NULL, 0),
(3, 'special', 'CHECKER_SUPER_USER', NULL, NULL, 0),
(4, 'special', 'REPORTING_SUPER_USER', NULL, NULL, 0),
(5, 'authorisation', 'READ_PERMISSION', 'PERMISSION', 'READ', 0),
(6, 'authorisation', 'PERMISSIONS_ROLE', 'ROLE', 'PERMISSIONS', 0),
(7, 'authorisation', 'CREATE_ROLE', 'ROLE', 'CREATE', 0),
(8, 'authorisation', 'CREATE_ROLE_CHECKER', 'ROLE', 'CREATE_CHECKER', 0),
(9, 'authorisation', 'READ_ROLE', 'ROLE', 'READ', 0),
(10, 'authorisation', 'UPDATE_ROLE', 'ROLE', 'UPDATE', 0),
(11, 'authorisation', 'UPDATE_ROLE_CHECKER', 'ROLE', 'UPDATE_CHECKER', 0),
(12, 'authorisation', 'DELETE_ROLE', 'ROLE', 'DELETE', 0),
(13, 'authorisation', 'DELETE_ROLE_CHECKER', 'ROLE', 'DELETE_CHECKER', 0),
(14, 'authorisation', 'CREATE_USER', 'USER', 'CREATE', 0),
(15, 'authorisation', 'CREATE_USER_CHECKER', 'USER', 'CREATE_CHECKER', 0),
(16, 'authorisation', 'READ_USER', 'USER', 'READ', 0),
(17, 'authorisation', 'UPDATE_USER', 'USER', 'UPDATE', 0),
(18, 'authorisation', 'UPDATE_USER_CHECKER', 'USER', 'UPDATE_CHECKER', 0),
(19, 'authorisation', 'DELETE_USER', 'USER', 'DELETE', 0),
(20, 'authorisation', 'DELETE_USER_CHECKER', 'USER', 'DELETE_CHECKER', 0),
(21, 'configuration', 'READ_CONFIGURATION', 'CONFIGURATION', 'READ', 0),
(22, 'configuration', 'UPDATE_CONFIGURATION', 'CONFIGURATION', 'UPDATE', 0),
(23, 'configuration', 'UPDATE_CONFIGURATION_CHECKER', 'CONFIGURATION', 'UPDATE_CHECKER', 0),
(24, 'configuration', 'READ_CODE', 'CODE', 'READ', 0),
(25, 'configuration', 'CREATE_CODE', 'CODE', 'CREATE', 0),
(26, 'configuration', 'CREATE_CODE_CHECKER', 'CODE', 'CREATE_CHECKER', 0),
(27, 'configuration', 'UPDATE_CODE', 'CODE', 'UPDATE', 0),
(28, 'configuration', 'UPDATE_CODE_CHECKER', 'CODE', 'UPDATE_CHECKER', 0),
(29, 'configuration', 'DELETE_CODE', 'CODE', 'DELETE', 0),
(30, 'configuration', 'DELETE_CODE_CHECKER', 'CODE', 'DELETE_CHECKER', 0),
(31, 'configuration', 'READ_CODEVALUE', 'CODEVALUE', 'READ', 0),
(32, 'configuration', 'CREATE_CODEVALUE', 'CODEVALUE', 'CREATE', 0),
(33, 'configuration', 'CREATE_CODEVALUE_CHECKER', 'CODEVALUE', 'CREATE_CHECKER', 0),
(34, 'configuration', 'UPDATE_CODEVALUE', 'CODEVALUE', 'UPDATE', 0),
(35, 'configuration', 'UPDATE_CODEVALUE_CHECKER', 'CODEVALUE', 'UPDATE_CHECKER', 0),
(36, 'configuration', 'DELETE_CODEVALUE', 'CODEVALUE', 'DELETE', 0),
(37, 'configuration', 'DELETE_CODEVALUE_CHECKER', 'CODEVALUE', 'DELETE_CHECKER', 0),
(38, 'configuration', 'READ_CURRENCY', 'CURRENCY', 'READ', 0),
(39, 'configuration', 'UPDATE_CURRENCY', 'CURRENCY', 'UPDATE', 0),
(40, 'configuration', 'UPDATE_CURRENCY_CHECKER', 'CURRENCY', 'UPDATE_CHECKER', 0),
(41, 'configuration', 'UPDATE_PERMISSION', 'PERMISSION', 'UPDATE', 0),
(42, 'configuration', 'UPDATE_PERMISSION_CHECKER', 'PERMISSION', 'UPDATE_CHECKER', 0),
(43, 'configuration', 'READ_DATATABLE', 'DATATABLE', 'READ', 0),
(44, 'configuration', 'REGISTER_DATATABLE', 'DATATABLE', 'REGISTER', 0),
(45, 'configuration', 'REGISTER_DATATABLE_CHECKER', 'DATATABLE', 'REGISTER_CHECKER', 0),
(46, 'configuration', 'DEREGISTER_DATATABLE', 'DATATABLE', 'DEREGISTER', 0),
(47, 'configuration', 'DEREGISTER_DATATABLE_CHECKER', 'DATATABLE', 'DEREGISTER_CHECKER', 0),
(48, 'configuration', 'READ_AUDIT', 'AUDIT', 'READ', 0),
(49, 'configuration', 'CREATE_CALENDAR', 'CALENDAR', 'CREATE', 0),
(50, 'configuration', 'READ_CALENDAR', 'CALENDAR', 'READ', 0),
(51, 'configuration', 'UPDATE_CALENDAR', 'CALENDAR', 'UPDATE', 0),
(52, 'configuration', 'DELETE_CALENDAR', 'CALENDAR', 'DELETE', 0),
(53, 'configuration', 'CREATE_CALENDAR_CHECKER', 'CALENDAR', 'CREATE_CHECKER', 0),
(54, 'configuration', 'UPDATE_CALENDAR_CHECKER', 'CALENDAR', 'UPDATE_CHECKER', 0),
(55, 'configuration', 'DELETE_CALENDAR_CHECKER', 'CALENDAR', 'DELETE_CHECKER', 0),
(57, 'organisation', 'READ_CHARGE', 'CHARGE', 'READ', 0),
(58, 'organisation', 'CREATE_CHARGE', 'CHARGE', 'CREATE', 0),
(59, 'organisation', 'CREATE_CHARGE_CHECKER', 'CHARGE', 'CREATE_CHECKER', 0),
(60, 'organisation', 'UPDATE_CHARGE', 'CHARGE', 'UPDATE', 0),
(61, 'organisation', 'UPDATE_CHARGE_CHECKER', 'CHARGE', 'UPDATE_CHECKER', 0),
(62, 'organisation', 'DELETE_CHARGE', 'CHARGE', 'DELETE', 0),
(63, 'organisation', 'DELETE_CHARGE_CHECKER', 'CHARGE', 'DELETE_CHECKER', 0),
(64, 'organisation', 'READ_FUND', 'FUND', 'READ', 0),
(65, 'organisation', 'CREATE_FUND', 'FUND', 'CREATE', 0),
(66, 'organisation', 'CREATE_FUND_CHECKER', 'FUND', 'CREATE_CHECKER', 0),
(67, 'organisation', 'UPDATE_FUND', 'FUND', 'UPDATE', 0),
(68, 'organisation', 'UPDATE_FUND_CHECKER', 'FUND', 'UPDATE_CHECKER', 0),
(69, 'organisation', 'DELETE_FUND', 'FUND', 'DELETE', 0),
(70, 'organisation', 'DELETE_FUND_CHECKER', 'FUND', 'DELETE_CHECKER', 0),
(71, 'organisation', 'READ_LOANPRODUCT', 'LOANPRODUCT', 'READ', 0),
(72, 'organisation', 'CREATE_LOANPRODUCT', 'LOANPRODUCT', 'CREATE', 0),
(73, 'organisation', 'CREATE_LOANPRODUCT_CHECKER', 'LOANPRODUCT', 'CREATE_CHECKER', 0),
(74, 'organisation', 'UPDATE_LOANPRODUCT', 'LOANPRODUCT', 'UPDATE', 0),
(75, 'organisation', 'UPDATE_LOANPRODUCT_CHECKER', 'LOANPRODUCT', 'UPDATE_CHECKER', 0),
(76, 'organisation', 'DELETE_LOANPRODUCT', 'LOANPRODUCT', 'DELETE', 0),
(77, 'organisation', 'DELETE_LOANPRODUCT_CHECKER', 'LOANPRODUCT', 'DELETE_CHECKER', 0),
(78, 'organisation', 'READ_OFFICE', 'OFFICE', 'READ', 0),
(79, 'organisation', 'CREATE_OFFICE', 'OFFICE', 'CREATE', 0),
(80, 'organisation', 'CREATE_OFFICE_CHECKER', 'OFFICE', 'CREATE_CHECKER', 0),
(81, 'organisation', 'UPDATE_OFFICE', 'OFFICE', 'UPDATE', 0),
(82, 'organisation', 'UPDATE_OFFICE_CHECKER', 'OFFICE', 'UPDATE_CHECKER', 0),
(83, 'organisation', 'READ_OFFICETRANSACTION', 'OFFICETRANSACTION', 'READ', 0),
(84, 'organisation', 'DELETE_OFFICE_CHECKER', 'OFFICE', 'DELETE_CHECKER', 0),
(85, 'organisation', 'CREATE_OFFICETRANSACTION', 'OFFICETRANSACTION', 'CREATE', 0),
(86, 'organisation', 'CREATE_OFFICETRANSACTION_CHECKER', 'OFFICETRANSACTION', 'CREATE_CHECKER', 0),
(87, 'organisation', 'DELETE_OFFICETRANSACTION', 'OFFICETRANSACTION', 'DELETE', 0),
(88, 'organisation', 'DELETE_OFFICETRANSACTION_CHECKER', 'OFFICETRANSACTION', 'DELETE_CHECKER', 0),
(89, 'organisation', 'READ_STAFF', 'STAFF', 'READ', 0),
(90, 'organisation', 'CREATE_STAFF', 'STAFF', 'CREATE', 0),
(91, 'organisation', 'CREATE_STAFF_CHECKER', 'STAFF', 'CREATE_CHECKER', 0),
(92, 'organisation', 'UPDATE_STAFF', 'STAFF', 'UPDATE', 0),
(93, 'organisation', 'UPDATE_STAFF_CHECKER', 'STAFF', 'UPDATE_CHECKER', 0),
(94, 'organisation', 'DELETE_STAFF', 'STAFF', 'DELETE', 0),
(95, 'organisation', 'DELETE_STAFF_CHECKER', 'STAFF', 'DELETE_CHECKER', 0),
(96, 'organisation', 'READ_SAVINGSPRODUCT', 'SAVINGSPRODUCT', 'READ', 0),
(97, 'organisation', 'CREATE_SAVINGSPRODUCT', 'SAVINGSPRODUCT', 'CREATE', 0),
(98, 'organisation', 'CREATE_SAVINGSPRODUCT_CHECKER', 'SAVINGSPRODUCT', 'CREATE_CHECKER', 0),
(99, 'organisation', 'UPDATE_SAVINGSPRODUCT', 'SAVINGSPRODUCT', 'UPDATE', 0),
(100, 'organisation', 'UPDATE_SAVINGSPRODUCT_CHECKER', 'SAVINGSPRODUCT', 'UPDATE_CHECKER', 0),
(101, 'organisation', 'DELETE_SAVINGSPRODUCT', 'SAVINGSPRODUCT', 'DELETE', 0),
(102, 'organisation', 'DELETE_SAVINGSPRODUCT_CHECKER', 'SAVINGSPRODUCT', 'DELETE_CHECKER', 0),
(103, 'portfolio', 'READ_LOAN', 'LOAN', 'READ', 0),
(104, 'portfolio', 'CREATE_LOAN', 'LOAN', 'CREATE', 0),
(105, 'portfolio', 'CREATE_LOAN_CHECKER', 'LOAN', 'CREATE_CHECKER', 0),
(106, 'portfolio', 'UPDATE_LOAN', 'LOAN', 'UPDATE', 0),
(107, 'portfolio', 'UPDATE_LOAN_CHECKER', 'LOAN', 'UPDATE_CHECKER', 0),
(108, 'portfolio', 'DELETE_LOAN', 'LOAN', 'DELETE', 0),
(109, 'portfolio', 'DELETE_LOAN_CHECKER', 'LOAN', 'DELETE_CHECKER', 0),
(110, 'portfolio', 'READ_CLIENT', 'CLIENT', 'READ', 0),
(111, 'portfolio', 'CREATE_CLIENT', 'CLIENT', 'CREATE', 0),
(112, 'portfolio', 'CREATE_CLIENT_CHECKER', 'CLIENT', 'CREATE_CHECKER', 0),
(113, 'portfolio', 'UPDATE_CLIENT', 'CLIENT', 'UPDATE', 0),
(114, 'portfolio', 'UPDATE_CLIENT_CHECKER', 'CLIENT', 'UPDATE_CHECKER', 0),
(115, 'portfolio', 'DELETE_CLIENT', 'CLIENT', 'DELETE', 0),
(116, 'portfolio', 'DELETE_CLIENT_CHECKER', 'CLIENT', 'DELETE_CHECKER', 0),
(117, 'portfolio', 'READ_CLIENTIMAGE', 'CLIENTIMAGE', 'READ', 0),
(118, 'portfolio', 'CREATE_CLIENTIMAGE', 'CLIENTIMAGE', 'CREATE', 0),
(119, 'portfolio', 'CREATE_CLIENTIMAGE_CHECKER', 'CLIENTIMAGE', 'CREATE_CHECKER', 0),
(120, 'portfolio', 'DELETE_CLIENTIMAGE', 'CLIENTIMAGE', 'DELETE', 0),
(121, 'portfolio', 'DELETE_CLIENTIMAGE_CHECKER', 'CLIENTIMAGE', 'DELETE_CHECKER', 0),
(122, 'portfolio', 'READ_CLIENTNOTE', 'CLIENTNOTE', 'READ', 0),
(123, 'portfolio', 'CREATE_CLIENTNOTE', 'CLIENTNOTE', 'CREATE', 0),
(124, 'portfolio', 'CREATE_CLIENTNOTE_CHECKER', 'CLIENTNOTE', 'CREATE_CHECKER', 0),
(125, 'portfolio', 'UPDATE_CLIENTNOTE', 'CLIENTNOTE', 'UPDATE', 0),
(126, 'portfolio', 'UPDATE_CLIENTNOTE_CHECKER', 'CLIENTNOTE', 'UPDATE_CHECKER', 0),
(127, 'portfolio', 'DELETE_CLIENTNOTE', 'CLIENTNOTE', 'DELETE', 0),
(128, 'portfolio', 'DELETE_CLIENTNOTE_CHECKER', 'CLIENTNOTE', 'DELETE_CHECKER', 0),
(129, 'portfolio_group', 'READ_GROUPNOTE', 'GROUPNOTE', 'READ', 0),
(130, 'portfolio_group', 'CREATE_GROUPNOTE', 'GROUPNOTE', 'CREATE', 0),
(131, 'portfolio_group', 'UPDATE_GROUPNOTE', 'GROUPNOTE', 'UPDATE', 0),
(132, 'portfolio_group', 'DELETE_GROUPNOTE', 'GROUPNOTE', 'DELETE', 0),
(133, 'portfolio_group', 'CREATE_GROUPNOTE_CHECKER', 'GROUPNOTE', 'CREATE_CHECKER', 0),
(134, 'portfolio_group', 'UPDATE_GROUPNOTE_CHECKER', 'GROUPNOTE', 'UPDATE_CHECKER', 0),
(135, 'portfolio_group', 'DELETE_GROUPNOTE_CHECKER', 'GROUPNOTE', 'DELETE_CHECKER', 0),
(136, 'portfolio', 'READ_LOANNOTE', 'LOANNOTE', 'READ', 0),
(137, 'portfolio', 'CREATE_LOANNOTE', 'LOANNOTE', 'CREATE', 0),
(138, 'portfolio', 'UPDATE_LOANNOTE', 'LOANNOTE', 'UPDATE', 0),
(139, 'portfolio', 'DELETE_LOANNOTE', 'LOANNOTE', 'DELETE', 0),
(140, 'portfolio', 'CREATE_LOANNOTE_CHECKER', 'LOANNOTE', 'CREATE_CHECKER', 0),
(141, 'portfolio', 'UPDATE_LOANNOTE_CHECKER', 'LOANNOTE', 'UPDATE_CHECKER', 0),
(142, 'portfolio', 'DELETE_LOANNOTE_CHECKER', 'LOANNOTE', 'DELETE_CHECKER', 0),
(143, 'portfolio', 'READ_LOANTRANSACTIONNOTE', 'LOANTRANSACTIONNOTE', 'READ', 0),
(144, 'portfolio', 'CREATE_LOANTRANSACTIONNOTE', 'LOANTRANSACTIONNOTE', 'CREATE', 0),
(145, 'portfolio', 'UPDATE_LOANTRANSACTIONNOTE', 'LOANTRANSACTIONNOTE', 'UPDATE', 0),
(146, 'portfolio', 'DELETE_LOANTRANSACTIONNOTE', 'LOANTRANSACTIONNOTE', 'DELETE', 0),
(147, 'portfolio', 'CREATE_LOANTRANSACTIONNOTE_CHECKER', 'LOANTRANSACTIONNOTE', 'CREATE_CHECKER', 0),
(148, 'portfolio', 'UPDATE_LOANTRANSACTIONNOTE_CHECKER', 'LOANTRANSACTIONNOTE', 'UPDATE_CHECKER', 0),
(149, 'portfolio', 'DELETE_LOANTRANSACTIONNOTE_CHECKER', 'LOANTRANSACTIONNOTE', 'DELETE_CHECKER', 0),
(150, 'portfolio', 'READ_SAVINGNOTE', 'SAVINGNOTE', 'READ', 0),
(151, 'portfolio', 'CREATE_SAVINGNOTE', 'SAVINGNOTE', 'CREATE', 0),
(152, 'portfolio', 'UPDATE_SAVINGNOTE', 'SAVINGNOTE', 'UPDATE', 0),
(153, 'portfolio', 'DELETE_SAVINGNOTE', 'SAVINGNOTE', 'DELETE', 0),
(154, 'portfolio', 'CREATE_SAVINGNOTE_CHECKER', 'SAVINGNOTE', 'CREATE_CHECKER', 0),
(155, 'portfolio', 'UPDATE_SAVINGNOTE_CHECKER', 'SAVINGNOTE', 'UPDATE_CHECKER', 0),
(156, 'portfolio', 'DELETE_SAVINGNOTE_CHECKER', 'SAVINGNOTE', 'DELETE_CHECKER', 0),
(157, 'portfolio', 'READ_CLIENTIDENTIFIER', 'CLIENTIDENTIFIER', 'READ', 0),
(158, 'portfolio', 'CREATE_CLIENTIDENTIFIER', 'CLIENTIDENTIFIER', 'CREATE', 0),
(159, 'portfolio', 'CREATE_CLIENTIDENTIFIER_CHECKER', 'CLIENTIDENTIFIER', 'CREATE_CHECKER', 0),
(160, 'portfolio', 'UPDATE_CLIENTIDENTIFIER', 'CLIENTIDENTIFIER', 'UPDATE', 0),
(161, 'portfolio', 'UPDATE_CLIENTIDENTIFIER_CHECKER', 'CLIENTIDENTIFIER', 'UPDATE_CHECKER', 0),
(162, 'portfolio', 'DELETE_CLIENTIDENTIFIER', 'CLIENTIDENTIFIER', 'DELETE', 0),
(163, 'portfolio', 'DELETE_CLIENTIDENTIFIER_CHECKER', 'CLIENTIDENTIFIER', 'DELETE_CHECKER', 0),
(164, 'portfolio', 'READ_DOCUMENT', 'DOCUMENT', 'READ', 0),
(165, 'portfolio', 'CREATE_DOCUMENT', 'DOCUMENT', 'CREATE', 0),
(166, 'portfolio', 'CREATE_DOCUMENT_CHECKER', 'DOCUMENT', 'CREATE_CHECKER', 0),
(167, 'portfolio', 'UPDATE_DOCUMENT', 'DOCUMENT', 'UPDATE', 0),
(168, 'portfolio', 'UPDATE_DOCUMENT_CHECKER', 'DOCUMENT', 'UPDATE_CHECKER', 0),
(169, 'portfolio', 'DELETE_DOCUMENT', 'DOCUMENT', 'DELETE', 0),
(170, 'portfolio', 'DELETE_DOCUMENT_CHECKER', 'DOCUMENT', 'DELETE_CHECKER', 0),
(171, 'portfolio_group', 'READ_GROUP', 'GROUP', 'READ', 0),
(172, 'portfolio_group', 'CREATE_GROUP', 'GROUP', 'CREATE', 0),
(173, 'portfolio_group', 'CREATE_GROUP_CHECKER', 'GROUP', 'CREATE_CHECKER', 0),
(174, 'portfolio_group', 'UPDATE_GROUP', 'GROUP', 'UPDATE', 0),
(175, 'portfolio_group', 'UPDATE_GROUP_CHECKER', 'GROUP', 'UPDATE_CHECKER', 0),
(176, 'portfolio_group', 'DELETE_GROUP', 'GROUP', 'DELETE', 0),
(177, 'portfolio_group', 'DELETE_GROUP_CHECKER', 'GROUP', 'DELETE_CHECKER', 0),
(178, 'portfolio_group', 'UNASSIGNSTAFF_GROUP', 'GROUP', 'UNASSIGNSTAFF', 0),
(179, 'portfolio_group', 'UNASSIGNSTAFF_GROUP_CHECKER', 'GROUP', 'UNASSIGNSTAFF_CHECKER', 0),
(180, 'portfolio', 'CREATE_LOANCHARGE', 'LOANCHARGE', 'CREATE', 0),
(181, 'portfolio', 'CREATE_LOANCHARGE_CHECKER', 'LOANCHARGE', 'CREATE_CHECKER', 0),
(182, 'portfolio', 'UPDATE_LOANCHARGE', 'LOANCHARGE', 'UPDATE', 0),
(183, 'portfolio', 'UPDATE_LOANCHARGE_CHECKER', 'LOANCHARGE', 'UPDATE_CHECKER', 0),
(184, 'portfolio', 'DELETE_LOANCHARGE', 'LOANCHARGE', 'DELETE', 0),
(185, 'portfolio', 'DELETE_LOANCHARGE_CHECKER', 'LOANCHARGE', 'DELETE_CHECKER', 0),
(186, 'portfolio', 'WAIVE_LOANCHARGE', 'LOANCHARGE', 'WAIVE', 0),
(187, 'portfolio', 'WAIVE_LOANCHARGE_CHECKER', 'LOANCHARGE', 'WAIVE_CHECKER', 0),
(188, 'portfolio', 'READ_SAVINGSACCOUNT', 'SAVINGSACCOUNT', 'READ', 0),
(189, 'portfolio', 'CREATE_SAVINGSACCOUNT', 'SAVINGSACCOUNT', 'CREATE', 0),
(190, 'portfolio', 'CREATE_SAVINGSACCOUNT_CHECKER', 'SAVINGSACCOUNT', 'CREATE_CHECKER', 0),
(191, 'portfolio', 'UPDATE_SAVINGSACCOUNT', 'SAVINGSACCOUNT', 'UPDATE', 0),
(192, 'portfolio', 'UPDATE_SAVINGSACCOUNT_CHECKER', 'SAVINGSACCOUNT', 'UPDATE_CHECKER', 0),
(193, 'portfolio', 'DELETE_SAVINGSACCOUNT', 'SAVINGSACCOUNT', 'DELETE', 0),
(194, 'portfolio', 'DELETE_SAVINGSACCOUNT_CHECKER', 'SAVINGSACCOUNT', 'DELETE_CHECKER', 0),
(195, 'portfolio', 'READ_GUARANTOR', 'GUARANTOR', 'READ', 0),
(196, 'portfolio', 'CREATE_GUARANTOR', 'GUARANTOR', 'CREATE', 0),
(197, 'portfolio', 'CREATE_GUARANTOR_CHECKER', 'GUARANTOR', 'CREATE_CHECKER', 0),
(198, 'portfolio', 'UPDATE_GUARANTOR', 'GUARANTOR', 'UPDATE', 0),
(199, 'portfolio', 'UPDATE_GUARANTOR_CHECKER', 'GUARANTOR', 'UPDATE_CHECKER', 0),
(200, 'portfolio', 'DELETE_GUARANTOR', 'GUARANTOR', 'DELETE', 0),
(201, 'portfolio', 'DELETE_GUARANTOR_CHECKER', 'GUARANTOR', 'DELETE_CHECKER', 0),
(202, 'portfolio', 'READ_COLLATERAL', 'COLLATERAL', 'READ', 0),
(203, 'portfolio', 'CREATE_COLLATERAL', 'COLLATERAL', 'CREATE', 0),
(204, 'portfolio', 'UPDATE_COLLATERAL', 'COLLATERAL', 'UPDATE', 0),
(205, 'portfolio', 'DELETE_COLLATERAL', 'COLLATERAL', 'DELETE', 0),
(206, 'portfolio', 'CREATE_COLLATERAL_CHECKER', 'COLLATERAL', 'CREATE_CHECKER', 0),
(207, 'portfolio', 'UPDATE_COLLATERAL_CHECKER', 'COLLATERAL', 'UPDATE_CHECKER', 0),
(208, 'portfolio', 'DELETE_COLLATERAL_CHECKER', 'COLLATERAL', 'DELETE_CHECKER', 0),
(209, 'transaction_loan', 'APPROVE_LOAN', 'LOAN', 'APPROVE', 0),
(211, 'transaction_loan', 'REJECT_LOAN', 'LOAN', 'REJECT', 0),
(213, 'transaction_loan', 'WITHDRAW_LOAN', 'LOAN', 'WITHDRAW', 0),
(215, 'transaction_loan', 'APPROVALUNDO_LOAN', 'LOAN', 'APPROVALUNDO', 0),
(216, 'transaction_loan', 'DISBURSE_LOAN', 'LOAN', 'DISBURSE', 0),
(218, 'transaction_loan', 'DISBURSALUNDO_LOAN', 'LOAN', 'DISBURSALUNDO', 0),
(219, 'transaction_loan', 'REPAYMENT_LOAN', 'LOAN', 'REPAYMENT', 0),
(221, 'transaction_loan', 'ADJUST_LOAN', 'LOAN', 'ADJUST', 0),
(222, 'transaction_loan', 'WAIVEINTERESTPORTION_LOAN', 'LOAN', 'WAIVEINTERESTPORTION', 0),
(223, 'transaction_loan', 'WRITEOFF_LOAN', 'LOAN', 'WRITEOFF', 0),
(224, 'transaction_loan', 'CLOSE_LOAN', 'LOAN', 'CLOSE', 0),
(225, 'transaction_loan', 'CLOSEASRESCHEDULED_LOAN', 'LOAN', 'CLOSEASRESCHEDULED', 0),
(226, 'transaction_loan', 'UPDATELOANOFFICER_LOAN', 'LOAN', 'UPDATELOANOFFICER', 0),
(227, 'transaction_loan', 'UPDATELOANOFFICER_LOAN_CHECKER', 'LOAN', 'UPDATELOANOFFICER_CHECKER', 0),
(228, 'transaction_loan', 'REMOVELOANOFFICER_LOAN', 'LOAN', 'REMOVELOANOFFICER', 0),
(229, 'transaction_loan', 'REMOVELOANOFFICER_LOAN_CHECKER', 'LOAN', 'REMOVELOANOFFICER_CHECKER', 0),
(230, 'transaction_loan', 'BULKREASSIGN_LOAN', 'LOAN', 'BULKREASSIGN', 0),
(231, 'transaction_loan', 'BULKREASSIGN_LOAN_CHECKER', 'LOAN', 'BULKREASSIGN_CHECKER', 0),
(232, 'transaction_loan', 'APPROVE_LOAN_CHECKER', 'LOAN', 'APPROVE_CHECKER', 0),
(234, 'transaction_loan', 'REJECT_LOAN_CHECKER', 'LOAN', 'REJECT_CHECKER', 0),
(236, 'transaction_loan', 'WITHDRAW_LOAN_CHECKER', 'LOAN', 'WITHDRAW_CHECKER', 0),
(238, 'transaction_loan', 'APPROVALUNDO_LOAN_CHECKER', 'LOAN', 'APPROVALUNDO_CHECKER', 0),
(239, 'transaction_loan', 'DISBURSE_LOAN_CHECKER', 'LOAN', 'DISBURSE_CHECKER', 0),
(241, 'transaction_loan', 'DISBURSALUNDO_LOAN_CHECKER', 'LOAN', 'DISBURSALUNDO_CHECKER', 0),
(242, 'transaction_loan', 'REPAYMENT_LOAN_CHECKER', 'LOAN', 'REPAYMENT_CHECKER', 0),
(244, 'transaction_loan', 'ADJUST_LOAN_CHECKER', 'LOAN', 'ADJUST_CHECKER', 0),
(245, 'transaction_loan', 'WAIVEINTERESTPORTION_LOAN_CHECKER', 'LOAN', 'WAIVEINTERESTPORTION_CHECKER', 0),
(246, 'transaction_loan', 'WRITEOFF_LOAN_CHECKER', 'LOAN', 'WRITEOFF_CHECKER', 0),
(247, 'transaction_loan', 'CLOSE_LOAN_CHECKER', 'LOAN', 'CLOSE_CHECKER', 0),
(248, 'transaction_loan', 'CLOSEASRESCHEDULED_LOAN_CHECKER', 'LOAN', 'CLOSEASRESCHEDULED_CHECKER', 0),
(249, 'transaction_savings', 'DEPOSIT_SAVINGSACCOUNT', 'SAVINGSACCOUNT', 'DEPOSIT', 0),
(250, 'transaction_savings', 'DEPOSIT_SAVINGSACCOUNT_CHECKER', 'SAVINGSACCOUNT', 'DEPOSIT_CHECKER', 0),
(251, 'transaction_savings', 'WITHDRAWAL_SAVINGSACCOUNT', 'SAVINGSACCOUNT', 'WITHDRAWAL', 0),
(252, 'transaction_savings', 'WITHDRAWAL_SAVINGSACCOUNT_CHECKER', 'SAVINGSACCOUNT', 'WITHDRAWAL_CHECKER', 0),
(253, 'transaction_savings', 'ACTIVATE_SAVINGSACCOUNT', 'SAVINGSACCOUNT', 'ACTIVATE', 0),
(254, 'transaction_savings', 'ACTIVATE_SAVINGSACCOUNT_CHECKER', 'SAVINGSACCOUNT', 'ACTIVATE_CHECKER', 0),
(255, 'transaction_savings', 'CALCULATEINTEREST_SAVINGSACCOUNT', 'SAVINGSACCOUNT', 'CALCULATEINTEREST', 0),
(256, 'transaction_savings', 'CALCULATEINTEREST_SAVINGSACCOUNT_CHECKER', 'SAVINGSACCOUNT', 'CALCULATEINTEREST_CHECKER', 0),
(257, 'accounting', 'CREATE_GLACCOUNT', 'GLACCOUNT', 'CREATE', 0),
(258, 'accounting', 'UPDATE_GLACCOUNT', 'GLACCOUNT', 'UPDATE', 0),
(259, 'accounting', 'DELETE_GLACCOUNT', 'GLACCOUNT', 'DELETE', 0),
(260, 'accounting', 'CREATE_GLCLOSURE', 'GLCLOSURE', 'CREATE', 0),
(261, 'accounting', 'UPDATE_GLCLOSURE', 'GLCLOSURE', 'UPDATE', 0),
(262, 'accounting', 'DELETE_GLCLOSURE', 'GLCLOSURE', 'DELETE', 0),
(263, 'accounting', 'CREATE_JOURNALENTRY', 'JOURNALENTRY', 'CREATE', 0),
(264, 'accounting', 'REVERSE_JOURNALENTRY', 'JOURNALENTRY', 'REVERSE', 0),
(265, 'report', 'READ_Active Loans - Details', 'Active Loans - Details', 'READ', 0),
(266, 'report', 'READ_Active Loans - Summary', 'Active Loans - Summary', 'READ', 0),
(267, 'report', 'READ_Active Loans by Disbursal Period', 'Active Loans by Disbursal Period', 'READ', 0),
(268, 'report', 'READ_Active Loans in last installment', 'Active Loans in last installment', 'READ', 0),
(269, 'report', 'READ_Active Loans in last installment Summary', 'Active Loans in last installment Summary', 'READ', 0),
(270, 'report', 'READ_Active Loans Passed Final Maturity', 'Active Loans Passed Final Maturity', 'READ', 0),
(271, 'report', 'READ_Active Loans Passed Final Maturity Summary', 'Active Loans Passed Final Maturity Summary', 'READ', 0),
(272, 'report', 'READ_Aging Detail', 'Aging Detail', 'READ', 0),
(273, 'report', 'READ_Aging Summary (Arrears in Months)', 'Aging Summary (Arrears in Months)', 'READ', 0),
(274, 'report', 'READ_Aging Summary (Arrears in Weeks)', 'Aging Summary (Arrears in Weeks)', 'READ', 0),
(275, 'report', 'READ_Balance Sheet', 'Balance Sheet', 'READ', 0),
(276, 'report', 'READ_Branch Expected Cash Flow', 'Branch Expected Cash Flow', 'READ', 0),
(277, 'report', 'READ_Client Listing', 'Client Listing', 'READ', 0),
(278, 'report', 'READ_Client Loans Listing', 'Client Loans Listing', 'READ', 0),
(279, 'report', 'READ_Expected Payments By Date - Basic', 'Expected Payments By Date - Basic', 'READ', 0),
(280, 'report', 'READ_Expected Payments By Date - Formatted', 'Expected Payments By Date - Formatted', 'READ', 0),
(281, 'report', 'READ_Funds Disbursed Between Dates Summary', 'Funds Disbursed Between Dates Summary', 'READ', 0),
(282, 'report', 'READ_Funds Disbursed Between Dates Summary by Office', 'Funds Disbursed Between Dates Summary by Office', 'READ', 0),
(283, 'report', 'READ_Income Statement', 'Income Statement', 'READ', 0),
(284, 'report', 'READ_Loan Account Schedule', 'Loan Account Schedule', 'READ', 0),
(285, 'report', 'READ_Loans Awaiting Disbursal', 'Loans Awaiting Disbursal', 'READ', 0),
(286, 'report', 'READ_Loans Awaiting Disbursal Summary', 'Loans Awaiting Disbursal Summary', 'READ', 0),
(287, 'report', 'READ_Loans Awaiting Disbursal Summary by Month', 'Loans Awaiting Disbursal Summary by Month', 'READ', 0),
(288, 'report', 'READ_Loans Pending Approval', 'Loans Pending Approval', 'READ', 0),
(289, 'report', 'READ_Obligation Met Loans Details', 'Obligation Met Loans Details', 'READ', 0),
(290, 'report', 'READ_Obligation Met Loans Summary', 'Obligation Met Loans Summary', 'READ', 0),
(291, 'report', 'READ_Portfolio at Risk', 'Portfolio at Risk', 'READ', 0),
(292, 'report', 'READ_Portfolio at Risk by Branch', 'Portfolio at Risk by Branch', 'READ', 0),
(293, 'report', 'READ_Rescheduled Loans', 'Rescheduled Loans', 'READ', 0),
(294, 'report', 'READ_Trial Balance', 'Trial Balance', 'READ', 0),
(295, 'report', 'READ_Written-Off Loans', 'Written-Off Loans', 'READ', 0),
(296, 'transaction_savings', 'POSTINTEREST_SAVINGSACCOUNT', 'SAVINGSACCOUNT', 'POSTINTEREST', 1),
(297, 'transaction_savings', 'POSTINTEREST_SAVINGSACCOUNT_CHECKER', 'SAVINGSACCOUNT', 'POSTINTEREST_CHECKER', 0),
(298, 'portfolio_center', 'READ_CENTER', 'CENTER', 'READ', 0),
(299, 'portfolio_center', 'CREATE_CENTER', 'CENTER', 'CREATE', 0),
(300, 'portfolio_center', 'CREATE_CENTER_CHECKER', 'CENTER', 'CREATE_CHECKER', 0),
(301, 'portfolio_center', 'UPDATE_CENTER', 'CENTER', 'UPDATE', 0),
(302, 'portfolio_center', 'UPDATE_CENTER_CHECKER', 'CENTER', 'UPDATE_CHECKER', 0),
(303, 'portfolio_center', 'DELETE_CENTER', 'CENTER', 'DELETE', 0),
(304, 'portfolio_center', 'DELETE_CENTER_CHECKER', 'CENTER', 'DELETE_CHECKER', 0),
(305, 'configuration', 'READ_REPORT', 'REPORT', 'READ', 0),
(306, 'configuration', 'CREATE_REPORT', 'REPORT', 'CREATE', 0),
(307, 'configuration', 'CREATE_REPORT_CHECKER', 'REPORT', 'CREATE_CHECKER', 0),
(308, 'configuration', 'UPDATE_REPORT', 'REPORT', 'UPDATE', 0),
(309, 'configuration', 'UPDATE_REPORT_CHECKER', 'REPORT', 'UPDATE_CHECKER', 0),
(310, 'configuration', 'DELETE_REPORT', 'REPORT', 'DELETE', 0),
(311, 'configuration', 'DELETE_REPORT_CHECKER', 'REPORT', 'DELETE_CHECKER', 0),
(312, 'portfolio', 'ACTIVATE_CLIENT', 'CLIENT', 'ACTIVATE', 1),
(313, 'portfolio', 'ACTIVATE_CLIENT_CHECKER', 'CLIENT', 'ACTIVATE_CHECKER', 0),
(314, 'portfolio_center', 'ACTIVATE_CENTER', 'CENTER', 'ACTIVATE', 1),
(315, 'portfolio_center', 'ACTIVATE_CENTER_CHECKER', 'CENTER', 'ACTIVATE_CHECKER', 0),
(316, 'portfolio_group', 'ACTIVATE_GROUP', 'GROUP', 'ACTIVATE', 1),
(317, 'portfolio_group', 'ACTIVATE_GROUP_CHECKER', 'GROUP', 'ACTIVATE_CHECKER', 0),
(318, 'portfolio_group', 'ASSOCIATECLIENTS_GROUP', 'GROUP', 'ASSOCIATECLIENTS', 0),
(319, 'portfolio_group', 'DISASSOCIATECLIENTS_GROUP', 'GROUP', 'DISASSOCIATECLIENTS', 0),
(320, 'portfolio_group', 'SAVECOLLECTIONSHEET_GROUP', 'GROUP', 'SAVECOLLECTIONSHEET', 0),
(321, 'portfolio_center', 'SAVECOLLECTIONSHEET_CENTER', 'CENTER', 'SAVECOLLECTIONSHEET', 0),
(323, 'accounting', 'DELETE_ACCOUNTINGRULE', 'ACCOUNTINGRULE', 'DELETE', 0),
(324, 'accounting', 'CREATE_ACCOUNTINGRULE', 'ACCOUNTINGRULE', 'CREATE', 0),
(325, 'accounting', 'UPDATE_ACCOUNTINGRULE', 'ACCOUNTINGRULE', 'UPDATE', 0),
(326, 'report', 'READ_GroupSummaryCounts', 'GroupSummaryCounts', 'READ', 0),
(327, 'report', 'READ_GroupSummaryAmounts', 'GroupSummaryAmounts', 'READ', 0),
(328, 'configuration', 'CREATE_DATATABLE', 'DATATABLE', 'CREATE', 0),
(329, 'configuration', 'CREATE_DATATABLE_CHECKER', 'DATATABLE', 'CREATE_CHECKER', 0),
(330, 'configuration', 'UPDATE_DATATABLE', 'DATATABLE', 'UPDATE', 0),
(331, 'configuration', 'UPDATE_DATATABLE_CHECKER', 'DATATABLE', 'UPDATE_CHECKER', 0),
(332, 'configuration', 'DELETE_DATATABLE', 'DATATABLE', 'DELETE', 0),
(333, 'configuration', 'DELETE_DATATABLE_CHECKER', 'DATATABLE', 'DELETE_CHECKER', 0),
(334, 'organisation', 'CREATE_HOLIDAY', 'HOLIDAY', 'CREATE', 0),
(335, 'portfolio_group', 'ASSIGNROLE_GROUP', 'GROUP', 'ASSIGNROLE', 0),
(336, 'portfolio_group', 'UNASSIGNROLE_GROUP', 'GROUP', 'UNASSIGNROLE', 0),
(337, 'portfolio_group', 'UPDATEROLE_GROUP', 'GROUP', 'UPDATEROLE', 0),
(346, 'report', 'READ_TxnRunningBalances', 'TxnRunningBalances', 'READ', 0),
(347, 'portfolio', 'UNASSIGNSTAFF_CLIENT', 'CLIENT', 'UNASSIGNSTAFF', 0),
(348, 'portfolio', 'ASSIGNSTAFF_CLIENT', 'CLIENT', 'ASSIGNSTAFF', 0),
(349, 'portfolio', 'CLOSE_CLIENT', 'CLIENT', 'CLOSE', 1),
(350, 'report', 'READ_FieldAgentStats', 'FieldAgentStats', 'READ', 0),
(351, 'report', 'READ_FieldAgentPrograms', 'FieldAgentPrograms', 'READ', 0),
(352, 'report', 'READ_ProgramDetails', 'ProgramDetails', 'READ', 0),
(353, 'report', 'READ_ChildrenStaffList', 'ChildrenStaffList', 'READ', 0),
(354, 'report', 'READ_CoordinatorStats', 'CoordinatorStats', 'READ', 0),
(355, 'report', 'READ_BranchManagerStats', 'BranchManagerStats', 'READ', 0),
(356, 'report', 'READ_ProgramDirectorStats', 'ProgramDirectorStats', 'READ', 0),
(357, 'report', 'READ_ProgramStats', 'ProgramStats', 'READ', 0),
(358, 'transaction_savings', 'APPROVE_SAVINGSACCOUNT', 'SAVINGSACCOUNT', 'APPROVE', 1),
(359, 'transaction_savings', 'REJECT_SAVINGSACCOUNT', 'SAVINGSACCOUNT', 'REJECT', 1),
(360, 'transaction_savings', 'WITHDRAW_SAVINGSACCOUNT', 'SAVINGSACCOUNT', 'WITHDRAW', 1),
(361, 'transaction_savings', 'APPROVALUNDO_SAVINGSACCOUNT', 'SAVINGSACCOUNT', 'APPROVALUNDO', 1),
(362, 'transaction_savings', 'CLOSE_SAVINGSACCOUNT', 'SAVINGSACCOUNT', 'CLOSE', 1),
(363, 'transaction_savings', 'APPROVE_SAVINGSACCOUNT_CHECKER', 'SAVINGSACCOUNT', 'APPROVE_CHECKER', 0),
(364, 'transaction_savings', 'REJECT_SAVINGSACCOUNT_CHECKER', 'SAVINGSACCOUNT', 'REJECT_CHECKER', 0),
(365, 'transaction_savings', 'WITHDRAW_SAVINGSACCOUNT_CHECKER', 'SAVINGSACCOUNT', 'WITHDRAW_CHECKER', 0),
(366, 'transaction_savings', 'APPROVALUNDO_SAVINGSACCOUNT_CHECKER', 'SAVINGSACCOUNT', 'APPROVALUNDO_CHECKER', 0),
(367, 'transaction_savings', 'CLOSE_SAVINGSACCOUNT_CHECKER', 'SAVINGSACCOUNT', 'CLOSE_CHECKER', 0),
(368, 'transaction_savings', 'UNDOTRANSACTION_SAVINGSACCOUNT', 'SAVINGSACCOUNT', 'UNDOTRANSACTION', 1),
(369, 'transaction_savings', 'UNDOTRANSACTION_SAVINGSACCOUNT_CHECKER', 'SAVINGSACCOUNT', 'UNDOTRANSACTION_CHECKER', 0),
(370, 'portfolio', 'CREATE_PRODUCTMIX', 'PRODUCTMIX', 'CREATE', 0),
(371, 'portfolio', 'UPDATE_PRODUCTMIX', 'PRODUCTMIX', 'UPDATE', 0),
(372, 'portfolio', 'DELETE_PRODUCTMIX', 'PRODUCTMIX', 'DELETE', 0),
(373, 'jobs', 'UPDATE_SCHEDULER', 'SCHEDULER', 'UPDATE', 0),
(374, 'transaction_savings', 'APPLYANNUALFEE_SAVINGSACCOUNT', 'SAVINGSACCOUNT', 'APPLYANNUALFEE', 1),
(375, 'transaction_savings', 'APPLYANNUALFEE_SAVINGSACCOUNT_CHECKER', 'SAVINGSACCOUNT', 'APPLYANNUALFEE_CHECKER', 0),
(376, 'portfolio_group', 'ASSIGNSTAFF_GROUP', 'GROUP', 'ASSIGNSTAFF', 0),
(377, 'transaction_savings', 'READ_ACCOUNTTRANSFER', 'ACCOUNTTRANSFER', 'READ', 0),
(378, 'transaction_savings', 'CREATE_ACCOUNTTRANSFER', 'ACCOUNTTRANSFER', 'CREATE', 1),
(379, 'transaction_savings', 'CREATE_ACCOUNTTRANSFER_CHECKER', 'ACCOUNTTRANSFER', 'CREATE_CHECKER', 0),
(380, 'transaction_savings', 'ADJUSTTRANSACTION_SAVINGSACCOUNT', 'SAVINGSACCOUNT', 'ADJUSTTRANSACTION', 0),
(381, 'portfolio', 'CREATE_MEETING', 'MEETING', 'CREATE', 0),
(382, 'portfolio', 'UPDATE_MEETING', 'MEETING', 'UPDATE', 0),
(383, 'portfolio', 'DELETE_MEETING', 'MEETING', 'DELETE', 0),
(384, 'portfolio', 'SAVEORUPDATEATTENDANCE_MEETING', 'MEETING', 'SAVEORUPDATEATTENDANCE', 0),
(385, 'portfolio_group', 'TRANSFERCLIENTS_GROUP', 'GROUP', 'TRANSFERCLIENTS', 0),
(386, 'portfolio_group', 'TRANSFERCLIENTS_GROUP_CHECKER', 'GROUP', 'TRANSFERCLIENTS_CHECKER', 0),
(389, 'portfolio', 'PROPOSETRANSFER_CLIENT', 'CLIENT', 'PROPOSETRANSFER', 0),
(390, 'portfolio', 'PROPOSETRANSFER_CLIENT_CHECKER', 'CLIENT', 'PROPOSETRANSFER_CHECKER', 0),
(391, 'portfolio', 'ACCEPTTRANSFER_CLIENT', 'CLIENT', 'ACCEPTTRANSFER', 0),
(392, 'portfolio', 'ACCEPTTRANSFER_CLIENT_CHECKER', 'CLIENT', 'ACCEPTTRANSFER_CHECKER', 0),
(393, 'portfolio', 'REJECTTRANSFER_CLIENT', 'CLIENT', 'REJECTTRANSFER', 0),
(394, 'portfolio', 'REJECTTRANSFER_CLIENT_CHECKER', 'CLIENT', 'REJECTTRANSFER_CHECKER', 0),
(395, 'portfolio', 'WITHDRAWTRANSFER_CLIENT', 'CLIENT', 'WITHDRAWTRANSFER', 0),
(396, 'portfolio', 'WITHDRAWTRANSFER_CLIENT_CHECKER', 'CLIENT', 'WITHDRAWTRANSFER_CHECKER', 0),
(397, 'portfolio', 'CLOSE_GROUP', 'GROUP', 'CLOSE', 1),
(398, 'portfolio', 'CLOSE_CENTER', 'CENTER', 'CLOSE', 1),
(399, 'xbrlmapping', 'UPDATE_XBRLMAPPING', 'XBRLMAPPING', 'UPDATE', 0),
(400, 'configuration', 'READ_CACHE', 'CACHE', 'READ', 0),
(401, 'configuration', 'UPDATE_CACHE', 'CACHE', 'UPDATE', 0),
(402, 'transaction_loan', 'PAY_LOANCHARGE', 'LOANCHARGE', 'PAY', 0),
(403, 'portfolio', 'CREATE_SAVINGSACCOUNTCHARGE', 'SAVINGSACCOUNTCHARGE', 'CREATE', 0),
(404, 'portfolio', 'CREATE_SAVINGSACCOUNTCHARGE_CHECKER', 'SAVINGSACCOUNTCHARGE', 'CREATE_CHECKER', 0),
(405, 'portfolio', 'UPDATE_SAVINGSACCOUNTCHARGE', 'SAVINGSACCOUNTCHARGE', 'UPDATE', 0),
(406, 'portfolio', 'UPDATE_SAVINGSACCOUNTCHARGE_CHECKER', 'SAVINGSACCOUNTCHARGE', 'UPDATE_CHECKER', 0),
(407, 'portfolio', 'DELETE_SAVINGSACCOUNTCHARGE', 'SAVINGSACCOUNTCHARGE', 'DELETE', 0),
(408, 'portfolio', 'DELETE_SAVINGSACCOUNTCHARGE_CHECKER', 'SAVINGSACCOUNTCHARGE', 'DELETE_CHECKER', 0),
(409, 'portfolio', 'WAIVE_SAVINGSACCOUNTCHARGE', 'SAVINGSACCOUNTCHARGE', 'WAIVE', 0),
(410, 'portfolio', 'WAIVE_SAVINGSACCOUNTCHARGE_CHECKER', 'SAVINGSACCOUNTCHARGE', 'WAIVE_CHECKER', 0),
(411, 'portfolio', 'PAY_SAVINGSACCOUNTCHARGE', 'SAVINGSACCOUNTCHARGE', 'PAY', 0),
(412, 'portfolio', 'PAY_SAVINGSACCOUNTCHARGE_CHECKER', 'SAVINGSACCOUNTCHARGE', 'PAY_CHECKER', 0),
(413, 'portfolio', 'PROPOSEANDACCEPTTRANSFER_CLIENT', 'CLIENT', 'PROPOSEANDACCEPTTRANSFER', 0),
(414, 'portfolio', 'PROPOSEANDACCEPTTRANSFER_CLIENT_CHECKER', 'CLIENT', 'PROPOSEANDACCEPTTRANSFER_CHECKER', 0),
(415, 'organisation', 'DELETE_TEMPLATE', 'TEMPLATE', 'DELETE', 0),
(416, 'organisation', 'CREATE_TEMPLATE', 'TEMPLATE', 'CREATE', 0),
(417, 'organisation', 'UPDATE_TEMPLATE', 'TEMPLATE', 'UPDATE', 0),
(418, 'organisation', 'READ_TEMPLATE', 'TEMPLATE', 'READ', 0),
(419, 'accounting', 'UPDATERUNNINGBALANCE_JOURNALENTRY', 'JOURNALENTRY', 'UPDATERUNNINGBALANCE', 0),
(420, 'organisation', 'READ_SMS', 'SMS', 'READ', 0),
(421, 'organisation', 'CREATE_SMS', 'SMS', 'CREATE', 0),
(422, 'organisation', 'CREATE_SMS_CHECKER', 'SMS', 'CREATE_CHECKER', 0),
(423, 'organisation', 'UPDATE_SMS', 'SMS', 'UPDATE', 0),
(424, 'organisation', 'UPDATE_SMS_CHECKER', 'SMS', 'UPDATE_CHECKER', 0),
(425, 'organisation', 'DELETE_SMS', 'SMS', 'DELETE', 0),
(426, 'organisation', 'DELETE_SMS_CHECKER', 'SMS', 'DELETE_CHECKER', 0),
(427, 'organisation', 'CREATE_HOLIDAY_CHECKER', 'HOLIDAY', 'CREATE_CHECKER', 0),
(428, 'organisation', 'ACTIVATE_HOLIDAY', 'HOLIDAY', 'ACTIVATE', 0),
(429, 'organisation', 'ACTIVATE_HOLIDAY_CHECKER', 'HOLIDAY', 'ACTIVATE_CHECKER', 0),
(430, 'organisation', 'UPDATE_HOLIDAY', 'HOLIDAY', 'UPDATE', 0),
(431, 'organisation', 'UPDATE_HOLIDAY_CHECKER', 'HOLIDAY', 'UPDATE_CHECKER', 0),
(432, 'organisation', 'DELETE_HOLIDAY', 'HOLIDAY', 'DELETE', 0),
(433, 'organisation', 'DELETE_HOLIDAY_CHECKER', 'HOLIDAY', 'DELETE_CHECKER', 0),
(434, 'transaction_loan', 'UNDOWRITEOFF_LOAN', 'LOAN', 'UNDOWRITEOFF', 0),
(435, 'portfolio', 'READ_SAVINGSACCOUNTCHARGE', 'SAVINGSACCOUNTCHARGE', 'READ', 0),
(436, 'accounting', 'CREATE_JOURNALENTRY_CHECKER', 'JOURNALENTRY', 'CREATE_CHECKER', 0),
(437, 'portfolio', 'UPDATE_DISBURSEMENTDETAIL', 'DISBURSEMENTDETAIL', 'UPDATE', 0),
(438, 'portfolio', 'UPDATESAVINGSACCOUNT_CLIENT', 'CLIENT', 'UPDATESAVINGSACCOUNT', 0),
(439, 'accounting', 'READ_ACCOUNTINGRULE', 'ACCOUNTINGRULE', 'READ', 0),
(440, 'accounting', 'READ_JOURNALENTRY', 'JOURNALENTRY', 'READ', 0),
(441, 'accounting', 'READ_GLACCOUNT', 'GLACCOUNT', 'READ', 0),
(442, 'accounting', 'READ_GLCLOSURE', 'GLCLOSURE', 'READ', 0),
(443, 'organisation', 'READ_HOLIDAY', 'HOLIDAY', 'READ', 0),
(444, 'jobs', 'READ_SCHEDULER', 'SCHEDULER', 'READ', 0),
(445, 'portfolio', 'READ_PRODUCTMIX', 'PRODUCTMIX', 'READ', 0),
(446, 'portfolio', 'READ_MEETING', 'MEETING', 'READ', 0),
(447, 'jobs', 'EXECUTEJOB_SCHEDULER', 'SCHEDULER', 'EXECUTEJOB', 0),
(448, 'account_transfer', 'READ_STANDINGINSTRUCTION ', 'STANDINGINSTRUCTION ', 'READ', 0),
(449, 'account_transfer', 'CREATE_STANDINGINSTRUCTION ', 'STANDINGINSTRUCTION ', 'CREATE', 0),
(450, 'account_transfer', 'UPDATE_STANDINGINSTRUCTION ', 'STANDINGINSTRUCTION ', 'UPDATE', 0),
(451, 'account_transfer', 'DELETE_STANDINGINSTRUCTION ', 'STANDINGINSTRUCTION ', 'DELETE', 0),
(452, 'portfolio', 'CREATE_INTERESTRATECHART', 'INTERESTRATECHART', 'CREATE', 0),
(453, 'portfolio', 'CREATE_INTERESTRATECHART_CHECKER', 'INTERESTRATECHART', 'CREATE_CHECKER', 0),
(454, 'portfolio', 'UPDATE_INTERESTRATECHART', 'INTERESTRATECHART', 'UPDATE', 0),
(455, 'portfolio', 'DELETE_INTERESTRATECHART', 'INTERESTRATECHART', 'DELETE', 0),
(456, 'portfolio', 'UPDATE_INTERESTRATECHART_CHECKER', 'INTERESTRATECHART', 'UPDATE_CHECKER', 0),
(457, 'portfolio', 'DELETE_INTERESTRATECHART_CHECKER', 'INTERESTRATECHART', 'DELETE_CHECKER', 0),
(458, 'portfolio', 'CREATE_CHARTSLAB', 'CHARTSLAB', 'CREATE', 0),
(459, 'portfolio', 'CREATE_CHARTSLAB_CHECKER', 'CHARTSLAB', 'CREATE_CHECKER', 0),
(460, 'portfolio', 'UPDATE_CHARTSLAB', 'CHARTSLAB', 'UPDATE', 0),
(461, 'portfolio', 'DELETE_CHARTSLAB', 'CHARTSLAB', 'DELETE', 0),
(462, 'portfolio', 'UPDATE_CHARTSLAB_CHECKER', 'CHARTSLAB', 'UPDATE_CHECKER', 0),
(463, 'portfolio', 'DELETE_CHARTSLAB_CHECKER', 'CHARTSLAB', 'DELETE_CHECKER', 0),
(464, 'portfolio', 'CREATE_FIXEDDEPOSITPRODUCT', 'FIXEDDEPOSITPRODUCT', 'CREATE', 0),
(465, 'portfolio', 'CREATE_FIXEDDEPOSITPRODUCT_CHECKER', 'FIXEDDEPOSITPRODUCT', 'CREATE_CHECKER', 0),
(466, 'portfolio', 'UPDATE_FIXEDDEPOSITPRODUCT', 'FIXEDDEPOSITPRODUCT', 'UPDATE', 0),
(467, 'portfolio', 'DELETE_FIXEDDEPOSITPRODUCT', 'FIXEDDEPOSITPRODUCT', 'DELETE', 0),
(468, 'portfolio', 'UPDATE_FIXEDDEPOSITPRODUCT_CHECKER', 'FIXEDDEPOSITPRODUCT', 'UPDATE_CHECKER', 0),
(469, 'portfolio', 'DELETE_FIXEDDEPOSITPRODUCT_CHECKER', 'FIXEDDEPOSITPRODUCT', 'DELETE_CHECKER', 0),
(470, 'portfolio', 'CREATE_RECURRINGDEPOSITPRODUCT', 'RECURRINGDEPOSITPRODUCT', 'CREATE', 0),
(471, 'portfolio', 'CREATE_RECURRINGDEPOSITPRODUCT_CHECKER', 'RECURRINGDEPOSITPRODUCT', 'CREATE_CHECKER', 0),
(472, 'portfolio', 'UPDATE_RECURRINGDEPOSITPRODUCT', 'RECURRINGDEPOSITPRODUCT', 'UPDATE', 0),
(473, 'portfolio', 'DELETE_RECURRINGDEPOSITPRODUCT', 'RECURRINGDEPOSITPRODUCT', 'DELETE', 0),
(474, 'portfolio', 'UPDATE_RECURRINGDEPOSITPRODUCT_CHECKER', 'RECURRINGDEPOSITPRODUCT', 'UPDATE_CHECKER', 0),
(475, 'portfolio', 'DELETE_RECURRINGDEPOSITPRODUCT_CHECKER', 'RECURRINGDEPOSITPRODUCT', 'DELETE_CHECKER', 0),
(476, 'portfolio', 'READ_FIXEDDEPOSITACCOUNT', 'FIXEDDEPOSITACCOUNT', 'READ', 0),
(477, 'portfolio', 'CREATE_FIXEDDEPOSITACCOUNT', 'FIXEDDEPOSITACCOUNT', 'CREATE', 0),
(478, 'portfolio', 'CREATE_FIXEDDEPOSITACCOUNT_CHECKER', 'FIXEDDEPOSITACCOUNT', 'CREATE_CHECKER', 0),
(479, 'portfolio', 'UPDATE_FIXEDDEPOSITACCOUNT', 'FIXEDDEPOSITACCOUNT', 'UPDATE', 0),
(480, 'portfolio', 'UPDATE_FIXEDDEPOSITACCOUNT_CHECKER', 'FIXEDDEPOSITACCOUNT', 'UPDATE_CHECKER', 0),
(481, 'portfolio', 'DELETE_FIXEDDEPOSITACCOUNT', 'FIXEDDEPOSITACCOUNT', 'DELETE', 0),
(482, 'portfolio', 'DELETE_FIXEDDEPOSITACCOUNT_CHECKER', 'FIXEDDEPOSITACCOUNT', 'DELETE_CHECKER', 0),
(483, 'transaction_savings', 'DEPOSIT_FIXEDDEPOSITACCOUNT', 'FIXEDDEPOSITACCOUNT', 'DEPOSIT', 0),
(484, 'transaction_savings', 'DEPOSIT_FIXEDDEPOSITACCOUNT_CHECKER', 'FIXEDDEPOSITACCOUNT', 'DEPOSIT_CHECKER', 0),
(485, 'transaction_savings', 'WITHDRAWAL_FIXEDDEPOSITACCOUNT', 'FIXEDDEPOSITACCOUNT', 'WITHDRAWAL', 0),
(486, 'transaction_savings', 'WITHDRAWAL_FIXEDDEPOSITACCOUNT_CHECKER', 'FIXEDDEPOSITACCOUNT', 'WITHDRAWAL_CHECKER', 0),
(487, 'transaction_savings', 'ACTIVATE_FIXEDDEPOSITACCOUNT', 'FIXEDDEPOSITACCOUNT', 'ACTIVATE', 0),
(488, 'transaction_savings', 'ACTIVATE_FIXEDDEPOSITACCOUNT_CHECKER', 'FIXEDDEPOSITACCOUNT', 'ACTIVATE_CHECKER', 0),
(489, 'transaction_savings', 'CALCULATEINTEREST_FIXEDDEPOSITACCOUNT', 'FIXEDDEPOSITACCOUNT', 'CALCULATEINTEREST', 0),
(490, 'transaction_savings', 'CALCULATEINTEREST_FIXEDDEPOSITACCOUNT_CHECKER', 'FIXEDDEPOSITACCOUNT', 'CALCULATEINTEREST_CHECKER', 0),
(491, 'transaction_savings', 'POSTINTEREST_FIXEDDEPOSITACCOUNT', 'FIXEDDEPOSITACCOUNT', 'POSTINTEREST', 1),
(492, 'transaction_savings', 'POSTINTEREST_FIXEDDEPOSITACCOUNT_CHECKER', 'FIXEDDEPOSITACCOUNT', 'POSTINTEREST_CHECKER', 0),
(493, 'transaction_savings', 'APPROVE_FIXEDDEPOSITACCOUNT', 'FIXEDDEPOSITACCOUNT', 'APPROVE', 1),
(494, 'transaction_savings', 'REJECT_FIXEDDEPOSITACCOUNT', 'FIXEDDEPOSITACCOUNT', 'REJECT', 1),
(495, 'transaction_savings', 'WITHDRAW_FIXEDDEPOSITACCOUNT', 'FIXEDDEPOSITACCOUNT', 'WITHDRAW', 1),
(496, 'transaction_savings', 'APPROVALUNDO_FIXEDDEPOSITACCOUNT', 'FIXEDDEPOSITACCOUNT', 'APPROVALUNDO', 1),
(497, 'transaction_savings', 'CLOSE_FIXEDDEPOSITACCOUNT', 'FIXEDDEPOSITACCOUNT', 'CLOSE', 1),
(498, 'transaction_savings', 'APPROVE_FIXEDDEPOSITACCOUNT_CHECKER', 'FIXEDDEPOSITACCOUNT', 'APPROVE_CHECKER', 0),
(499, 'transaction_savings', 'REJECT_FIXEDDEPOSITACCOUNT_CHECKER', 'FIXEDDEPOSITACCOUNT', 'REJECT_CHECKER', 0),
(500, 'transaction_savings', 'WITHDRAW_FIXEDDEPOSITACCOUNT_CHECKER', 'FIXEDDEPOSITACCOUNT', 'WITHDRAW_CHECKER', 0),
(501, 'transaction_savings', 'APPROVALUNDO_FIXEDDEPOSITACCOUNT_CHECKER', 'FIXEDDEPOSITACCOUNT', 'APPROVALUNDO_CHECKER', 0),
(502, 'transaction_savings', 'CLOSE_FIXEDDEPOSITACCOUNT_CHECKER', 'FIXEDDEPOSITACCOUNT', 'CLOSE_CHECKER', 0),
(503, 'transaction_savings', 'UNDOTRANSACTION_FIXEDDEPOSITACCOUNT', 'FIXEDDEPOSITACCOUNT', 'UNDOTRANSACTION', 1),
(504, 'transaction_savings', 'UNDOTRANSACTION_FIXEDDEPOSITACCOUNT_CHECKER', 'FIXEDDEPOSITACCOUNT', 'UNDOTRANSACTION_CHECKER', 0),
(505, 'transaction_savings', 'ADJUSTTRANSACTION_FIXEDDEPOSITACCOUNT', 'FIXEDDEPOSITACCOUNT', 'ADJUSTTRANSACTION', 0),
(506, 'portfolio', 'READ_RECURRINGDEPOSITACCOUNT', 'RECURRINGDEPOSITACCOUNT', 'READ', 0),
(507, 'portfolio', 'CREATE_RECURRINGDEPOSITACCOUNT', 'RECURRINGDEPOSITACCOUNT', 'CREATE', 0),
(508, 'portfolio', 'CREATE_RECURRINGDEPOSITACCOUNT_CHECKER', 'RECURRINGDEPOSITACCOUNT', 'CREATE_CHECKER', 0),
(509, 'portfolio', 'UPDATE_RECURRINGDEPOSITACCOUNT', 'RECURRINGDEPOSITACCOUNT', 'UPDATE', 0),
(510, 'portfolio', 'UPDATE_RECURRINGDEPOSITACCOUNT_CHECKER', 'RECURRINGDEPOSITACCOUNT', 'UPDATE_CHECKER', 0),
(511, 'portfolio', 'DELETE_RECURRINGDEPOSITACCOUNT', 'RECURRINGDEPOSITACCOUNT', 'DELETE', 0),
(512, 'portfolio', 'DELETE_RECURRINGDEPOSITACCOUNT_CHECKER', 'RECURRINGDEPOSITACCOUNT', 'DELETE_CHECKER', 0),
(513, 'transaction_savings', 'DEPOSIT_RECURRINGDEPOSITACCOUNT', 'RECURRINGDEPOSITACCOUNT', 'DEPOSIT', 0),
(514, 'transaction_savings', 'DEPOSIT_RECURRINGDEPOSITACCOUNT_CHECKER', 'RECURRINGDEPOSITACCOUNT', 'DEPOSIT_CHECKER', 0),
(515, 'transaction_savings', 'WITHDRAWAL_RECURRINGDEPOSITACCOUNT', 'RECURRINGDEPOSITACCOUNT', 'WITHDRAWAL', 0),
(516, 'transaction_savings', 'WITHDRAWAL_RECURRINGDEPOSITACCOUNT_CHECKER', 'RECURRINGDEPOSITACCOUNT', 'WITHDRAWAL_CHECKER', 0),
(517, 'transaction_savings', 'ACTIVATE_RECURRINGDEPOSITACCOUNT', 'RECURRINGDEPOSITACCOUNT', 'ACTIVATE', 0),
(518, 'transaction_savings', 'ACTIVATE_RECURRINGDEPOSITACCOUNT_CHECKER', 'RECURRINGDEPOSITACCOUNT', 'ACTIVATE_CHECKER', 0),
(519, 'transaction_savings', 'CALCULATEINTEREST_RECURRINGDEPOSITACCOUNT', 'RECURRINGDEPOSITACCOUNT', 'CALCULATEINTEREST', 0),
(520, 'transaction_savings', 'CALCULATEINTEREST_RECURRINGDEPOSITACCOUNT_CHECKER', 'RECURRINGDEPOSITACCOUNT', 'CALCULATEINTEREST_CHECKER', 0),
(521, 'transaction_savings', 'POSTINTEREST_RECURRINGDEPOSITACCOUNT', 'RECURRINGDEPOSITACCOUNT', 'POSTINTEREST', 1),
(522, 'transaction_savings', 'POSTINTEREST_RECURRINGDEPOSITACCOUNT_CHECKER', 'RECURRINGDEPOSITACCOUNT', 'POSTINTEREST_CHECKER', 0),
(523, 'transaction_savings', 'APPROVE_RECURRINGDEPOSITACCOUNT', 'RECURRINGDEPOSITACCOUNT', 'APPROVE', 1),
(524, 'transaction_savings', 'REJECT_RECURRINGDEPOSITACCOUNT', 'RECURRINGDEPOSITACCOUNT', 'REJECT', 1),
(525, 'transaction_savings', 'WITHDRAW_RECURRINGDEPOSITACCOUNT', 'RECURRINGDEPOSITACCOUNT', 'WITHDRAW', 1),
(526, 'transaction_savings', 'APPROVALUNDO_RECURRINGDEPOSITACCOUNT', 'RECURRINGDEPOSITACCOUNT', 'APPROVALUNDO', 1),
(527, 'transaction_savings', 'CLOSE_RECURRINGDEPOSITACCOUNT', 'RECURRINGDEPOSITACCOUNT', 'CLOSE', 1),
(528, 'transaction_savings', 'APPROVE_RECURRINGDEPOSITACCOUNT_CHECKER', 'RECURRINGDEPOSITACCOUNT', 'APPROVE_CHECKER', 0),
(529, 'transaction_savings', 'REJECT_RECURRINGDEPOSITACCOUNT_CHECKER', 'RECURRINGDEPOSITACCOUNT', 'REJECT_CHECKER', 0),
(530, 'transaction_savings', 'WITHDRAW_RECURRINGDEPOSITACCOUNT_CHECKER', 'RECURRINGDEPOSITACCOUNT', 'WITHDRAW_CHECKER', 0),
(531, 'transaction_savings', 'APPROVALUNDO_RECURRINGDEPOSITACCOUNT_CHECKER', 'RECURRINGDEPOSITACCOUNT', 'APPROVALUNDO_CHECKER', 0),
(532, 'transaction_savings', 'CLOSE_RECURRINGDEPOSITACCOUNT_CHECKER', 'RECURRINGDEPOSITACCOUNT', 'CLOSE_CHECKER', 0),
(533, 'transaction_savings', 'UNDOTRANSACTION_RECURRINGDEPOSITACCOUNT', 'RECURRINGDEPOSITACCOUNT', 'UNDOTRANSACTION', 1),
(534, 'transaction_savings', 'UNDOTRANSACTION_RECURRINGDEPOSITACCOUNT_CHECKER', 'RECURRINGDEPOSITACCOUNT', 'UNDOTRANSACTION_CHECKER', 0),
(535, 'transaction_savings', 'ADJUSTTRANSACTION_RECURRINGDEPOSITACCOUNT', 'RECURRINGDEPOSITACCOUNT', 'ADJUSTTRANSACTION', 0),
(536, 'transaction_savings', 'PREMATURECLOSE_FIXEDDEPOSITACCOUNT_CHECKER', 'FIXEDDEPOSITACCOUNT', 'PREMATURECLOSE_CHECKER', 0),
(537, 'transaction_savings', 'PREMATURECLOSE_FIXEDDEPOSITACCOUNT', 'FIXEDDEPOSITACCOUNT', 'PREMATURECLOSE', 1),
(538, 'transaction_savings', 'PREMATURECLOSE_RECURRINGDEPOSITACCOUNT_CHECKER', 'RECURRINGDEPOSITACCOUNT', 'PREMATURECLOSE_CHECKER', 0),
(539, 'transaction_savings', 'PREMATURECLOSE_RECURRINGDEPOSITACCOUNT', 'RECURRINGDEPOSITACCOUNT', 'PREMATURECLOSE', 1),
(540, 'transaction_loan', 'DISBURSETOSAVINGS_LOAN', 'LOAN', 'DISBURSETOSAVINGS', 0),
(541, 'transaction_loan', 'RECOVERYPAYMENT_LOAN', 'LOAN', 'RECOVERYPAYMENT', 0),
(542, 'organisation', 'READ_RECURRINGDEPOSITPRODUCT', 'RECURRINGDEPOSITPRODUCT', 'READ', 0),
(543, 'organisation', 'READ_FIXEDDEPOSITPRODUCT', 'FIXEDDEPOSITPRODUCT', 'READ', 0),
(544, 'accounting', 'READ_FINANCIALACTIVITYACCOUNT', 'FINANCIALACTIVITYACCOUNT', 'READ', 0),
(545, 'accounting', 'CREATE_FINANCIALACTIVITYACCOUNT', 'FINANCIALACTIVITYACCOUNT', 'CREATE', 0),
(546, 'accounting', 'DELETE_FINANCIALACTIVITYACCOUNT', 'FINANCIALACTIVITYACCOUNT', 'DELETE', 0),
(547, 'accounting', 'UPDATE_FINANCIALACTIVITYACCOUNT', 'FINANCIALACTIVITYACCOUNT', 'UPDATE', 0),
(548, 'datatable', 'UPDATE_LIKELIHOOD', 'likelihood', 'UPDATE', 0),
(549, 'survey', 'REGISTER_SURVEY', 'survey', 'CREATE', 0),
(550, 'accounting', 'EXECUTE_PERIODICACCRUALACCOUNTING', 'PERIODICACCRUALACCOUNTING', 'EXECUTE', 0),
(551, 'portfolio', 'INACTIVATE_SAVINGSACCOUNTCHARGE', 'SAVINGSACCOUNTCHARGE', 'INACTIVATE', 0),
(552, 'portfolio', 'INACTIVATE_SAVINGSACCOUNTCHARGE_CHECKER', 'SAVINGSACCOUNTCHARGE', 'INACTIVATE_CHECKER', 0),
(553, 'portfolio_center', 'DISASSOCIATEGROUPS_CENTER', 'CENTER', 'DISASSOCIATEGROUPS', 0),
(554, 'portfolio_center', 'ASSOCIATEGROUPS_CENTER', 'CENTER', 'ASSOCIATEGROUPS', 0),
(555, 'portfolio_center', 'DISASSOCIATEGROUPS_CENTER_CHECKER', 'CENTER', 'DISASSOCIATEGROUPS_CHECKER', 0),
(556, 'portfolio_center', 'ASSOCIATEGROUPS_CENTER_CHECKER', 'CENTER', 'ASSOCIATEGROUPS_CHECKER', 0),
(557, 'loan_reschedule', 'READ_RESCHEDULELOAN', 'RESCHEDULELOAN', 'READ', 0),
(558, 'loan_reschedule', 'CREATE_RESCHEDULELOAN', 'RESCHEDULELOAN', 'CREATE', 0),
(559, 'loan_reschedule', 'REJECT_RESCHEDULELOAN', 'RESCHEDULELOAN', 'REJECT', 0),
(560, 'loan_reschedule', 'APPROVE_RESCHEDULELOAN', 'RESCHEDULELOAN', 'APPROVE', 0),
(561, 'configuration', 'CREATE_HOOK', 'HOOK', 'CREATE', 0),
(562, 'configuration', 'READ_HOOK', 'HOOK', 'READ', 0),
(563, 'configuration', 'UPDATE_HOOK', 'HOOK', 'UPDATE', 0),
(564, 'configuration', 'DELETE_HOOK', 'HOOK', 'DELETE', 0),
(565, 'portfolio', 'REMOVESAVINGSOFFICER_SAVINGSACCOUNT', 'SAVINGSACCOUNT', 'REMOVESAVINGSOFFICER', 1),
(566, 'portfolio', 'UPDATESAVINGSOFFICER_SAVINGSACCOUNT', 'SAVINGSACCOUNT', 'UPDATESAVINGSOFFICER', 1),
(567, 'report', 'READ_Active Loans - Summary(Pentaho)', 'Active Loans - Summary(Pentaho)', 'READ', 0),
(568, 'report', 'READ_Active Loans by Disbursal Period(Pentaho)', 'Active Loans by Disbursal Period(Pentaho)', 'READ', 0),
(569, 'report', 'READ_Active Loans in last installment Summary(Pentaho)', 'Active Loans in last installment Summary(Pentaho)', 'READ', 0),
(570, 'report', 'READ_Active Loans in last installment(Pentaho)', 'Active Loans in last installment(Pentaho)', 'READ', 0),
(571, 'report', 'READ_Active Loans Passed Final Maturity Summary(Pentaho)', 'Active Loans Passed Final Maturity Summary(Pentaho)', 'READ', 0),
(572, 'report', 'READ_Active Loans Passed Final Maturity(Pentaho)', 'Active Loans Passed Final Maturity(Pentaho)', 'READ', 0),
(573, 'report', 'READ_Aging Detail(Pentaho)', 'Aging Detail(Pentaho)', 'READ', 0),
(574, 'report', 'READ_Aging Summary (Arrears in Months)(Pentaho)', 'Aging Summary (Arrears in Months)(Pentaho)', 'READ', 0),
(575, 'report', 'READ_Aging Summary (Arrears in Weeks)(Pentaho)', 'Aging Summary (Arrears in Weeks)(Pentaho)', 'READ', 0),
(576, 'report', 'READ_Client Listing(Pentaho)', 'Client Listing(Pentaho)', 'READ', 0),
(577, 'report', 'READ_Client Loan Account Schedule', 'Client Loan Account Schedule', 'READ', 0),
(578, 'report', 'READ_Client Loans Listing(Pentaho)', 'Client Loans Listing(Pentaho)', 'READ', 0),
(579, 'report', 'READ_Client Saving Transactions', 'Client Saving Transactions', 'READ', 0),
(580, 'report', 'READ_Client Savings Summary', 'Client Savings Summary', 'READ', 0),
(581, 'report', 'READ_ClientSummary ', 'ClientSummary ', 'READ', 0),
(582, 'report', 'READ_ClientTrendsByDay', 'ClientTrendsByDay', 'READ', 0),
(583, 'report', 'READ_ClientTrendsByMonth', 'ClientTrendsByMonth', 'READ', 0),
(584, 'report', 'READ_ClientTrendsByWeek', 'ClientTrendsByWeek', 'READ', 0),
(585, 'report', 'READ_Demand_Vs_Collection', 'Demand_Vs_Collection', 'READ', 0),
(586, 'report', 'READ_Disbursal_Vs_Awaitingdisbursal', 'Disbursal_Vs_Awaitingdisbursal', 'READ', 0),
(587, 'report', 'READ_Expected Payments By Date - Basic(Pentaho)', 'Expected Payments By Date - Basic(Pentaho)', 'READ', 0),
(588, 'report', 'READ_Funds Disbursed Between Dates Summary by Office(Pentaho)', 'Funds Disbursed Between Dates Summary by Office(Pentaho)', 'READ', 0),
(589, 'report', 'READ_Funds Disbursed Between Dates Summary(Pentaho)', 'Funds Disbursed Between Dates Summary(Pentaho)', 'READ', 0),
(590, 'report', 'READ_GroupNamesByStaff', 'GroupNamesByStaff', 'READ', 0),
(591, 'report', 'READ_GroupSavingSummary', 'GroupSavingSummary', 'READ', 0),
(592, 'report', 'READ_LoanCyclePerProduct', 'LoanCyclePerProduct', 'READ', 0),
(593, 'report', 'READ_Loans Awaiting Disbursal Summary by Month(Pentaho)', 'Loans Awaiting Disbursal Summary by Month(Pentaho)', 'READ', 0),
(594, 'report', 'READ_Loans Awaiting Disbursal Summary(Pentaho)', 'Loans Awaiting Disbursal Summary(Pentaho)', 'READ', 0),
(595, 'report', 'READ_Loans Awaiting Disbursal(Pentaho)', 'Loans Awaiting Disbursal(Pentaho)', 'READ', 0),
(596, 'report', 'READ_Loans Pending Approval(Pentaho)', 'Loans Pending Approval(Pentaho)', 'READ', 0),
(597, 'report', 'READ_LoanTrendsByDay', 'LoanTrendsByDay', 'READ', 0),
(598, 'report', 'READ_LoanTrendsByMonth', 'LoanTrendsByMonth', 'READ', 0),
(599, 'report', 'READ_LoanTrendsByWeek', 'LoanTrendsByWeek', 'READ', 0),
(600, 'report', 'READ_Obligation Met Loans Details(Pentaho)', 'Obligation Met Loans Details(Pentaho)', 'READ', 0),
(601, 'report', 'READ_Obligation Met Loans Summary(Pentaho)', 'Obligation Met Loans Summary(Pentaho)', 'READ', 0),
(602, 'report', 'READ_Portfolio at Risk by Branch(Pentaho)', 'Portfolio at Risk by Branch(Pentaho)', 'READ', 0),
(603, 'report', 'READ_Portfolio at Risk(Pentaho)', 'Portfolio at Risk(Pentaho)', 'READ', 0),
(604, 'report', 'READ_Rescheduled Loans(Pentaho)', 'Rescheduled Loans(Pentaho)', 'READ', 0),
(605, 'report', 'READ_Savings Transactions', 'Savings Transactions', 'READ', 0),
(606, 'report', 'READ_TxnRunningBalances(Pentaho)', 'TxnRunningBalances(Pentaho)', 'READ', 0),
(607, 'report', 'READ_Written-Off Loans(Pentaho)', 'Written-Off Loans(Pentaho)', 'READ', 0),
(608, 'configuration', 'CREATE_ACCOUNTNUMBERFORMAT', 'ACCOUNTNUMBERFORMAT', 'CREATE', 0),
(609, 'configuration', 'READ_ACCOUNTNUMBERFORMAT', 'ACCOUNTNUMBERFORMAT', 'READ', 0),
(610, 'configuration', 'UPDATE_ACCOUNTNUMBERFORMAT', 'ACCOUNTNUMBERFORMAT', 'UPDATE', 0),
(611, 'configuration', 'DELETE_ACCOUNTNUMBERFORMAT', 'HOOK', 'DELETE', 0),
(612, 'portfolio', 'RECOVERGUARANTEES_LOAN', 'LOAN', 'RECOVERGUARANTEES', 0),
(613, 'portfolio', 'RECOVERGUARANTEES_LOAN_CHECKER', 'LOAN', 'RECOVERGUARANTEES_CHECKER', 0),
(614, 'portfolio', 'REJECT_CLIENT', 'CLIENT', 'REJECT', 1),
(615, 'portfolio', 'REJECT_CLIENT_CHECKER', 'CLIENT', 'REJECT_CHECKER', 0),
(616, 'portfolio', 'WITHDRAW_CLIENT', 'CLIENT', 'WITHDRAW', 1),
(617, 'portfolio', 'WITHDRAW_CLIENT_CHECKER', 'CLIENT', 'WITHDRAW_CHECKER', 0),
(618, 'portfolio', 'REACTIVATE_CLIENT', 'CLIENT', 'REACTIVATE', 1),
(619, 'portfolio', 'REACTIVATE_CLIENT_CHECKER', 'CLIENT', 'REACTIVATE_CHECKER', 0),
(620, 'transaction_savings', 'UPDATEDEPOSITAMOUNT_RECURRINGDEPOSITACCOUNT', 'RECURRINGDEPOSITACCOUNT', 'UPDATEDEPOSITAMOUNT', 1),
(621, 'transaction_savings', 'UPDATEDEPOSITAMOUNT_RECURRINGDEPOSITACCOUNT_CHECKER', 'RECURRINGDEPOSITACCOUNT', 'UPDATEDEPOSITAMOUNT', 1),
(622, 'transaction_savings', 'REFUNDBYTRANSFER_ACCOUNTTRANSFER_CHECKER', 'ACCOUNTTRANSFER', 'REFUNDBYTRANSFER', 0),
(623, 'transaction_savings', 'REFUNDBYTRANSFER_ACCOUNTTRANSFER', 'ACCOUNTTRANSFER', 'REFUNDBYTRANSFER', 1),
(624, 'transaction_loan', 'REFUNDBYCASH_LOAN', 'LOAN', 'REFUNDBYCASH', 1),
(625, 'transaction_loan', 'REFUNDBYCASH_LOAN_CHECKER', 'LOAN', 'REFUNDBYCASH', 0),
(626, 'cash_mgmt', 'CREATE_TELLER', 'TELLER', 'CREATE', 1),
(627, 'cash_mgmt', 'UPDATE_TELLER', 'TELLER', 'UPDATE', 1),
(628, 'cash_mgmt', 'ALLOCATECASHIER_TELLER', 'TELLER', 'ALLOCATE', 1);
INSERT INTO `m_permission` (`id`, `grouping`, `code`, `entity_name`, `action_name`, `can_maker_checker`) VALUES
(629, 'cash_mgmt', 'UPDATECASHIERALLOCATION_TELLER', 'TELLER', 'UPDATECASHIERALLOCATION', 1),
(630, 'cash_mgmt', 'DELETECASHIERALLOCATION_TELLER', 'TELLER', 'DELETECASHIERALLOCATION', 1),
(631, 'cash_mgmt', 'ALLOCATECASHTOCASHIER_TELLER', 'TELLER', 'ALLOCATECASHTOCASHIER', 1),
(632, 'cash_mgmt', 'SETTLECASHFROMCASHIER_TELLER', 'TELLER', 'SETTLECASHFROMCASHIER', 1),
(633, 'authorisation', 'DISABLE_ROLE', 'ROLE', 'DISABLE', 0),
(634, 'authorisation', 'DISABLE_ROLE_CHECKER', 'ROLE', 'DISABLE_CHECKER', 0),
(635, 'authorisation', 'ENABLE_ROLE', 'ROLE', 'ENABLE', 0),
(636, 'authorisation', 'ENABLE_ROLE_CHECKER', 'ROLE', 'ENABLE_CHECKER', 0),
(637, 'accounting', 'DEFINEOPENINGBALANCE_JOURNALENTRY', 'JOURNALENTRY', 'DEFINEOPENINGBALANCE', 1),
(638, 'collection_sheet', 'READ_COLLECTIONSHEET', 'COLLECTIONSHEET', 'READ', 0),
(639, 'collection_sheet', 'SAVE_COLLECTIONSHEET', 'COLLECTIONSHEET', 'SAVE', 0),
(640, 'infrastructure', 'CREATE_ENTITYMAPPING', 'ENTITYMAPPING', 'CREATE', 0),
(641, 'infrastructure', 'UPDATE_ENTITYMAPPING', 'ENTITYMAPPING', 'UPDATE', 0),
(642, 'infrastructure', 'DELETE_ENTITYMAPPING', 'ENTITYMAPPING', 'DELETE', 0),
(643, 'organisation', 'READ_WORKINGDAYS', 'WORKINGDAYS', 'READ', 0),
(644, 'organisation', 'UPDATE_WORKINGDAYS', 'WORKINGDAYS', 'UPDATE', 0),
(645, 'organisation', 'UPDATE_WORKINGDAYS_CHECKER', 'WORKINGDAYS', 'UPDATE_CHECKER', 0),
(646, 'authorisation', 'READ_PASSWORD_PREFERENCES', 'PASSWORD_PREFERENCES', 'READ', 0),
(647, 'authorisation', 'UPDATE_PASSWORD_PREFERENCES', 'PASSWORD_PREFERENCES', 'UPDATE', 0),
(648, 'authorisation', 'UPDATE_PASSWORD_PREFERENCES_CHECKER', 'PASSWORD_PREFERENCES', 'UPDATE_CHECKER', 0),
(649, 'portfolio', 'CREATE_PAYMENTTYPE', 'PAYMENTTYPE', 'CREATE', 0),
(650, 'portfolio', 'UPDATE_PAYMENTTYPE', 'PAYMENTTYPE', 'UPDATE', 0),
(651, 'portfolio', 'DELETE_PAYMENTTYPE', 'PAYMENTTYPE', 'DELETE', 0),
(652, 'cash_mgmt', 'DELETE_TELLER', 'TELLER', 'DELETE', 1),
(653, 'report', 'READ_General Ledger Report', 'General Ledger Report', 'READ', 0),
(654, 'portfolio', 'READ_STAFFIMAGE', 'STAFFIMAGE', 'READ', 0),
(655, 'portfolio', 'CREATE_STAFFIMAGE', 'STAFFIMAGE', 'CREATE', 1),
(656, 'portfolio', 'CREATE_STAFFIMAGE_CHECKER', 'STAFFIMAGE', 'CREATE', 0),
(657, 'portfolio', 'DELETE_STAFFIMAGE', 'STAFFIMAGE', 'DELETE', 1),
(658, 'portfolio', 'DELETE_STAFFIMAGE_CHECKER', 'STAFFIMAGE', 'DELETE', 0),
(659, 'report', 'READ_Active Loan Summary per Branch', 'Active Loan Summary per Branch', 'READ', 0),
(660, 'report', 'READ_Disbursal Report', 'Disbursal Report', 'READ', 0),
(661, 'report', 'READ_Balance Outstanding', 'Balance Outstanding', 'READ', 0),
(662, 'report', 'READ_Collection Report', 'Collection Report', 'READ', 0),
(663, 'portfolio', 'READ_PAYMENTTYPE', 'PAYMENTTYPE', 'READ', 0),
(664, 'report', 'READ_Staff Assignment History', 'Staff Assignment History(Pentaho)', 'READ', 0),
(665, 'externalservices', 'UPDATE_EXTERNALSERVICES', 'EXTERNALSERVICES', 'UPDATE', 0),
(666, 'portfolio', 'READ_CLIENTCHARGE', 'CLIENTCHARGE', 'READ', 0),
(667, 'portfolio', 'CREATE_CLIENTCHARGE', 'CLIENTCHARGE', 'CREATE', 0),
(668, 'portfolio', 'DELETE_CLIENTCHARGE', 'CLIENTCHARGE', 'DELETE', 0),
(669, 'portfolio', 'WAIVE_CLIENTCHARGE', 'CLIENTCHARGE', 'WAIVE', 0),
(670, 'portfolio', 'PAY_CLIENTCHARGE', 'CLIENTCHARGE', 'PAY', 0),
(671, 'portfolio', 'INACTIVATE_CLIENTCHARGE', 'CLIENTCHARGE', 'INACTIVATE', 0),
(672, 'portfolio', 'UPDATE_CLIENTCHARGE', 'CLIENTCHARGE', 'UPDATE', 0),
(673, 'portfolio', 'CREATE_CLIENTCHARGE_CHECKER', 'CLIENTCHARGE', 'CREATE_CHECKER', 0),
(674, 'portfolio', 'DELETE_CLIENTCHARGE_CHECKER', 'CLIENTCHARGE', 'DELETE_CHECKER', 0),
(675, 'portfolio', 'WAIVE_CLIENTCHARGE_CHECKER', 'CLIENTCHARGE', 'WAIVE_CHECKER', 0),
(676, 'portfolio', 'PAY_CLIENTCHARGE_CHECKER', 'CLIENTCHARGE', 'PAY_CHECKER', 0),
(677, 'portfolio', 'INACTIVATE_CLIENTCHARGE_CHECKER', 'CLIENTCHARGE', 'INACTIVATE_CHECKER', 0),
(678, 'portfolio', 'UPDATE_CLIENTCHARGE_CHECKER', 'CLIENTCHARGE', 'UPDATE_CHECKER', 0),
(679, 'transaction_client', 'READTRANSACTION_CLIENT', 'CLIENT', 'READTRANSACTION', 0),
(680, 'transaction_client', 'UNDOTRANSACTION_CLIENT', 'CLIENT', 'UNDOTRANSACTION', 0),
(681, 'transaction_client', 'UNDOTRANSACTION_CLIENT_CHECKER', 'CLIENT', 'UNDOTRANSACTION_CHECKER', 0),
(682, 'LOAN_PROVISIONING', 'CREATE_PROVISIONCATEGORY', 'PROVISIONCATEGORY', 'CREATE', 0),
(683, 'LOAN_PROVISIONING', 'DELETE_PROVISIONCATEGORY', 'PROVISIONCATEGORY', 'DELETE', 0),
(684, 'LOAN_PROVISIONING', 'CREATE_PROVISIONCRITERIA', 'PROVISIONINGCRITERIA', 'CREATE', 0),
(685, 'LOAN_PROVISIONING', 'UPDATE_PROVISIONCRITERIA', 'PROVISIONINGCRITERIA', 'UPDATE', 0),
(686, 'LOAN_PROVISIONING', 'DELETE_PROVISIONCRITERIA', 'PROVISIONINGCRITERIA', 'DELETE', 0),
(687, 'LOAN_PROVISIONING', 'CREATE_PROVISIONENTRIES', 'PROVISIONINGENTRIES', 'CREATE', 0),
(688, 'LOAN_PROVISIONING', 'CREATE_PROVISIONJOURNALENTRIES', 'PROVISIONINGENTRIES', 'CREATE', 0),
(689, 'LOAN_PROVISIONING', 'RECREATE_PROVISIONENTRIES', 'PROVISIONINGENTRIES', 'RECREATE', 0),
(690, 'portfolio', 'READ_FLOATINGRATE', 'FLOATINGRATE', 'READ', 0),
(691, 'portfolio', 'CREATE_FLOATINGRATE', 'FLOATINGRATE', 'CREATE', 1),
(692, 'portfolio', 'CREATE_FLOATINGRATE_CHECKER', 'FLOATINGRATE', 'CREATE_CHECKER', 0),
(693, 'portfolio', 'UPDATE_FLOATINGRATE', 'FLOATINGRATE', 'UPDATE', 1),
(694, 'portfolio', 'UPDATE_FLOATINGRATE_CHECKER', 'FLOATINGRATE', 'UPDATE_CHECKER', 0),
(695, 'portfolio', 'CREATESCHEDULEEXCEPTIONS_LOAN', 'LOAN', 'CREATESCHEDULEEXCEPTIONS', 0),
(696, 'portfolio', 'CREATESCHEDULEEXCEPTIONS_LOAN_CHECKER', 'LOAN', 'CREATESCHEDULEEXCEPTIONS_CHECKER', 0),
(697, 'portfolio', 'DELETESCHEDULEEXCEPTIONS_LOAN', 'LOAN', 'DELETESCHEDULEEXCEPTIONS', 0),
(698, 'portfolio', 'DELETESCHEDULEEXCEPTIONS_LOAN_CHECKER', 'LOAN', 'DELETESCHEDULEEXCEPTIONS_CHECKER', 0),
(699, 'transaction_loan', 'DISBURSALLASTUNDO_LOAN', 'LOAN', 'DISBURSALLASTUNDO', 0),
(700, 'transaction_loan', 'DISBURSALLASTUNDO_LOAN_CHECKER', 'LOAN', 'DISBURSALLASTUNDO_CHECKER', 0),
(701, 'SHAREPRODUCT', 'CREATE_SHAREPRODUCT', 'SHAREPRODUCT', 'CREATE', 0),
(702, 'SHAREPRODUCT', 'UPDATE_SHAREPRODUCT', 'SHAREPRODUCT', 'CREATE', 0),
(703, 'SHAREACCOUNT', 'CREATE_SHAREACCOUNT', 'SHAREACCOUNT', 'CREATE', 0),
(704, 'SHAREACCOUNT', 'UPDATE_SHAREACCOUNT', 'SHAREACCOUNT', 'CREATE', 0),
(705, 'organisation', 'READ_TAXCOMPONENT', 'TAXCOMPONENT', 'READ', 0),
(706, 'organisation', 'CREATE_TAXCOMPONENT', 'TAXCOMPONENT', 'CREATE', 0),
(707, 'organisation', 'CREATE_TAXCOMPONENT_CHECKER', 'TAXCOMPONENT', 'CREATE_CHECKER', 0),
(708, 'organisation', 'UPDATE_TAXCOMPONENT', 'TAXCOMPONENT', 'UPDATE', 0),
(709, 'organisation', 'UPDATE_TAXCOMPONENT_CHECKER', 'TAXCOMPONENT', 'UPDATE_CHECKER', 0),
(710, 'organisation', 'READ_TAXGROUP', 'TAXGROUP', 'READ', 0),
(711, 'organisation', 'CREATE_TAXGROUP', 'TAXGROUP', 'CREATE', 0),
(712, 'organisation', 'CREATE_TAXGROUP_CHECKER', 'TAXGROUP', 'CREATE_CHECKER', 0),
(713, 'organisation', 'UPDATE_TAXGROUP', 'TAXGROUP', 'UPDATE', 0),
(714, 'organisation', 'UPDATE_TAXGROUP_CHECKER', 'TAXGROUP', 'UPDATE_CHECKER', 0),
(715, 'portfolio', 'UPDATEWITHHOLDTAX_SAVINGSACCOUNT', 'SAVINGSACCOUNT', 'UPDATEWITHHOLDTAX', 0),
(716, 'portfolio', 'UPDATEWITHHOLDTAX_SAVINGSACCOUNT_CHECKER', 'SAVINGSACCOUNT', 'UPDATEWITHHOLDTAX_CHECKER', 0),
(717, 'SHAREPRODUCT', 'CREATE_DIVIDEND_SHAREPRODUCT', 'SHAREPRODUCT', 'CREATE_DIVIDEND', 0),
(718, 'SHAREPRODUCT', 'CREATE_DIVIDEND_SHAREPRODUCT_CHECKER', 'SHAREPRODUCT', 'CREATE_DIVIDEND_CHECKER', 0),
(719, 'SHAREPRODUCT', 'APPROVE_DIVIDEND_SHAREPRODUCT', 'SHAREPRODUCT', 'APPROVE_DIVIDEND', 0),
(720, 'SHAREPRODUCT', 'APPROVE_DIVIDEND_SHAREPRODUCT_CHECKER', 'SHAREPRODUCT', 'APPROVE_DIVIDEND_CHECKER', 0),
(721, 'SHAREPRODUCT', 'DELETE_DIVIDEND_SHAREPRODUCT', 'SHAREPRODUCT', 'DELETE_DIVIDEND', 0),
(722, 'SHAREPRODUCT', 'DELETE_DIVIDEND_SHAREPRODUCT_CHECKER', 'SHAREPRODUCT', 'DELETE_DIVIDEND_CHECKER', 0),
(723, 'SHAREPRODUCT', 'READ_DIVIDEND_SHAREPRODUCT', 'SHAREPRODUCT', 'READ_DIVIDEND', 0),
(724, 'SHAREACCOUNT', 'APPROVE_SHAREACCOUNT', 'SHAREACCOUNT', 'APPROVE', 0),
(725, 'SHAREACCOUNT', 'ACTIVATE_SHAREACCOUNT', 'SHAREACCOUNT', 'ACTIVATE', 0),
(726, 'SHAREACCOUNT', 'UNDOAPPROVAL_SHAREACCOUNT', 'SHAREACCOUNT', 'UNDOAPPROVAL', 0),
(727, 'SHAREACCOUNT', 'REJECT_SHAREACCOUNT', 'SHAREACCOUNT', 'REJECT', 0),
(728, 'SHAREACCOUNT', 'APPLYADDITIONALSHARES_SHAREACCOUNT', 'SHAREACCOUNT', 'APPLYADDITIONALSHARES', 0),
(729, 'SHAREACCOUNT', 'APPROVEADDITIONALSHARES_SHAREACCOUNT', 'SHAREACCOUNT', 'APPROVEADDITIONALSHARES', 0),
(730, 'SHAREACCOUNT', 'REJECTADDITIONALSHARES_SHAREACCOUNT', 'SHAREACCOUNT', 'REJECTADDITIONALSHARES', 0),
(731, 'SHAREACCOUNT', 'REDEEMSHARES_SHAREACCOUNT', 'SHAREACCOUNT', 'REDEEMSHARES', 0),
(732, 'SHAREACCOUNT', 'CLOSE_SHAREACCOUNT', 'SHAREACCOUNT', 'CLOSE', 0),
(733, 'SSBENEFICIARYTPT', 'READ_SSBENEFICIARYTPT', 'SSBENEFICIARYTPT', 'READ', 0),
(734, 'SSBENEFICIARYTPT', 'CREATE_SSBENEFICIARYTPT', 'SSBENEFICIARYTPT', 'CREATE', 0),
(735, 'SSBENEFICIARYTPT', 'UPDATE_SSBENEFICIARYTPT', 'SSBENEFICIARYTPT', 'UPDATE', 0),
(736, 'SSBENEFICIARYTPT', 'DELETE_SSBENEFICIARYTPT', 'SSBENEFICIARYTPT', 'DELETE', 0),
(737, 'portfolio', 'FORECLOSURE_LOAN', 'LOAN', 'FORECLOSURE', 0),
(738, 'portfolio', 'FORECLOSURE_LOAN_CHECKER', 'LOAN', 'FORECLOSURE_CHECKER', 0),
(739, 'portfolio', 'CREATE_ADDRESS', 'ADDRESS', 'CREATE', 0),
(740, 'portfolio', 'CREATE_ADDRESS_CHECKER', 'ADDRESS', 'CREATE_CHECKER', 1),
(741, 'portfolio', 'UPDATE_ADDRESS', 'ADDRESS', 'UPDATE', 0),
(742, 'portfolio', 'UPDATE_ADDRESS_CHECKER', 'ADDRESS', 'UPDATE_CHECKER', 1),
(743, 'portfolio', 'READ_ADDRESS', 'ADDRESS', 'READ', 0),
(744, 'portfolio', 'DELETE_ADDRESS', 'ADDRESS', 'DELETE', 0),
(745, 'portfolio', 'DELETE_ADDRESS_CHECKER', 'ADDRESS', 'DELETE_CHECKER', 1),
(746, 'jobs', 'CREATE_REPORTMAILINGJOB', 'REPORTMAILINGJOB', 'CREATE', 0),
(747, 'jobs', 'UPDATE_REPORTMAILINGJOB', 'REPORTMAILINGJOB', 'UPDATE', 0),
(748, 'jobs', 'DELETE_REPORTMAILINGJOB', 'REPORTMAILINGJOB', 'DELETE', 0),
(749, 'jobs', 'READ_REPORTMAILINGJOB', 'REPORTMAILINGJOB', 'READ', 0),
(750, 'portfolio', 'UNDOREJECT_CLIENT', 'CLIENT', 'UNDOREJECT', 1),
(751, 'portfolio', 'UNDOREJECT_CLIENT_CHECKER', 'CLIENT', 'UNDOREJECT_CHECKER', 1),
(752, 'portfolio', 'UNDOWITHDRAWAL_CLIENT', 'CLIENT', 'UNDOWITHDRAWAL', 1),
(753, 'portfolio', 'UNDOWITHDRAWAL_CLIENT_CHECKER', 'CLIENT', 'UNDOWITHDRAWAL_CHECKER', 1),
(754, 'organisation', 'READ_SMSCAMPAIGN', 'SMSCAMPAIGN', 'READ', 0),
(755, 'organisation', 'CREATE_SMSCAMPAIGN', 'SMSCAMPAIGN', 'CREATE', 0),
(756, 'organisation', 'CREATE_SMSCAMPAIGN_CHECKER', 'SMSCAMPAIGN', 'CREATE', 0),
(757, 'organisation', 'UPDATE_SMSCAMPAIGN', 'SMSCAMPAIGN', 'UPDATE', 0),
(758, 'organisation', 'UPDATE_SMSCAMPAIGN_CHECKER', 'SMSCAMPAIGN', 'UPDATE', 0),
(759, 'organisation', 'DELETE_SMSCAMPAIGN', 'SMSCAMPAIGN', 'DELETE', 0),
(760, 'organisation', 'DELETE_SMSCAMPAIGN_CHECKER', 'SMSCAMPAIGN', 'DELETE', 0),
(761, 'organisation', 'ACTIVATE_SMSCAMPAIGN', 'SMSCAMPAIGN', 'ACTIVATE', 0),
(762, 'organisation', 'CLOSE_SMSCAMPAIGN', 'SMSCAMPAIGN', 'CLOSE', 0),
(763, 'organisation', 'REACTIVATE_SMSCAMPAIGN', 'SMSCAMPAIGN', 'REACTIVATE', 0),
(764, 'organisation', 'READ_EMAIL', 'EMAIL', 'READ', 0),
(765, 'organisation', 'CREATE_EMAIL', 'EMAIL', 'CREATE', 0),
(766, 'organisation', 'CREATE_EMAIL_CHECKER', 'EMAIL', 'CREATE_CHECKER', 0),
(767, 'organisation', 'UPDATE_EMAIL', 'EMAIL', 'UPDATE', 0),
(768, 'organisation', 'UPDATE_EMAIL_CHECKER', 'EMAIL', 'UPDATE_CHECKER', 0),
(769, 'organisation', 'DELETE_EMAIL', 'EMAIL', 'DELETE', 0),
(770, 'organisation', 'DELETE_EMAIL_CHECKER', 'EMAIL', 'DELETE_CHECKER', 0),
(771, 'organisation', 'READ_EMAIL_CAMPAIGN', 'EMAIL_CAMPAIGN', 'READ', 0),
(772, 'organisation', 'CREATE_EMAIL_CAMPAIGN', 'EMAIL_CAMPAIGN', 'CREATE', 0),
(773, 'organisation', 'CREATE_EMAIL_CAMPAIGN_CHECKER', 'EMAIL_CAMPAIGN', 'CREATE_CHECKER', 0),
(774, 'organisation', 'UPDATE_EMAIL_CAMPAIGN', 'EMAIL_CAMPAIGN', 'UPDATE', 0),
(775, 'organisation', 'UPDATE_EMAIL_CAMPAIGN_CHECKER', 'EMAIL_CAMPAIGN', 'UPDATE_CHECKER', 0),
(776, 'organisation', 'DELETE_EMAIL_CAMPAIGN', 'EMAIL_CAMPAIGN', 'DELETE', 0),
(777, 'organisation', 'DELETE_EMAIL_CAMPAIGN_CHECKER', 'EMAIL_CAMPAIGN', 'DELETE_CHECKER', 0),
(778, 'organisation', 'CLOSE_EMAIL_CAMPAIGN', 'EMAIL_CAMPAIGN', 'CLOSE', 0),
(779, 'organisation', 'ACTIVATE_EMAIL_CAMPAIGN', 'EMAIL_CAMPAIGN', 'ACTIVATE', 0),
(780, 'organisation', 'REACTIVATE_EMAIL_CAMPAIGN', 'EMAIL_CAMPAIGN', 'REACTIVATE', 0),
(781, 'organisation', 'READ_EMAIL_CONFIGURATION', 'EMAIL_CONFIGURATION', 'READ', 0),
(782, 'organisation', 'UPDATE_EMAIL_CONFIGURATION', 'EMAIL_CONFIGURATION', 'UPDATE', 0),
(783, 'report', 'READ_Active Clients - Email', 'Active Clients - Email', 'READ', 0),
(784, 'report', 'READ_Prospective Clients - Email', 'Prospective Clients - Email', 'READ', 0),
(785, 'report', 'READ_Active Loan Clients - Email', 'Active Loan Clients - Email', 'READ', 0),
(786, 'report', 'READ_Loans in arrears - Email', 'Loans in arrears - Email', 'READ', 0),
(787, 'report', 'READ_Loans disbursed to clients - Email', 'Loans disbursed to clients - Email', 'READ', 0),
(788, 'report', 'READ_Loan payments due - Email', 'Loan payments due - Email', 'READ', 0),
(789, 'report', 'READ_Dormant Prospects - Email', 'Dormant Prospects - Email', 'READ', 0),
(790, 'report', 'READ_Active Group Leaders - Email', 'Active Group Leaders - Email', 'READ', 0),
(791, 'report', 'READ_Loan Payments Due (Overdue Loans) - Email', 'Loan Payments Due (Overdue Loans) - Email', 'READ', 0),
(792, 'report', 'READ_Loan Payments Received (Active Loans) - Email', 'Loan Payments Received (Active Loans) - Email', 'READ', 0),
(793, 'report', 'READ_Loan Payments Received (Overdue Loans) - Email', 'Loan Payments Received (Overdue Loans)  - Email', 'READ', 0),
(794, 'report', 'READ_Loan Fully Repaid - Email', 'Loan Fully Repaid - Email', 'READ', 0),
(795, 'report', 'READ_Loans Outstanding after final instalment date - Email', 'Loans Outstanding after final instalment date - Email', 'READ', 0),
(796, 'report', 'READ_Happy Birthday - Email', 'Happy Birthday - Email', 'READ', 0),
(797, 'report', 'READ_Loan Rejected - Email', 'Loan Rejected - Email', 'READ', 0),
(798, 'report', 'READ_Loan Approved - Email', 'Loan Approved - Email', 'READ', 0),
(799, 'report', 'READ_Loan Repayment - Email', 'Loan Repayment - Email', 'READ', 0),
(800, 'datatable', 'READ_ENTITY_DATATABLE_CHECK', 'ENTITY_DATATABLE_CHECK', 'READ', 0),
(801, 'datatable', 'CREATE_ENTITY_DATATABLE_CHECK', 'ENTITY_DATATABLE_CHECK', 'CREATE', 0),
(802, 'datatable', 'DELETE_ENTITY_DATATABLE_CHECK', 'ENTITY_DATATABLE_CHECK', 'DELETE', 0),
(803, 'configuration', 'CREATE_CREDITBUREAU_LOANPRODUCT_MAPPING', 'CREDITBUREAU_LOANPRODUCT_MAPPING', 'CREATE', 0),
(804, 'configuration', 'CREATE_ORGANISATIONCREDITBUREAU', 'ORGANISATIONCREDITBUREAU', 'CREATE', 0),
(805, 'configuration', 'UPDATE_ORGANISATIONCREDITBUREAU', 'ORGANISATIONCREDITBUREAU', 'UPDATE', 0),
(806, 'configuration', 'UPDATE_CREDITBUREAU_LOANPRODUCT_MAPPING', 'CREDITBUREAU_LOANPRODUCT_MAPPING', 'UPDATE', 0),
(807, 'configuration', 'GET_CREDITREPORT', 'CREDITREPORT', 'GET', 0),
(808, 'configuration', 'CREATE_CREDITBUREAU_CONFIGURATION', 'CREDITBUREAU_CONFIGURATION', 'CREATE', 0),
(809, 'configuration', 'UPDATE_CREDITBUREAU_CONFIGURATION', 'CREDITBUREAU_CONFIGURATION', 'UPDATE', 0),
(810, 'configuration', 'SAVE_CREDITREPORT', 'CREDITREPORT', 'SAVE', 0),
(811, 'configuration', 'DELETE_CREDITREPORT', 'CREDITREPORT', 'DELETE', 0),
(812, 'portfolio', 'CREATE_FAMILYMEMBERS', 'FAMILYMEMBERS', 'CREATE', 0),
(813, 'portfolio', 'UPDATE_FAMILYMEMBERS', 'FAMILYMEMBERS', 'UPDATE', 0),
(814, 'portfolio', 'DELETE_FAMILYMEMBERS', 'FAMILYMEMBERS', 'DELETE', 0),
(815, 'transaction_savings', 'HOLDAMOUNT_SAVINGSACCOUNT', 'SAVINGSACCOUNT', 'HOLDAMOUNT', 0),
(816, 'transaction_savings', 'HOLDAMOUNT_SAVINGSACCOUNT_CHECKER', 'SAVINGSACCOUNT', 'HOLDAMOUNT_CHECKER', 0),
(817, 'transaction_savings', 'BLOCKDEBIT_SAVINGSACCOUNT', 'SAVINGSACCOUNT', 'BLOCKDEBIT', 0),
(818, 'transaction_savings', 'BLOCKDEBIT_SAVINGSACCOUNT_CHECKER', 'SAVINGSACCOUNT', 'BLOCKDEBIT_CHECKER', 0),
(819, 'transaction_savings', 'UNBLOCKDEBIT_SAVINGSACCOUNT', 'SAVINGSACCOUNT', 'UNBLOCKDEBIT', 0),
(820, 'transaction_savings', 'UNBLOCKDEBIT_SAVINGSACCOUNT_CHECKER', 'SAVINGSACCOUNT', 'UNBLOCKDEBIT_CHECKER', 0),
(821, 'transaction_savings', 'BLOCKCREDIT_SAVINGSACCOUNT', 'SAVINGSACCOUNT', 'BLOCKCREDIT', 0),
(822, 'transaction_savings', 'BLOCKCREDIT_SAVINGSACCOUNT_CHECKER', 'SAVINGSACCOUNT', 'BLOCKCREDIT_CHECKER', 0),
(823, 'transaction_savings', 'UNBLOCKCREDIT_SAVINGSACCOUNT', 'SAVINGSACCOUNT', 'UNBLOCKCREDIT', 0),
(824, 'transaction_savings', 'UNBLOCKCREDIT_SAVINGSACCOUNT_CHECKER', 'SAVINGSACCOUNT', 'UNBLOCKCREDIT_CHECKER', 0),
(825, 'transaction_savings', 'BLOCK_SAVINGSACCOUNT', 'SAVINGSACCOUNT', 'BLOCK', 0),
(826, 'transaction_savings', 'BLOCK_SAVINGSACCOUNT_CHECKER', 'SAVINGSACCOUNT', 'BLOCK_CHECKER', 0),
(827, 'transaction_savings', 'UNBLOCK_SAVINGSACCOUNT', 'SAVINGSACCOUNT', 'UNBLOCK', 0),
(828, 'transaction_savings', 'UNBLOCK_SAVINGSACCOUNT_CHECKER', 'SAVINGSACCOUNT', 'UNBLOCK_CHECKER', 0),
(829, 'transaction_savings', 'RELEASEAMOUNT_SAVINGSACCOUNT', 'SAVINGSACCOUNT', 'RELEASEAMOUNT', 0),
(830, 'transaction_savings', 'RELEASEAMOUNT_SAVINGSACCOUNT_CHECKER', 'SAVINGSACCOUNT', 'RELEASEAMOUNT_CHECKER', 0),
(831, 'authorisation', 'UPDATE_ADHOC', 'ADHOC', 'UPDATE', 1),
(832, 'authorisation', 'UPDATE_ADHOC_CHECKER', 'ADHOC', 'UPDATE', 0),
(833, 'authorisation', 'DELETE_ADHOC', 'ADHOC', 'DELETE', 1),
(834, 'authorisation', 'DELETE_ADHOC_CHECKER', 'ADHOC', 'DELETE', 0),
(835, 'authorisation', 'CREATE_ADHOC', 'ADHOC', 'CREATE', 1),
(836, 'authorisation', 'CREATE_ADHOC_CHECKER', 'ADHOC', 'CREATE', 0),
(837, 'authorisation', 'INVALIDATE_TWOFACTOR_ACCESSTOKEN', 'TWOFACTOR_ACCESSTOKEN', 'INVALIDATE', 0),
(838, 'configuration', 'READ_TWOFACTOR_CONFIGURATION', 'TWOFACTOR_CONFIGURATION', 'READ', 0),
(839, 'configuration', 'UPDATE_TWOFACTOR_CONFIGURATION', 'TWOFACTOR_CONFIGURATION', 'UPDATE', 0),
(840, 'special', 'BYPASS_TWOFACTOR', NULL, NULL, 0),
(841, 'infrastructure', 'READ_IMPORT', 'IMPORT', 'READ', 0),
(842, 'portfolio', 'LINK_ACCOUNT_TO_POCKET', 'POCKET', 'LINK_ACCOUNT_TO', 0),
(843, 'portfolio', 'DELINK_ACCOUNT_FROM_POCKET', 'POCKET', 'DELINK_ACCOUNT_FROM', 0),
(844, 'interop', 'READ_INTERID', 'INTERID', 'READ', 0),
(845, 'interop', 'READ_INTERREQUEST', 'INTERREQUEST', 'READ', 0),
(846, 'interop', 'READ_INTERQUOTE', 'INTERQUOTE', 'READ', 0),
(847, 'interop', 'READ_INTERTRANSFER', 'INTERTRANSFER', 'READ', 0),
(848, 'interop', 'PREPARE_INTERTRANSFER', 'INTERTRANSFER', 'PREPARE', 0),
(849, 'interop', 'RELEASE_INTERTRANSFER', 'INTERTRANSFER', 'RELEASE', 0),
(850, 'interop', 'CREATE_INTERID', 'INTERID', 'CREATE', 0),
(851, 'interop', 'CREATE_INTERREQUEST', 'INTERREQUEST', 'CREATE', 0),
(852, 'interop', 'CREATE_INTERQUOTE', 'INTERQUOTE', 'CREATE', 0),
(853, 'interop', 'CREATE_INTERTRANSFER', 'INTERTRANSFER', 'CREATE', 0),
(854, 'interop', 'DELETE_INTERID', 'INTERID', 'DELETE', 0),
(855, 'organisation', 'READ_RATE', 'RATE', 'CREATE', 1),
(856, 'organisation', 'CREATE_RATE', 'RATE', 'CREATE', 1),
(857, 'organisation', 'UPDATE_RATE', 'RATE', 'UPDATE', 1),
(858, 'portfolio', 'CREATE_GSIMACCOUNT', 'GSIMACCOUNT', 'CREATE', 0),
(859, 'portfolio', 'APPROVE_GSIMACCOUNT', 'GSIMACCOUNT', 'APPROVE', 0),
(860, 'portfolio', 'ACTIVATE_GSIMACCOUNT', 'GSIMACCOUNT', 'ACTIVATE', 0),
(861, 'portfolio', 'APPROVALUNDO_GSIMACCOUNT', 'GSIMACCOUNT', 'APPROVALUNDO', 0),
(862, 'portfolio', 'UPDATE_GSIMACCOUNT', 'GSIMACCOUNT', 'UPDATE', 0),
(863, 'portfolio', 'REJECT_GSIMACCOUNT', 'GSIMACCOUNT', 'REJECT', 0),
(864, 'portfolio', 'DEPOSIT_GSIMACCOUNT', 'GSIMACCOUNT', 'DEPOSIT', 0),
(865, 'portfolio', 'CLOSE_GSIMACCOUNT', 'GSIMACCOUNT', 'CLOSE', 0),
(866, 'portfolio', 'APPROVE_GLIMLOAN', 'GLIMLOAN', 'APPROVE', 0),
(867, 'portfolio', 'DISBURSE_GLIMLOAN', 'GLIMLOAN', 'DISBURSE', 0),
(868, 'portfolio', 'REPAYMENT_GLIMLOAN', 'GLIMLOAN', 'REPAYMENT', 0),
(869, 'portfolio', 'UNDODISBURSAL_GLIMLOAN', 'GLIMLOAN', 'UNDODISBURSAL', 0),
(870, 'portfolio', 'UNDOAPPROVAL_GLIMLOAN', 'GLIMLOAN', 'UNDOAPPROVAL', 0),
(871, 'portfolio', 'REJECT_GLIMLOAN', 'GLIMLOAN', 'REJECT', 0);

-- --------------------------------------------------------

--
-- Table structure for table `m_pocket`
--

CREATE TABLE `m_pocket` (
  `id` bigint(20) NOT NULL,
  `app_user_id` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `m_pocket_accounts_mapping`
--

CREATE TABLE `m_pocket_accounts_mapping` (
  `id` bigint(20) NOT NULL,
  `pocket_id` bigint(20) NOT NULL,
  `account_id` bigint(20) NOT NULL,
  `account_type` int(11) NOT NULL,
  `account_number` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `m_portfolio_account_associations`
--

CREATE TABLE `m_portfolio_account_associations` (
  `id` bigint(20) NOT NULL,
  `loan_account_id` bigint(20) DEFAULT NULL,
  `savings_account_id` bigint(20) DEFAULT NULL,
  `linked_loan_account_id` bigint(20) DEFAULT NULL,
  `linked_savings_account_id` bigint(20) DEFAULT NULL,
  `association_type_enum` smallint(6) NOT NULL DEFAULT '1',
  `is_active` tinyint(4) NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `m_portfolio_command_source`
--

CREATE TABLE `m_portfolio_command_source` (
  `id` bigint(20) NOT NULL,
  `action_name` varchar(50) NOT NULL,
  `entity_name` varchar(50) NOT NULL,
  `office_id` bigint(20) DEFAULT NULL,
  `group_id` bigint(20) DEFAULT NULL,
  `client_id` bigint(20) DEFAULT NULL,
  `loan_id` bigint(20) DEFAULT NULL,
  `savings_account_id` bigint(20) DEFAULT NULL,
  `api_get_url` varchar(100) NOT NULL,
  `resource_id` bigint(20) DEFAULT NULL,
  `subresource_id` bigint(20) DEFAULT NULL,
  `command_as_json` text NOT NULL,
  `maker_id` bigint(20) NOT NULL,
  `made_on_date` datetime NOT NULL,
  `checker_id` bigint(20) DEFAULT NULL,
  `checked_on_date` datetime DEFAULT NULL,
  `processing_result_enum` smallint(6) NOT NULL,
  `product_id` bigint(20) DEFAULT NULL,
  `transaction_id` varchar(100) DEFAULT NULL,
  `creditbureau_id` bigint(20) DEFAULT NULL,
  `organisation_creditbureau_id` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `m_portfolio_command_source`
--

INSERT INTO `m_portfolio_command_source` (`id`, `action_name`, `entity_name`, `office_id`, `group_id`, `client_id`, `loan_id`, `savings_account_id`, `api_get_url`, `resource_id`, `subresource_id`, `command_as_json`, `maker_id`, `made_on_date`, `checker_id`, `checked_on_date`, `processing_result_enum`, `product_id`, `transaction_id`, `creditbureau_id`, `organisation_creditbureau_id`) VALUES
(1, 'CREATE', 'OFFICE', 2, NULL, NULL, NULL, NULL, '/offices/template', 2, NULL, '{\"parentId\":1,\"name\":\"buruburu\",\"externalId\":\"2\",\"locale\":\"en\",\"dateFormat\":\"dd MMMM yyyy\",\"openingDate\":\"01 November 2022\"}', 1, '2022-11-01 23:55:17', NULL, NULL, 1, NULL, NULL, NULL, NULL),
(2, 'UPDATE', 'OFFICE', 1, NULL, NULL, NULL, NULL, '/offices/1', 1, NULL, '{\"openingDate\":\"22 November 2022\",\"dateFormat\":\"dd MMMM yyyy\",\"locale\":\"en\"}', 1, '2022-11-22 17:39:35', NULL, NULL, 1, NULL, NULL, NULL, NULL),
(3, 'CREATE', 'STAFF', 1, NULL, NULL, NULL, NULL, '/staff/template', 1, NULL, '{\"isLoanOfficer\":true,\"officeId\":1,\"firstname\":\"Machette\",\"lastname\":\"Leo\",\"mobileNo\":\"25471429048\",\"joiningDate\":\"21 November 2022\",\"locale\":\"en\",\"dateFormat\":\"dd MMMM yyyy\"}', 1, '2022-11-22 17:45:40', NULL, NULL, 1, NULL, NULL, NULL, NULL),
(4, 'UPDATE', 'WORKINGDAYS', NULL, NULL, NULL, NULL, NULL, '/workingdays/', 1, NULL, '{\"recurrence\":\"FREQ\\u003dWEEKLY;INTERVAL\\u003d1;BYDAY\\u003dMO,TU,WE,TH,FR,SA\"}', 1, '2022-11-22 17:46:24', NULL, NULL, 1, NULL, NULL, NULL, NULL),
(5, 'ENABLE', 'ROLE', NULL, NULL, NULL, NULL, NULL, '/roles/2/enable', 2, NULL, '{}', 1, '2022-11-22 17:49:07', NULL, NULL, 1, NULL, NULL, NULL, NULL),
(6, 'CREATE', 'ROLE', NULL, NULL, NULL, NULL, NULL, '/roles/template', 3, NULL, '{\"name\":\"Teller\",\"description\":\"Perform all Teller Operations\"}', 1, '2022-11-22 17:49:56', NULL, NULL, 1, NULL, NULL, NULL, NULL),
(7, 'PERMISSIONS', 'ROLE', NULL, NULL, NULL, NULL, NULL, '/roles/3/permissions', 3, NULL, '{\"permissions\":{\"APPROVALUNDO_FIXEDDEPOSITACCOUNT\":true,\"CALCULATEINTEREST_RECURRINGDEPOSITACCOUNT\":true,\"ACTIVATE_SAVINGSACCOUNT_CHECKER\":true,\"UNBLOCKCREDIT_SAVINGSACCOUNT\":true,\"APPROVE_RECURRINGDEPOSITACCOUNT_CHECKER\":true,\"REFUNDBYTRANSFER_ACCOUNTTRANSFER\":true,\"REJECT_SAVINGSACCOUNT\":true,\"CLOSE_RECURRINGDEPOSITACCOUNT_CHECKER\":true,\"ACTIVATE_FIXEDDEPOSITACCOUNT\":true,\"ADJUSTTRANSACTION_RECURRINGDEPOSITACCOUNT\":true,\"APPROVALUNDO_SAVINGSACCOUNT\":true,\"DEPOSIT_FIXEDDEPOSITACCOUNT_CHECKER\":true,\"UNDOTRANSACTION_FIXEDDEPOSITACCOUNT\":true,\"PREMATURECLOSE_FIXEDDEPOSITACCOUNT\":true,\"UNDOTRANSACTION_SAVINGSACCOUNT\":true,\"BLOCKDEBIT_SAVINGSACCOUNT\":true,\"CLOSE_SAVINGSACCOUNT\":true,\"HOLDAMOUNT_SAVINGSACCOUNT\":true,\"PREMATURECLOSE_RECURRINGDEPOSITACCOUNT\":true,\"ADJUSTTRANSACTION_SAVINGSACCOUNT\":true,\"WITHDRAWAL_FIXEDDEPOSITACCOUNT_CHECKER\":true,\"CLOSE_FIXEDDEPOSITACCOUNT_CHECKER\":true,\"APPROVALUNDO_SAVINGSACCOUNT_CHECKER\":true,\"BLOCKCREDIT_SAVINGSACCOUNT\":true,\"CLOSE_FIXEDDEPOSITACCOUNT\":true,\"UNDOTRANSACTION_FIXEDDEPOSITACCOUNT_CHECKER\":true,\"DEPOSIT_RECURRINGDEPOSITACCOUNT_CHECKER\":true,\"RELEASEAMOUNT_SAVINGSACCOUNT_CHECKER\":true,\"UNDOTRANSACTION_RECURRINGDEPOSITACCOUNT\":true,\"APPROVE_SAVINGSACCOUNT\":true,\"DEPOSIT_RECURRINGDEPOSITACCOUNT\":true,\"REJECT_RECURRINGDEPOSITACCOUNT\":true,\"BLOCKCREDIT_SAVINGSACCOUNT_CHECKER\":true,\"UNDOTRANSACTION_CLIENT\":true,\"APPLYANNUALFEE_SAVINGSACCOUNT_CHECKER\":true,\"CALCULATEINTEREST_FIXEDDEPOSITACCOUNT_CHECKER\":true,\"WITHDRAWAL_SAVINGSACCOUNT_CHECKER\":true,\"CALCULATEINTEREST_RECURRINGDEPOSITACCOUNT_CHECKER\":true,\"POSTINTEREST_RECURRINGDEPOSITACCOUNT\":true,\"CLOSE_SAVINGSACCOUNT_CHECKER\":true,\"UNDOTRANSACTION_RECURRINGDEPOSITACCOUNT_CHECKER\":true,\"UPDATEDEPOSITAMOUNT_RECURRINGDEPOSITACCOUNT_CHECKER\":true,\"BLOCK_SAVINGSACCOUNT_CHECKER\":true,\"UNBLOCK_SAVINGSACCOUNT\":true,\"CALCULATEINTEREST_FIXEDDEPOSITACCOUNT\":true,\"REJECT_FIXEDDEPOSITACCOUNT\":true,\"CLOSE_RECURRINGDEPOSITACCOUNT\":true,\"POSTINTEREST_SAVINGSACCOUNT_CHECKER\":true,\"READTRANSACTION_CLIENT\":true,\"APPROVE_SAVINGSACCOUNT_CHECKER\":true,\"WITHDRAW_SAVINGSACCOUNT_CHECKER\":true,\"WITHDRAWAL_FIXEDDEPOSITACCOUNT\":true,\"BLOCK_SAVINGSACCOUNT\":true,\"DEPOSIT_FIXEDDEPOSITACCOUNT\":true,\"ACTIVATE_RECURRINGDEPOSITACCOUNT_CHECKER\":true,\"ACTIVATE_SAVINGSACCOUNT\":true,\"APPROVALUNDO_RECURRINGDEPOSITACCOUNT\":true,\"UPDATEDEPOSITAMOUNT_RECURRINGDEPOSITACCOUNT\":true,\"REJECT_RECURRINGDEPOSITACCOUNT_CHECKER\":true,\"ADJUSTTRANSACTION_FIXEDDEPOSITACCOUNT\":true,\"POSTINTEREST_FIXEDDEPOSITACCOUNT\":true,\"UNBLOCKDEBIT_SAVINGSACCOUNT_CHECKER\":true,\"POSTINTEREST_FIXEDDEPOSITACCOUNT_CHECKER\":true,\"DEPOSIT_SAVINGSACCOUNT_CHECKER\":true,\"UNDOTRANSACTION_SAVINGSACCOUNT_CHECKER\":true,\"WITHDRAW_FIXEDDEPOSITACCOUNT_CHECKER\":true,\"POSTINTEREST_RECURRINGDEPOSITACCOUNT_CHECKER\":true,\"HOLDAMOUNT_SAVINGSACCOUNT_CHECKER\":true,\"REFUNDBYTRANSFER_ACCOUNTTRANSFER_CHECKER\":true,\"UNBLOCKCREDIT_SAVINGSACCOUNT_CHECKER\":true,\"ACTIVATE_RECURRINGDEPOSITACCOUNT\":true,\"UNBLOCK_SAVINGSACCOUNT_CHECKER\":true,\"APPROVE_FIXEDDEPOSITACCOUNT_CHECKER\":true,\"PREMATURECLOSE_FIXEDDEPOSITACCOUNT_CHECKER\":true,\"APPROVE_RECURRINGDEPOSITACCOUNT\":true,\"WITHDRAW_FIXEDDEPOSITACCOUNT\":true,\"CREATE_ACCOUNTTRANSFER_CHECKER\":true,\"WITHDRAWAL_RECURRINGDEPOSITACCOUNT_CHECKER\":true,\"DEPOSIT_SAVINGSACCOUNT\":true,\"APPLYANNUALFEE_SAVINGSACCOUNT\":true,\"REJECT_FIXEDDEPOSITACCOUNT_CHECKER\":true,\"CALCULATEINTEREST_SAVINGSACCOUNT\":true,\"BLOCKDEBIT_SAVINGSACCOUNT_CHECKER\":true,\"READ_ACCOUNTTRANSFER\":true,\"PREMATURECLOSE_RECURRINGDEPOSITACCOUNT_CHECKER\":true,\"WITHDRAW_RECURRINGDEPOSITACCOUNT\":true,\"APPROVALUNDO_FIXEDDEPOSITACCOUNT_CHECKER\":true,\"RELEASEAMOUNT_SAVINGSACCOUNT\":true,\"WITHDRAWAL_SAVINGSACCOUNT\":true,\"WITHDRAWAL_RECURRINGDEPOSITACCOUNT\":true,\"WITHDRAW_RECURRINGDEPOSITACCOUNT_CHECKER\":true,\"UNBLOCKDEBIT_SAVINGSACCOUNT\":true,\"ACTIVATE_FIXEDDEPOSITACCOUNT_CHECKER\":true,\"WITHDRAW_SAVINGSACCOUNT\":true,\"REJECT_SAVINGSACCOUNT_CHECKER\":true,\"CALCULATEINTEREST_SAVINGSACCOUNT_CHECKER\":true,\"POSTINTEREST_SAVINGSACCOUNT\":true,\"CREATE_ACCOUNTTRANSFER\":true,\"APPROVALUNDO_RECURRINGDEPOSITACCOUNT_CHECKER\":true,\"APPROVE_FIXEDDEPOSITACCOUNT\":true}}', 1, '2022-11-22 17:52:37', NULL, NULL, 1, NULL, NULL, NULL, NULL),
(8, 'UPDATE', 'EXTERNALSERVICES', NULL, NULL, NULL, NULL, NULL, '/externalservices/SMTP', 2, NULL, '{\"value\":\"eugenechimita41@gmail.com\"}', 1, '2022-11-22 18:11:52', NULL, NULL, 1, NULL, NULL, NULL, NULL),
(9, 'UPDATE', 'EXTERNALSERVICES', NULL, NULL, NULL, NULL, NULL, '/externalservices/SMTP', 2, NULL, '{\"value\":\"false\"}', 1, '2022-11-22 18:13:27', NULL, NULL, 1, NULL, NULL, NULL, NULL),
(10, 'CREATE', 'USER', 1, NULL, NULL, NULL, NULL, '/users/template', 11, NULL, '{\"sendPasswordToEmail\":false,\"roles\":[\"3\"],\"username\":\"machette\",\"firstname\":\"machette\",\"lastname\":\"leo\",\"email\":\"eugenechiita@gmail.com\",\"password\":\"abc123456\",\"repeatPassword\":\"abc123456\",\"officeId\":1,\"staffId\":1}', 1, '2022-11-22 18:17:50', NULL, NULL, 1, NULL, NULL, NULL, NULL),
(11, 'UPDATE', 'GLACCOUNT', NULL, NULL, NULL, NULL, NULL, '/glaccounts/26', 26, NULL, '{\"glCode\":\"50200\"}', 1, '2022-11-22 19:12:05', NULL, NULL, 1, NULL, NULL, NULL, NULL),
(12, 'CREATE', 'GLACCOUNT', NULL, NULL, NULL, NULL, NULL, '/glaccounts/template', 58, NULL, '{\"manualEntriesAllowed\":true,\"type\":3,\"usage\":\"1\",\"glCode\":\"50201\",\"parentId\":26,\"name\":\"Additional investment\",\"description\":\"This Describes the money Initially invested into the business\"}', 1, '2022-11-22 19:31:26', NULL, NULL, 1, NULL, NULL, NULL, NULL),
(13, 'CREATE', 'FINANCIALACTIVITYACCOUNT', NULL, NULL, NULL, NULL, NULL, '/organizationglaccounts/template', 1, NULL, '{\"financialActivityId\":300,\"glAccountId\":58}', 1, '2022-11-22 19:31:55', NULL, NULL, 1, NULL, NULL, NULL, NULL),
(14, 'CREATE', 'SAVINGSPRODUCT', NULL, NULL, NULL, NULL, NULL, '/savingsproducts/template', 1, NULL, '{\"currencyCode\":\"USD\",\"digitsAfterDecimal\":2,\"interestCompoundingPeriodType\":1,\"interestPostingPeriodType\":4,\"interestCalculationType\":1,\"interestCalculationDaysInYearType\":365,\"accountingRule\":\"2\",\"paymentChannelToFundSourceMappings\":[],\"feeToIncomeAccountMappings\":[],\"penaltyToIncomeAccountMappings\":[],\"charges\":[],\"locale\":\"en\",\"name\":\"MobileMoney\",\"shortName\":\"MM\",\"description\":\"all the collections into the sytem\",\"inMultiplesOf\":\"10\",\"nominalAnnualInterestRate\":0,\"minRequiredOpeningBalance\":\"0\",\"lockinPeriodFrequency\":\"0\",\"lockinPeriodFrequencyType\":0,\"withdrawalFeeForTransfers\":true,\"minBalanceForInterestCalculation\":\"10\",\"minRequiredBalance\":\"0\",\"savingsReferenceAccountId\":32,\"overdraftPortfolioControlId\":34,\"savingsControlAccountId\":30,\"transfersInSuspenseAccountId\":30,\"interestOnSavingsAccountId\":42,\"writeOffAccountId\":41,\"incomeFromFeeAccountId\":36,\"incomeFromPenaltyAccountId\":36,\"incomeFromInterestId\":36}', 1, '2022-11-22 19:56:29', NULL, NULL, 1, NULL, NULL, NULL, NULL),
(15, 'CREATE', 'CLIENT', 1, NULL, 1, NULL, 1, '/clients/template', 1, NULL, '{\"address\":[],\"familyMembers\":[],\"officeId\":1,\"legalFormId\":1,\"firstname\":\"Eugene\",\"lastname\":\"Mutswenje\",\"mobileNo\":\"254714290788\",\"savingsProductId\":1,\"active\":true,\"locale\":\"en\",\"dateFormat\":\"dd MMMM yyyy\",\"activationDate\":\"22 November 2022\",\"submittedOnDate\":\"22 November 2022\",\"dateOfBirth\":\"01 February 2001\"}', 1, '2022-11-22 20:05:27', NULL, NULL, 1, NULL, NULL, NULL, NULL),
(16, 'CREATE', 'USER', 1, NULL, NULL, NULL, NULL, '/users/template', 12, NULL, '{\"isSelfServiceUser\":true,\"sendPasswordToEmail\":false,\"roles\":[2],\"firstname\":\"Eugene\",\"lastname\":\"Mutswenje\",\"officeId\":1,\"clients\":[\"1\"],\"username\":\"eugene\",\"password\":\"abc123456\",\"repeatPassword\":\"abc123456\"}', 1, '2022-11-22 20:07:42', NULL, NULL, 1, NULL, NULL, NULL, NULL),
(17, 'PERMISSIONS', 'ROLE', NULL, NULL, NULL, NULL, NULL, '/roles/3/permissions', 3, NULL, '{\"permissions\":{\"READ_CLIENT\":true,\"ACCEPTTRANSFER_CLIENT\":true,\"REJECT_CLIENT\":true,\"ACTIVATE_CLIENT\":true,\"PAY_CLIENTCHARGE\":true,\"WITHDRAW_CLIENT_CHECKER\":true,\"PROPOSETRANSFER_CLIENT_CHECKER\":true,\"REACTIVATE_CLIENT\":true,\"CLOSE_CLIENT\":true,\"CREATE_CLIENT\":true,\"READ_CLIENTCHARGE\":true,\"UPDATE_SAVINGSACCOUNT_CHECKER\":true,\"REACTIVATE_CLIENT_CHECKER\":true,\"REJECT_CLIENT_CHECKER\":true,\"REJECTTRANSFER_CLIENT_CHECKER\":true,\"WITHDRAWTRANSFER_CLIENT_CHECKER\":true,\"WITHDRAWTRANSFER_CLIENT\":true,\"WITHDRAW_CLIENT\":true,\"PAY_CLIENTCHARGE_CHECKER\":true,\"CREATE_FIXEDDEPOSITACCOUNT_CHECKER\":true,\"CREATE_SAVINGSACCOUNTCHARGE\":true,\"ACTIVATE_CLIENT_CHECKER\":true,\"PROPOSETRANSFER_CLIENT\":true,\"REJECTTRANSFER_CLIENT\":true,\"CREATE_CLIENT_CHECKER\":true,\"CREATE_FIXEDDEPOSITACCOUNT\":true,\"UPDATE_SAVINGSACCOUNT\":true}}', 1, '2022-11-22 20:36:40', NULL, NULL, 1, NULL, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `m_product_loan`
--

CREATE TABLE `m_product_loan` (
  `id` bigint(20) NOT NULL,
  `short_name` varchar(4) NOT NULL,
  `currency_code` varchar(3) NOT NULL,
  `currency_digits` smallint(6) NOT NULL,
  `currency_multiplesof` smallint(6) DEFAULT NULL,
  `principal_amount` decimal(19,6) DEFAULT NULL,
  `min_principal_amount` decimal(19,6) DEFAULT NULL,
  `max_principal_amount` decimal(19,6) DEFAULT NULL,
  `arrearstolerance_amount` decimal(19,6) DEFAULT NULL,
  `name` varchar(100) NOT NULL,
  `description` varchar(500) DEFAULT NULL,
  `fund_id` bigint(20) DEFAULT NULL,
  `is_linked_to_floating_interest_rates` bit(1) NOT NULL DEFAULT b'0',
  `allow_variabe_installments` bit(1) NOT NULL DEFAULT b'0',
  `nominal_interest_rate_per_period` decimal(19,6) DEFAULT NULL,
  `min_nominal_interest_rate_per_period` decimal(19,6) DEFAULT NULL,
  `max_nominal_interest_rate_per_period` decimal(19,6) DEFAULT NULL,
  `interest_period_frequency_enum` smallint(6) DEFAULT NULL,
  `annual_nominal_interest_rate` decimal(19,6) DEFAULT NULL,
  `interest_method_enum` smallint(6) NOT NULL,
  `interest_calculated_in_period_enum` smallint(6) NOT NULL DEFAULT '1',
  `allow_partial_period_interest_calcualtion` tinyint(4) NOT NULL DEFAULT '0',
  `repay_every` smallint(6) NOT NULL,
  `repayment_period_frequency_enum` smallint(6) NOT NULL,
  `number_of_repayments` smallint(6) NOT NULL,
  `min_number_of_repayments` smallint(6) DEFAULT NULL,
  `max_number_of_repayments` smallint(6) DEFAULT NULL,
  `grace_on_principal_periods` smallint(6) DEFAULT NULL,
  `recurring_moratorium_principal_periods` smallint(6) DEFAULT NULL,
  `grace_on_interest_periods` smallint(6) DEFAULT NULL,
  `grace_interest_free_periods` smallint(6) DEFAULT NULL,
  `amortization_method_enum` smallint(6) NOT NULL,
  `accounting_type` smallint(6) NOT NULL,
  `loan_transaction_strategy_id` bigint(20) DEFAULT NULL,
  `external_id` varchar(100) DEFAULT NULL,
  `include_in_borrower_cycle` tinyint(4) NOT NULL DEFAULT '0',
  `use_borrower_cycle` tinyint(4) NOT NULL DEFAULT '0',
  `start_date` date DEFAULT NULL,
  `close_date` date DEFAULT NULL,
  `allow_multiple_disbursals` tinyint(4) NOT NULL DEFAULT '0',
  `max_disbursals` int(11) DEFAULT NULL,
  `max_outstanding_loan_balance` decimal(19,6) DEFAULT NULL,
  `grace_on_arrears_ageing` smallint(6) DEFAULT NULL,
  `overdue_days_for_npa` smallint(6) DEFAULT NULL,
  `days_in_month_enum` smallint(6) NOT NULL DEFAULT '1',
  `days_in_year_enum` smallint(6) NOT NULL DEFAULT '1',
  `interest_recalculation_enabled` tinyint(4) NOT NULL DEFAULT '0',
  `min_days_between_disbursal_and_first_repayment` int(11) DEFAULT NULL,
  `hold_guarantee_funds` tinyint(4) NOT NULL DEFAULT '0',
  `principal_threshold_for_last_installment` decimal(5,2) NOT NULL DEFAULT '50.00',
  `account_moves_out_of_npa_only_on_arrears_completion` tinyint(4) NOT NULL DEFAULT '0',
  `can_define_fixed_emi_amount` tinyint(4) NOT NULL DEFAULT '0',
  `instalment_amount_in_multiples_of` decimal(19,6) DEFAULT NULL,
  `can_use_for_topup` tinyint(4) NOT NULL DEFAULT '0',
  `sync_expected_with_disbursement_date` tinyint(4) DEFAULT '0',
  `is_equal_amortization` tinyint(4) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `m_product_loan_charge`
--

CREATE TABLE `m_product_loan_charge` (
  `product_loan_id` bigint(20) NOT NULL,
  `charge_id` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `m_product_loan_configurable_attributes`
--

CREATE TABLE `m_product_loan_configurable_attributes` (
  `id` bigint(20) NOT NULL,
  `loan_product_id` bigint(20) NOT NULL,
  `amortization_method_enum` tinyint(4) NOT NULL DEFAULT '1',
  `interest_method_enum` tinyint(4) NOT NULL DEFAULT '1',
  `loan_transaction_strategy_id` tinyint(4) NOT NULL DEFAULT '1',
  `interest_calculated_in_period_enum` tinyint(4) NOT NULL DEFAULT '1',
  `arrearstolerance_amount` tinyint(4) NOT NULL DEFAULT '1',
  `repay_every` tinyint(4) NOT NULL DEFAULT '1',
  `moratorium` tinyint(4) NOT NULL DEFAULT '1',
  `grace_on_arrears_ageing` tinyint(4) NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `m_product_loan_floating_rates`
--

CREATE TABLE `m_product_loan_floating_rates` (
  `id` bigint(20) NOT NULL,
  `loan_product_id` bigint(20) NOT NULL,
  `floating_rates_id` bigint(20) NOT NULL,
  `interest_rate_differential` decimal(19,6) NOT NULL DEFAULT '0.000000',
  `min_differential_lending_rate` decimal(19,6) NOT NULL DEFAULT '0.000000',
  `default_differential_lending_rate` decimal(19,6) NOT NULL DEFAULT '0.000000',
  `max_differential_lending_rate` decimal(19,6) NOT NULL DEFAULT '0.000000',
  `is_floating_interest_rate_calculation_allowed` bit(1) NOT NULL DEFAULT b'0'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `m_product_loan_guarantee_details`
--

CREATE TABLE `m_product_loan_guarantee_details` (
  `id` bigint(20) NOT NULL,
  `loan_product_id` bigint(20) NOT NULL,
  `mandatory_guarantee` decimal(19,5) NOT NULL,
  `minimum_guarantee_from_own_funds` decimal(19,5) DEFAULT NULL,
  `minimum_guarantee_from_guarantor_funds` decimal(19,5) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `m_product_loan_rate`
--

CREATE TABLE `m_product_loan_rate` (
  `product_loan_id` bigint(20) NOT NULL,
  `rate_id` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `m_product_loan_recalculation_details`
--

CREATE TABLE `m_product_loan_recalculation_details` (
  `id` bigint(20) NOT NULL,
  `product_id` bigint(20) NOT NULL,
  `compound_type_enum` smallint(6) NOT NULL,
  `reschedule_strategy_enum` smallint(6) NOT NULL,
  `rest_frequency_type_enum` smallint(6) NOT NULL,
  `rest_frequency_interval` smallint(6) NOT NULL DEFAULT '0',
  `arrears_based_on_original_schedule` tinyint(4) NOT NULL DEFAULT '0',
  `pre_close_interest_calculation_strategy` smallint(6) NOT NULL DEFAULT '1',
  `compounding_frequency_type_enum` smallint(6) DEFAULT NULL,
  `compounding_frequency_interval` smallint(6) DEFAULT NULL,
  `rest_frequency_nth_day_enum` int(11) DEFAULT NULL,
  `rest_frequency_on_day` int(11) DEFAULT NULL,
  `rest_frequency_weekday_enum` int(11) DEFAULT NULL,
  `compounding_frequency_nth_day_enum` int(11) DEFAULT NULL,
  `compounding_frequency_on_day` int(11) DEFAULT NULL,
  `compounding_frequency_weekday_enum` int(11) DEFAULT NULL,
  `is_compounding_to_be_posted_as_transaction` tinyint(4) NOT NULL DEFAULT '0',
  `allow_compounding_on_eod` tinyint(4) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `m_product_loan_variable_installment_config`
--

CREATE TABLE `m_product_loan_variable_installment_config` (
  `id` bigint(20) NOT NULL,
  `loan_product_id` bigint(20) NOT NULL,
  `minimum_gap` int(11) NOT NULL,
  `maximum_gap` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `m_product_loan_variations_borrower_cycle`
--

CREATE TABLE `m_product_loan_variations_borrower_cycle` (
  `id` bigint(20) NOT NULL,
  `loan_product_id` bigint(20) NOT NULL DEFAULT '0',
  `borrower_cycle_number` int(11) NOT NULL DEFAULT '0',
  `value_condition` int(11) NOT NULL DEFAULT '0',
  `param_type` int(11) NOT NULL DEFAULT '0',
  `default_value` decimal(19,6) NOT NULL DEFAULT '0.000000',
  `max_value` decimal(19,6) DEFAULT NULL,
  `min_value` decimal(19,6) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `m_product_mix`
--

CREATE TABLE `m_product_mix` (
  `id` bigint(20) NOT NULL,
  `product_id` bigint(20) NOT NULL,
  `restricted_product_id` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `m_provisioning_criteria`
--

CREATE TABLE `m_provisioning_criteria` (
  `id` bigint(20) NOT NULL,
  `criteria_name` varchar(200) NOT NULL,
  `createdby_id` bigint(20) DEFAULT NULL,
  `created_date` datetime DEFAULT NULL,
  `lastmodifiedby_id` bigint(20) DEFAULT NULL,
  `lastmodified_date` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `m_provisioning_criteria_definition`
--

CREATE TABLE `m_provisioning_criteria_definition` (
  `id` bigint(20) NOT NULL,
  `criteria_id` bigint(20) NOT NULL,
  `category_id` bigint(20) NOT NULL,
  `min_age` bigint(20) NOT NULL,
  `max_age` bigint(20) NOT NULL,
  `provision_percentage` decimal(5,2) NOT NULL,
  `liability_account` bigint(20) DEFAULT NULL,
  `expense_account` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `m_provisioning_history`
--

CREATE TABLE `m_provisioning_history` (
  `id` bigint(20) NOT NULL,
  `journal_entry_created` bit(1) DEFAULT b'0',
  `createdby_id` bigint(20) DEFAULT NULL,
  `created_date` date DEFAULT NULL,
  `lastmodifiedby_id` bigint(20) DEFAULT NULL,
  `lastmodified_date` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `m_provision_category`
--

CREATE TABLE `m_provision_category` (
  `id` bigint(20) NOT NULL,
  `category_name` varchar(100) NOT NULL,
  `description` varchar(300) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `m_provision_category`
--

INSERT INTO `m_provision_category` (`id`, `category_name`, `description`) VALUES
(1, 'STANDARD', 'Punctual Payment without any dues'),
(2, 'SUB-STANDARD', 'Principal and/or Interest overdue by x days'),
(3, 'DOUBTFUL', 'Principal and/or Interest overdue by x days and less than y'),
(4, 'LOSS', 'Principal and/or Interest overdue by y days');

-- --------------------------------------------------------

--
-- Table structure for table `m_rate`
--

CREATE TABLE `m_rate` (
  `id` bigint(20) NOT NULL,
  `name` varchar(250) NOT NULL,
  `percentage` decimal(10,2) NOT NULL,
  `active` tinyint(4) DEFAULT '0',
  `product_apply` smallint(6) NOT NULL,
  `created_date` datetime DEFAULT NULL,
  `createdby_id` bigint(20) NOT NULL,
  `lastmodifiedby_id` bigint(20) NOT NULL,
  `lastmodified_date` datetime DEFAULT NULL,
  `approve_user` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `m_report_mailing_job`
--

CREATE TABLE `m_report_mailing_job` (
  `id` bigint(20) NOT NULL,
  `name` varchar(100) NOT NULL,
  `description` text,
  `start_datetime` datetime NOT NULL,
  `recurrence` varchar(100) DEFAULT NULL,
  `created_date` date NOT NULL,
  `createdby_id` bigint(20) NOT NULL,
  `lastmodified_date` date DEFAULT NULL,
  `lastmodifiedby_id` bigint(20) DEFAULT NULL,
  `email_recipients` text NOT NULL,
  `email_subject` varchar(100) NOT NULL,
  `email_message` text NOT NULL,
  `email_attachment_file_format` varchar(10) NOT NULL,
  `stretchy_report_id` int(11) NOT NULL,
  `stretchy_report_param_map` text,
  `previous_run_datetime` datetime DEFAULT NULL,
  `next_run_datetime` datetime DEFAULT NULL,
  `previous_run_status` varchar(10) DEFAULT NULL,
  `previous_run_error_log` text,
  `previous_run_error_message` text,
  `number_of_runs` int(11) NOT NULL DEFAULT '0',
  `is_active` tinyint(4) NOT NULL DEFAULT '0',
  `is_deleted` tinyint(4) NOT NULL DEFAULT '0',
  `run_as_userid` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `m_report_mailing_job_configuration`
--

CREATE TABLE `m_report_mailing_job_configuration` (
  `id` int(11) NOT NULL,
  `name` varchar(50) NOT NULL,
  `value` varchar(200) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `m_report_mailing_job_configuration`
--

INSERT INTO `m_report_mailing_job_configuration` (`id`, `name`, `value`) VALUES
(1, 'GMAIL_SMTP_SERVER', 'smtp.gmail.com'),
(2, 'GMAIL_SMTP_PORT', '587'),
(3, 'GMAIL_SMTP_USERNAME', ''),
(4, 'GMAIL_SMTP_PASSWORD', '');

-- --------------------------------------------------------

--
-- Table structure for table `m_report_mailing_job_run_history`
--

CREATE TABLE `m_report_mailing_job_run_history` (
  `id` bigint(20) NOT NULL,
  `job_id` bigint(20) NOT NULL,
  `start_datetime` datetime NOT NULL,
  `end_datetime` datetime NOT NULL,
  `status` varchar(10) NOT NULL,
  `error_message` text,
  `error_log` text
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `m_role`
--

CREATE TABLE `m_role` (
  `id` bigint(20) NOT NULL,
  `name` varchar(100) NOT NULL,
  `description` varchar(500) NOT NULL,
  `is_disabled` tinyint(4) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `m_role`
--

INSERT INTO `m_role` (`id`, `name`, `description`, `is_disabled`) VALUES
(1, 'Super user', 'This role provides all application permissions.', 0),
(2, 'Self Service User', 'self service user role', 0),
(3, 'Teller', 'Perform all Teller Operations', 0);

-- --------------------------------------------------------

--
-- Table structure for table `m_role_permission`
--

CREATE TABLE `m_role_permission` (
  `role_id` bigint(20) NOT NULL,
  `permission_id` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `m_role_permission`
--

INSERT INTO `m_role_permission` (`role_id`, `permission_id`) VALUES
(1, 1),
(3, 110),
(3, 111),
(3, 112),
(3, 191),
(3, 192),
(3, 249),
(3, 250),
(3, 251),
(3, 252),
(3, 253),
(3, 254),
(3, 255),
(3, 256),
(3, 296),
(3, 297),
(3, 312),
(3, 313),
(3, 349),
(3, 358),
(3, 359),
(3, 360),
(3, 361),
(3, 362),
(3, 363),
(3, 364),
(3, 365),
(3, 366),
(3, 367),
(3, 368),
(3, 369),
(3, 374),
(3, 375),
(3, 377),
(3, 378),
(3, 379),
(3, 380),
(3, 389),
(3, 390),
(3, 391),
(3, 393),
(3, 394),
(3, 395),
(3, 396),
(3, 403),
(3, 477),
(3, 478),
(3, 483),
(3, 484),
(3, 485),
(3, 486),
(3, 487),
(3, 488),
(3, 489),
(3, 490),
(3, 491),
(3, 492),
(3, 493),
(3, 494),
(3, 495),
(3, 496),
(3, 497),
(3, 498),
(3, 499),
(3, 500),
(3, 501),
(3, 502),
(3, 503),
(3, 504),
(3, 505),
(3, 513),
(3, 514),
(3, 515),
(3, 516),
(3, 517),
(3, 518),
(3, 519),
(3, 520),
(3, 521),
(3, 522),
(3, 523),
(3, 524),
(3, 525),
(3, 526),
(3, 527),
(3, 528),
(3, 529),
(3, 530),
(3, 531),
(3, 532),
(3, 533),
(3, 534),
(3, 535),
(3, 536),
(3, 537),
(3, 538),
(3, 539),
(3, 614),
(3, 615),
(3, 616),
(3, 617),
(3, 618),
(3, 619),
(3, 620),
(3, 621),
(3, 622),
(3, 623),
(3, 666),
(3, 670),
(3, 676),
(3, 679),
(3, 680),
(3, 815),
(3, 816),
(3, 817),
(3, 818),
(3, 819),
(3, 820),
(3, 821),
(3, 822),
(3, 823),
(3, 824),
(3, 825),
(3, 826),
(3, 827),
(3, 828),
(3, 829),
(3, 830);

-- --------------------------------------------------------

--
-- Table structure for table `m_savings_account`
--

CREATE TABLE `m_savings_account` (
  `id` bigint(20) NOT NULL,
  `account_no` varchar(20) NOT NULL,
  `external_id` varchar(100) DEFAULT NULL,
  `client_id` bigint(20) DEFAULT NULL,
  `group_id` bigint(20) DEFAULT NULL,
  `gsim_id` bigint(20) DEFAULT NULL,
  `product_id` bigint(20) DEFAULT NULL,
  `field_officer_id` bigint(20) DEFAULT NULL,
  `status_enum` smallint(6) NOT NULL DEFAULT '300',
  `sub_status_enum` smallint(6) NOT NULL DEFAULT '0',
  `account_type_enum` smallint(6) NOT NULL DEFAULT '1',
  `deposit_type_enum` smallint(6) NOT NULL DEFAULT '100',
  `submittedon_date` date NOT NULL,
  `submittedon_userid` bigint(20) DEFAULT NULL,
  `approvedon_date` date DEFAULT NULL,
  `approvedon_userid` bigint(20) DEFAULT NULL,
  `rejectedon_date` date DEFAULT NULL,
  `rejectedon_userid` bigint(20) DEFAULT NULL,
  `withdrawnon_date` date DEFAULT NULL,
  `withdrawnon_userid` bigint(20) DEFAULT NULL,
  `activatedon_date` date DEFAULT NULL,
  `activatedon_userid` bigint(20) DEFAULT NULL,
  `closedon_date` date DEFAULT NULL,
  `closedon_userid` bigint(20) DEFAULT NULL,
  `currency_code` varchar(3) NOT NULL,
  `currency_digits` smallint(6) NOT NULL,
  `currency_multiplesof` smallint(6) DEFAULT NULL,
  `nominal_annual_interest_rate` decimal(19,6) NOT NULL,
  `interest_compounding_period_enum` smallint(6) NOT NULL,
  `interest_posting_period_enum` smallint(6) NOT NULL DEFAULT '4',
  `interest_calculation_type_enum` smallint(6) NOT NULL,
  `interest_calculation_days_in_year_type_enum` smallint(6) NOT NULL,
  `min_required_opening_balance` decimal(19,6) DEFAULT NULL,
  `lockin_period_frequency` decimal(19,6) DEFAULT NULL,
  `lockin_period_frequency_enum` smallint(6) DEFAULT NULL,
  `withdrawal_fee_for_transfer` tinyint(4) DEFAULT '1',
  `allow_overdraft` tinyint(4) NOT NULL DEFAULT '0',
  `overdraft_limit` decimal(19,6) DEFAULT NULL,
  `nominal_annual_interest_rate_overdraft` decimal(19,6) DEFAULT '0.000000',
  `min_overdraft_for_interest_calculation` decimal(19,6) DEFAULT '0.000000',
  `lockedin_until_date_derived` date DEFAULT NULL,
  `total_deposits_derived` decimal(19,6) DEFAULT NULL,
  `total_withdrawals_derived` decimal(19,6) DEFAULT NULL,
  `total_withdrawal_fees_derived` decimal(19,6) DEFAULT NULL,
  `total_fees_charge_derived` decimal(19,6) DEFAULT NULL,
  `total_penalty_charge_derived` decimal(19,6) DEFAULT NULL,
  `total_annual_fees_derived` decimal(19,6) DEFAULT NULL,
  `total_interest_earned_derived` decimal(19,6) DEFAULT NULL,
  `total_interest_posted_derived` decimal(19,6) DEFAULT NULL,
  `total_overdraft_interest_derived` decimal(19,6) DEFAULT '0.000000',
  `total_withhold_tax_derived` decimal(19,6) DEFAULT NULL,
  `account_balance_derived` decimal(19,6) NOT NULL DEFAULT '0.000000',
  `min_required_balance` decimal(19,6) DEFAULT NULL,
  `enforce_min_required_balance` tinyint(4) NOT NULL DEFAULT '0',
  `min_balance_for_interest_calculation` decimal(19,6) DEFAULT NULL,
  `start_interest_calculation_date` date DEFAULT NULL,
  `on_hold_funds_derived` decimal(19,6) DEFAULT NULL,
  `version` int(11) NOT NULL DEFAULT '1',
  `withhold_tax` tinyint(4) NOT NULL DEFAULT '0',
  `tax_group_id` bigint(20) DEFAULT NULL,
  `last_interest_calculation_date` date DEFAULT NULL,
  `total_savings_amount_on_hold` decimal(19,6) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `m_savings_account`
--

INSERT INTO `m_savings_account` (`id`, `account_no`, `external_id`, `client_id`, `group_id`, `gsim_id`, `product_id`, `field_officer_id`, `status_enum`, `sub_status_enum`, `account_type_enum`, `deposit_type_enum`, `submittedon_date`, `submittedon_userid`, `approvedon_date`, `approvedon_userid`, `rejectedon_date`, `rejectedon_userid`, `withdrawnon_date`, `withdrawnon_userid`, `activatedon_date`, `activatedon_userid`, `closedon_date`, `closedon_userid`, `currency_code`, `currency_digits`, `currency_multiplesof`, `nominal_annual_interest_rate`, `interest_compounding_period_enum`, `interest_posting_period_enum`, `interest_calculation_type_enum`, `interest_calculation_days_in_year_type_enum`, `min_required_opening_balance`, `lockin_period_frequency`, `lockin_period_frequency_enum`, `withdrawal_fee_for_transfer`, `allow_overdraft`, `overdraft_limit`, `nominal_annual_interest_rate_overdraft`, `min_overdraft_for_interest_calculation`, `lockedin_until_date_derived`, `total_deposits_derived`, `total_withdrawals_derived`, `total_withdrawal_fees_derived`, `total_fees_charge_derived`, `total_penalty_charge_derived`, `total_annual_fees_derived`, `total_interest_earned_derived`, `total_interest_posted_derived`, `total_overdraft_interest_derived`, `total_withhold_tax_derived`, `account_balance_derived`, `min_required_balance`, `enforce_min_required_balance`, `min_balance_for_interest_calculation`, `start_interest_calculation_date`, `on_hold_funds_derived`, `version`, `withhold_tax`, `tax_group_id`, `last_interest_calculation_date`, `total_savings_amount_on_hold`) VALUES
(1, '000000001', NULL, 1, NULL, NULL, 1, NULL, 300, 0, 1, 100, '2022-11-21', 1, '2022-11-21', 1, NULL, NULL, NULL, NULL, '2022-11-21', 1, NULL, NULL, 'USD', 2, 10, '0.000000', 1, 4, 1, 365, NULL, NULL, NULL, 1, 0, '0.000000', '0.000000', '0.000000', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0.000000', '0.000000', 0, '10.000000', NULL, NULL, 2, 0, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `m_savings_account_charge`
--

CREATE TABLE `m_savings_account_charge` (
  `id` bigint(20) NOT NULL,
  `savings_account_id` bigint(20) NOT NULL,
  `charge_id` bigint(20) NOT NULL,
  `is_penalty` tinyint(4) NOT NULL DEFAULT '0',
  `charge_time_enum` smallint(6) NOT NULL,
  `charge_due_date` date DEFAULT NULL,
  `fee_on_month` smallint(6) DEFAULT NULL,
  `fee_on_day` smallint(6) DEFAULT NULL,
  `fee_interval` smallint(6) DEFAULT NULL,
  `charge_calculation_enum` smallint(6) NOT NULL,
  `calculation_percentage` decimal(19,6) DEFAULT NULL,
  `calculation_on_amount` decimal(19,6) DEFAULT NULL,
  `amount` decimal(19,6) NOT NULL,
  `amount_paid_derived` decimal(19,6) DEFAULT NULL,
  `amount_waived_derived` decimal(19,6) DEFAULT NULL,
  `amount_writtenoff_derived` decimal(19,6) DEFAULT NULL,
  `amount_outstanding_derived` decimal(19,6) NOT NULL DEFAULT '0.000000',
  `is_paid_derived` tinyint(4) NOT NULL DEFAULT '0',
  `waived` tinyint(4) NOT NULL DEFAULT '0',
  `is_active` tinyint(4) NOT NULL DEFAULT '1',
  `inactivated_on_date` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `m_savings_account_charge_paid_by`
--

CREATE TABLE `m_savings_account_charge_paid_by` (
  `id` bigint(20) NOT NULL,
  `savings_account_transaction_id` bigint(20) NOT NULL,
  `savings_account_charge_id` bigint(20) NOT NULL,
  `amount` decimal(19,6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `m_savings_account_interest_rate_chart`
--

CREATE TABLE `m_savings_account_interest_rate_chart` (
  `id` bigint(20) NOT NULL,
  `savings_account_id` bigint(20) NOT NULL,
  `name` varchar(100) DEFAULT NULL,
  `description` varchar(200) DEFAULT NULL,
  `from_date` date NOT NULL,
  `end_date` date DEFAULT NULL,
  `is_primary_grouping_by_amount` tinyint(4) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `m_savings_account_interest_rate_slab`
--

CREATE TABLE `m_savings_account_interest_rate_slab` (
  `id` bigint(20) NOT NULL,
  `savings_account_interest_rate_chart_id` bigint(20) NOT NULL,
  `description` varchar(200) DEFAULT NULL,
  `period_type_enum` smallint(6) DEFAULT NULL,
  `from_period` int(11) DEFAULT NULL,
  `to_period` int(11) DEFAULT NULL,
  `amount_range_from` decimal(19,6) DEFAULT NULL,
  `amount_range_to` decimal(19,6) DEFAULT NULL,
  `annual_interest_rate` decimal(19,6) NOT NULL,
  `currency_code` varchar(3) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `m_savings_account_transaction`
--

CREATE TABLE `m_savings_account_transaction` (
  `id` bigint(20) NOT NULL,
  `savings_account_id` bigint(20) NOT NULL,
  `office_id` bigint(20) NOT NULL,
  `payment_detail_id` bigint(20) DEFAULT NULL,
  `transaction_type_enum` smallint(6) NOT NULL,
  `is_reversed` tinyint(4) NOT NULL,
  `transaction_date` date NOT NULL,
  `amount` decimal(19,6) NOT NULL,
  `overdraft_amount_derived` decimal(19,6) DEFAULT NULL,
  `balance_end_date_derived` date DEFAULT NULL,
  `balance_number_of_days_derived` int(11) DEFAULT NULL,
  `running_balance_derived` decimal(19,6) DEFAULT NULL,
  `cumulative_balance_derived` decimal(19,6) DEFAULT NULL,
  `created_date` datetime NOT NULL,
  `appuser_id` bigint(20) DEFAULT NULL,
  `is_manual` tinyint(1) DEFAULT '0',
  `release_id_of_hold_amount` bigint(20) DEFAULT NULL,
  `is_loan_disbursement` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `m_savings_account_transaction_tax_details`
--

CREATE TABLE `m_savings_account_transaction_tax_details` (
  `id` bigint(20) NOT NULL,
  `savings_transaction_id` bigint(20) NOT NULL,
  `tax_component_id` bigint(20) NOT NULL,
  `amount` decimal(19,6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `m_savings_interest_incentives`
--

CREATE TABLE `m_savings_interest_incentives` (
  `id` bigint(20) NOT NULL,
  `deposit_account_interest_rate_slab_id` bigint(20) NOT NULL,
  `entiry_type` smallint(6) NOT NULL,
  `attribute_name` smallint(6) NOT NULL,
  `condition_type` smallint(6) NOT NULL,
  `attribute_value` varchar(50) NOT NULL,
  `incentive_type` smallint(6) NOT NULL,
  `amount` decimal(19,6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `m_savings_officer_assignment_history`
--

CREATE TABLE `m_savings_officer_assignment_history` (
  `id` bigint(20) NOT NULL,
  `account_id` bigint(20) NOT NULL,
  `savings_officer_id` bigint(20) DEFAULT NULL,
  `start_date` date NOT NULL,
  `end_date` date DEFAULT NULL,
  `createdby_id` bigint(20) DEFAULT NULL,
  `created_date` datetime DEFAULT NULL,
  `lastmodified_date` datetime DEFAULT NULL,
  `lastmodifiedby_id` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `m_savings_product`
--

CREATE TABLE `m_savings_product` (
  `id` bigint(20) NOT NULL,
  `name` varchar(100) NOT NULL,
  `short_name` varchar(4) NOT NULL,
  `description` varchar(500) DEFAULT NULL,
  `deposit_type_enum` smallint(6) NOT NULL DEFAULT '100',
  `currency_code` varchar(3) NOT NULL,
  `currency_digits` smallint(6) NOT NULL,
  `currency_multiplesof` smallint(6) DEFAULT NULL,
  `nominal_annual_interest_rate` decimal(19,6) NOT NULL,
  `interest_compounding_period_enum` smallint(6) NOT NULL,
  `interest_posting_period_enum` smallint(6) NOT NULL DEFAULT '4',
  `interest_calculation_type_enum` smallint(6) NOT NULL,
  `interest_calculation_days_in_year_type_enum` smallint(6) NOT NULL,
  `min_required_opening_balance` decimal(19,6) DEFAULT NULL,
  `lockin_period_frequency` decimal(19,6) DEFAULT NULL,
  `lockin_period_frequency_enum` smallint(6) DEFAULT NULL,
  `accounting_type` smallint(6) NOT NULL,
  `withdrawal_fee_amount` decimal(19,6) DEFAULT NULL,
  `withdrawal_fee_type_enum` smallint(6) DEFAULT NULL,
  `withdrawal_fee_for_transfer` tinyint(4) DEFAULT '1',
  `allow_overdraft` tinyint(4) NOT NULL DEFAULT '0',
  `overdraft_limit` decimal(19,6) DEFAULT NULL,
  `nominal_annual_interest_rate_overdraft` decimal(19,6) DEFAULT '0.000000',
  `min_overdraft_for_interest_calculation` decimal(19,6) DEFAULT '0.000000',
  `min_required_balance` decimal(19,6) DEFAULT NULL,
  `enforce_min_required_balance` tinyint(4) NOT NULL DEFAULT '0',
  `min_balance_for_interest_calculation` decimal(19,6) DEFAULT NULL,
  `withhold_tax` tinyint(4) NOT NULL DEFAULT '0',
  `tax_group_id` bigint(20) DEFAULT NULL,
  `is_dormancy_tracking_active` smallint(6) DEFAULT NULL,
  `days_to_inactive` int(11) DEFAULT NULL,
  `days_to_dormancy` int(11) DEFAULT NULL,
  `days_to_escheat` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `m_savings_product`
--

INSERT INTO `m_savings_product` (`id`, `name`, `short_name`, `description`, `deposit_type_enum`, `currency_code`, `currency_digits`, `currency_multiplesof`, `nominal_annual_interest_rate`, `interest_compounding_period_enum`, `interest_posting_period_enum`, `interest_calculation_type_enum`, `interest_calculation_days_in_year_type_enum`, `min_required_opening_balance`, `lockin_period_frequency`, `lockin_period_frequency_enum`, `accounting_type`, `withdrawal_fee_amount`, `withdrawal_fee_type_enum`, `withdrawal_fee_for_transfer`, `allow_overdraft`, `overdraft_limit`, `nominal_annual_interest_rate_overdraft`, `min_overdraft_for_interest_calculation`, `min_required_balance`, `enforce_min_required_balance`, `min_balance_for_interest_calculation`, `withhold_tax`, `tax_group_id`, `is_dormancy_tracking_active`, `days_to_inactive`, `days_to_dormancy`, `days_to_escheat`) VALUES
(1, 'MobileMoney', 'MM', 'all the collections into the sytem', 100, 'USD', 2, 10, '0.000000', 1, 4, 1, 365, NULL, NULL, NULL, 2, NULL, NULL, 1, 0, '0.000000', '0.000000', '0.000000', '0.000000', 0, '10.000000', 0, NULL, 0, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `m_savings_product_charge`
--

CREATE TABLE `m_savings_product_charge` (
  `savings_product_id` bigint(20) NOT NULL,
  `charge_id` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `m_selfservice_beneficiaries_tpt`
--

CREATE TABLE `m_selfservice_beneficiaries_tpt` (
  `id` bigint(20) NOT NULL,
  `app_user_id` bigint(20) NOT NULL,
  `name` varchar(50) NOT NULL,
  `office_id` bigint(20) NOT NULL,
  `client_id` bigint(20) NOT NULL,
  `account_id` bigint(20) NOT NULL,
  `account_type` smallint(6) NOT NULL,
  `transfer_limit` bigint(20) DEFAULT '0',
  `is_active` bit(1) NOT NULL DEFAULT b'0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `m_selfservice_user_client_mapping`
--

CREATE TABLE `m_selfservice_user_client_mapping` (
  `id` bigint(20) NOT NULL,
  `appuser_id` bigint(20) NOT NULL,
  `client_id` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `m_selfservice_user_client_mapping`
--

INSERT INTO `m_selfservice_user_client_mapping` (`id`, `appuser_id`, `client_id`) VALUES
(1, 12, 1);

-- --------------------------------------------------------

--
-- Table structure for table `m_share_account`
--

CREATE TABLE `m_share_account` (
  `id` bigint(20) NOT NULL,
  `account_no` varchar(50) NOT NULL,
  `product_id` bigint(20) NOT NULL,
  `client_id` bigint(20) NOT NULL,
  `external_id` varchar(100) DEFAULT NULL,
  `status_enum` smallint(6) NOT NULL DEFAULT '300',
  `total_approved_shares` bigint(20) DEFAULT NULL,
  `total_pending_shares` bigint(20) DEFAULT NULL,
  `submitted_date` date NOT NULL,
  `submitted_userid` bigint(20) DEFAULT NULL,
  `approved_date` date DEFAULT NULL,
  `approved_userid` bigint(20) DEFAULT NULL,
  `rejected_date` date DEFAULT NULL,
  `rejected_userid` bigint(20) DEFAULT NULL,
  `activated_date` date DEFAULT NULL,
  `activated_userid` bigint(20) DEFAULT NULL,
  `closed_date` date DEFAULT NULL,
  `closed_userid` bigint(20) DEFAULT NULL,
  `currency_code` varchar(3) NOT NULL,
  `currency_digits` smallint(6) NOT NULL,
  `currency_multiplesof` smallint(6) DEFAULT NULL,
  `savings_account_id` bigint(20) NOT NULL,
  `minimum_active_period_frequency` decimal(19,6) DEFAULT NULL,
  `minimum_active_period_frequency_enum` smallint(6) DEFAULT NULL,
  `lockin_period_frequency` decimal(19,6) DEFAULT NULL,
  `lockin_period_frequency_enum` smallint(6) DEFAULT NULL,
  `allow_dividends_inactive_clients` smallint(6) DEFAULT '0',
  `created_date` datetime DEFAULT NULL,
  `lastmodifiedby_id` bigint(20) DEFAULT NULL,
  `lastmodified_date` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `m_share_account_charge`
--

CREATE TABLE `m_share_account_charge` (
  `id` bigint(20) NOT NULL,
  `account_id` bigint(20) NOT NULL,
  `charge_id` bigint(20) NOT NULL,
  `charge_time_enum` smallint(6) NOT NULL,
  `charge_calculation_enum` smallint(6) NOT NULL,
  `charge_payment_mode_enum` smallint(6) NOT NULL DEFAULT '0',
  `calculation_percentage` decimal(19,6) DEFAULT NULL,
  `calculation_on_amount` decimal(19,6) DEFAULT NULL,
  `charge_amount_or_percentage` decimal(19,6) DEFAULT NULL,
  `amount` decimal(19,6) NOT NULL,
  `amount_paid_derived` decimal(19,6) DEFAULT NULL,
  `amount_waived_derived` decimal(19,6) DEFAULT NULL,
  `amount_writtenoff_derived` decimal(19,6) DEFAULT NULL,
  `amount_outstanding_derived` decimal(19,6) NOT NULL DEFAULT '0.000000',
  `is_paid_derived` tinyint(4) NOT NULL DEFAULT '0',
  `waived` tinyint(4) NOT NULL DEFAULT '0',
  `min_cap` decimal(19,6) DEFAULT NULL,
  `max_cap` decimal(19,6) DEFAULT NULL,
  `is_active` tinyint(4) NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `m_share_account_charge_paid_by`
--

CREATE TABLE `m_share_account_charge_paid_by` (
  `id` bigint(20) NOT NULL,
  `share_transaction_id` bigint(20) DEFAULT NULL,
  `charge_transaction_id` bigint(20) DEFAULT NULL,
  `amount` decimal(20,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `m_share_account_dividend_details`
--

CREATE TABLE `m_share_account_dividend_details` (
  `id` bigint(20) NOT NULL,
  `dividend_pay_out_id` bigint(20) NOT NULL,
  `account_id` bigint(20) NOT NULL,
  `amount` decimal(19,6) NOT NULL,
  `status` smallint(6) NOT NULL,
  `savings_transaction_id` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `m_share_account_transactions`
--

CREATE TABLE `m_share_account_transactions` (
  `id` bigint(20) NOT NULL,
  `account_id` bigint(20) NOT NULL,
  `transaction_date` date DEFAULT NULL,
  `total_shares` bigint(20) DEFAULT NULL,
  `unit_price` decimal(10,2) DEFAULT NULL,
  `amount` decimal(20,2) DEFAULT NULL,
  `charge_amount` decimal(20,2) DEFAULT NULL,
  `amount_paid` decimal(20,2) DEFAULT NULL,
  `status_enum` smallint(6) NOT NULL DEFAULT '300',
  `type_enum` smallint(6) DEFAULT NULL,
  `is_active` tinyint(4) NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `m_share_product`
--

CREATE TABLE `m_share_product` (
  `id` bigint(20) NOT NULL,
  `name` varchar(200) NOT NULL,
  `short_name` varchar(4) NOT NULL,
  `external_id` varchar(100) DEFAULT NULL,
  `description` varchar(500) NOT NULL,
  `start_date` datetime DEFAULT NULL,
  `end_date` datetime DEFAULT NULL,
  `currency_code` varchar(3) NOT NULL,
  `currency_digits` smallint(6) NOT NULL,
  `currency_multiplesof` smallint(6) DEFAULT NULL,
  `total_shares` bigint(20) NOT NULL,
  `issued_shares` bigint(20) DEFAULT NULL,
  `totalsubscribed_shares` bigint(20) DEFAULT NULL,
  `unit_price` decimal(10,2) NOT NULL,
  `capital_amount` decimal(20,2) NOT NULL,
  `minimum_client_shares` bigint(20) DEFAULT NULL,
  `nominal_client_shares` bigint(20) NOT NULL,
  `maximum_client_shares` bigint(20) DEFAULT NULL,
  `minimum_active_period_frequency` decimal(19,6) DEFAULT NULL,
  `minimum_active_period_frequency_enum` smallint(6) DEFAULT NULL,
  `lockin_period_frequency` decimal(19,6) DEFAULT NULL,
  `lockin_period_frequency_enum` smallint(6) DEFAULT NULL,
  `allow_dividends_inactive_clients` smallint(6) DEFAULT '0',
  `createdby_id` bigint(20) DEFAULT NULL,
  `created_date` datetime DEFAULT NULL,
  `lastmodifiedby_id` bigint(20) DEFAULT NULL,
  `lastmodified_date` datetime DEFAULT NULL,
  `accounting_type` smallint(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `m_share_product_charge`
--

CREATE TABLE `m_share_product_charge` (
  `product_id` bigint(20) NOT NULL,
  `charge_id` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `m_share_product_dividend_pay_out`
--

CREATE TABLE `m_share_product_dividend_pay_out` (
  `id` bigint(20) NOT NULL,
  `product_id` bigint(20) NOT NULL,
  `amount` decimal(19,6) NOT NULL,
  `dividend_period_start_date` date NOT NULL,
  `dividend_period_end_date` date NOT NULL,
  `status` smallint(6) NOT NULL,
  `createdby_id` bigint(20) DEFAULT NULL,
  `created_date` datetime DEFAULT NULL,
  `lastmodifiedby_id` bigint(20) DEFAULT NULL,
  `lastmodified_date` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `m_share_product_market_price`
--

CREATE TABLE `m_share_product_market_price` (
  `id` bigint(20) NOT NULL,
  `product_id` bigint(20) NOT NULL,
  `from_date` date DEFAULT NULL,
  `share_value` decimal(10,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `m_staff`
--

CREATE TABLE `m_staff` (
  `id` bigint(20) NOT NULL,
  `is_loan_officer` tinyint(4) NOT NULL DEFAULT '0',
  `office_id` bigint(20) DEFAULT NULL,
  `firstname` varchar(50) DEFAULT NULL,
  `lastname` varchar(50) DEFAULT NULL,
  `display_name` varchar(102) NOT NULL,
  `mobile_no` varchar(50) DEFAULT NULL,
  `external_id` varchar(100) DEFAULT NULL,
  `organisational_role_enum` smallint(6) DEFAULT NULL,
  `organisational_role_parent_staff_id` bigint(20) DEFAULT NULL,
  `is_active` tinyint(4) NOT NULL DEFAULT '1',
  `joining_date` date DEFAULT NULL,
  `image_id` bigint(20) DEFAULT NULL,
  `email_address` varchar(150) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `m_staff`
--

INSERT INTO `m_staff` (`id`, `is_loan_officer`, `office_id`, `firstname`, `lastname`, `display_name`, `mobile_no`, `external_id`, `organisational_role_enum`, `organisational_role_parent_staff_id`, `is_active`, `joining_date`, `image_id`, `email_address`) VALUES
(1, 1, 1, 'Machette', 'Leo', 'Leo, Machette', '25471429048', NULL, NULL, NULL, 1, '2022-11-20', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `m_staff_assignment_history`
--

CREATE TABLE `m_staff_assignment_history` (
  `id` bigint(20) NOT NULL,
  `centre_id` bigint(20) DEFAULT NULL,
  `staff_id` bigint(20) NOT NULL,
  `start_date` date NOT NULL,
  `end_date` date DEFAULT NULL,
  `createdby_id` bigint(20) DEFAULT NULL,
  `created_date` datetime DEFAULT NULL,
  `lastmodified_date` datetime DEFAULT NULL,
  `lastmodifiedby_id` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `m_surveys`
--

CREATE TABLE `m_surveys` (
  `id` bigint(20) NOT NULL,
  `a_key` varchar(32) NOT NULL,
  `a_name` varchar(255) NOT NULL,
  `description` varchar(4000) DEFAULT NULL,
  `country_code` varchar(2) NOT NULL,
  `valid_from` datetime DEFAULT NULL,
  `valid_to` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `m_survey_components`
--

CREATE TABLE `m_survey_components` (
  `id` bigint(20) NOT NULL,
  `survey_id` bigint(20) NOT NULL,
  `a_key` varchar(32) NOT NULL,
  `a_text` varchar(255) NOT NULL,
  `description` varchar(4000) DEFAULT NULL,
  `sequence_no` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `m_survey_lookup_tables`
--

CREATE TABLE `m_survey_lookup_tables` (
  `id` bigint(20) NOT NULL,
  `survey_id` bigint(20) NOT NULL,
  `a_key` varchar(255) NOT NULL,
  `description` int(11) DEFAULT NULL,
  `value_from` int(11) NOT NULL,
  `value_to` int(11) NOT NULL,
  `score` decimal(5,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `m_survey_questions`
--

CREATE TABLE `m_survey_questions` (
  `id` bigint(20) NOT NULL,
  `survey_id` bigint(20) NOT NULL,
  `component_key` varchar(32) DEFAULT NULL,
  `a_key` varchar(32) NOT NULL,
  `a_text` varchar(255) NOT NULL,
  `description` varchar(4000) DEFAULT NULL,
  `sequence_no` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `m_survey_responses`
--

CREATE TABLE `m_survey_responses` (
  `id` bigint(20) NOT NULL,
  `question_id` bigint(20) NOT NULL,
  `a_text` varchar(255) NOT NULL,
  `a_value` int(11) NOT NULL,
  `sequence_no` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `m_survey_scorecards`
--

CREATE TABLE `m_survey_scorecards` (
  `id` bigint(20) NOT NULL,
  `survey_id` bigint(20) NOT NULL,
  `question_id` bigint(20) NOT NULL,
  `response_id` bigint(20) NOT NULL,
  `user_id` bigint(20) NOT NULL,
  `client_id` bigint(20) NOT NULL,
  `created_on` datetime DEFAULT NULL,
  `a_value` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `m_tax_component`
--

CREATE TABLE `m_tax_component` (
  `id` bigint(20) NOT NULL,
  `name` varchar(50) NOT NULL,
  `percentage` decimal(19,6) NOT NULL,
  `debit_account_type_enum` smallint(6) DEFAULT NULL,
  `debit_account_id` bigint(20) DEFAULT NULL,
  `credit_account_type_enum` smallint(6) DEFAULT NULL,
  `credit_account_id` bigint(20) DEFAULT NULL,
  `start_date` date NOT NULL,
  `createdby_id` bigint(20) NOT NULL,
  `created_date` datetime NOT NULL,
  `lastmodifiedby_id` bigint(20) NOT NULL,
  `lastmodified_date` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `m_tax_component_history`
--

CREATE TABLE `m_tax_component_history` (
  `id` bigint(20) NOT NULL,
  `tax_component_id` bigint(20) NOT NULL,
  `percentage` decimal(19,6) NOT NULL,
  `start_date` date NOT NULL,
  `end_date` date NOT NULL,
  `createdby_id` bigint(20) NOT NULL,
  `created_date` datetime NOT NULL,
  `lastmodifiedby_id` bigint(20) NOT NULL,
  `lastmodified_date` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `m_tax_group`
--

CREATE TABLE `m_tax_group` (
  `id` bigint(20) NOT NULL,
  `name` varchar(50) NOT NULL,
  `createdby_id` bigint(20) NOT NULL,
  `created_date` datetime NOT NULL,
  `lastmodifiedby_id` bigint(20) NOT NULL,
  `lastmodified_date` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `m_tax_group_mappings`
--

CREATE TABLE `m_tax_group_mappings` (
  `id` bigint(20) NOT NULL,
  `tax_group_id` bigint(20) NOT NULL,
  `tax_component_id` bigint(20) NOT NULL,
  `start_date` date NOT NULL,
  `end_date` date DEFAULT NULL,
  `createdby_id` bigint(20) NOT NULL,
  `created_date` datetime NOT NULL,
  `lastmodifiedby_id` bigint(20) NOT NULL,
  `lastmodified_date` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `m_tellers`
--

CREATE TABLE `m_tellers` (
  `id` bigint(20) NOT NULL,
  `office_id` bigint(20) NOT NULL,
  `debit_account_id` bigint(20) DEFAULT NULL,
  `credit_account_id` bigint(20) DEFAULT NULL,
  `name` varchar(50) NOT NULL,
  `description` varchar(100) DEFAULT NULL,
  `valid_from` date DEFAULT NULL,
  `valid_to` date DEFAULT NULL,
  `state` smallint(6) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `m_template`
--

CREATE TABLE `m_template` (
  `id` bigint(20) NOT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `text` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `entity` int(11) DEFAULT NULL,
  `type` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `m_templatemappers`
--

CREATE TABLE `m_templatemappers` (
  `id` bigint(20) NOT NULL,
  `mapperkey` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `mapperorder` int(11) DEFAULT NULL,
  `mappervalue` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `m_template_m_templatemappers`
--

CREATE TABLE `m_template_m_templatemappers` (
  `m_template_id` bigint(20) NOT NULL,
  `mappers_id` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `m_trial_balance`
--

CREATE TABLE `m_trial_balance` (
  `office_id` bigint(20) NOT NULL,
  `account_id` bigint(20) NOT NULL,
  `amount` decimal(19,6) NOT NULL,
  `entry_date` date NOT NULL,
  `created_date` date DEFAULT NULL,
  `closing_balance` decimal(19,6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `m_working_days`
--

CREATE TABLE `m_working_days` (
  `id` bigint(20) NOT NULL,
  `recurrence` varchar(100) DEFAULT NULL,
  `repayment_rescheduling_enum` smallint(6) DEFAULT NULL,
  `extend_term_daily_repayments` tinyint(4) DEFAULT '0',
  `extend_term_holiday_repayment` tinyint(1) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `m_working_days`
--

INSERT INTO `m_working_days` (`id`, `recurrence`, `repayment_rescheduling_enum`, `extend_term_daily_repayments`, `extend_term_holiday_repayment`) VALUES
(1, 'FREQ=WEEKLY;INTERVAL=1;BYDAY=MO,TU,WE,TH,FR,SA', 2, 0, 0);

-- --------------------------------------------------------

--
-- Table structure for table `notification_generator`
--

CREATE TABLE `notification_generator` (
  `id` bigint(20) NOT NULL,
  `object_type` text,
  `object_identifier` bigint(20) DEFAULT NULL,
  `action` text,
  `actor` bigint(20) DEFAULT NULL,
  `is_system_generated` tinyint(4) DEFAULT '0',
  `notification_content` text,
  `created_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `notification_mapper`
--

CREATE TABLE `notification_mapper` (
  `id` bigint(20) NOT NULL,
  `notification_id` bigint(20) DEFAULT NULL,
  `user_id` bigint(20) DEFAULT NULL,
  `is_read` tinyint(4) DEFAULT '0',
  `created_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `oauth_access_token`
--

CREATE TABLE `oauth_access_token` (
  `token_id` varchar(256) DEFAULT NULL,
  `token` blob,
  `authentication_id` varchar(256) DEFAULT NULL,
  `user_name` varchar(256) DEFAULT NULL,
  `client_id` varchar(256) DEFAULT NULL,
  `authentication` blob,
  `refresh_token` varchar(256) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `oauth_client_details`
--

CREATE TABLE `oauth_client_details` (
  `client_id` varchar(128) NOT NULL,
  `resource_ids` varchar(256) DEFAULT NULL,
  `client_secret` varchar(256) DEFAULT NULL,
  `scope` varchar(256) DEFAULT NULL,
  `authorized_grant_types` varchar(256) DEFAULT NULL,
  `web_server_redirect_uri` varchar(256) DEFAULT NULL,
  `authorities` varchar(256) DEFAULT NULL,
  `access_token_validity` int(11) DEFAULT NULL,
  `refresh_token_validity` int(11) DEFAULT NULL,
  `additional_information` varchar(4096) DEFAULT NULL,
  `autoapprove` bit(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `oauth_client_details`
--

INSERT INTO `oauth_client_details` (`client_id`, `resource_ids`, `client_secret`, `scope`, `authorized_grant_types`, `web_server_redirect_uri`, `authorities`, `access_token_validity`, `refresh_token_validity`, `additional_information`, `autoapprove`) VALUES
('community-app', NULL, '{SHA-256}a665a45920422f9d417e4867efdc4fb8a04a1f3fff1fa07e998e86f7f7a27ae3', 'all', 'password,refresh_token', NULL, NULL, NULL, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `oauth_refresh_token`
--

CREATE TABLE `oauth_refresh_token` (
  `token_id` varchar(256) DEFAULT NULL,
  `token` blob,
  `authentication` blob
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `ppi_likelihoods`
--

CREATE TABLE `ppi_likelihoods` (
  `id` bigint(20) NOT NULL,
  `code` varchar(100) NOT NULL,
  `name` varchar(250) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `ppi_likelihoods_ppi`
--

CREATE TABLE `ppi_likelihoods_ppi` (
  `id` bigint(20) NOT NULL,
  `likelihood_id` bigint(20) NOT NULL,
  `ppi_name` varchar(250) NOT NULL,
  `enabled` int(11) NOT NULL DEFAULT '100'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `ppi_scores`
--

CREATE TABLE `ppi_scores` (
  `id` bigint(20) NOT NULL,
  `score_from` int(11) NOT NULL,
  `score_to` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `ppi_scores`
--

INSERT INTO `ppi_scores` (`id`, `score_from`, `score_to`) VALUES
(1, 0, 4),
(2, 5, 9),
(3, 10, 14),
(4, 15, 19),
(5, 20, 24),
(6, 25, 29),
(7, 30, 34),
(8, 35, 39),
(9, 40, 44),
(10, 45, 49),
(11, 50, 54),
(12, 55, 59),
(13, 60, 64),
(14, 65, 69),
(15, 70, 74),
(16, 75, 79),
(17, 80, 84),
(18, 85, 89),
(19, 90, 94),
(20, 95, 100);

-- --------------------------------------------------------

--
-- Table structure for table `ref_loan_transaction_processing_strategy`
--

CREATE TABLE `ref_loan_transaction_processing_strategy` (
  `id` bigint(20) NOT NULL,
  `code` varchar(100) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `sort_order` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `ref_loan_transaction_processing_strategy`
--

INSERT INTO `ref_loan_transaction_processing_strategy` (`id`, `code`, `name`, `sort_order`) VALUES
(1, 'mifos-standard-strategy', 'Penalties, Fees, Interest, Principal order', 1),
(2, 'heavensfamily-strategy', 'HeavensFamily Unique', 6),
(3, 'creocore-strategy', 'Creocore Unique', 7),
(4, 'rbi-india-strategy', 'Overdue/Due Fee/Int,Principal', 2),
(5, 'principal-interest-penalties-fees-order-strategy', 'Principal, Interest, Penalties, Fees Order', 3),
(6, 'interest-principal-penalties-fees-order-strategy', 'Interest, Principal, Penalties, Fees Order', 4),
(7, 'early-repayment-strategy', 'Early Repayment Strategy', 5);

-- --------------------------------------------------------

--
-- Table structure for table `request_audit_table`
--

CREATE TABLE `request_audit_table` (
  `id` bigint(20) NOT NULL,
  `lastname` varchar(100) NOT NULL,
  `username` varchar(100) NOT NULL,
  `mobile_number` varchar(50) DEFAULT NULL,
  `firstname` varchar(100) NOT NULL,
  `authentication_token` varchar(100) DEFAULT NULL,
  `password` varchar(250) NOT NULL,
  `email` varchar(100) NOT NULL,
  `client_id` bigint(20) NOT NULL,
  `created_date` date NOT NULL,
  `account_number` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `rpt_sequence`
--

CREATE TABLE `rpt_sequence` (
  `id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `r_enum_value`
--

CREATE TABLE `r_enum_value` (
  `enum_name` varchar(100) NOT NULL,
  `enum_id` int(11) NOT NULL,
  `enum_message_property` varchar(100) NOT NULL,
  `enum_value` varchar(100) NOT NULL,
  `enum_type` tinyint(4) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `r_enum_value`
--

INSERT INTO `r_enum_value` (`enum_name`, `enum_id`, `enum_message_property`, `enum_value`, `enum_type`) VALUES
('account_type_type_enum', 0, 'INVALID', 'INVALID', 0),
('account_type_type_enum', 1, 'INDIVIDUAL', 'INDIVIDUAL', 0),
('account_type_type_enum', 2, 'GROUP', 'GROUP', 0),
('account_type_type_enum', 3, 'JLG', 'JLG', 0),
('accrual_accounts_for_loan_type_enum', 1, 'FUND_SOURCE', 'FUND_SOURCE', 0),
('accrual_accounts_for_loan_type_enum', 2, 'LOAN_PORTFOLIO', 'LOAN_PORTFOLIO', 0),
('accrual_accounts_for_loan_type_enum', 3, 'INTEREST_ON_LOANS', 'INTEREST_ON_LOANS', 0),
('accrual_accounts_for_loan_type_enum', 4, 'INCOME_FROM_FEES', 'INCOME_FROM_FEES', 0),
('accrual_accounts_for_loan_type_enum', 5, 'INCOME_FROM_PENALTIES', 'INCOME_FROM_PENALTIES', 0),
('accrual_accounts_for_loan_type_enum', 6, 'LOSSES_WRITTEN_OFF', 'LOSSES_WRITTEN_OFF', 0),
('accrual_accounts_for_loan_type_enum', 7, 'INTEREST_RECEIVABLE', 'INTEREST_RECEIVABLE', 0),
('accrual_accounts_for_loan_type_enum', 8, 'FEES_RECEIVABLE', 'FEES_RECEIVABLE', 0),
('accrual_accounts_for_loan_type_enum', 9, 'PENALTIES_RECEIVABLE', 'PENALTIES_RECEIVABLE', 0),
('accrual_accounts_for_loan_type_enum', 10, 'TRANSFERS_SUSPENSE', 'TRANSFERS_SUSPENSE', 0),
('accrual_accounts_for_loan_type_enum', 11, 'OVERPAYMENT', 'OVERPAYMENT', 0),
('accrual_accounts_for_loan_type_enum', 12, 'INCOME_FROM_RECOVERY', 'INCOME_FROM_RECOVERY', 0),
('amortization_method_enum', 0, 'Equal principle payments', 'Equal principle payments', 0),
('amortization_method_enum', 1, 'Equal installments', 'Equal installments', 0),
('calendar_type_enum', 0, 'INVALID', 'INVALID', 0),
('calendar_type_enum', 1, 'CLIENTS', 'CLIENTS', 0),
('calendar_type_enum', 2, 'GROUPS', 'GROUPS', 0),
('calendar_type_enum', 3, 'LOANS', 'LOANS', 0),
('calendar_type_enum', 4, 'CENTERS', 'CENTERS', 0),
('calendar_type_enum', 5, 'SAVINGS', 'SAVINGS', 0),
('calendar_type_enum', 6, 'LOAN_RECALCULATION_REST_DETAIL', 'LOAN_RECALCULATION_REST_DETAIL', 0),
('calendar_type_enum', 7, 'LOAN_RECALCULATION_COMPOUNDING_DETAIL', 'LOAN_RECALCULATION_COMPOUNDING_DETAIL', 0),
('cash_accounts_for_loan_type_enum', 1, 'FUND_SOURCE', 'FUND_SOURCE', 0),
('cash_accounts_for_loan_type_enum', 2, 'LOAN_PORTFOLIO', 'LOAN_PORTFOLIO', 0),
('cash_accounts_for_loan_type_enum', 3, 'INTEREST_ON_LOANS', 'INTEREST_ON_LOANS', 0),
('cash_accounts_for_loan_type_enum', 4, 'INCOME_FROM_FEES', 'INCOME_FROM_FEES', 0),
('cash_accounts_for_loan_type_enum', 5, 'INCOME_FROM_PENALTIES', 'INCOME_FROM_PENALTIES', 0),
('cash_accounts_for_loan_type_enum', 6, 'LOSSES_WRITTEN_OFF', 'LOSSES_WRITTEN_OFF', 0),
('cash_accounts_for_loan_type_enum', 10, 'TRANSFERS_SUSPENSE', 'TRANSFERS_SUSPENSE', 0),
('cash_accounts_for_loan_type_enum', 11, 'OVERPAYMENT', 'OVERPAYMENT', 0),
('cash_accounts_for_loan_type_enum', 12, 'INCOME_FROM_RECOVERY', 'INCOME_FROM_RECOVERY', 0),
('cash_accounts_for_savings_type_enum', 1, 'SAVINGS_REFERENCE', 'SAVINGS_REFERENCE', 0),
('cash_accounts_for_savings_type_enum', 2, 'SAVINGS_CONTROL', 'SAVINGS_CONTROL', 0),
('cash_accounts_for_savings_type_enum', 3, 'INTEREST_ON_SAVINGS', 'INTEREST_ON_SAVINGS', 0),
('cash_accounts_for_savings_type_enum', 4, 'INCOME_FROM_FEES', 'INCOME_FROM_FEES', 0),
('cash_accounts_for_savings_type_enum', 5, 'INCOME_FROM_PENALTIES', 'INCOME_FROM_PENALTIES', 0),
('cash_accounts_for_savings_type_enum', 10, 'TRANSFERS_SUSPENSE', 'TRANSFERS_SUSPENSE', 0),
('cash_accounts_for_savings_type_enum', 11, 'OVERDRAFT_PORTFOLIO_CONTROL', 'OVERDRAFT_PORTFOLIO_CONTROL', 0),
('cash_accounts_for_savings_type_enum', 12, 'INCOME_FROM_INTEREST', 'INCOME_FROM_INTEREST', 0),
('cash_account_for_shares_type_enum', 1, 'SHARES_REFERENCE', 'SHARES_REFERENCE', 0),
('cash_account_for_shares_type_enum', 2, 'SHARES_SUSPENSE', 'SHARES_SUSPENSE', 0),
('cash_account_for_shares_type_enum', 3, 'INCOME_FROM_FEES', 'INCOME_FROM_FEES', 0),
('cash_account_for_shares_type_enum', 4, 'SHARES_EQUITY', 'SHARES_EQUITY', 0),
('client_transaction_type_enum', 1, 'PAY_CHARGE', 'PAY_CHARGE', 0),
('client_transaction_type_enum', 2, 'WAIVE_CHARGE', 'WAIVE_CHARGE', 0),
('entity_account_type_enum', 1, 'CLIENT', 'CLIENT', 0),
('entity_account_type_enum', 2, 'LOAN', 'LOAN', 0),
('entity_account_type_enum', 3, 'SAVINGS', 'SAVINGS', 0),
('entity_account_type_enum', 4, 'CENTER', 'CENTER', 0),
('entity_account_type_enum', 5, 'GROUP', 'GROUP', 0),
('entity_account_type_enum', 6, 'SHARES', 'SHARES', 0),
('financial_activity_type_enum', 100, 'ASSET_TRANSFER', 'ASSET_TRANSFER', 0),
('financial_activity_type_enum', 101, 'CASH_AT_MAINVAULT', 'CASH_AT_MAINVAULT', 0),
('financial_activity_type_enum', 102, 'CASH_AT_TELLER', 'CASH_AT_TELLER', 0),
('financial_activity_type_enum', 103, 'ASSET_FUND_SOURCE', 'ASSET_FUND_SOURCE', 0),
('financial_activity_type_enum', 200, 'LIABILITY_TRANSFER', 'LIABILITY_TRANSFER', 0),
('financial_activity_type_enum', 201, 'PAYABLE_DIVIDENDS', 'PAYABLE_DIVIDENDS', 0),
('financial_activity_type_enum', 300, 'OPENING_BALANCES_TRANSFER_CONTRA', 'OPENING_BALANCES_TRANSFER_CONTRA', 0),
('glaccount_type_enum', 1, 'ASSET', 'ASSET', 0),
('glaccount_type_enum', 2, 'LIABILITY', 'LIABILITY', 0),
('glaccount_type_enum', 3, 'EQUITY', 'EQUITY', 0),
('glaccount_type_enum', 4, 'INCOME', 'INCOME', 0),
('glaccount_type_enum', 5, 'EXPENSE', 'EXPENSE', 0),
('interest_calculated_in_period_enum', 0, 'Daily', 'Daily', 0),
('interest_calculated_in_period_enum', 1, 'Same as repayment period', 'Same as repayment period', 0),
('interest_method_enum', 0, 'Declining Balance', 'Declining Balance', 0),
('interest_method_enum', 1, 'Flat', 'Flat', 0),
('interest_period_frequency_enum', 2, 'Per month', 'Per month', 0),
('interest_period_frequency_enum', 3, 'Per year', 'Per year', 0),
('journal_entry_type_type_enum', 1, 'CREDIT', 'CREDIT', 0),
('journal_entry_type_type_enum', 2, 'DEBIT', 'DEBIT', 0),
('loan_status_id', 0, 'Invalid', 'Invalid', 0),
('loan_status_id', 100, 'Submitted and awaiting approval', 'Submitted and awaiting approval', 0),
('loan_status_id', 200, 'Approved', 'Approved', 0),
('loan_status_id', 300, 'Active', 'Active', 0),
('loan_status_id', 400, 'Withdrawn by client', 'Withdrawn by client', 0),
('loan_status_id', 500, 'Rejected', 'Rejected', 0),
('loan_status_id', 600, 'Closed', 'Closed', 0),
('loan_status_id', 601, 'Written-Off', 'Written-Off', 0),
('loan_status_id', 602, 'Rescheduled', 'Rescheduled', 0),
('loan_status_id', 700, 'Overpaid', 'Overpaid', 0),
('loan_transaction_strategy_id', 1, 'mifos-standard-strategy', 'Mifos style', 0),
('loan_transaction_strategy_id', 2, 'heavensfamily-strategy', 'Heavensfamily', 0),
('loan_transaction_strategy_id', 3, 'creocore-strategy', 'Creocore', 0),
('loan_transaction_strategy_id', 4, 'rbi-india-strategy', 'RBI (India)', 0),
('loan_transaction_type_enum', 0, 'INVALID', 'INVALID', 0),
('loan_transaction_type_enum', 1, 'DISBURSEMENT', 'DISBURSEMENT', 0),
('loan_transaction_type_enum', 2, 'REPAYMENT', 'REPAYMENT', 0),
('loan_transaction_type_enum', 3, 'CONTRA', 'CONTRA', 0),
('loan_transaction_type_enum', 4, 'WAIVE_INTEREST', 'WAIVE_INTEREST', 0),
('loan_transaction_type_enum', 5, 'REPAYMENT_AT_DISBURSEMENT', 'REPAYMENT_AT_DISBURSEMENT', 0),
('loan_transaction_type_enum', 6, 'WRITEOFF', 'WRITEOFF', 0),
('loan_transaction_type_enum', 7, 'MARKED_FOR_RESCHEDULING', 'MARKED_FOR_RESCHEDULING', 0),
('loan_transaction_type_enum', 8, 'RECOVERY_REPAYMENT', 'RECOVERY_REPAYMENT', 0),
('loan_transaction_type_enum', 9, 'WAIVE_CHARGES', 'WAIVE_CHARGES', 0),
('loan_transaction_type_enum', 10, 'ACCRUAL', 'ACCRUAL', 0),
('loan_transaction_type_enum', 12, 'INITIATE_TRANSFER', 'INITIATE_TRANSFER', 0),
('loan_transaction_type_enum', 13, 'APPROVE_TRANSFER', 'APPROVE_TRANSFER', 0),
('loan_transaction_type_enum', 14, 'WITHDRAW_TRANSFER', 'WITHDRAW_TRANSFER', 0),
('loan_transaction_type_enum', 15, 'REJECT_TRANSFER', 'REJECT_TRANSFER', 0),
('loan_transaction_type_enum', 16, 'REFUND', 'REFUND', 0),
('loan_transaction_type_enum', 17, 'CHARGE_PAYMENT', 'CHARGE_PAYMENT', 0),
('loan_transaction_type_enum', 18, 'REFUND_FOR_ACTIVE_LOAN', 'REFUND_FOR_ACTIVE_LOAN', 0),
('loan_transaction_type_enum', 19, 'INCOME_POSTING', 'INCOME_POSTING', 0),
('loan_type_enum', 1, 'Individual Loan', 'Individual Loan', 0),
('loan_type_enum', 2, 'Group Loan', 'Group Loan', 0),
('portfolio_account_type_enum', 1, 'LOAN', 'LOAN', 0),
('portfolio_account_type_enum', 2, 'SAVING', 'EXPENSE', 0),
('portfolio_account_type_enum', 3, 'PROVISIONING', 'PROVISIONING', 0),
('portfolio_account_type_enum', 4, 'SHARES', 'SHARES', 0),
('processing_result_enum', 0, 'invalid', 'Invalid', 0),
('processing_result_enum', 1, 'processed', 'Processed', 0),
('processing_result_enum', 2, 'awaiting.approval', 'Awaiting Approval', 0),
('processing_result_enum', 3, 'rejected', 'Rejected', 0),
('repayment_period_frequency_enum', 0, 'Days', 'Days', 0),
('repayment_period_frequency_enum', 1, 'Weeks', 'Weeks', 0),
('repayment_period_frequency_enum', 2, 'Months', 'Months', 0),
('savings_transaction_type_enum', 0, 'INVALID', 'INVALID', 0),
('savings_transaction_type_enum', 1, 'deposit', 'deposit', 0),
('savings_transaction_type_enum', 2, 'withdrawal', 'withdrawal', 1),
('savings_transaction_type_enum', 3, 'Interest Posting', 'Interest Posting', 0),
('savings_transaction_type_enum', 4, 'Withdrawal Fee', 'Withdrawal Fee', 1),
('savings_transaction_type_enum', 5, 'Annual Fee', 'Annual Fee', 1),
('savings_transaction_type_enum', 6, 'Waive Charge', 'Waive Charge', 0),
('savings_transaction_type_enum', 7, 'Pay Charge', 'Pay Charge', 1),
('savings_transaction_type_enum', 8, 'DIVIDEND_PAYOUT', 'DIVIDEND_PAYOUT', 0),
('savings_transaction_type_enum', 12, 'Initiate Transfer', 'Initiate Transfer', 0),
('savings_transaction_type_enum', 13, 'Approve Transfer', 'Approve Transfer', 0),
('savings_transaction_type_enum', 14, 'Withdraw Transfer', 'Withdraw Transfer', 0),
('savings_transaction_type_enum', 15, 'Reject Transfer', 'Reject Transfer', 0),
('savings_transaction_type_enum', 16, 'Written-Off', 'Written-Off', 0),
('savings_transaction_type_enum', 17, 'Overdraft Interest', 'Overdraft Interest', 0),
('savings_transaction_type_enum', 19, 'WITHHOLD_TAX', 'WITHHOLD_TAX', 0),
('status_enum', 0, 'Invalid', 'Invalid', 0),
('status_enum', 100, 'Pending', 'Pending', 0),
('status_enum', 300, 'Active', 'Active', 0),
('status_enum', 600, 'Closed', 'Closed', 0),
('teller_status', 300, 'Active', 'Active', 0),
('teller_status', 400, 'Inactive', 'Inactive', 0),
('teller_status', 600, 'Closed', 'Closed', 0),
('term_period_frequency_enum', 0, 'Days', 'Days', 0),
('term_period_frequency_enum', 1, 'Weeks', 'Weeks', 0),
('term_period_frequency_enum', 2, 'Months', 'Months', 0),
('term_period_frequency_enum', 3, 'Years', 'Years', 0),
('transaction_type_enum', 1, 'Disbursement', 'Disbursement', 0),
('transaction_type_enum', 2, 'Repayment', 'Repayment', 0),
('transaction_type_enum', 3, 'Contra', 'Contra', 0),
('transaction_type_enum', 4, 'Waive Interest', 'Waive Interest', 0),
('transaction_type_enum', 5, 'Repayment At Disbursement', 'Repayment At Disbursement', 0),
('transaction_type_enum', 6, 'Write-Off', 'Write-Off', 0),
('transaction_type_enum', 7, 'Marked for Rescheduling', 'Marked for Rescheduling', 0),
('transaction_type_enum', 8, 'Recovery Repayment', 'Recovery Repayment', 0),
('transaction_type_enum', 9, 'Waive Charges', 'Waive Charges', 0),
('transaction_type_enum', 10, 'Apply Charges', 'Apply Charges', 0),
('transaction_type_enum', 11, 'Apply Interest', 'Apply Interest', 0);

-- --------------------------------------------------------

--
-- Table structure for table `scheduled_email_campaign`
--

CREATE TABLE `scheduled_email_campaign` (
  `id` bigint(20) NOT NULL,
  `campaign_name` varchar(100) NOT NULL,
  `campaign_type` int(11) NOT NULL,
  `businessRule_id` int(11) NOT NULL,
  `param_value` text,
  `status_enum` int(11) NOT NULL,
  `email_subject` varchar(100) NOT NULL,
  `email_message` text NOT NULL,
  `email_attachment_file_format` varchar(10) NOT NULL,
  `stretchy_report_id` int(11) NOT NULL,
  `stretchy_report_param_map` text,
  `closedon_date` date DEFAULT NULL,
  `closedon_userid` bigint(20) DEFAULT NULL,
  `submittedon_date` date DEFAULT NULL,
  `submittedon_userid` bigint(20) DEFAULT NULL,
  `approvedon_date` date DEFAULT NULL,
  `approvedon_userid` bigint(20) DEFAULT NULL,
  `recurrence` varchar(100) DEFAULT NULL,
  `next_trigger_date` datetime DEFAULT NULL,
  `last_trigger_date` datetime DEFAULT NULL,
  `recurrence_start_date` datetime DEFAULT NULL,
  `is_visible` tinyint(4) DEFAULT '1',
  `previous_run_error_log` text,
  `previous_run_error_message` text,
  `previous_run_status` varchar(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `scheduled_email_configuration`
--

CREATE TABLE `scheduled_email_configuration` (
  `id` int(11) NOT NULL,
  `name` varchar(50) NOT NULL,
  `value` varchar(200) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `scheduled_email_configuration`
--

INSERT INTO `scheduled_email_configuration` (`id`, `name`, `value`) VALUES
(1, 'SMTP_SERVER', NULL),
(2, 'SMTP_PORT', NULL),
(3, 'SMTP_USERNAME', NULL),
(4, 'SMTP_PASSWORD', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `scheduled_email_messages_outbound`
--

CREATE TABLE `scheduled_email_messages_outbound` (
  `id` bigint(20) NOT NULL,
  `group_id` bigint(20) DEFAULT NULL,
  `client_id` bigint(20) DEFAULT NULL,
  `staff_id` bigint(20) DEFAULT NULL,
  `email_campaign_id` bigint(20) DEFAULT NULL,
  `status_enum` int(11) NOT NULL DEFAULT '100',
  `email_address` varchar(50) NOT NULL,
  `email_subject` varchar(50) NOT NULL,
  `message` text NOT NULL,
  `campaign_name` varchar(200) DEFAULT NULL,
  `submittedon_date` date DEFAULT NULL,
  `error_message` text
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `scheduler_detail`
--

CREATE TABLE `scheduler_detail` (
  `id` smallint(6) NOT NULL,
  `is_suspended` tinyint(4) NOT NULL DEFAULT '0',
  `execute_misfired_jobs` tinyint(4) NOT NULL DEFAULT '1',
  `reset_scheduler_on_bootup` tinyint(4) NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `scheduler_detail`
--

INSERT INTO `scheduler_detail` (`id`, `is_suspended`, `execute_misfired_jobs`, `reset_scheduler_on_bootup`) VALUES
(1, 0, 1, 1);

-- --------------------------------------------------------

--
-- Table structure for table `schema_version`
--

CREATE TABLE `schema_version` (
  `installed_rank` int(11) NOT NULL,
  `version` varchar(50) DEFAULT NULL,
  `description` varchar(200) NOT NULL,
  `type` varchar(20) NOT NULL,
  `script` varchar(1000) NOT NULL,
  `checksum` int(11) DEFAULT NULL,
  `installed_by` varchar(100) NOT NULL,
  `installed_on` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `execution_time` int(11) NOT NULL,
  `success` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `schema_version`
--

INSERT INTO `schema_version` (`installed_rank`, `version`, `description`, `type`, `script`, `checksum`, `installed_by`, `installed_on`, `execution_time`, `success`) VALUES
(1, '1', 'mifosplatform-core-ddl-latest', 'SQL', 'V1__mifosplatform-core-ddl-latest.sql', 119064388, 'root', '2022-11-01 14:12:13', 28127, 1),
(2, '2', 'mifosx-base-reference-data-utf8', 'SQL', 'V2__mifosx-base-reference-data-utf8.sql', -65442615, 'root', '2022-11-01 14:12:13', 336, 1),
(3, '3', 'mifosx-permissions-and-authorisation-utf8', 'SQL', 'V3__mifosx-permissions-and-authorisation-utf8.sql', 1944250308, 'root', '2022-11-01 14:12:13', 15, 1),
(4, '4', 'mifosx-core-reports-utf8', 'SQL', 'V4__mifosx-core-reports-utf8.sql', -227449669, 'root', '2022-11-01 14:12:15', 1531, 1),
(5, '5', 'update-savings-product-and-account-tables', 'SQL', 'V5__update-savings-product-and-account-tables.sql', -900351275, 'root', '2022-11-01 14:12:17', 1850, 1),
(6, '6', 'add min max principal column to loan', 'SQL', 'V6__add_min_max_principal_column_to_loan.sql', -1601193182, 'root', '2022-11-01 14:12:21', 4141, 1),
(7, '7', 'remove read makerchecker permission', 'SQL', 'V7__remove_read_makerchecker_permission.sql', 608480343, 'root', '2022-11-01 14:12:21', 3, 1),
(8, '8', 'deposit-transaction-permissions-if-they-exist', 'SQL', 'V8__deposit-transaction-permissions-if-they-exist.sql', 1588201274, 'root', '2022-11-01 14:12:22', 3, 1),
(9, '9', 'add min max constraint column to loan loanproduct', 'SQL', 'V9__add_min_max_constraint_column_to_loan_loanproduct.sql', -1936466576, 'root', '2022-11-01 14:12:27', 5099, 1),
(10, '10', 'interest-posting-fields-for-savings', 'SQL', 'V10__interest-posting-fields-for-savings.sql', -1851884020, 'root', '2022-11-01 14:12:29', 1783, 1),
(11, '11', 'add-payment-details', 'SQL', 'V11__add-payment-details.sql', 392037504, 'root', '2022-11-01 14:12:30', 1537, 1),
(12, '12', 'add external id to couple of tables', 'SQL', 'V12__add_external_id_to_couple_of_tables.sql', -1413720704, 'root', '2022-11-01 14:12:34', 4109, 1),
(13, '13', 'add group and client pending configuration', 'SQL', 'V13__add_group_and_client_pending_configuration.sql', -1923581595, 'root', '2022-11-01 14:12:35', 4, 1),
(14, '14', 'rename status id to enum', 'SQL', 'V14__rename_status_id_to_enum.sql', 1170819410, 'root', '2022-11-01 14:12:35', 222, 1),
(15, '15', 'center permissions', 'SQL', 'V15__center_permissions.sql', 1040281837, 'root', '2022-11-01 14:12:35', 1, 1),
(16, '16', 'drop min max column on loan table', 'SQL', 'V16__drop_min_max_column_on_loan_table.sql', -1885825047, 'root', '2022-11-01 14:12:37', 1746, 1),
(17, '17', 'update stretchy reporting ddl', 'SQL', 'V17__update_stretchy_reporting_ddl.sql', -1840572406, 'root', '2022-11-01 14:12:42', 5493, 1),
(18, '18', 'update stretchy reporting reportSql', 'SQL', 'V18__update_stretchy_reporting_reportSql.sql', -1818577971, 'root', '2022-11-01 14:12:43', 1, 1),
(19, '19', 'report maintenance permissions', 'SQL', 'V19__report_maintenance_permissions.sql', 1532394580, 'root', '2022-11-01 14:12:43', 4, 1),
(20, '20', 'report maint perms really configuration', 'SQL', 'V20__report_maint_perms_really_configuration.sql', -1359770258, 'root', '2022-11-01 14:12:43', 1, 1),
(21, '21', 'activation-permissions-for-clients', 'SQL', 'V21__activation-permissions-for-clients.sql', 445212986, 'root', '2022-11-01 14:12:44', 852, 1),
(22, '22', 'alter-group-for-consistency-add-permissions', 'SQL', 'V22__alter-group-for-consistency-add-permissions.sql', -1826174817, 'root', '2022-11-01 14:12:47', 2713, 1),
(23, '23', 'remove-enable-disable-configuration-for-client-group-status', 'SQL', 'V23__remove-enable-disable-configuration-for-client-group-status.sql', -400016213, 'root', '2022-11-01 14:12:48', 1011, 1),
(24, '24', 'add-group-client-foreign-key-constraint-in-loan-table', 'SQL', 'V24__add-group-client-foreign-key-constraint-in-loan-table.sql', -1728973066, 'root', '2022-11-01 14:12:50', 2143, 1),
(25, '25', 'update client reports for status and activation change', 'SQL', 'V25__update_client_reports_for_status_and_activation_change.sql', 270522482, 'root', '2022-11-01 14:12:50', 3, 1),
(26, '26', 'add-support-for-withdrawal-fees-on-savings', 'SQL', 'V26__add-support-for-withdrawal-fees-on-savings.sql', -668171609, 'root', '2022-11-01 14:12:54', 3685, 1),
(27, '27', 'add-loan-type-column-to-loan-table', 'SQL', 'V27__add-loan-type-column-to-loan-table.sql', 292612808, 'root', '2022-11-01 14:12:56', 1580, 1),
(28, '28', 'accounting-abstractions-and-autoposting', 'SQL', 'V28__accounting-abstractions-and-autoposting.sql', 381728263, 'root', '2022-11-01 14:12:57', 1541, 1),
(29, '29', 'add-support-for-annual-fees-on-savings', 'SQL', 'V29__add-support-for-annual-fees-on-savings.sql', -976993309, 'root', '2022-11-01 14:13:00', 2717, 1),
(30, '30', 'add-referenceNumber-to-acc gl journal entry', 'SQL', 'V30__add-referenceNumber-to-acc_gl_journal_entry.sql', -1919365230, 'root', '2022-11-01 14:13:01', 965, 1),
(31, '31', 'drop-autopostings', 'SQL', 'V31__drop-autopostings.sql', 710219330, 'root', '2022-11-01 14:13:02', 228, 1),
(32, '32', 'associate-disassociate-clients-from-group-permissions', 'SQL', 'V32__associate-disassociate-clients-from-group-permissions.sql', -592697821, 'root', '2022-11-01 14:13:02', 0, 1),
(33, '33', 'drop unique check on stretchy report parameter', 'SQL', 'V33__drop_unique_check_on_stretchy_report_parameter.sql', -2055810627, 'root', '2022-11-01 14:13:02', 218, 1),
(34, '34', 'add unique check on stretchy report parameter', 'SQL', 'V34__add_unique_check_on_stretchy_report_parameter.sql', 193396801, 'root', '2022-11-01 14:13:02', 392, 1),
(35, '35', 'add hierarchy column for acc gl account', 'SQL', 'V35__add_hierarchy_column_for_acc_gl_account.sql', 1133190959, 'root', '2022-11-01 14:13:03', 750, 1),
(36, '36', 'add tag id column for acc gl account', 'SQL', 'V36__add_tag_id_column_for_acc_gl_account.sql', -79675329, 'root', '2022-11-01 14:13:04', 1171, 1),
(37, '37', 'add-center-group-collection-sheet-permissions', 'SQL', 'V37__add-center-group-collection-sheet-permissions.sql', -751237991, 'root', '2022-11-01 14:13:05', 3, 1),
(38, '38', 'add-group-summary-details-report', 'SQL', 'V38__add-group-summary-details-report.sql', 143779472, 'root', '2022-11-01 14:13:05', 2, 1),
(39, '39', 'payment-channels-updates', 'SQL', 'V39__payment-channels-updates.sql', 1158269891, 'root', '2022-11-01 14:13:08', 3406, 1),
(40, '40', 'add permissions for accounting rule', 'SQL', 'V40__add_permissions_for_accounting_rule.sql', 1847558050, 'root', '2022-11-01 14:13:08', 3, 1),
(41, '41', 'group-summary-reports', 'SQL', 'V41__group-summary-reports.sql', 342424801, 'root', '2022-11-01 14:13:08', 6, 1),
(42, '42', 'Add default value for id for acc accounting rule', 'SQL', 'V42__Add_default_value_for_id_for_acc_accounting_rule.sql', -72799220, 'root', '2022-11-01 14:13:10', 1463, 1),
(43, '43', 'accounting-for-savings', 'SQL', 'V43__accounting-for-savings.sql', 1651196492, 'root', '2022-11-01 14:13:12', 1962, 1),
(44, '44', 'document-increase-size-of-column-type', 'SQL', 'V44__document-increase-size-of-column-type.sql', 2053715010, 'root', '2022-11-01 14:13:13', 1097, 1),
(45, '45', 'create acc rule tags table', 'SQL', 'V45__create_acc_rule_tags_table.sql', -556083400, 'root', '2022-11-01 14:13:14', 616, 1),
(46, '46', 'extend datatables api', 'SQL', 'V46__extend_datatables_api.sql', 1073435779, 'root', '2022-11-01 14:13:14', 3, 1),
(47, '47', 'staff-hierarchy-link-to-users', 'SQL', 'V47__staff-hierarchy-link-to-users.sql', 2033613047, 'root', '2022-11-01 14:13:18', 3383, 1),
(48, '48', 'adding-S3-Support', 'SQL', 'V48__adding-S3-Support.sql', 1991189662, 'root', '2022-11-01 14:13:23', 4850, 1),
(49, '49', 'track-loan-charge-payment-transactions', 'SQL', 'V49__track-loan-charge-payment-transactions.sql', -1576460310, 'root', '2022-11-01 14:13:23', 570, 1),
(50, '50', 'add-grace-settings-to-loan-product', 'SQL', 'V50__add-grace-settings-to-loan-product.sql', 1074006619, 'root', '2022-11-01 14:13:26', 2872, 1),
(51, '51', 'track-additional-details-related-to-installment-performance', 'SQL', 'V51__track-additional-details-related-to-installment-performance.sql', -1758431293, 'root', '2022-11-01 14:13:28', 2098, 1),
(52, '52', 'add boolean support cols to acc accounting rule', 'SQL', 'V52__add_boolean_support_cols_to_acc_accounting_rule.sql', 1199512253, 'root', '2022-11-01 14:13:30', 1575, 1),
(53, '53', 'track-advance-and-late-payments-on-installment', 'SQL', 'V53__track-advance-and-late-payments-on-installment.sql', 1514685834, 'root', '2022-11-01 14:13:31', 838, 1),
(54, '54', 'charge-to-income-account-mappings', 'SQL', 'V54__charge-to-income-account-mappings.sql', -153666643, 'root', '2022-11-01 14:13:33', 2022, 1),
(55, '55', 'add-additional-transaction-processing-strategies', 'SQL', 'V55__add-additional-transaction-processing-strategies.sql', -91742538, 'root', '2022-11-01 14:13:34', 1052, 1),
(56, '56', 'track-overpaid-amount-on-loans', 'SQL', 'V56__track-overpaid-amount-on-loans.sql', -1832228693, 'root', '2022-11-01 14:13:38', 3083, 1),
(57, '57', 'add default values to debit and credit accounts acc accounting rule', 'SQL', 'V57__add_default_values_to_debit_and_credit_accounts_acc_accounting_rule.sql', 1639714560, 'root', '2022-11-01 14:13:39', 1016, 1),
(58, '58', 'create-holiday-tables changed', 'SQL', 'V58__create-holiday-tables_changed.sql', -185888084, 'root', '2022-11-01 14:13:40', 1009, 1),
(59, '59', 'add group roles schema and permissions', 'SQL', 'V59__add_group_roles_schema_and_permissions.sql', -567172469, 'root', '2022-11-01 14:13:41', 641, 1),
(60, '60', 'quipo dashboard reports', 'SQL', 'V60__quipo_dashboard_reports.sql', -920595952, 'root', '2022-11-01 14:13:41', 9, 1),
(61, '61', 'txn running balance example', 'SQL', 'V61__txn_running_balance_example.sql', -912252258, 'root', '2022-11-01 14:13:41', 2, 1),
(62, '62', 'add staff id to m client changed', 'SQL', 'V62__add_staff_id_to_m_client_changed.sql', -319349448, 'root', '2022-11-01 14:13:42', 1302, 1),
(63, '63', 'add sync disbursement with meeting column to loan', 'SQL', 'V63__add_sync_disbursement_with_meeting_column_to_loan.sql', -159805428, 'root', '2022-11-01 14:13:45', 2324, 1),
(64, '64', 'add permission for assign staff', 'SQL', 'V64__add_permission_for_assign_staff.sql', 1478925682, 'root', '2022-11-01 14:13:45', 0, 1),
(65, '65', 'fix rupee symbol issues', 'SQL', 'V65__fix_rupee_symbol_issues.sql', 1527270133, 'root', '2022-11-01 14:13:45', 2, 1),
(66, '66', 'client close functionality', 'SQL', 'V66__client_close_functionality.sql', -884613759, 'root', '2022-11-01 14:13:47', 1531, 1),
(67, '67', 'loans in advance table', 'SQL', 'V67__loans_in_advance_table.sql', -155855088, 'root', '2022-11-01 14:13:47', 460, 1),
(68, '68', 'quipo dashboard reports updated', 'SQL', 'V68__quipo_dashboard_reports_updated.sql', -764702941, 'root', '2022-11-01 14:13:47', 52, 1),
(69, '69', 'loans in advance initialise', 'SQL', 'V69__loans_in_advance_initialise.sql', -399716568, 'root', '2022-11-01 14:13:48', 307, 1),
(70, '70', 'quipo program detail query fix', 'SQL', 'V70__quipo_program_detail_query_fix.sql', 222777237, 'root', '2022-11-01 14:13:48', 2, 1),
(71, '71', 'insert reschedule repayment to configuration', 'SQL', 'V71__insert_reschedule_repayment_to_configuration.sql', -1450097207, 'root', '2022-11-01 14:13:48', 1, 1),
(72, '72', 'add m loan counter changes', 'SQL', 'V72__add_m_loan_counter_changes.sql', -2060857847, 'root', '2022-11-01 14:13:50', 1569, 1),
(73, '73', 'add repayments rescheduled to and processed column to holiday', 'SQL', 'V73__add_repayments_rescheduled_to_and_processed_column_to_holiday.sql', 1663775859, 'root', '2022-11-01 14:13:51', 843, 1),
(74, '74', 'alter m loan counter table add group', 'SQL', 'V74__alter_m_loan_counter_table_add_group.sql', -1992756920, 'root', '2022-11-01 14:13:53', 2653, 1),
(75, '75', 'add reschedule-repayments-on-holidays to configuration', 'SQL', 'V75__add_reschedule-repayments-on-holidays_to_configuration.sql', 443386459, 'root', '2022-11-01 14:13:53', 2, 1),
(76, '76', 'rename permission grouping', 'SQL', 'V76__rename_permission_grouping.sql', -982796666, 'root', '2022-11-01 14:13:54', 5, 1),
(77, '77', 'alter m product loan changes', 'SQL', 'V77__alter_m_product_loan_changes.sql', -1229136110, 'root', '2022-11-01 14:13:55', 1414, 1),
(78, '78', 'breakdown portfolio grouping', 'SQL', 'V78__breakdown_portfolio_grouping.sql', 1328636103, 'root', '2022-11-01 14:13:55', 3, 1),
(79, '79', 'schedule jobs tables', 'SQL', 'V79__schedule_jobs_tables.sql', -589743195, 'root', '2022-11-01 14:13:56', 1108, 1),
(80, '80', 'schedule jobs tables updates', 'SQL', 'V80__schedule_jobs_tables_updates.sql', -1425539878, 'root', '2022-11-01 14:14:01', 4651, 1),
(81, '81', 'savings related changes', 'SQL', 'V81__savings_related_changes.sql', 1563638998, 'root', '2022-11-01 14:14:07', 6259, 1),
(82, '82', 'schedule jobs tables updates for running status', 'SQL', 'V82__schedule_jobs_tables_updates_for_running_status.sql', 1132800071, 'root', '2022-11-01 14:14:10', 2533, 1),
(83, '83', 'non-working-days-table', 'SQL', 'V83__non-working-days-table.sql', -302946339, 'root', '2022-11-01 14:14:10', 370, 1),
(84, '84', 'undo savings transaction permission', 'SQL', 'V84__undo_savings_transaction_permission.sql', -1287198757, 'root', '2022-11-01 14:14:11', 3, 1),
(85, '85', 'product mix related changes', 'SQL', 'V85__product_mix_related_changes.sql', 601061174, 'root', '2022-11-01 14:14:16', 4961, 1),
(86, '86', 'update-working-days', 'SQL', 'V86__update-working-days.sql', 105514946, 'root', '2022-11-01 14:14:16', 247, 1),
(87, '87', 'add permission for scheduler', 'SQL', 'V87__add_permission_for_scheduler.sql', -677627947, 'root', '2022-11-01 14:14:16', 1, 1),
(88, '88', 'added update constrain for scheduler jobs', 'SQL', 'V88__added_update_constrain_for_scheduler_jobs.sql', -204911234, 'root', '2022-11-01 14:14:17', 889, 1),
(89, '89', 'added scheduler group', 'SQL', 'V89__added_scheduler_group.sql', -1619195387, 'root', '2022-11-01 14:14:18', 1156, 1),
(90, '90', 'client performance history reports', 'SQL', 'V90__client_performance_history_reports.sql', 1812136764, 'root', '2022-11-01 14:14:19', 2, 1),
(91, '91', 'apply annual fees permission', 'SQL', 'V91__apply_annual_fees_permission.sql', 877103133, 'root', '2022-11-01 14:14:19', 1, 1),
(92, '91.1', 'configuration settings for holiday and non workingday', 'SQL', 'V91_1__configuration_settings_for_holiday_and_non_workingday.sql', -915366498, 'root', '2022-11-01 14:14:19', 3, 1),
(93, '92', 'group center assign staff permission', 'SQL', 'V92__group_center_assign_staff_permission.sql', -62928282, 'root', '2022-11-01 14:14:19', 0, 1),
(94, '93', 'loan transaction external id', 'SQL', 'V93__loan_transaction_external_id.sql', -1055999447, 'root', '2022-11-01 14:14:20', 1497, 1),
(95, '94', 'added savings accont type', 'SQL', 'V94__added_savings_accont type.sql', -93732125, 'root', '2022-11-01 14:14:22', 1043, 1),
(96, '95', 'batch job postInterest', 'SQL', 'V95__batch_job_postInterest.sql', 519798982, 'root', '2022-11-01 14:14:22', 2, 1),
(97, '96', 'savings accounts transfers table', 'SQL', 'V96__savings_accounts_transfers_table.sql', -289730275, 'root', '2022-11-01 14:14:23', 1146, 1),
(98, '97', 'add permission for adjust savings transaction', 'SQL', 'V97__add_permission_for_adjust_savings_transaction.sql', -569595860, 'root', '2022-11-01 14:14:23', 0, 1),
(99, '98', 'added currency roundof for multipleof', 'SQL', 'V98__added_currency_roundof_for_multipleof.sql', -646313893, 'root', '2022-11-01 14:14:34', 10574, 1),
(100, '100', 'Group saving summary report', 'SQL', 'V100__Group_saving_summary_report.sql', -730964236, 'root', '2022-11-01 14:14:34', 1, 1),
(101, '101', 'add mulitplesof to account transfers table', 'SQL', 'V101__add_mulitplesof_to_account_transfers_table.sql', -1900362387, 'root', '2022-11-01 14:14:40', 5972, 1),
(102, '102', 'client attendance tables', 'SQL', 'V102__client_attendance_tables.sql', -469225698, 'root', '2022-11-01 14:14:42', 2069, 1),
(103, '103', 'cluster support for batch jobs', 'SQL', 'V103__cluster_support_for_batch_jobs.sql', -1135652338, 'root', '2022-11-01 14:14:46', 3052, 1),
(104, '104', 'permissions for transfers', 'SQL', 'V104__permissions_for_transfers.sql', 1739230211, 'root', '2022-11-01 14:14:46', 4, 1),
(105, '105', 'track loan transaction against office', 'SQL', 'V105__track_loan_transaction_against_office.sql', -972472883, 'root', '2022-11-01 14:14:55', 9251, 1),
(106, '106', 'more permissions for transfers', 'SQL', 'V106__more_permissions_for_transfers.sql', -1474579375, 'root', '2022-11-01 14:14:55', 6, 1),
(107, '107', 'datatable code mappings', 'SQL', 'V107__datatable_code_mappings.sql', -1800596985, 'root', '2022-11-01 14:14:56', 853, 1),
(108, '108', 'client has transfer office', 'SQL', 'V108__client_has_transfer_office.sql', 1956889616, 'root', '2022-11-01 14:15:04', 7179, 1),
(109, '109', 'account transfer withdrawal fee configuration', 'SQL', 'V109__account_transfer_withdrawal_fee_configuration.sql', 2075172743, 'root', '2022-11-01 14:15:11', 6733, 1),
(110, '110', 'group center close', 'SQL', 'V110__group_center_close.sql', 841639004, 'root', '2022-11-01 14:15:23', 11926, 1),
(111, '111', 'disable constraint approach for datatables by default', 'SQL', 'V111__disable_constraint_approach_for_datatables_by_default.sql', 486408181, 'root', '2022-11-01 14:15:23', 0, 1),
(112, '111.1', 'set default transfers in suspense account for existing loan products', 'SQL', 'V111_1__set default_transfers_in_suspense_account_for_existing_loan_products.sql', 1517426279, 'root', '2022-11-01 14:15:24', 1, 1),
(113, '112', 'mixreport sql support', 'SQL', 'V112__mixreport_sql_support.sql', -1228035301, 'root', '2022-11-01 14:15:34', 9840, 1),
(114, '113', 'track savings transaction against office', 'SQL', 'V113__track_savings_transaction_against_office.sql', -410281860, 'root', '2022-11-01 14:15:48', 13805, 1),
(115, '114', 'set default transfers in suspense account for existing savings products - Copy', 'SQL', 'V114__set_default_transfers_in_suspense_account_for_existing_savings_products - Copy.sql', 1902069156, 'root', '2022-11-01 14:15:49', 0, 1),
(116, '115', 'permissions for cache api', 'SQL', 'V115__permissions_for_cache_api.sql', -1184713061, 'root', '2022-11-01 14:15:50', 1404, 1),
(117, '116', 'track currency for journal entries', 'SQL', 'V116__track_currency_for_journal_entries.sql', 1256336927, 'root', '2022-11-01 14:16:00', 8754, 1),
(118, '117', 'loan charge from savings', 'SQL', 'V117__loan_charge_from_savings.sql', -26677731, 'root', '2022-11-01 14:16:08', 8255, 1),
(119, '118', 'savings charge', 'SQL', 'V118__savings_charge.sql', 693838896, 'root', '2022-11-01 14:16:13', 4390, 1),
(120, '118.1', 'savings charge patch update', 'SQL', 'V118_1__savings_charge_patch_update.sql', 1694808161, 'root', '2022-11-01 14:16:16', 3688, 1),
(121, '118.2', 'product mapping delete duplicate fund source to account mappings', 'SQL', 'V118_2__product_mapping_delete_duplicate_fund_source_to_account_mappings.sql', -1336898572, 'root', '2022-11-01 14:16:17', 2, 1),
(122, '118.3', 'permissions form propose and accept client transfers', 'SQL', 'V118_3__permissions_form_propose_and_accept_client_transfers.sql', 798165935, 'root', '2022-11-01 14:16:17', 2, 1),
(123, '118.4', 'reset default transfers in suspense account for existing savings products', 'SQL', 'V118_4__reset_default_transfers_in_suspense_account_for_existing_savings_products.sql', 1360542042, 'root', '2022-11-01 14:16:17', 2, 1),
(124, '118.5', 'batch job entry for pay savings charge', 'SQL', 'V118_5__batch_job_entry_for_pay_savings_charge.sql', -1863312124, 'root', '2022-11-01 14:16:17', 0, 1),
(125, '118.6', 'defaults for income from penalties for savings product', 'SQL', 'V118_6__defaults_for_income_from_penalties_for savings_product.sql', 506260705, 'root', '2022-11-01 14:16:18', 0, 1),
(126, '118.7', 'move withdrawal annual fee to charges', 'SQL', 'V118_7__move_withdrawal_annual_fee_to_charges.sql', -111540129, 'root', '2022-11-01 14:16:25', 6806, 1),
(127, '118.8', 'track overpayments seperately in loan transactions', 'SQL', 'V118_8__track_overpayments_seperately_in_loan_transactions.sql', 386372433, 'root', '2022-11-01 14:16:26', 1334, 1),
(128, '119', 'add template table', 'SQL', 'V119__add_template_table.sql', 773887610, 'root', '2022-11-01 14:16:29', 2715, 1),
(129, '120', 'accounting running balance', 'SQL', 'V120__accounting_running_balance.sql', 836827696, 'root', '2022-11-01 14:16:31', 1893, 1),
(130, '121', 'accounting running balance for organization', 'SQL', 'V121__accounting_running_balance_for_organization.sql', 1624429192, 'root', '2022-11-01 14:16:33', 1826, 1),
(131, '122', 'recurring fee support for savings', 'SQL', 'V122__recurring_fee_support_for_savings.sql', -1151248135, 'root', '2022-11-01 14:16:37', 3687, 1),
(132, '123', 'remove payment mode for savings', 'SQL', 'V123__remove_payment_mode_for_savings.sql', -1898672139, 'root', '2022-11-01 14:16:39', 1409, 1),
(133, '124', 'added min max cap for charges', 'SQL', 'V124__added_min_max_cap_for_charges.sql', -624649509, 'root', '2022-11-01 14:16:43', 3931, 1),
(134, '125', 'added column for actual fee amount or percentage', 'SQL', 'V125__added_column_for_actual_fee_amount_or_percentage.sql', -699282713, 'root', '2022-11-01 14:16:45', 1825, 1),
(135, '126', 'initial database structure for sms outbound', 'SQL', 'V126__initial_database_structure_for_sms_outbound.sql', 257031585, 'root', '2022-11-01 14:16:46', 1309, 1),
(136, '127', 'mobile no fields', 'SQL', 'V127__mobile_no_fields.sql', 860635589, 'root', '2022-11-01 14:16:53', 6774, 1),
(137, '128', 'added loan installment charge', 'SQL', 'V128__added_loan_installment_charge.sql', -1886711024, 'root', '2022-11-01 14:16:54', 1116, 1),
(138, '129', 'client and group timeline', 'SQL', 'V129__client_and_group_timeline.sql', 2147432875, 'root', '2022-11-01 14:17:02', 6899, 1),
(139, '130', 'calendar-history-table', 'SQL', 'V130__calendar-history-table.sql', -1193476532, 'root', '2022-11-01 14:17:03', 1108, 1),
(140, '131', 'holiday-status-column-and-permissions', 'SQL', 'V131__holiday-status-column-and-permissions.sql', -8443552, 'root', '2022-11-01 14:17:06', 2496, 1),
(141, '132', 'borrower cycle changes', 'SQL', 'V132__borrower_cycle_changes.sql', 1166326270, 'root', '2022-11-01 14:17:08', 2095, 1),
(142, '133', 'adding payment detail with journal entry', 'SQL', 'V133__adding_payment_detail_with_journal_entry.sql', -150385482, 'root', '2022-11-01 14:17:14', 5806, 1),
(143, '134', 'added column value on c configuration', 'SQL', 'V134__added_column_value_on_c_configuration.sql', -1810735396, 'root', '2022-11-01 14:17:17', 2741, 1),
(144, '134.1', 'submitted date updation for clients', 'SQL', 'V134_1__submitted_date_updation_for_clients.sql', -1419828368, 'root', '2022-11-01 14:17:17', 3, 1),
(145, '134.2', 'permissions spelling correction', 'SQL', 'V134_2__permissions_spelling_correction.sql', -100492284, 'root', '2022-11-01 14:17:18', 3, 1),
(146, '135', 'added permission for undo written off', 'SQL', 'V135__added_permission_for_undo_written_off.sql', -1992691827, 'root', '2022-11-01 14:17:18', 2, 1),
(147, '136.1', 'update script strechy parameter', 'SQL', 'V136_1__update_script_strechy_parameter.sql', -990813696, 'root', '2022-11-01 14:17:18', 0, 1),
(148, '137', 'added is active column in m staff', 'SQL', 'V137__added_is_active_column_in_m_staff.sql', 1805101073, 'root', '2022-11-01 14:17:19', 1307, 1),
(149, '138', 'add short name for m product loan and m savings product', 'SQL', 'V138__add_short_name_for_m_product_loan_and_m_savings_product.sql', 916954384, 'root', '2022-11-01 14:17:29', 9754, 1),
(150, '139', 'default value for is active updated to true in m staff', 'SQL', 'V139__default_value_for_is_active_updated_to_true_in_m_staff.sql', 799254643, 'root', '2022-11-01 14:17:31', 1899, 1),
(151, '140', 'added loan charge status', 'SQL', 'V140__added_loan_charge_status.sql', 270843604, 'root', '2022-11-01 14:17:33', 2052, 1),
(152, '140.1', 'added payment detail id in ac gl journal entry', 'SQL', 'V140_1__added_payment_detail_id_in_ac_gl_journal_entry.sql', -2089139064, 'root', '2022-11-01 14:17:37', 3669, 1),
(153, '141', 'add early repayment strategy', 'SQL', 'V141__add_early_repayment_strategy.sql', 2121926239, 'root', '2022-11-01 14:17:37', 1, 1),
(154, '142', 'read savingsaccount charge permission', 'SQL', 'V142__read_savingsaccount_charge_permission.sql', -1880404982, 'root', '2022-11-01 14:17:37', 2, 1),
(155, '143', 'create journalentry checker permission', 'SQL', 'V143__create_journalentry_checker_permission.sql', 1002908030, 'root', '2022-11-01 14:17:38', 1, 1),
(156, '144', 'spelling mistake corrections', 'SQL', 'V144__spelling_mistake_corrections.sql', 1355644353, 'root', '2022-11-01 14:17:39', 949, 1),
(157, '145', 'add force password reset in c configuration', 'SQL', 'V145__add_force_password_reset_in_c_configuration.sql', 1290308329, 'root', '2022-11-01 14:17:45', 6509, 1),
(158, '146', 'tranche loans', 'SQL', 'V146__tranche_loans.sql', 148696440, 'root', '2022-11-01 14:17:57', 11022, 1),
(159, '147', 'tranche loans column name changes', 'SQL', 'V147__tranche_loans_column_name_changes.sql', -2088758170, 'root', '2022-11-01 14:17:57', 364, 1),
(160, '148', 'overdraft changes', 'SQL', 'V148__overdraft_changes.sql', 98556387, 'root', '2022-11-01 14:18:11', 13729, 1),
(161, '149', 'add created date savings transaction', 'SQL', 'V149__add_created_date_savings_transaction.sql', -2136734884, 'root', '2022-11-01 14:18:13', 2048, 1),
(162, '150', 'basic savings report', 'SQL', 'V150__basic_savings_report.sql', 94705542, 'root', '2022-11-01 14:18:17', 2922, 1),
(163, '151', 'add default savings account to client', 'SQL', 'V151__add_default_savings_account_to_client.sql', -98921622, 'root', '2022-11-01 14:18:25', 8210, 1),
(164, '152', 'added grace for over due', 'SQL', 'V152__added_grace_for_over_due.sql', -845122124, 'root', '2022-11-01 14:18:33', 8429, 1),
(165, '153', 'Insert missed permissions', 'SQL', 'V153__Insert_missed_permissions.sql', -1902915424, 'root', '2022-11-01 14:18:34', 2, 1),
(166, '154', 'aging details', 'SQL', 'V154__aging_details.sql', 1320106608, 'root', '2022-11-01 14:18:34', 1, 1),
(167, '155', 'stretchy into pentaho', 'SQL', 'V155__stretchy_into_pentaho.sql', -1335716019, 'root', '2022-11-01 14:18:34', 228, 1),
(168, '156', 'added loan saving txns pentaho', 'SQL', 'V156__added_loan_saving_txns_pentaho.sql', -55199363, 'root', '2022-11-01 14:18:34', 8, 1),
(169, '157', 'overdue charge improvements', 'SQL', 'V157__overdue_charge_improvements.sql', 120692153, 'root', '2022-11-01 14:18:38', 3430, 1),
(170, '158', 'dashboard and navigation queries', 'SQL', 'V158__dashboard_and_navigation_queries.sql', 566454310, 'root', '2022-11-01 14:18:38', 12, 1),
(171, '159', 'add transaction id column m portfolio command source', 'SQL', 'V159__add_transaction_id_column_m_portfolio_command_source.sql', -76225081, 'root', '2022-11-01 14:18:46', 7107, 1),
(172, '160', 'standing instruction changes', 'SQL', 'V160__standing_instruction_changes.sql', 1476018685, 'root', '2022-11-01 14:18:58', 12130, 1),
(173, '160.2', 'Allow nullValue For principal on lonProduct', 'SQL', 'V160_2__Allow_nullValue_For_principal_on_lonProduct.sql', 1540776224, 'root', '2022-11-01 14:19:02', 3307, 1),
(174, '161', 'added accrual batch job', 'SQL', 'V161__added_accrual_batch_job.sql', -1495069402, 'root', '2022-11-01 14:19:03', 1234, 1),
(175, '162', 'overdue charge batch job', 'SQL', 'V162__overdue_charge_batch_job.sql', -620232185, 'root', '2022-11-01 14:19:03', 2, 1),
(176, '163', 'added npa for loans', 'SQL', 'V163__added_npa_for_loans.sql', -426968531, 'root', '2022-11-01 14:19:10', 6356, 1),
(177, '164', 'fd and rd deposit tables', 'SQL', 'V164__fd_and_rd_deposit_tables.sql', -156323344, 'root', '2022-11-01 14:19:30', 20035, 1),
(178, '165', 'added permission for disburse to saving account', 'SQL', 'V165__added_permission_for_disburse_to_saving_account.sql', 1989930130, 'root', '2022-11-01 14:19:30', 1, 1),
(179, '166', 'added deposit amount to product term and preclosure', 'SQL', 'V166__added_deposit_amount_to_product_term_and_preclosure.sql', 435508611, 'root', '2022-11-01 14:19:34', 3434, 1),
(180, '167', 'added columns for writtenOff loans recovered', 'SQL', 'V167__added_columns_for_writtenOff_loans_recovered.sql', -139337444, 'root', '2022-11-01 14:19:41', 7140, 1),
(181, '168', 'added transfer fixed deposit interest to linked account', 'SQL', 'V168__added_transfer_fixed_deposit_interest_to_linked_account.sql', -1725072282, 'root', '2022-11-01 14:19:45', 3822, 1),
(182, '169', 'update dashboard reports to core reports use report to false', 'SQL', 'V169__update_dashboard_reports_to_core_reports_use_report_to_false.sql', -130647887, 'root', '2022-11-01 14:19:45', 0, 1),
(183, '170', 'update deposit accounts maturity details job', 'SQL', 'V170__update_deposit_accounts_maturity_details_job.sql', -136517052, 'root', '2022-11-01 14:19:46', 2, 1),
(184, '171', 'added mandatory savings and rd changes', 'SQL', 'V171__added_mandatory_savings_and_rd_changes.sql', -2002400008, 'root', '2022-11-01 14:19:57', 10469, 1),
(185, '172', 'accounting changes for transfers', 'SQL', 'V172__accounting_changes_for_transfers.sql', -1460781005, 'root', '2022-11-01 14:19:58', 1170, 1),
(186, '173', 'ppi', 'SQL', 'V173__ppi.sql', -1691444217, 'root', '2022-11-01 14:20:06', 7836, 1),
(187, '174', 'remove interest accrual', 'SQL', 'V174__remove_interest_accrual.sql', -420117845, 'root', '2022-11-01 14:20:06', 2, 1),
(188, '175', 'added incentive interest rates', 'SQL', 'V175__added_incentive_interest_rates.sql', 1104860725, 'root', '2022-11-01 14:20:20', 13473, 1),
(189, '176', 'updates to financial activity accounts', 'SQL', 'V176__updates_to_financial_activity_accounts.sql', -2031193301, 'root', '2022-11-01 14:20:24', 4447, 1),
(190, '177', 'cleanup for client incentives', 'SQL', 'V177__cleanup_for_client_incentives.sql', -573278511, 'root', '2022-11-01 14:20:25', 2, 1),
(191, '178', 'updates to financial activity accounts pt2', 'SQL', 'V178__updates_to_financial_activity_accounts_pt2.sql', -515240905, 'root', '2022-11-01 14:20:25', 5, 1),
(192, '179', 'updates to action names for maker checker permissions', 'SQL', 'V179__updates_to_action_names_for_maker_checker_permissions.sql', 433965975, 'root', '2022-11-01 14:20:25', 11, 1),
(193, '180', 'update report schemas for disbursed vs awaitingdisbursal and groupnamesbystaff', 'SQL', 'V180__update_report_schemas_for_disbursed_vs_awaitingdisbursal_and_groupnamesbystaff.sql', 1294800637, 'root', '2022-11-01 14:20:25', 2, 1),
(194, '181', 'standing instruction logging', 'SQL', 'V181__standing_instruction_logging.sql', 1737578730, 'root', '2022-11-01 14:20:27', 1061, 1),
(195, '182', 'added min required balance to savings product', 'SQL', 'V182__added_min_required_balance_to_savings_product.sql', -239896332, 'root', '2022-11-01 14:20:31', 3955, 1),
(196, '183', 'added min balance for interest calculation', 'SQL', 'V183__added_min_balance_for_interest_calculation.sql', 588382570, 'root', '2022-11-01 14:20:37', 6281, 1),
(197, '184', 'update min required balance for savings product', 'SQL', 'V184__update_min_required_balance_for_savings_product.sql', -273624790, 'root', '2022-11-01 14:20:38', 754, 1),
(198, '185', 'add accrual till date for periodic accrual', 'SQL', 'V185__add_accrual_till_date_for_periodic_accrual.sql', -866948659, 'root', '2022-11-01 14:20:44', 6087, 1),
(199, '186', 'added periodic accrual job', 'SQL', 'V186__added_periodic_accrual_job.sql', 1261991143, 'root', '2022-11-01 14:20:44', 4, 1),
(200, '187', 'added permission to periodic accrual', 'SQL', 'V187__added_permission_to_periodic_accrual.sql', 850662953, 'root', '2022-11-01 14:20:45', 0, 1),
(201, '188', 'add savingscharge inactivate permissions', 'SQL', 'V188__add_savingscharge_inactivate_permissions.sql', -1188306388, 'root', '2022-11-01 14:20:47', 2059, 1),
(202, '189', 'm loan interest recalculation tables', 'SQL', 'V189__m_loan_interest_recalculation_tables.sql', 1968736430, 'root', '2022-11-01 14:21:01', 13980, 1),
(203, '190', 'add associategroup disassociategroup permissions', 'SQL', 'V190__add_associategroup_disassociategroup_permissions.sql', 1066545321, 'root', '2022-11-01 14:21:01', 1, 1),
(204, '191', 'update gl account increase size of name col', 'SQL', 'V191__update_gl_account_increase_size_of_name_col.sql', -365376750, 'root', '2022-11-01 14:21:04', 2619, 1),
(205, '192', 'interest recalculate job', 'SQL', 'V192__interest_recalculate_job.sql', 1921712905, 'root', '2022-11-01 14:21:04', 243, 1),
(206, '193', 'added column joiningDate for staff', 'SQL', 'V193__added_column_joiningDate_for_staff.sql', -1285035914, 'root', '2022-11-01 14:21:06', 1706, 1),
(207, '194', 'added recalculatedInterestComponent for interest recalculation', 'SQL', 'V194__added_recalculatedInterestComponent_for_interest_recalculation.sql', 1302596643, 'root', '2022-11-01 14:21:08', 1754, 1),
(208, '195', 'moved rest frequency to product level', 'SQL', 'V195__moved_rest_frequency_to_product_level.sql', 2029546480, 'root', '2022-11-01 14:21:12', 3363, 1),
(209, '196', 'added loan running balance to transactions', 'SQL', 'V196__added_loan_running_balance_to_transactions.sql', 1883093695, 'root', '2022-11-01 14:21:19', 7251, 1),
(210, '197', 'updated loan running balance of transactions', 'SQL', 'V197__updated_loan_running_balance_of_transactions.sql', -1442602776, 'root', '2022-11-01 14:21:23', 3232, 1),
(211, '198', 'loan rescheduling tables and permissions', 'SQL', 'V198__loan_rescheduling_tables_and_permissions.sql', 1975900833, 'root', '2022-11-01 14:21:36', 12175, 1),
(212, '199', 'removed extra columns from schedule history', 'SQL', 'V199__removed_extra_columns_from_schedule_history.sql', -628343048, 'root', '2022-11-01 14:21:37', 1013, 1),
(213, '200', 'alter savings account for start interest calculation date', 'SQL', 'V200__alter_savings_account_for_start_interest_calculation_date.sql', 1369807683, 'root', '2022-11-01 14:21:41', 3968, 1),
(214, '201', 'webhooks', 'SQL', 'V201__webhooks.sql', 1580327182, 'root', '2022-11-01 14:21:48', 6301, 1),
(215, '202', 'savings officer history table', 'SQL', 'V202__savings_officer_history_table.sql', -1502962087, 'root', '2022-11-01 14:21:49', 1505, 1),
(216, '203', 'added subbmittedDate loantransaction', 'SQL', 'V203__added_subbmittedDate_loantransaction.sql', -2090160057, 'root', '2022-11-01 14:21:51', 1585, 1),
(217, '204', 'insert script for charges paid by for accruals', 'SQL', 'V204__insert_script_for_charges_paid_by_for_accruals.sql', 1038522105, 'root', '2022-11-01 14:21:51', 1, 1),
(218, '205', 'fix for charge and interest waiver with accruals', 'SQL', 'V205__fix_for_charge_and_interest_waiver_with_accruals.sql', 1454561403, 'root', '2022-11-01 14:21:54', 2719, 1),
(219, '206', 'interest posting configuration', 'SQL', 'V206__interest_posting_configuration.sql', -652463161, 'root', '2022-11-01 14:21:57', 2382, 1),
(220, '207', 'min max clients per group', 'SQL', 'V207__min_max_clients_per_group.sql', 304411787, 'root', '2022-11-01 14:21:59', 2205, 1),
(221, '208', 'min max clients in group redux', 'SQL', 'V208__min_max_clients_in_group_redux.sql', 594853062, 'root', '2022-11-01 14:22:01', 1875, 1),
(222, '209', 'add all report names in m permission table', 'SQL', 'V209__add_all_report_names_in_m_permission_table.sql', -1546489658, 'root', '2022-11-01 14:22:01', 7, 1),
(223, '210', 'track manually adjusted transactions', 'SQL', 'V210__track_manually_adjusted_transactions.sql', -1397991547, 'root', '2022-11-01 14:22:04', 2497, 1),
(224, '211', 'minimum days between disbursal and first repayment', 'SQL', 'V211__minimum_days_between_disbursal_and_first_repayment.sql', 507426804, 'root', '2022-11-01 14:22:06', 2053, 1),
(225, '212', 'add NthDay and DayOfWeek columns loan', 'SQL', 'V212__add_NthDay_and_DayOfWeek_columns_loan.sql', -1792938441, 'root', '2022-11-01 14:22:11', 5006, 1),
(226, '213', 'NthDay and DayOfWeek columns should be nullable', 'SQL', 'V213__NthDay_and_DayOfWeek_columns_should_be_nullable.sql', -1571069204, 'root', '2022-11-01 14:22:18', 6424, 1),
(227, '214', 'alter table add create SI at disbursement', 'SQL', 'V214__alter_table_add_create_SI_at_disbursement.sql', 1565545285, 'root', '2022-11-01 14:22:24', 5254, 1),
(228, '215', 'guarantee on hold fund changes', 'SQL', 'V215__guarantee_on_hold_fund_changes.sql', 1553301022, 'root', '2022-11-01 14:22:33', 9466, 1),
(229, '216', 'adding loan proposed amount to loan', 'SQL', 'V216__adding_loan_proposed_amount_to_loan.sql', -1296820554, 'root', '2022-11-01 14:22:38', 5100, 1),
(230, '217', 'client substatus and codevalue description', 'SQL', 'V217__client_substatus_and_codevalue_description.sql', 230389645, 'root', '2022-11-01 14:22:46', 7784, 1),
(231, '218', 'add user and datetime for loan savings transactions', 'SQL', 'V218__add_user_and_datetime_for_loan_savings_transactions.sql', -2132951063, 'root', '2022-11-01 14:22:50', 3879, 1),
(232, '219', 'guarantor on hold fund changes for account', 'SQL', 'V219__guarantor_on_hold_fund_changes_for_account.sql', 1173682793, 'root', '2022-11-01 14:23:09', 18585, 1),
(233, '220', 'account number preferences', 'SQL', 'V220__account_number_preferences.sql', -1395443636, 'root', '2022-11-01 14:23:10', 980, 1),
(234, '221', 'add version for m savings account', 'SQL', 'V221__add_version_for_m_savings_account.sql', 1324880199, 'root', '2022-11-01 14:23:12', 1685, 1),
(235, '222', 'guarantor on hold fund changes for transactions', 'SQL', 'V222__guarantor_on_hold_fund_changes_for_transactions.sql', -1021912882, 'root', '2022-11-01 14:23:22', 9044, 1),
(236, '223', 'add version for m loan account', 'SQL', 'V223__add_version_for_m_loan_account.sql', -686519762, 'root', '2022-11-01 14:23:28', 5966, 1),
(237, '224', 'client lifecycle adding statuses', 'SQL', 'V224__client_lifecycle_adding_statuses.sql', -347754190, 'root', '2022-11-01 14:23:39', 11529, 1),
(238, '225', 'permissions for updating recurring deposit amount', 'SQL', 'V225__permissions_for_updating_recurring_deposit_amount.sql', 1673325243, 'root', '2022-11-01 14:23:40', 2, 1),
(239, '226', 'configuration for enforcing calendars for jlg loans', 'SQL', 'V226__configuration_for_enforcing_calendars_for_jlg_loans.sql', -1270613354, 'root', '2022-11-01 14:23:40', 1, 1),
(240, '227', 'loan-refund-permissions', 'SQL', 'V227__loan-refund-permissions.sql', 635415447, 'root', '2022-11-01 14:23:40', 2, 1),
(241, '228', 'entity to entity access', 'SQL', 'V228__entity_to_entity_access.sql', -1590508427, 'root', '2022-11-01 14:23:41', 1093, 1),
(242, '229', 'teller cash management', 'SQL', 'V229__teller_cash_management.sql', 1165501911, 'root', '2022-11-01 14:23:44', 2617, 1),
(243, '230', 'role status and correspoding permissions', 'SQL', 'V230__role_status_and_correspoding_permissions.sql', 935459059, 'root', '2022-11-01 14:23:46', 2226, 1),
(244, '231', 'm cashier transaction added currency code', 'SQL', 'V231__m_cashier_transaction_added_currency_code.sql', 803739261, 'root', '2022-11-01 14:23:51', 4024, 1),
(245, '232', 'insert center closure reason', 'SQL', 'V232__insert_center_closure_reason.sql', 1666879545, 'root', '2022-11-01 14:23:51', 1, 1),
(246, '233', 'Savings Transaction Receipt', 'SQL', 'V233__Savings_Transaction_Receipt.sql', -81992382, 'root', '2022-11-01 14:23:52', 1, 1),
(247, '234', 'opening balaces setup', 'SQL', 'V234__opening_balaces_setup.sql', 856921280, 'root', '2022-11-01 14:23:53', 1073, 1),
(248, '235', 'add ugd template id m hook', 'SQL', 'V235__add_ugd_template_id_m_hook.sql', 515913863, 'root', '2022-11-01 14:23:59', 5464, 1),
(249, '236', 'individual collection sheet permissions', 'SQL', 'V236__individual_collection_sheet_permissions.sql', -1242002583, 'root', '2022-11-01 14:23:59', 0, 1),
(250, '237', 'add threshold config for last instalment', 'SQL', 'V237__add_threshold_config_for_last_instalment.sql', 1366235690, 'root', '2022-11-01 14:24:05', 5520, 1),
(251, '238', 'update staff display name length', 'SQL', 'V238__update_staff_display_name_length.sql', 1560337825, 'root', '2022-11-01 14:24:06', 794, 1),
(252, '239', 'Loan Transaction Receipt', 'SQL', 'V239__Loan_Transaction_Receipt.sql', -99215366, 'root', '2022-11-01 14:24:06', 1, 1),
(253, '240', 'arrears aging config for interest recalculation', 'SQL', 'V240__arrears_aging_config_for_interest_recalculation.sql', -486597638, 'root', '2022-11-01 14:24:08', 2317, 1),
(254, '241', 'fixed emi changes', 'SQL', 'V241__fixed_emi_changes.sql', 1276677991, 'root', '2022-11-01 14:24:10', 1649, 1),
(255, '242', 'entitytoentitymappingrelation', 'SQL', 'V242__entitytoentitymappingrelation.sql', 2141732987, 'root', '2022-11-01 14:24:12', 1498, 1),
(256, '243', 'alter loan disbursement details', 'SQL', 'V243__alter_loan_disbursement_details.sql', 854330757, 'root', '2022-11-01 14:24:14', 1371, 1),
(257, '244', 'staff assignment history table', 'SQL', 'V244__staff_assignment_history_table.sql', 662527334, 'root', '2022-11-01 14:24:15', 828, 1),
(258, '245', 'open rd changes', 'SQL', 'V245__open_rd_changes.sql', 1616661888, 'root', '2022-11-01 14:24:15', 0, 1),
(259, '246', 'drop group client foreign key from m loan', 'SQL', 'V246__drop_group_client_foreign_key_from_m_loan.sql', -851010237, 'root', '2022-11-01 14:24:15', 95, 1),
(260, '247', 'consistency wrt spelling principalThresholdForLastInstalment', 'SQL', 'V247__consistency_wrt_spelling_principalThresholdForLastInstalment.sql', 107261655, 'root', '2022-11-01 14:24:16', 173, 1),
(261, '248', 'added password never expired to User', 'SQL', 'V248__added_password_never_expired_to_User.sql', -416151926, 'root', '2022-11-01 14:24:18', 1861, 1),
(262, '249', 'workingdays permissions', 'SQL', 'V249__workingdays_permissions.sql', -285334816, 'root', '2022-11-01 14:24:18', 1, 1),
(263, '250', 'password validation policy', 'SQL', 'V250__password_validation_policy.sql', -1970072983, 'root', '2022-11-01 14:24:19', 1156, 1),
(264, '251', 'paymentType table', 'SQL', 'V251__paymentType_table.sql', -395216932, 'root', '2022-11-01 14:24:24', 4426, 1),
(265, '252', 'bug fix teller cash management', 'SQL', 'V252__bug_fix_teller_cash_management.sql', 1613140584, 'root', '2022-11-01 14:24:27', 2884, 1),
(266, '253', 'product loan configurable attributes', 'SQL', 'V253__product_loan_configurable_attributes.sql', 1687840572, 'root', '2022-11-01 14:24:28', 788, 1),
(267, '254', 'General Ledger Report', 'SQL', 'V254__General_Ledger_Report.sql', -486963713, 'root', '2022-11-01 14:24:28', 2, 1),
(268, '255', 'pre close interest period config', 'SQL', 'V255__pre_close_interest_period_config.sql', 2037205087, 'root', '2022-11-01 14:24:30', 1730, 1),
(269, '256', 'Update script for General Ledger report', 'SQL', 'V256__Update script for General_Ledger_report.sql', -336841668, 'root', '2022-11-01 14:24:30', 2, 1),
(270, '257', 'staff image association', 'SQL', 'V257__staff_image_association.sql', 509589779, 'root', '2022-11-01 14:24:31', 1561, 1),
(271, '258', 'interest compounding changes', 'SQL', 'V258__interest_compounding_changes.sql', -1316238878, 'root', '2022-11-01 14:24:33', 1727, 1),
(272, '259', 'alter working days', 'SQL', 'V259__alter_working_days.sql', 42090107, 'root', '2022-11-01 14:24:34', 956, 1),
(273, '260', 'alter password validation policy', 'SQL', 'V260__alter_password_validation_policy.sql', -134451744, 'root', '2022-11-01 14:24:38', 3082, 1),
(274, '261', 'Update script for Client Loan Account Schedule Report', 'SQL', 'V261__Update script for Client_Loan_Account_Schedule_Report.sql', 1270228973, 'root', '2022-11-01 14:24:38', 1, 1),
(275, '262', 'accountNumber for groups', 'SQL', 'V262__accountNumber_for_groups.sql', 1663491032, 'root', '2022-11-01 14:24:39', 1355, 1),
(276, '263', 'mifos reports', 'SQL', 'V263__mifos_reports.sql', 2038173302, 'root', '2022-11-01 14:24:39', 3, 1),
(277, '264', 'insert paymenttype and report read permission', 'SQL', 'V264__insert_paymenttype_and_report_read_permission.sql', -1418023569, 'root', '2022-11-01 14:24:39', 1, 1),
(278, '265', 'modify external service schema', 'SQL', 'V265__modify_external_service_schema.sql', -394241072, 'root', '2022-11-01 14:24:46', 6398, 1),
(279, '266', 'client fees', 'SQL', 'V266__client_fees.sql', 793462969, 'root', '2022-11-01 14:24:49', 2823, 1),
(280, '267', 'client transaction permissions', 'SQL', 'V267__client_transaction_permissions.sql', -1823491409, 'root', '2022-11-01 14:24:49', 0, 1),
(281, '268', 'update gmail password', 'SQL', 'V268__update_gmail_password.sql', -1846713169, 'root', '2022-11-01 14:24:49', 1, 1),
(282, '269', 'increased calendar title length ', 'SQL', 'V269__increased_calendar_title_length .sql', 680250262, 'root', '2022-11-01 14:24:50', 1167, 1),
(283, '270', 'add rounding mode configuration', 'SQL', 'V270__add_rounding_mode_configuration.sql', -200508772, 'root', '2022-11-01 14:24:52', 1376, 1),
(284, '271', 'accounting for client charges', 'SQL', 'V271__accounting_for_client_charges.sql', -2124213317, 'root', '2022-11-01 14:24:56', 4040, 1),
(285, '272', 'loan tranche disbursement charge', 'SQL', 'V272__loan_tranche_disbursement_charge.sql', 1939084876, 'root', '2022-11-01 14:24:59', 3391, 1),
(286, '273', 'oauth changes', 'SQL', 'V273__oauth_changes.sql', -1803712, 'root', '2022-11-01 14:25:01', 1368, 1),
(287, '274', 'Loan Reschedule Code Value', 'SQL', 'V274__Loan_Reschedule_Code_Value.sql', 1077311620, 'root', '2022-11-01 14:25:01', 1, 1),
(288, '275', 'loan transaction to repayment schedule mapping', 'SQL', 'V275__loan_transaction_to_repayment_schedule_mapping.sql', -1878203075, 'root', '2022-11-01 14:25:02', 624, 1),
(289, '276', 'loan recalulated till date', 'SQL', 'V276__loan_recalulated_till_date.sql', 62303251, 'root', '2022-11-01 14:25:05', 3420, 1),
(290, '277', 'Loan Product Provisioning', 'SQL', 'V277__Loan_Product_Provisioning.sql', 1163791805, 'root', '2022-11-01 14:25:13', 7321, 1),
(291, '278', 'LoanTransactionProcessingStrategy', 'SQL', 'V278__LoanTransactionProcessingStrategy.sql', 1873478635, 'root', '2022-11-01 14:25:15', 1611, 1),
(292, '279', 'floating rates', 'SQL', 'V279__floating_rates.sql', -1321932908, 'root', '2022-11-01 14:25:22', 7008, 1),
(293, '280', 'spm framework initial tables', 'SQL', 'V280__spm_framework_initial_tables.sql', 2057612535, 'root', '2022-11-01 14:25:25', 3343, 1),
(294, '281', 'add configuration param backdate-penalties', 'SQL', 'V281__add_configuration_param_backdate-penalties.sql', -134414634, 'root', '2022-11-01 14:25:25', 1, 1),
(295, '282', 'CustomerSelfService', 'SQL', 'V282__CustomerSelfService.sql', -112186895, 'root', '2022-11-01 14:25:28', 2090, 1),
(296, '283', 'Variable Installments', 'SQL', 'V283__Variable_Installments.sql', 1381678945, 'root', '2022-11-01 14:25:31', 2811, 1),
(297, '284', 'update codevalue', 'SQL', 'V284__update_codevalue.sql', -315539877, 'root', '2022-11-01 14:25:33', 1531, 1),
(298, '285', 'undo last tranche script', 'SQL', 'V285__undo_last_tranche_script.sql', -1708554317, 'root', '2022-11-01 14:25:33', 3, 1),
(299, '286', 'partial period interest calcualtion', 'SQL', 'V286__partial_period_interest_calcualtion.sql', 1765545142, 'root', '2022-11-01 14:25:37', 4504, 1),
(300, '287', 'alter spm scorecard', 'SQL', 'V287__alter_spm_scorecard.sql', 1495090597, 'root', '2022-11-01 14:25:39', 996, 1),
(301, '288', 'overdraft interest', 'SQL', 'V288__overdraft_interest.sql', -301352008, 'root', '2022-11-01 14:25:42', 3088, 1),
(302, '289', 'client non person', 'SQL', 'V289__client_non_person.sql', -1916779621, 'root', '2022-11-01 14:25:44', 2281, 1),
(303, '290', 'shares dividends permissions script', 'SQL', 'V290__shares_dividends_permissions_script.sql', -1638533667, 'root', '2022-11-01 14:25:44', 0, 1),
(304, '291', 'organisation start date config', 'SQL', 'V291__organisation_start_date_config.sql', -1272130082, 'root', '2022-11-01 14:25:46', 1161, 1),
(305, '292', 'update organisation start date', 'SQL', 'V292__update_organisation_start_date.sql', -101002738, 'root', '2022-11-01 14:25:46', 1, 1),
(306, '293', 'interest rate chart support for amounts', 'SQL', 'V293__interest_rate_chart_support_for_amounts.sql', -1908082614, 'root', '2022-11-01 14:25:50', 3567, 1),
(307, '294', 'configuration for paymnettype application forDisbursement charge', 'SQL', 'V294__configuration_for_paymnettype_application_forDisbursement_charge.sql', -1112793210, 'root', '2022-11-01 14:25:50', 1, 1),
(308, '295', 'configuration for interest charged date same as disbursal date', 'SQL', 'V295__configuration_for_interest_charged_date_same_as_disbursal_date.sql', -303825985, 'root', '2022-11-01 14:25:50', 1, 1),
(309, '296', 'skip repayment on first-day of month', 'SQL', 'V296__skip_repayment_on first-day_of_month.sql', -1283375064, 'root', '2022-11-01 14:25:50', 1, 1),
(310, '297', 'Adding Meeting Time column', 'SQL', 'V297__Adding_Meeting_Time_column.sql', 152366287, 'root', '2022-11-01 14:25:51', 714, 1),
(311, '298', 'savings interest tax', 'SQL', 'V298__savings_interest_tax.sql', 1473155438, 'root', '2022-11-01 14:26:00', 8824, 1),
(312, '299', 'share products', 'SQL', 'V299__share_products.sql', 1820562466, 'root', '2022-11-01 14:26:09', 9082, 1),
(313, '300', 'configuration for allow changing of emi amount', 'SQL', 'V300__configuration_for_allow_changing_of_emi_amount.sql', -1584357813, 'root', '2022-11-01 14:26:11', 1427, 1),
(314, '301', 'recurring moratorium principal periods', 'SQL', 'V301__recurring_moratorium_principal_periods.sql', 1959819032, 'root', '2022-11-01 14:26:15', 4373, 1),
(315, '302', 'add status to client identifier', 'SQL', 'V302__add_status_to_client_identifier.sql', -609094176, 'root', '2022-11-01 14:26:17', 1065, 1),
(316, '303', 'Savings Account Dormancy', 'SQL', 'V303__Savings_Account_Dormancy.sql', -475774589, 'root', '2022-11-01 14:26:19', 2347, 1),
(317, '304', 'customer self service third party transfers', 'SQL', 'V304__customer_self_service_third_party_transfers.sql', -808836671, 'root', '2022-11-01 14:26:20', 452, 1),
(318, '305', 'compounding and rest frequency nth day freq and insertion script for accrual job', 'SQL', 'V305__compounding_and_rest_frequency_nth_day_freq_and_insertion_script_for_accrual_job.sql', 750419157, 'root', '2022-11-01 14:26:27', 7616, 1),
(319, '306', 'add domancy tracking job to savings group', 'SQL', 'V306__add_domancy_tracking_job_to_savings_group.sql', -735246260, 'root', '2022-11-01 14:26:27', 0, 1);
INSERT INTO `schema_version` (`installed_rank`, `version`, `description`, `type`, `script`, `checksum`, `installed_by`, `installed_on`, `execution_time`, `success`) VALUES
(320, '307', 'add share notes', 'SQL', 'V307__add_share_notes.sql', 2077703947, 'root', '2022-11-01 14:26:29', 1557, 1),
(321, '308', 'add interest recalculation in savings account', 'SQL', 'V308__add_interest_recalculation_in_savings_account.sql', 1578347227, 'root', '2022-11-01 14:26:30', 1165, 1),
(322, '309', 'add loan write off reason code', 'SQL', 'V309__add_loan_write_off_reason_code.sql', -1257844376, 'root', '2022-11-01 14:26:34', 3908, 1),
(323, '310', 'copy data from entitytoentityaccess to entitytoentitymapping', 'SQL', 'V310__copy_data_from_entitytoentityaccess_to_entitytoentitymapping.sql', -73861671, 'root', '2022-11-01 14:26:35', 2, 1),
(324, '311', 'foreclosure details', 'SQL', 'V311__foreclosure_details.sql', -1763238446, 'root', '2022-11-01 14:26:39', 4029, 1),
(325, '312', 'add is mandatory to code value', 'SQL', 'V312__add_is_mandatory_to_code_value.sql', 702873023, 'root', '2022-11-01 14:26:40', 1185, 1),
(326, '313', 'multi rescheduling script', 'SQL', 'V313__multi_rescheduling_script.sql', 579706172, 'root', '2022-11-01 14:26:47', 6378, 1),
(327, '314', 'updating r enum table', 'SQL', 'V314__updating_r_enum_table.sql', -552509053, 'root', '2022-11-01 14:26:47', 7, 1),
(328, '315', 'add sync expected with disbursement date in m product loan', 'SQL', 'V315__add_sync_expected_with_disbursement_date_in_m_product_loan.sql', -338986738, 'root', '2022-11-01 14:26:48', 1144, 1),
(329, '316', 'address module tables metadat', 'SQL', 'V316__address_module_tables_metadat.sql', 1482410633, 'root', '2022-11-01 14:26:51', 2723, 1),
(330, '317', 'report mailing job module', 'SQL', 'V317__report_mailing_job_module.sql', -1964152991, 'root', '2022-11-01 14:26:53', 1763, 1),
(331, '318', 'topuploan', 'SQL', 'V318__topuploan.sql', -178042340, 'root', '2022-11-01 14:26:56', 3569, 1),
(332, '319', 'client undoreject', 'SQL', 'V319__client_undoreject.sql', 418303352, 'root', '2022-11-01 14:26:59', 2015, 1),
(333, '320', 'add holiday payment reschedule', 'SQL', 'V320__add_holiday_payment_reschedule.sql', -1696761107, 'root', '2022-11-01 14:27:00', 831, 1),
(334, '321', 'boolean field As Interest PostedOn', 'SQL', 'V321__boolean_field_As_Interest_PostedOn.sql', -564979342, 'root', '2022-11-01 14:27:01', 1107, 1),
(335, '322', 'sms campaign', 'SQL', 'V322__sms_campaign.sql', 1784285769, 'root', '2022-11-01 14:27:06', 4853, 1),
(336, '322.1', 'scheduled email campaign', 'SQL', 'V322_1__scheduled_email_campaign.sql', 993824162, 'root', '2022-11-01 14:27:12', 5627, 1),
(337, '322.2', 'email business rules', 'SQL', 'V322_2__email_business_rules.sql', -858032822, 'root', '2022-11-01 14:27:12', 1, 1),
(338, '323', 'spm replace dead fk with exisiting one', 'SQL', 'V323__spm_replace_dead_fk_with_exisiting_one.sql', 1830770944, 'root', '2022-11-01 14:27:13', 939, 1),
(339, '324', 'datatable checks', 'SQL', 'V324__datatable_checks.sql', -1746043830, 'root', '2022-11-01 14:27:14', 695, 1),
(340, '325', 'add is staff client data', 'SQL', 'V325__add_is_staff_client_data.sql', -2093166076, 'root', '2022-11-01 14:27:18', 3943, 1),
(341, '326', 'data migration for client tr gl entries', 'SQL', 'V326__data_migration_for_client_tr_gl_entries.sql', -80809096, 'root', '2022-11-01 14:27:18', 1, 1),
(342, '327', 'creditbureau configuration', 'SQL', 'V327__creditbureau_configuration.sql', -528645003, 'root', '2022-11-01 14:27:22', 4014, 1),
(343, '327.1', 'creditbureau integration', 'SQL', 'V327_1__creditbureau_integration.sql', -931851048, 'root', '2022-11-01 14:27:27', 3945, 1),
(344, '328', 'family members sql support', 'SQL', 'V328__family_members_sql_support.sql', 295593591, 'root', '2022-11-01 14:27:27', 796, 1),
(345, '329', 'sms messages without campaign', 'SQL', 'V329__sms_messages_without_campaign.sql', 731847220, 'root', '2022-11-01 14:27:29', 1038, 1),
(346, '330', 'savings account transaction releaseId', 'SQL', 'V330__savings_account_transaction_releaseId.sql', 1420154877, 'root', '2022-11-01 14:27:31', 2227, 1),
(347, '331', 'holiday schema changes', 'SQL', 'V331__holiday_schema_changes.sql', 789821545, 'root', '2022-11-01 14:27:32', 984, 1),
(348, '332', 'self service registration schema', 'SQL', 'V332__self_service_registration_schema.sql', 1475909001, 'root', '2022-11-01 14:27:33', 419, 1),
(349, '333', 'adhocquery', 'SQL', 'V333__adhocquery.sql', -753457584, 'root', '2022-11-01 14:27:34', 597, 1),
(350, '334', 'notification module tables', 'SQL', 'V334__notification_module_tables.sql', -1567885962, 'root', '2022-11-01 14:27:36', 2479, 1),
(351, '335', 'self service user role', 'SQL', 'V335__self_service_user_role.sql', -495779979, 'root', '2022-11-01 14:27:37', 0, 1),
(352, '336', 'sms campaign notification', 'SQL', 'V336__sms_campaign_notification.sql', 1600757867, 'root', '2022-11-01 14:27:40', 3459, 1),
(353, '337', 'equal amortization', 'SQL', 'V337__equal_amortization.sql', -2120972940, 'root', '2022-11-01 14:27:44', 3213, 1),
(354, '338', 'two factor authentication', 'SQL', 'V338__two_factor_authentication.sql', -122769206, 'root', '2022-11-01 14:27:45', 1037, 1),
(355, '339', 'report-run-frequency', 'SQL', 'V339__report-run-frequency.sql', 717187764, 'root', '2022-11-01 14:27:47', 2401, 1),
(356, '340', 'nullable-adhoc-email', 'SQL', 'V340__nullable-adhoc-email.sql', 470255029, 'root', '2022-11-01 14:27:49', 1077, 1),
(357, '341', 'm import document', 'SQL', 'V341__m_import_document.sql', 238493445, 'root', '2022-11-01 14:27:50', 521, 1),
(358, '342', 'topic module table', 'SQL', 'V342__topic_module_table.sql', 1818874128, 'root', '2022-11-01 14:27:51', 1100, 1),
(359, '343', 'scheduled email campaign status', 'SQL', 'V343__scheduled_email_campaign_status.sql', -1833476723, 'root', '2022-11-01 14:27:52', 941, 1),
(360, '344', 'parallelizing and paging recalculate interest for loans job', 'SQL', 'V344__parallelizing_and_paging_recalculate_interest_for_loans_job.sql', -995945751, 'root', '2022-11-01 14:27:53', 546, 1),
(361, '345', 'reports for self service user', 'SQL', 'V345__reports_for_self_service_user.sql', -1121649676, 'root', '2022-11-01 14:27:56', 2547, 1),
(362, '346', 'nullable saving product description', 'SQL', 'V346__nullable_saving_product_description.sql', 1914950317, 'root', '2022-11-01 14:27:57', 1239, 1),
(363, '347', 'correcting report category', 'SQL', 'V347__correcting_report_category.sql', 1347060894, 'root', '2022-11-01 14:27:57', 1, 1),
(364, '348', 'm trial balance table', 'SQL', 'V348__m_trial_balance_table.sql', 1399465771, 'root', '2022-11-01 14:28:00', 2757, 1),
(365, '349', 'client transfer details', 'SQL', 'V349__client_transfer_details.sql', 1053416594, 'root', '2022-11-01 14:28:04', 3764, 1),
(366, '350', 'email from', 'SQL', 'V350__email_from.sql', 1291409244, 'root', '2022-11-01 14:28:04', 1, 1),
(367, '351', 'pocket mapping', 'SQL', 'V351__pocket_mapping.sql', 1136734233, 'root', '2022-11-01 14:28:06', 1921, 1),
(368, '352', 'interop init', 'SQL', 'V352__interop_init.sql', -1081383089, 'root', '2022-11-01 14:28:07', 864, 1),
(369, '353', 'migrate passwords to ss 5', 'SQL', 'V353__migrate_passwords_to_ss_5.sql', -910092290, 'root', '2022-11-01 14:28:07', 1, 1),
(370, '354', 'self service user unique for client', 'SQL', 'V354__self_service_user_unique_for_client.sql', -1374909974, 'root', '2022-11-01 14:28:08', 580, 1),
(371, '355', 'rates', 'SQL', 'V355__rates.sql', -805980975, 'root', '2022-11-01 14:28:10', 1980, 1),
(372, '356', 'GSIM migration script', 'SQL', 'V356__GSIM_migration_script.sql', 2088314980, 'root', '2022-11-01 14:28:15', 4345, 1),
(373, '357', 'GLIM migration script', 'SQL', 'V357__GLIM_migration_script.sql', -576644125, 'root', '2022-11-01 14:28:20', 4922, 1),
(374, '358', 'fixed deposit rollover transfer', 'SQL', 'V358__fixed_deposit_rollover_transfer.sql', -1089070748, 'root', '2022-11-01 14:28:22', 1799, 1),
(375, '359', 'remove fied from address', 'SQL', 'V359__remove_fied_from_address.sql', -718515365, 'root', '2022-11-01 14:28:22', 0, 1),
(376, '360', 'conf loan payday on holiday', 'SQL', 'V360__conf_loan_payday_on_holiday.sql', 1360897967, 'root', '2022-11-01 14:28:22', 0, 1),
(377, '361', 'conf interest appropriations', 'SQL', 'V361__conf_interest_appropriations.sql', 463976465, 'root', '2022-11-01 14:28:22', 0, 1),
(378, '362', 'reschedule interest to lrs', 'SQL', 'V362__reschedule_interest_to_lrs.sql', 788461010, 'root', '2022-11-01 14:28:23', 787, 1),
(379, '363', 'mnote indexing for performance', 'SQL', 'V363__mnote_indexing_for_performance.sql', 829953313, 'root', '2022-11-01 14:28:24', 467, 1),
(380, '364', 'elastic hook template', 'SQL', 'V364__elastic_hook_template.sql', -96489753, 'root', '2022-11-01 14:28:24', 107, 1),
(381, '365', 'reportCategoryList-FINERACT-1306', 'SQL', 'V365__reportCategoryList-FINERACT-1306.sql', 601874777, 'root', '2022-11-01 14:28:24', 0, 1);

-- --------------------------------------------------------

--
-- Table structure for table `sms_campaign`
--

CREATE TABLE `sms_campaign` (
  `id` bigint(20) NOT NULL,
  `campaign_name` varchar(100) NOT NULL,
  `campaign_type` int(11) NOT NULL,
  `campaign_trigger_type` int(11) NOT NULL,
  `report_id` int(11) NOT NULL,
  `provider_id` bigint(20) DEFAULT NULL,
  `param_value` text,
  `status_enum` int(11) NOT NULL,
  `message` text NOT NULL,
  `submittedon_date` date DEFAULT NULL,
  `submittedon_userid` bigint(20) DEFAULT NULL,
  `approvedon_date` date DEFAULT NULL,
  `approvedon_userid` bigint(20) DEFAULT NULL,
  `closedon_date` date DEFAULT NULL,
  `closedon_userid` bigint(20) DEFAULT NULL,
  `recurrence` varchar(100) DEFAULT NULL,
  `next_trigger_date` datetime DEFAULT NULL,
  `last_trigger_date` datetime DEFAULT NULL,
  `recurrence_start_date` datetime DEFAULT NULL,
  `is_visible` tinyint(4) DEFAULT '1',
  `is_notification` tinyint(4) DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `sms_messages_outbound`
--

CREATE TABLE `sms_messages_outbound` (
  `id` bigint(20) NOT NULL,
  `group_id` bigint(20) DEFAULT NULL,
  `client_id` bigint(20) DEFAULT NULL,
  `staff_id` bigint(20) DEFAULT NULL,
  `status_enum` int(11) NOT NULL DEFAULT '100',
  `mobile_no` varchar(50) DEFAULT NULL,
  `message` varchar(1000) NOT NULL,
  `campaign_id` bigint(20) DEFAULT NULL,
  `external_id` varchar(100) DEFAULT NULL,
  `submittedon_date` date DEFAULT NULL,
  `delivered_on_date` datetime DEFAULT NULL,
  `is_notification` tinyint(4) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `stretchy_parameter`
--

CREATE TABLE `stretchy_parameter` (
  `id` int(11) NOT NULL,
  `parameter_name` varchar(45) NOT NULL,
  `parameter_variable` varchar(45) DEFAULT NULL,
  `parameter_label` varchar(45) NOT NULL,
  `parameter_displayType` varchar(45) NOT NULL,
  `parameter_FormatType` varchar(10) NOT NULL,
  `parameter_default` varchar(45) NOT NULL,
  `special` varchar(1) DEFAULT NULL,
  `selectOne` varchar(1) DEFAULT NULL,
  `selectAll` varchar(1) DEFAULT NULL,
  `parameter_sql` text,
  `parent_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `stretchy_parameter`
--

INSERT INTO `stretchy_parameter` (`id`, `parameter_name`, `parameter_variable`, `parameter_label`, `parameter_displayType`, `parameter_FormatType`, `parameter_default`, `special`, `selectOne`, `selectAll`, `parameter_sql`, `parent_id`) VALUES
(1, 'startDateSelect', 'startDate', 'startDate', 'date', 'date', 'today', NULL, NULL, NULL, NULL, NULL),
(2, 'endDateSelect', 'endDate', 'endDate', 'date', 'date', 'today', NULL, NULL, NULL, NULL, NULL),
(3, 'obligDateTypeSelect', 'obligDateType', 'obligDateType', 'select', 'number', '0', NULL, NULL, NULL, 'select * from\r\n(select 1 as id, \"Closed\" as `name` union all\r\nselect 2, \"Disbursal\" ) x\r\norder by x.`id`', NULL),
(5, 'OfficeIdSelectOne', 'officeId', 'Office', 'select', 'number', '0', NULL, 'Y', NULL, 'select id, \r\nconcat(substring(\"........................................\", 1, \r\n   \n\n((LENGTH(`hierarchy`) - LENGTH(REPLACE(`hierarchy`, \'.\', \'\')) - 1) * 4)), \r\n   `name`) as tc\r\nfrom m_office\r\nwhere hierarchy like concat\n\n(\'${currentUserHierarchy}\', \'%\')\r\norder by hierarchy', NULL),
(6, 'loanOfficerIdSelectAll', 'loanOfficerId', 'Loan Officer', 'select', 'number', '0', NULL, NULL, 'Y', '(select lo.id, lo.display_name as `Name` \r\nfrom m_office o \r\njoin m_office ounder on ounder.hierarchy like concat(o.hierarchy, \'%\')\r\njoin m_staff lo on lo.office_id = ounder.id\r\nwhere lo.is_loan_officer = true\r\nand o.id = ${officeId})\r\nunion all\r\n(select -10, \'-\')\r\norder by 2', 5),
(10, 'currencyIdSelectAll', 'currencyId', 'Currency', 'select', 'number', '0', NULL, NULL, 'Y', 'select `code`, `name`\r\nfrom m_organisation_currency\r\norder by `code`', NULL),
(20, 'fundIdSelectAll', 'fundId', 'Fund', 'select', 'number', '0', NULL, NULL, 'Y', '(select id, `name`\r\nfrom m_fund)\r\nunion all\r\n(select -10, \'-\')\r\norder by 2', NULL),
(25, 'loanProductIdSelectAll', 'loanProductId', 'Product', 'select', 'number', '0', NULL, NULL, 'Y', 'select p.id, p.`name`\r\nfrom m_product_loan p\r\nwhere (p.currency_code = \'${currencyId}\' or \'-1\'= \'${currencyId}\')\r\norder by 2', 10),
(26, 'loanPurposeIdSelectAll', 'loanPurposeId', 'Loan Purpose', 'select', 'number', '0', NULL, NULL, 'Y', 'select -10 as id, \'-\' as code_value\r\nunion all\r\nselect * from (select v.id, v.code_value\r\nfrom m_code c\r\njoin m_code_value v on v.code_id = c.id\r\nwhere c.code_name = \"loanPurpose\"\r\norder by v.order_position)  x', NULL),
(100, 'parTypeSelect', 'parType', 'parType', 'select', 'number', '0', NULL, NULL, NULL, 'select * from\r\n(select 1 as id, \"Principal Only\" as `name` union all\r\nselect 2, \"Principal + Interest\" union all\r\nselect 3, \"Principal + Interest + Fees\" union all\r\nselect 4, \"Principal + Interest + Fees + Penalties\") x\r\norder by x.`id`', NULL),
(1001, 'FullReportList', NULL, 'n/a', 'n/a', 'n/a', 'n/a', 'Y', NULL, NULL, 'select  r.id as report_id, r.report_name, r.report_type, r.report_subtype, r.report_category,\nrp.id as parameter_id, rp.report_parameter_name, p.parameter_name\n  from stretchy_report r\n  left join stretchy_report_parameter rp on rp.report_id = r.id \n  left join stretchy_parameter p on p.id = rp.parameter_id\n  where r.use_report is true and r.self_service_user_report = \'${isSelfServiceUser}\'\n  and exists\n  ( select \'f\'\n  from m_appuser_role ur \n  join m_role r on r.id = ur.role_id\n  join m_role_permission rp on rp.role_id = r.id\n  join m_permission p on p.id = rp.permission_id\n  where ur.appuser_id = ${currentUserId}\n  and (p.code in (\'ALL_FUNCTIONS_READ\', \'ALL_FUNCTIONS\') or p.code = concat(\"READ_\", r.report_name)) )\n  order by r.report_category, r.report_name, rp.id', NULL),
(1002, 'FullParameterList', NULL, 'n/a', 'n/a', 'n/a', 'n/a', 'Y', NULL, NULL, 'select sp.parameter_name, sp.parameter_variable, sp.parameter_label, sp.parameter_displayType, \r sp.parameter_FormatType, sp.parameter_default, sp.selectOne,  sp.selectAll, spp.parameter_name as parentParameterName\r from stretchy_parameter sp\r left join stretchy_parameter spp on spp.id = sp.parent_id\r where sp.special is null\r and exists \r   (select \'f\' \r  from stretchy_report sr\r   join stretchy_report_parameter srp on srp.report_id = sr.id   and sr.self_service_user_report = \'${isSelfServiceUser}\'\r   where sr.report_name in(${reportListing})\r   and srp.parameter_id = sp.id\r  )\r order by sp.id', NULL),
(1003, 'reportCategoryList', NULL, 'n/a', 'n/a', 'n/a', 'n/a', 'Y', NULL, NULL, 'select  r.id as report_id, r.report_name, r.report_type, r.report_subtype, r.report_category,\n  rp.id as parameter_id, rp.report_parameter_name, p.parameter_name\n  from stretchy_report r\n  left join stretchy_report_parameter rp on rp.report_id = r.id\n  left join stretchy_parameter p on p.id = rp.parameter_id\n  where r.report_category = \'${reportCategory}\'\n  and r.use_report is true and r.self_service_user_report = \'${isSelfServiceUser}\'  \n  and exists\n  (select \'f\'\n  from m_appuser_role ur \n  join m_role r on r.id = ur.role_id\n  join m_role_permission rp on rp.role_id = r.id\n  join m_permission p on p.id = rp.permission_id\n  where ur.appuser_id = ${currentUserId}\n  and (p.code in (\'ALL_FUNCTIONS_READ\', \'ALL_FUNCTIONS\') or p.code = concat(\"READ_\", r.report_name)) )\n  order by r.report_category, r.report_name, rp.id', NULL),
(1004, 'selectAccount', 'accountNo', 'Enter Account No', 'text', 'string', 'n/a', NULL, NULL, NULL, NULL, NULL),
(1005, 'savingsProductIdSelectAll', 'savingsProductId', 'Product', 'select', 'number', '0', NULL, NULL, 'Y', 'select p.id, p.`name`\r\nfrom m_savings_product p\r\norder by 2', NULL),
(1006, 'transactionId', 'transactionId', 'transactionId', 'text', 'string', 'n/a', NULL, NULL, NULL, NULL, NULL),
(1007, 'selectCenterId', 'centerId', 'Enter Center Id', 'text', 'string', 'n/a', NULL, NULL, NULL, NULL, NULL),
(1008, 'SelectGLAccountNO', 'GLAccountNO', 'GLAccountNO', 'select', 'number', '0', NULL, NULL, NULL, 'select id aid,name aname\r\nfrom acc_gl_account', NULL),
(1009, 'asOnDate', 'asOn', 'As On', 'date', 'date', 'today', NULL, NULL, NULL, NULL, NULL),
(1010, 'SavingsAccountSubStatus', 'subStatus', 'SavingsAccountDormancyStatus', 'select', 'number', '100', NULL, NULL, NULL, 'select * from\r\n(select 100 as id, \"Inactive\" as name  union all\r\nselect 200 as id, \"Dormant\" as  name union all \r\nselect 300 as id, \"Escheat\" as name) x\r\norder by x.`id`', NULL),
(1011, 'cycleXSelect', 'cycleX', 'Cycle X Number', 'text', 'number', 'n/a', NULL, NULL, NULL, NULL, NULL),
(1012, 'cycleYSelect', 'cycleY', 'Cycle Y Number', 'text', 'number', 'n/a', NULL, NULL, NULL, NULL, NULL),
(1013, 'fromXSelect', 'fromX', 'From X Number', 'text', 'number', 'n/a', NULL, NULL, NULL, NULL, NULL),
(1014, 'toYSelect', 'toY', 'To Y Number', 'text', 'number', 'n/a', NULL, NULL, NULL, NULL, NULL),
(1015, 'overdueXSelect', 'overdueX', 'Overdue X Number', 'text', 'number', 'n/a', NULL, NULL, NULL, NULL, NULL),
(1016, 'overdueYSelect', 'overdueY', 'Overdue Y Number', 'text', 'number', 'n/a', NULL, NULL, NULL, NULL, NULL),
(1017, 'DefaultLoan', 'loanId', 'Loan', 'none', 'number', '-1', NULL, NULL, 'Y', 'select ml.id \nfrom m_loan ml \nleft join m_client mc on mc.id = ml.client_id \nleft join m_office mo on mo.id = mc.office_id \nwhere mo.id = ${officeId} or ${officeId} = -1', 5),
(1018, 'DefaultClient', 'clientId', 'Client', 'none', 'number', '-1', NULL, NULL, 'Y', 'select mc.id \nfrom m_client mc\n left join m_office on mc.office_id = mo.id\n where mo.id = ${officeId} or ${officeId} = -1', 5),
(1019, 'DefaultGroup', 'groupId', 'Group', 'none', 'number', '-1', NULL, NULL, 'Y', 'select mg.id \nfrom m_group mg\nleft join m_office mo on mg.office_id = mo.id\nwhere mo.id = ${officeId} or ${officeId} = -1', 5),
(1020, 'SelectLoanType', 'loanType', 'Loan Type', 'select', 'number', '-1', NULL, NULL, 'Y', 'select\nenum_id as id,\nenum_value as value\nfrom r_enum_value\nwhere enum_name = \'loan_type_enum\'', NULL),
(1021, 'DefaultSavings', 'savingsId', 'Savings', 'none', 'number', '-1', NULL, NULL, 'Y', NULL, 5),
(1022, 'DefaultSavingsTransactionId', 'savingsTransactionId', 'Savings Transaction', 'none', 'number', '-1', NULL, NULL, 'Y', NULL, 5);

-- --------------------------------------------------------

--
-- Table structure for table `stretchy_report`
--

CREATE TABLE `stretchy_report` (
  `id` int(11) NOT NULL,
  `report_name` varchar(100) NOT NULL,
  `report_type` varchar(20) NOT NULL,
  `report_subtype` varchar(20) DEFAULT NULL,
  `report_category` varchar(45) DEFAULT NULL,
  `report_sql` text,
  `description` text,
  `core_report` tinyint(4) DEFAULT '0',
  `use_report` tinyint(4) DEFAULT '0',
  `self_service_user_report` tinyint(4) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `stretchy_report`
--

INSERT INTO `stretchy_report` (`id`, `report_name`, `report_type`, `report_subtype`, `report_category`, `report_sql`, `description`, `core_report`, `use_report`, `self_service_user_report`) VALUES
(1, 'Client Listing', 'Table', NULL, 'Client', 'select\nconcat(repeat(\"..\",\n   ((LENGTH(ounder.`hierarchy`) - LENGTH(REPLACE(ounder.`hierarchy`, \'.\', \'\')) - 1))), ounder.`name`) as \"Office/Branch\",\n c.account_no as \"Client Account No.\",\nc.display_name as \"Name\",\nr.enum_message_property as \"Status\",\nc.activation_date as \"Activation\", c.external_id as \"External Id\"\nfrom m_office o\njoin m_office ounder on ounder.hierarchy like concat(o.hierarchy, \'%\')\nand ounder.hierarchy like concat(\'${currentUserHierarchy}\', \'%\')\njoin m_client c on c.office_id = ounder.id\nleft join r_enum_value r on r.enum_name = \'status_enum\' and r.enum_id = c.status_enum\nwhere o.id = ${officeId}\norder by ounder.hierarchy, c.account_no', 'Individual Client Report\r\n\r\nLists the small number of defined fields on the client table.  Would expect to copy this \n\nreport and add any \'one to one\' additional data for specific tenant needs.\r\n\r\nCan be run for any size MFI but you\'d expect it only to be run within a branch for \n\nlarger ones.  Depending on how many columns are displayed, there is probably is a limit of about 20/50k clients returned for html display (export to excel doesn\'t \n\nhave that client browser/memory impact).', 1, 1, 0),
(2, 'Client Loans Listing', 'Table', NULL, 'Client', 'select\nconcat(repeat(\"..\",\n   ((LENGTH(ounder.`hierarchy`) - LENGTH(REPLACE(ounder.`hierarchy`, \'.\', \'\')) - 1))), ounder.`name`) as \"Office/Branch\", c.account_no as \"Client Account No.\",\nc.display_name as \"Name\",\nr.enum_message_property as \"Client Status\",\nlo.display_name as \"Loan Officer\", l.account_no as \"Loan Account No.\", l.external_id as \"External Id\", p.name as Loan, st.enum_message_property as \"Status\",\nf.`name` as Fund, purp.code_value as \"Loan Purpose\",\nifnull(cur.display_symbol, l.currency_code) as Currency,\nl.principal_amount, l.arrearstolerance_amount as \"Arrears Tolerance Amount\",\nl.number_of_repayments as \"Expected No. Repayments\",\nl.annual_nominal_interest_rate as \" Annual Nominal Interest Rate\",\nl.nominal_interest_rate_per_period as \"Nominal Interest Rate Per Period\",\nipf.enum_message_property as \"Interest Rate Frequency\",\nim.enum_message_property as \"Interest Method\",\nicp.enum_message_property as \"Interest Calculated in Period\",\nl.term_frequency as \"Term Frequency\",\ntf.enum_message_property as \"Term Frequency Period\",\nl.repay_every as \"Repayment Frequency\",\nrf.enum_message_property as \"Repayment Frequency Period\",\nam.enum_message_property as \"Amortization\",\nl.total_charges_due_at_disbursement_derived as \"Total Charges Due At Disbursement\",\ndate(l.submittedon_date) as Submitted, date(l.approvedon_date) Approved, l.expected_disbursedon_date As \"Expected Disbursal\",\ndate(l.expected_firstrepaymenton_date) as \"Expected First Repayment\",\ndate(l.interest_calculated_from_date) as \"Interest Calculated From\" ,\ndate(l.disbursedon_date) as Disbursed,\ndate(l.expected_maturedon_date) \"Expected Maturity\",\ndate(l.maturedon_date) as \"Matured On\", date(l.closedon_date) as Closed,\ndate(l.rejectedon_date) as Rejected, date(l.rescheduledon_date) as Rescheduled,\ndate(l.withdrawnon_date) as Withdrawn, date(l.writtenoffon_date) \"Written Off\"\nfrom m_office o\njoin m_office ounder on ounder.hierarchy like concat(o.hierarchy, \'%\')\nand ounder.hierarchy like concat(\'${currentUserHierarchy}\', \'%\')\njoin m_client c on c.office_id = ounder.id\nleft join r_enum_value r on r.enum_name = \'status_enum\'\n and r.enum_id = c.status_enum\nleft join m_loan l on l.client_id = c.id\nleft join m_staff lo on lo.id = l.loan_officer_id\nleft join m_product_loan p on p.id = l.product_id\nleft join m_fund f on f.id = l.fund_id\nleft join r_enum_value st on st.enum_name = \"loan_status_id\" and st.enum_id = l.loan_status_id\nleft join r_enum_value ipf on ipf.enum_name = \"interest_period_frequency_enum\"\n and ipf.enum_id = l.interest_period_frequency_enum\nleft join r_enum_value im on im.enum_name = \"interest_method_enum\"\n and im.enum_id = l.interest_method_enum\nleft join r_enum_value tf on tf.enum_name = \"term_period_frequency_enum\"\n and tf.enum_id = l.term_period_frequency_enum\nleft join r_enum_value icp on icp.enum_name = \"interest_calculated_in_period_enum\"\n and icp.enum_id = l.interest_calculated_in_period_enum\nleft join r_enum_value rf on rf.enum_name = \"repayment_period_frequency_enum\"\n and rf.enum_id = l.repayment_period_frequency_enum\nleft join r_enum_value am on am.enum_name = \"amortization_method_enum\"\n and am.enum_id = l.amortization_method_enum\nleft join m_code_value purp on purp.id = l.loanpurpose_cv_id\nleft join m_currency cur on cur.code = l.currency_code\nwhere o.id = ${officeId}\nand (l.currency_code = \"${currencyId}\" or \"-1\" = \"${currencyId}\")\nand (l.product_id = \"${loanProductId}\" or \"-1\" = \"${loanProductId}\")\nand (ifnull(l.loan_officer_id, -10) = \"${loanOfficerId}\" or \"-1\" = \"${loanOfficerId}\")\nand (ifnull(l.fund_id, -10) = ${fundId} or -1 = ${fundId})\nand (ifnull(l.loanpurpose_cv_id, -10) = ${loanPurposeId} or -1 = ${loanPurposeId})\norder by ounder.hierarchy, 2 , l.id', 'Individual Client Report\r\n\r\nPretty \n\nwide report that lists the basic details of client loans.  \r\n\r\nCan be run for any size MFI but you\'d expect it only to be run within a branch for larger ones.  \n\nThere is probably is a limit of about 20/50k clients returned for html display (export to excel doesn\'t have that client browser/memory impact).', 1, 1, 0),
(5, 'Loans Awaiting Disbursal', 'Table', NULL, 'Loan', 'SELECT \r\nconcat(repeat(\"..\",   \r\n   ((LENGTH(ounder.`hierarchy`) - LENGTH(REPLACE(ounder.`hierarchy`, \'.\', \'\')) - 1))), ounder.`name`) as \"Office/Branch\",\r\nc.account_no as \"Client Account No\", c.display_name as \"Name\", l.account_no as \"Loan Account No.\", pl.`name` as \"Product\", \r\nf.`name` as Fund, ifnull(cur.display_symbol, l.currency_code) as Currency,  \r\nl.principal_amount as Principal,  \r\nl.term_frequency as \"Term Frequency\",\n\n\r\ntf.enum_message_property as \"Term Frequency Period\",\r\nl.annual_nominal_interest_rate as \" Annual Nominal Interest Rate\",\r\ndate(l.approvedon_date) \"Approved\",\r\ndatediff(l.expected_disbursedon_date, curdate()) as \"Days to Disbursal\",\r\ndate(l.expected_disbursedon_date) \"Expected Disbursal\",\r\npurp.code_value as \"Loan Purpose\",\r\n lo.display_name as \"Loan Officer\"\r\nfrom m_office o \r\njoin m_office ounder on ounder.hierarchy like concat(o.hierarchy, \'%\')\r\nand ounder.hierarchy like concat(\'${currentUserHierarchy}\', \'%\')\r\njoin m_client c on c.office_id = ounder.id\r\njoin m_loan l on l.client_id = c.id\r\njoin m_product_loan pl on pl.id = l.product_id\r\nleft join m_staff lo on lo.id = l.loan_officer_id\r\nleft join m_currency cur on cur.code = l.currency_code\r\nleft join m_fund f on f.id = l.fund_id\r\nleft join m_code_value purp on purp.id = l.loanpurpose_cv_id\r\nleft join r_enum_value tf on tf.enum_name = \"term_period_frequency_enum\" and tf.enum_id = l.term_period_frequency_enum\r\nwhere o.id = ${officeId}\r\nand (l.currency_code = \"${currencyId}\" or \"-1\" = \"${currencyId}\")\r\nand (l.product_id = \"${loanProductId}\" or \"-1\" = \"${loanProductId}\")\r\nand (ifnull(l.loan_officer_id, -10) = \"${loanOfficerId}\" or \"-1\" = \"${loanOfficerId}\")\r\nand (ifnull(l.fund_id, -10) = ${fundId} or -1 = ${fundId})\r\nand (ifnull(l.loanpurpose_cv_id, -10) = ${loanPurposeId} or -1 = ${loanPurposeId})\r\nand l.loan_status_id = 200\r\norder by ounder.hierarchy, datediff(l.expected_disbursedon_date, curdate()),  c.account_no', 'Individual Client Report', 1, 1, 0),
(6, 'Loans Awaiting Disbursal Summary', 'Table', NULL, 'Loan', 'SELECT \r\nconcat(repeat(\"..\",   \r\n   ((LENGTH(ounder.`hierarchy`) - LENGTH(REPLACE(ounder.`hierarchy`, \'.\', \'\')) - 1))), ounder.`name`) as \"Office/Branch\",\r\npl.`name` as \"Product\", \r\nifnull(cur.display_symbol, l.currency_code) as Currency,  f.`name` as Fund,\r\nsum(l.principal_amount) as Principal\r\nfrom m_office o \r\njoin m_office ounder on ounder.hierarchy like concat(o.hierarchy, \'%\')\r\nand ounder.hierarchy like concat(\'${currentUserHierarchy}\', \'%\')\r\njoin m_client c on c.office_id = ounder.id\r\njoin m_loan l on l.client_id = c.id\r\njoin m_product_loan pl on pl.id = l.product_id\r\nleft join m_staff lo on lo.id = l.loan_officer_id\r\nleft join m_currency cur on cur.code = l.currency_code\r\nleft join m_fund f on f.id = l.fund_id\r\nleft join m_code_value purp on purp.id = l.loanpurpose_cv_id\r\nwhere o.id = ${officeId}\r\nand (l.currency_code = \"${currencyId}\" or \"-1\" = \"${currencyId}\")\r\nand (l.product_id = \"${loanProductId}\" or \"-1\" = \"${loanProductId}\")\r\nand (ifnull(l.loan_officer_id, -10) = \"${loanOfficerId}\" or \"-1\" = \"${loanOfficerId}\")\r\nand (ifnull(l.fund_id, -10) = ${fundId} or -1 = ${fundId})\r\nand (ifnull(l.loanpurpose_cv_id, -10) = ${loanPurposeId} or -1 = ${loanPurposeId})\r\nand l.loan_status_id = 200\r\ngroup by ounder.hierarchy, pl.`name`, l.currency_code,  f.`name`\r\norder by ounder.hierarchy, pl.`name`, l.currency_code,  f.`name`', 'Individual Client Report', 1, 1, 0),
(7, 'Loans Awaiting Disbursal Summary by Month', 'Table', NULL, 'Loan', 'SELECT \r\nconcat(repeat(\"..\",   ((LENGTH(ounder.`hierarchy`) - LENGTH(REPLACE(ounder.`hierarchy`, \'.\', \'\')) - 1))), ounder.`name`) as \"Office/Branch\",\r\npl.`name` as \"Product\", \r\nifnull(cur.display_symbol, l.currency_code) as Currency,  \r\nyear(l.expected_disbursedon_date) as \"Year\", \r\nmonthname(l.expected_disbursedon_date) as \"Month\",\r\nsum(l.principal_amount) as Principal\r\nfrom m_office o \r\njoin m_office ounder on ounder.hierarchy like concat(o.hierarchy, \'%\')\r\nand ounder.hierarchy like concat(\'${currentUserHierarchy}\', \'%\')\r\njoin m_client c on c.office_id = ounder.id\r\njoin m_loan l on l.client_id = c.id\r\njoin m_product_loan pl on pl.id = l.product_id\r\nleft join m_staff lo on lo.id = l.loan_officer_id\r\nleft join m_currency cur on cur.code = l.currency_code\r\nleft join m_fund f on f.id = l.fund_id\r\nleft join m_code_value purp on purp.id = l.loanpurpose_cv_id\r\nwhere o.id = ${officeId}\r\nand (l.currency_code = \"${currencyId}\" or \"-1\" = \"${currencyId}\")\r\nand (l.product_id = \"${loanProductId}\" or \"-1\" = \"${loanProductId}\")\r\nand (ifnull(l.loan_officer_id, -10) = \"${loanOfficerId}\" or \"-1\" = \"${loanOfficerId}\")\r\nand (ifnull(l.fund_id, -10) = ${fundId} or -1 = ${fundId})\r\nand (ifnull(l.loanpurpose_cv_id, -10) = ${loanPurposeId} or -1 = ${loanPurposeId})\r\nand l.loan_status_id = 200\r\ngroup by ounder.hierarchy, pl.`name`, l.currency_code, year(l.expected_disbursedon_date), month(l.expected_disbursedon_date)\r\norder by ounder.hierarchy, pl.`name`, l.currency_code, year(l.expected_disbursedon_date), month(l.expected_disbursedon_date)', 'Individual Client Report', 1, 1, 0),
(8, 'Loans Pending Approval', 'Table', NULL, 'Loan', 'SELECT \r\nconcat(repeat(\"..\",   \r\n   ((LENGTH(ounder.`hierarchy`) - LENGTH(REPLACE(ounder.`hierarchy`, \'.\', \'\')) - 1))), ounder.`name`) as \"Office/Branch\",\r\nc.account_no as \"Client Account No.\", c.display_name as \"Client Name\", \r\nifnull(cur.display_symbol, l.currency_code) as Currency,  pl.`name` as \"Product\", \r\nl.account_no as \"Loan Account No.\", \r\nl.principal_amount as \"Loan Amount\", \r\nl.term_frequency as \"Term Frequency\",\n\n\r\ntf.enum_message_property as \"Term Frequency Period\",\r\nl.annual_nominal_interest_rate as \" Annual \n\nNominal Interest Rate\", \r\ndatediff(curdate(), l.submittedon_date) \"Days Pending Approval\", \r\npurp.code_value as \"Loan Purpose\",\r\nlo.display_name as \"Loan Officer\"\r\nfrom m_office o \r\njoin m_office ounder on ounder.hierarchy like concat(o.hierarchy, \'%\')\r\nand ounder.hierarchy like concat(\'${currentUserHierarchy}\', \'%\')\r\njoin m_client c on c.office_id = ounder.id\r\njoin m_loan l on l.client_id = c.id\r\njoin m_product_loan pl on pl.id = l.product_id\r\nleft join m_staff lo on lo.id = l.loan_officer_id\r\nleft join m_currency cur on cur.code = l.currency_code\r\nleft join m_code_value purp on purp.id = l.loanpurpose_cv_id\r\nleft join r_enum_value tf on tf.enum_name = \"term_period_frequency_enum\" and tf.enum_id = l.term_period_frequency_enum\r\nwhere o.id = ${officeId}\r\nand (l.currency_code = \"${currencyId}\" or \"-1\" = \"${currencyId}\")\r\nand (l.product_id = \"${loanProductId}\" or \"-1\" = \"${loanProductId}\")\r\nand (ifnull(l.loan_officer_id, -10) = \"${loanOfficerId}\" or \"-1\" = \"${loanOfficerId}\")\r\nand (ifnull(l.loanpurpose_cv_id, -10) = ${loanPurposeId} or -1 = ${loanPurposeId})\r\nand l.loan_status_id = 100 /*Submitted and awaiting approval */\r\norder by ounder.hierarchy, l.submittedon_date,  l.account_no', 'Individual Client Report', 1, 1, 0),
(11, 'Active Loans - Summary', 'Table', NULL, 'Loan', 'select concat(repeat(\"..\",   \r\n   ((LENGTH(mo.`hierarchy`) - LENGTH(REPLACE(mo.`hierarchy`, \'.\', \'\')) - 1))), mo.`name`) as \"Office/Branch\", x.currency as Currency,\r\n x.client_count as \"No. of Clients\", x.active_loan_count as \"No. Active Loans\", x. loans_in_arrears_count as \"No. of Loans in Arrears\",\r\nx.principal as \"Total Loans Disbursed\", x.principal_repaid as \"Principal Repaid\", x.principal_outstanding as \"Principal Outstanding\", x.principal_overdue as \"Principal Overdue\",\r\nx.interest as \"Total Interest\", x.interest_repaid as \"Interest Repaid\", x.interest_outstanding as \"Interest Outstanding\", x.interest_overdue as \"Interest Overdue\",\r\nx.fees as \"Total Fees\", x.fees_repaid as \"Fees Repaid\", x.fees_outstanding as \"Fees Outstanding\", x.fees_overdue as \"Fees Overdue\",\r\nx.penalties as \"Total Penalties\", x.penalties_repaid as \"Penalties Repaid\", x.penalties_outstanding as \"Penalties Outstanding\", x.penalties_overdue as \"Penalties Overdue\",\r\n\r\n	(case\r\n	when ${parType} = 1 then\r\n    cast(round((x.principal_overdue * 100) / x.principal_outstanding, 2) as char)\r\n	when ${parType} = 2 then\r\n    cast(round(((x.principal_overdue + x.interest_overdue) * 100) / (x.principal_outstanding + x.interest_outstanding), 2) as char)\r\n	when ${parType} = 3 then\r\n    cast(round(((x.principal_overdue + x.interest_overdue + x.fees_overdue) * 100) / (x.principal_outstanding + x.interest_outstanding + x.fees_outstanding), 2) as char)\r\n	when ${parType} = 4 then\r\n    cast(round(((x.principal_overdue + x.interest_overdue + x.fees_overdue + x.penalties_overdue) * 100) / (x.principal_outstanding + x.interest_outstanding + x.fees_outstanding + x.penalties_overdue), 2) as char)\r\n	else \"invalid PAR Type\"\r\n	end) as \"Portfolio at Risk %\"\r\n from m_office mo\r\njoin \r\n(select ounder.id as branch,\r\nifnull(cur.display_symbol, l.currency_code) as currency,\r\ncount(distinct(c.id)) as client_count, \r\ncount(distinct(l.id)) as  active_loan_count,\r\ncount(distinct(if(laa.loan_id is not null,  l.id, null)  )) as loans_in_arrears_count,\r\n\r\nsum(l.principal_disbursed_derived) as principal,\r\nsum(l.principal_repaid_derived) as principal_repaid,\r\nsum(l.principal_outstanding_derived) as principal_outstanding,\r\nsum(laa.principal_overdue_derived) as principal_overdue,\r\n\r\nsum(l.interest_charged_derived) as interest,\r\nsum(l.interest_repaid_derived) as interest_repaid,\r\nsum(l.interest_outstanding_derived) as interest_outstanding,\r\nsum(laa.interest_overdue_derived) as interest_overdue,\r\n\r\nsum(l.fee_charges_charged_derived) as fees,\r\nsum(l.fee_charges_repaid_derived) as fees_repaid,\r\nsum(l.fee_charges_outstanding_derived)  as fees_outstanding,\r\nsum(laa.fee_charges_overdue_derived) as fees_overdue,\r\n\r\nsum(l.penalty_charges_charged_derived) as penalties,\r\nsum(l.penalty_charges_repaid_derived) as penalties_repaid,\r\nsum(l.penalty_charges_outstanding_derived) as penalties_outstanding,\r\nsum(laa.penalty_charges_overdue_derived) as penalties_overdue\r\n\r\nfrom m_office o \r\njoin m_office ounder on ounder.hierarchy like concat(o.hierarchy, \'%\')\r\nand ounder.hierarchy like concat(\'${currentUserHierarchy}\', \'%\')\r\njoin m_client c on c.office_id = ounder.id\r\njoin m_loan l on l.client_id = c.id\r\nleft join m_loan_arrears_aging laa on laa.loan_id = l.id\r\nleft join m_currency cur on cur.code = l.currency_code\r\n\r\nwhere o.id = ${officeId}\r\nand (l.currency_code = \"${currencyId}\" or \"-1\" = \"${currencyId}\")\r\nand (l.product_id = \"${loanProductId}\" or \"-1\" = \"${loanProductId}\")\r\nand (ifnull(l.loan_officer_id, -10) = \"${loanOfficerId}\" or \"-1\" = \"${loanOfficerId}\")\r\nand (ifnull(l.fund_id, -10) = ${fundId} or -1 = ${fundId})\r\nand (ifnull(l.loanpurpose_cv_id, -10) = ${loanPurposeId} or -1 = ${loanPurposeId})\r\nand l.loan_status_id = 300\r\ngroup by ounder.id, l.currency_code) x on x.branch = mo.id\r\norder by mo.hierarchy, x.Currency', NULL, 1, 1, 0),
(12, 'Active Loans - Details', 'Table', NULL, 'Loan', 'select concat(repeat(\"..\",   \r\n   ((LENGTH(ounder.`hierarchy`) - LENGTH(REPLACE(ounder.`hierarchy`, \'.\', \'\')) - 1))), ounder.`name`) as \"Office/Branch\",\r\nifnull(cur.display_symbol, l.currency_code) as Currency,\r\nlo.display_name as \"Loan Officer\", \r\nc.display_name as \"Client\", l.account_no as \"Loan Account No.\", pl.`name` as \"Product\", \r\nf.`name` as Fund,  \r\nl.principal_amount as \"Loan Amount\", \r\nl.annual_nominal_interest_rate as \" Annual Nominal Interest Rate\", \r\ndate(l.disbursedon_date) as \"Disbursed Date\", \r\ndate(l.expected_maturedon_date) as \"Expected Matured On\",\r\n\r\nl.principal_repaid_derived as \"Principal Repaid\",\r\nl.principal_outstanding_derived as \"Principal Outstanding\",\r\nlaa.principal_overdue_derived as \"Principal Overdue\",\r\n\r\nl.interest_repaid_derived as \"Interest Repaid\",\r\nl.interest_outstanding_derived as \"Interest Outstanding\",\r\nlaa.interest_overdue_derived as \"Interest Overdue\",\r\n\r\nl.fee_charges_repaid_derived as \"Fees Repaid\",\r\nl.fee_charges_outstanding_derived  as \"Fees Outstanding\",\r\nlaa.fee_charges_overdue_derived as \"Fees Overdue\",\r\n\r\nl.penalty_charges_repaid_derived as \"Penalties Repaid\",\r\nl.penalty_charges_outstanding_derived as \"Penalties Outstanding\",\r\npenalty_charges_overdue_derived as \"Penalties Overdue\"\r\n\r\nfrom m_office o \r\njoin m_office ounder on ounder.hierarchy like concat(o.hierarchy, \'%\')\r\nand ounder.hierarchy like concat(\'${currentUserHierarchy}\', \'%\')\r\njoin m_client c on c.office_id = ounder.id\r\njoin m_loan l on l.client_id = c.id\r\njoin m_product_loan pl on pl.id = l.product_id\r\nleft join m_staff lo on lo.id = l.loan_officer_id\r\nleft join m_currency cur on cur.code = l.currency_code\r\nleft join m_fund f on f.id = l.fund_id\r\nleft join m_loan_arrears_aging laa on laa.loan_id = l.id\r\nwhere o.id = ${officeId}\r\nand (l.currency_code = \"${currencyId}\" or \"-1\" = \"${currencyId}\")\r\nand (l.product_id = \"${loanProductId}\" or \"-1\" = \"${loanProductId}\")\r\nand (ifnull(l.loan_officer_id, -10) = \"${loanOfficerId}\" or \"-1\" = \"${loanOfficerId}\")\r\nand (ifnull(l.fund_id, -10) = ${fundId} or -1 = ${fundId})\r\nand (ifnull(l.loanpurpose_cv_id, -10) = ${loanPurposeId} or -1 = ${loanPurposeId})\r\nand l.loan_status_id = 300\r\ngroup by l.id\r\norder by ounder.hierarchy, l.currency_code, c.account_no, l.account_no', 'Individual Client \n\nReport', 1, 1, 0),
(13, 'Obligation Met Loans Details', 'Table', NULL, 'Loan', 'select concat(repeat(\"..\",   \r\n   ((LENGTH(ounder.`hierarchy`) - LENGTH(REPLACE(ounder.`hierarchy`, \'.\', \'\')) - 1))), ounder.`name`) as \"Office/Branch\",\r\nifnull(cur.display_symbol, l.currency_code) as Currency,\r\nc.account_no as \"Client Account No.\", c.display_name as \"Client\",\r\nl.account_no as \"Loan Account No.\", pl.`name` as \"Product\", \r\nf.`name` as Fund,  \r\nl.principal_amount as \"Loan Amount\", \r\nl.total_repayment_derived  as \"Total Repaid\", \r\nl.annual_nominal_interest_rate as \" Annual Nominal Interest Rate\", \r\ndate(l.disbursedon_date) as \"Disbursed\", \r\ndate(l.closedon_date) as \"Closed\",\r\n\r\nl.principal_repaid_derived as \"Principal Repaid\",\r\nl.interest_repaid_derived as \"Interest Repaid\",\r\nl.fee_charges_repaid_derived as \"Fees Repaid\",\r\nl.penalty_charges_repaid_derived as \"Penalties Repaid\",\r\nlo.display_name as \"Loan Officer\"\r\n\r\nfrom m_office o \r\njoin m_office ounder on ounder.hierarchy like concat(o.hierarchy, \'%\')\r\nand ounder.hierarchy like concat(\'${currentUserHierarchy}\', \'%\')\r\njoin m_client c on c.office_id = ounder.id\r\njoin m_loan l on l.client_id = c.id\r\njoin m_product_loan pl on pl.id = l.product_id\r\nleft join m_staff lo on lo.id = l.loan_officer_id\r\nleft join m_currency cur on cur.code = l.currency_code\r\nleft join m_fund f on f.id = l.fund_id\r\nwhere o.id = ${officeId}\r\nand (l.currency_code = \"${currencyId}\" or \"-1\" = \"${currencyId}\")\r\nand (l.product_id = \"${loanProductId}\" or \"-1\" = \"${loanProductId}\")\r\nand (ifnull(l.loan_officer_id, -10) = \"${loanOfficerId}\" or \"-1\" = \"${loanOfficerId}\")\r\nand (ifnull(l.fund_id, -10) = ${fundId} or -1 = ${fundId})\r\nand (ifnull(l.loanpurpose_cv_id, -10) = ${loanPurposeId} or -1 = ${loanPurposeId})\r\nand (case\r\n	when ${obligDateType} = 1 then\r\n    l.closedon_date between \'${startDate}\' and \'${endDate}\'\r\n	when ${obligDateType} = 2 then\r\n    l.disbursedon_date between \'${startDate}\' and \'${endDate}\'\r\n	else 1 = 1\r\n	end)\r\nand l.loan_status_id = 600\r\ngroup by l.id\r\norder by ounder.hierarchy, l.currency_code, c.account_no, l.account_no', 'Individual Client \n\nReport', 1, 1, 0),
(14, 'Obligation Met Loans Summary', 'Table', NULL, 'Loan', 'select concat(repeat(\"..\",   \r\n   ((LENGTH(ounder.`hierarchy`) - LENGTH(REPLACE(ounder.`hierarchy`, \'.\', \'\')) - 1))), ounder.`name`) as \"Office/Branch\",\r\nifnull(cur.display_symbol, l.currency_code) as Currency,\r\ncount(distinct(c.id)) as \"No. of Clients\",\r\ncount(distinct(l.id)) as \"No. of Loans\",\r\nsum(l.principal_amount) as \"Total Loan Amount\", \r\nsum(l.principal_repaid_derived) as \"Total Principal Repaid\",\r\nsum(l.interest_repaid_derived) as \"Total Interest Repaid\",\r\nsum(l.fee_charges_repaid_derived) as \"Total Fees Repaid\",\r\nsum(l.penalty_charges_repaid_derived) as \"Total Penalties Repaid\",\r\nsum(l.interest_waived_derived) as \"Total Interest Waived\",\r\nsum(l.fee_charges_waived_derived) as \"Total Fees Waived\",\r\nsum(l.penalty_charges_waived_derived) as \"Total Penalties Waived\"\r\n\r\nfrom m_office o \r\njoin m_office ounder on ounder.hierarchy like concat(o.hierarchy, \'%\')\r\nand ounder.hierarchy like concat(\'${currentUserHierarchy}\', \'%\')\r\njoin m_client c on c.office_id = ounder.id\r\njoin m_loan l on l.client_id = c.id\r\njoin m_product_loan pl on pl.id = l.product_id\r\nleft join m_staff lo on lo.id = l.loan_officer_id\r\nleft join m_currency cur on cur.code = l.currency_code\r\nleft join m_fund f on f.id = l.fund_id\r\nwhere o.id = ${officeId}\r\nand (l.currency_code = \"${currencyId}\" or \"-1\" = \"${currencyId}\")\r\nand (l.product_id = \"${loanProductId}\" or \"-1\" = \"${loanProductId}\")\r\nand (ifnull(l.loan_officer_id, -10) = \"${loanOfficerId}\" or \"-1\" = \"${loanOfficerId}\")\r\nand (ifnull(l.fund_id, -10) = ${fundId} or -1 = ${fundId})\r\nand (ifnull(l.loanpurpose_cv_id, -10) = ${loanPurposeId} or -1 = ${loanPurposeId})\r\nand (case\r\n	when ${obligDateType} = 1 then\r\n    l.closedon_date between \'${startDate}\' and \'${endDate}\'\r\n	when ${obligDateType} = 2 then\r\n    l.disbursedon_date between \'${startDate}\' and \'${endDate}\'\r\n	else 1 = 1\r\n	end)\r\nand l.loan_status_id = 600\r\ngroup by ounder.hierarchy, l.currency_code\r\norder by ounder.hierarchy, l.currency_code', 'Individual Client \n\nReport', 1, 1, 0),
(15, 'Portfolio at Risk', 'Table', NULL, 'Loan', 'select x.Currency, x.`Principal Outstanding`, x.`Principal Overdue`, x.`Interest Outstanding`, x.`Interest Overdue`, \r\nx.`Fees Outstanding`, x.`Fees Overdue`, x.`Penalties Outstanding`, x.`Penalties Overdue`,\r\n\r\n	(case\r\n	when ${parType} = 1 then\r\n    cast(round((x.`Principal Overdue` * 100) / x.`Principal Outstanding`, 2) as char)\r\n	when ${parType} = 2 then\r\n    cast(round(((x.`Principal Overdue` + x.`Interest Overdue`) * 100) / (x.`Principal Outstanding` + x.`Interest Outstanding`), 2) as char)\r\n	when ${parType} = 3 then\r\n    cast(round(((x.`Principal Overdue` + x.`Interest Overdue` + x.`Fees Overdue`) * 100) / (x.`Principal Outstanding` + x.`Interest Outstanding` + x.`Fees Outstanding`), 2) as char)\r\n	when ${parType} = 4 then\r\n    cast(round(((x.`Principal Overdue` + x.`Interest Overdue` + x.`Fees Overdue` + x.`Penalties Overdue`) * 100) / (x.`Principal Outstanding` + x.`Interest Outstanding` + x.`Fees Outstanding` + x.`Penalties Overdue`), 2) as char)\r\n	else \"invalid PAR Type\"\r\n	end) as \"Portfolio at Risk %\"\r\n from \r\n(select  ifnull(cur.display_symbol, l.currency_code) as Currency,  \r\nsum(l.principal_outstanding_derived) as \"Principal Outstanding\",\r\nsum(laa.principal_overdue_derived) as \"Principal Overdue\",\r\n\r\nsum(l.interest_outstanding_derived) as \"Interest Outstanding\",\r\nsum(laa.interest_overdue_derived) as \"Interest Overdue\",\r\n\r\nsum(l.fee_charges_outstanding_derived)  as \"Fees Outstanding\",\r\nsum(laa.fee_charges_overdue_derived) as \"Fees Overdue\",\r\n\r\nsum(penalty_charges_outstanding_derived) as \"Penalties Outstanding\",\r\nsum(laa.penalty_charges_overdue_derived) as \"Penalties Overdue\"\r\n\r\nfrom m_office o \r\njoin m_office ounder on ounder.hierarchy like concat(o.hierarchy, \'%\')\r\nand ounder.hierarchy like concat(\'${currentUserHierarchy}\', \'%\')\r\njoin m_client c on c.office_id = ounder.id\r\njoin  m_loan l on l.client_id = c.id\r\nleft join m_staff lo on lo.id = l.loan_officer_id\r\nleft join m_currency cur on cur.code = l.currency_code\r\nleft join m_fund f on f.id = l.fund_id\r\nleft join m_code_value purp on purp.id = l.loanpurpose_cv_id\r\nleft join m_product_loan p on p.id = l.product_id\r\nleft join m_loan_arrears_aging laa on laa.loan_id = l.id\r\nwhere o.id = ${officeId}\r\nand (l.currency_code = \"${currencyId}\" or \"-1\" = \"${currencyId}\")\r\nand (l.product_id = \"${loanProductId}\" or \"-1\" = \"${loanProductId}\")\r\nand (ifnull(l.loan_officer_id, -10) = \"${loanOfficerId}\" or \"-1\" = \"${loanOfficerId}\")\r\nand (ifnull(l.fund_id, -10) = ${fundId} or -1 = ${fundId})\r\nand (ifnull(l.loanpurpose_cv_id, -10) = ${loanPurposeId} or -1 = ${loanPurposeId})\r\nand l.loan_status_id = 300\r\ngroup by l.currency_code\r\norder by l.currency_code) x', 'Covers all loans.\r\n\r\nFor larger MFIs … we should add some derived fields on loan (or a 1:1 loan related table like mifos 2.x does)\r\nPrinciple, Interest, Fees, Penalties Outstanding and Overdue (possibly waived and written off too)', 1, 1, 0),
(16, 'Portfolio at Risk by Branch', 'Table', NULL, 'Loan', 'select concat(repeat(\"..\",   \r\n   ((LENGTH(mo.`hierarchy`) - LENGTH(REPLACE(mo.`hierarchy`, \'.\', \'\')) - 1))), mo.`name`) as \"Office/Branch\",\r\nx.Currency, x.`Principal Outstanding`, x.`Principal Overdue`, x.`Interest Outstanding`, x.`Interest Overdue`, \r\nx.`Fees Outstanding`, x.`Fees Overdue`, x.`Penalties Outstanding`, x.`Penalties Overdue`,\r\n\r\n	(case\r\n	when ${parType} = 1 then\r\n    cast(round((x.`Principal Overdue` * 100) / x.`Principal Outstanding`, 2) as char)\r\n	when ${parType} = 2 then\r\n    cast(round(((x.`Principal Overdue` + x.`Interest Overdue`) * 100) / (x.`Principal Outstanding` + x.`Interest Outstanding`), 2) as char)\r\n	when ${parType} = 3 then\r\n    cast(round(((x.`Principal Overdue` + x.`Interest Overdue` + x.`Fees Overdue`) * 100) / (x.`Principal Outstanding` + x.`Interest Outstanding` + x.`Fees Outstanding`), 2) as char)\r\n	when ${parType} = 4 then\r\n    cast(round(((x.`Principal Overdue` + x.`Interest Overdue` + x.`Fees Overdue` + x.`Penalties Overdue`) * 100) / (x.`Principal Outstanding` + x.`Interest Outstanding` + x.`Fees Outstanding` + x.`Penalties Overdue`), 2) as char)\r\n	else \"invalid PAR Type\"\r\n	end) as \"Portfolio at Risk %\"\r\n from m_office mo\r\njoin \r\n(select  ounder.id as \"branch\", ifnull(cur.display_symbol, l.currency_code) as Currency,  \r\n\r\nsum(l.principal_outstanding_derived) as \"Principal Outstanding\",\r\nsum(laa.principal_overdue_derived) as \"Principal Overdue\",\r\n\r\nsum(l.interest_outstanding_derived) as \"Interest Outstanding\",\r\nsum(laa.interest_overdue_derived) as \"Interest Overdue\",\r\n\r\nsum(l.fee_charges_outstanding_derived)  as \"Fees Outstanding\",\r\nsum(laa.fee_charges_overdue_derived) as \"Fees Overdue\",\r\n\r\nsum(penalty_charges_outstanding_derived) as \"Penalties Outstanding\",\r\nsum(laa.penalty_charges_overdue_derived) as \"Penalties Overdue\"\r\n\r\nfrom m_office o \r\njoin m_office ounder on ounder.hierarchy like concat(o.hierarchy, \'%\')\r\nand ounder.hierarchy like concat(\'${currentUserHierarchy}\', \'%\')\r\njoin m_client c on c.office_id = ounder.id\r\njoin  m_loan l on l.client_id = c.id\r\nleft join m_staff lo on lo.id = l.loan_officer_id\r\nleft join m_currency cur on cur.code = l.currency_code\r\nleft join m_fund f on f.id = l.fund_id\r\nleft join m_code_value purp on purp.id = l.loanpurpose_cv_id\r\nleft join m_product_loan p on p.id = l.product_id\r\nleft join m_loan_arrears_aging laa on laa.loan_id = l.id\r\nwhere o.id = ${officeId}\r\nand (l.currency_code = \"${currencyId}\" or \"-1\" = \"${currencyId}\")\r\nand (l.product_id = \"${loanProductId}\" or \"-1\" = \"${loanProductId}\")\r\nand (ifnull(l.loan_officer_id, -10) = \"${loanOfficerId}\" or \"-1\" = \"${loanOfficerId}\")\r\nand (ifnull(l.fund_id, -10) = ${fundId} or -1 = ${fundId})\r\nand (ifnull(l.loanpurpose_cv_id, -10) = ${loanPurposeId} or -1 = ${loanPurposeId})\r\nand l.loan_status_id = 300\r\ngroup by ounder.id, l.currency_code) x on x.branch = mo.id\r\norder by mo.hierarchy, x.Currency', 'Covers all loans.\r\n\r\nFor larger MFIs … we should add some derived fields on loan (or a 1:1 loan related table like mifos 2.x does)\r\nPrinciple, Interest, Fees, Penalties Outstanding and Overdue (possibly waived and written off too)', 1, 1, 0),
(20, 'Funds Disbursed Between Dates Summary', 'Table', NULL, 'Fund', 'select ifnull(f.`name`, \'-\') as Fund,  ifnull(cur.display_symbol, l.currency_code) as Currency, \r\nround(sum(l.principal_amount), 4) as disbursed_amount\r\nfrom m_office ounder \r\njoin m_client c on c.office_id = ounder.id\r\njoin m_loan l on l.client_id = c.id\r\njoin m_currency cur on cur.`code` = l.currency_code\r\nleft join m_fund f on f.id = l.fund_id\r\nwhere disbursedon_date between \'${startDate}\' and \'${endDate}\'\r\nand (ifnull(l.fund_id, -10) = ${fundId} or -1 = ${fundId})\r\nand (l.currency_code = \'${currencyId}\' or \'-1\' = \'${currencyId}\')\r\nand ounder.hierarchy like concat(\'${currentUserHierarchy}\', \'%\')\r\ngroup by ifnull(f.`name`, \'-\') , ifnull(cur.display_symbol, l.currency_code)\r\norder by ifnull(f.`name`, \'-\') , ifnull(cur.display_symbol, l.currency_code)', NULL, 1, 1, 0),
(21, 'Funds Disbursed Between Dates Summary by Office', 'Table', NULL, 'Fund', 'select \r\nconcat(repeat(\"..\",   \r\n   ((LENGTH(ounder.`hierarchy`) - LENGTH(REPLACE(ounder.`hierarchy`, \'.\', \'\')) - 1))), ounder.`name`) as \"Office/Branch\",\r\n \n\nifnull(f.`name`, \'-\') as Fund,  ifnull(cur.display_symbol, l.currency_code) as Currency, round(sum(l.principal_amount), 4) as disbursed_amount\r\nfrom m_office o\r\n\n\njoin m_office ounder on ounder.hierarchy like concat(o.hierarchy, \'%\')\r\nand ounder.hierarchy like concat(\'${currentUserHierarchy}\', \'%\')\r\njoin m_client c \n\non c.office_id = ounder.id\r\njoin m_loan l on l.client_id = c.id\r\njoin m_currency cur on cur.`code` = l.currency_code\r\nleft join m_fund f on f.id = l.fund_id\r\n\n\nwhere disbursedon_date between \'${startDate}\' and \'${endDate}\'\r\nand o.id = ${officeId}\r\nand (ifnull(l.fund_id, -10) = ${fundId} or -1 = ${fundId})\r\nand \n\n(l.currency_code = \'${currencyId}\' or \'-1\' = \'${currencyId}\')\r\ngroup by ounder.`name`,  ifnull(f.`name`, \'-\') , ifnull(cur.display_symbol, \n\nl.currency_code)\r\norder by ounder.`name`,  ifnull(f.`name`, \'-\') , ifnull(cur.display_symbol, l.currency_code)', NULL, 1, 1, 0),
(48, 'Balance Sheet', 'Pentaho', NULL, 'Accounting', NULL, 'Balance Sheet', 1, 1, 0),
(49, 'Income Statement', 'Pentaho', NULL, 'Accounting', NULL, 'Profit and Loss Statement', 1, 1, 0),
(50, 'Trial Balance', 'Pentaho', NULL, 'Accounting', NULL, 'Trial Balance Report', 1, 1, 0),
(51, 'Written-Off Loans', 'Table', NULL, 'Loan', 'SELECT \r\nconcat(repeat(\"..\",   \r\n   ((LENGTH(ounder.`hierarchy`) - LENGTH(REPLACE(ounder.`hierarchy`, \'.\', \'\')) - 1))), ounder.`name`) as \"Office/Branch\",\r\nifnull(cur.display_symbol, ml.currency_code) as Currency,  \r\nc.account_no as \"Client Account No.\",\r\nc.display_name AS \'Client Name\',\r\nml.account_no AS \'Loan Account No.\',\r\nmpl.name AS \'Product Name\',\r\nml.disbursedon_date AS \'Disbursed Date\',\r\nlt.transaction_date AS \'Written Off date\',\r\nml.principal_amount as \"Loan Amount\",\r\nifnull(lt.principal_portion_derived, 0) AS \'Written-Off Principal\',\r\nifnull(lt.interest_portion_derived, 0) AS \'Written-Off Interest\',\r\nifnull(lt.fee_charges_portion_derived,0) AS \'Written-Off Fees\',\r\nifnull(lt.penalty_charges_portion_derived,0) AS \'Written-Off Penalties\',\r\nn.note AS \'Reason For Write-Off\',\r\nIFNULL(ms.display_name,\'-\') AS \'Loan Officer Name\'\r\nFROM m_office o\r\nJOIN m_office ounder ON ounder.hierarchy like concat(o.hierarchy, \'%\')\r\nAND ounder.hierarchy like CONCAT(\'${currentUserHierarchy}\', \'%\')\r\nJOIN m_client c ON c.office_id = ounder.id\r\nJOIN m_loan ml ON ml.client_id = c.id\r\nJOIN m_product_loan mpl ON mpl.id=ml.product_id\r\nLEFT JOIN m_staff ms ON ms.id=ml.loan_officer_id\r\nJOIN m_loan_transaction lt ON lt.loan_id = ml.id\r\nLEFT JOIN m_note n ON n.loan_transaction_id = lt.id\r\nLEFT JOIN m_currency cur on cur.code = ml.currency_code\r\nWHERE lt.transaction_type_enum = 6 /*write-off */\r\nAND lt.is_reversed is false \r\nAND ml.loan_status_id=601\r\nAND o.id=${officeId}\r\nAND (mpl.id=${loanProductId} OR ${loanProductId}=-1)\r\nAND lt.transaction_date BETWEEN \'${startDate}\' AND \'${endDate}\'\r\nAND (ml.currency_code = \"${currencyId}\" or \"-1\" = \"${currencyId}\") \r\nORDER BY ounder.hierarchy, ifnull(cur.display_symbol, ml.currency_code), ml.account_no', 'Individual Lending Report. Written Off Loans', 1, 1, 0),
(52, 'Aging Detail', 'Table', NULL, 'Loan', '\r\nSELECT \r\nconcat(repeat(\"..\",   \r\n   ((LENGTH(ounder.`hierarchy`) - LENGTH(REPLACE(ounder.`hierarchy`, \'.\', \'\')) - 1))), ounder.`name`) as \"Office/Branch\",\r\nifnull(cur.display_symbol, ml.currency_code) as Currency,  \r\nmc.account_no as \"Client Account No.\",\r\n 	mc.display_name AS \"Client Name\",\r\n 	ml.account_no AS \"Account Number\",\r\n 	ml.principal_amount AS \"Loan Amount\",\r\n ml.principal_disbursed_derived AS \"Original Principal\",\r\n ml.interest_charged_derived AS \"Original Interest\",\r\n ml.principal_repaid_derived AS \"Principal Paid\",\r\n ml.interest_repaid_derived AS \"Interest Paid\",\r\n laa.principal_overdue_derived AS \"Principal Overdue\",\r\n laa.interest_overdue_derived AS \"Interest Overdue\",\r\nDATEDIFF(CURDATE(), laa.overdue_since_date_derived) as \"Days in Arrears\",\r\n\r\n 	IF(DATEDIFF(CURDATE(), laa.overdue_since_date_derived)<7, \'<1\', \r\n 	IF(DATEDIFF(CURDATE(), laa.overdue_since_date_derived)<8, \' 1\', \r\n 	IF(DATEDIFF(CURDATE(), laa.overdue_since_date_derived)<15,  \'2\', \r\n 	IF(DATEDIFF(CURDATE(), laa.overdue_since_date_derived)<22, \' 3\', \r\n 	IF(DATEDIFF(CURDATE(), laa.overdue_since_date_derived)<29, \' 4\', \r\n 	IF(DATEDIFF(CURDATE(), laa.overdue_since_date_derived)<36, \' 5\', \r\n 	IF(DATEDIFF(CURDATE(), laa.overdue_since_date_derived)<43, \' 6\', \r\n 	IF(DATEDIFF(CURDATE(), laa.overdue_since_date_derived)<50, \' 7\', \r\n 	IF(DATEDIFF(CURDATE(), laa.overdue_since_date_derived)<57, \' 8\', \r\n 	IF(DATEDIFF(CURDATE(), laa.overdue_since_date_derived)<64, \' 9\', \r\n 	IF(DATEDIFF(CURDATE(), laa.overdue_since_date_derived)<71, \'10\', \r\n 	IF(DATEDIFF(CURDATE(), laa.overdue_since_date_derived)<78, \'11\', \r\n 	IF(DATEDIFF(CURDATE(), laa.overdue_since_date_derived)<85, \'12\', \'12+\')))))))))))) )AS \"Weeks In Arrears Band\",\r\n\r\n		IF(DATEDIFF(CURDATE(),  laa.overdue_since_date_derived)<31, \'0 - 30\', \r\n		IF(DATEDIFF(CURDATE(),  laa.overdue_since_date_derived)<61, \'30 - 60\', \r\n		IF(DATEDIFF(CURDATE(),  laa.overdue_since_date_derived)<91, \'60 - 90\', \r\n		IF(DATEDIFF(CURDATE(),  laa.overdue_since_date_derived)<181, \'90 - 180\', \r\n		IF(DATEDIFF(CURDATE(),  laa.overdue_since_date_derived)<361, \'180 - 360\', \r\n				 \'> 360\'))))) AS \"Days in Arrears Band\"\r\n\r\n	FROM m_office mo \r\n    JOIN m_office ounder ON ounder.hierarchy like concat(mo.hierarchy, \'%\')\r\n	        AND ounder.hierarchy like CONCAT(\'${currentUserHierarchy}\', \'%\')\r\n    INNER JOIN m_client mc ON mc.office_id=ounder.id\r\n	    INNER JOIN m_loan ml ON ml.client_id = mc.id\r\n	    INNER JOIN r_enum_value rev ON rev.enum_id=ml.loan_status_id AND rev.enum_name = \'loan_status_id\'\r\n    INNER JOIN m_loan_arrears_aging laa ON laa.loan_id=ml.id\r\n    left join m_currency cur on cur.code = ml.currency_code\r\n	WHERE ml.loan_status_id=300\r\n    AND mo.id=${officeId}\r\nORDER BY ounder.hierarchy, ifnull(cur.display_symbol, ml.currency_code), ml.account_no\r\n', 'Loan arrears aging (Weeks)', 1, 1, 0),
(53, 'Aging Summary (Arrears in Weeks)', 'Table', NULL, 'Loan', 'SELECT \r\n  IFNULL(periods.currencyName, periods.currency) as currency, \r\n  periods.period_no \'Weeks In Arrears (Up To)\', \r\n  IFNULL(ars.loanId, 0) \'No Of Loans\', \r\n  IFNULL(ars.principal,0.0) \'Original Principal\', \r\n  IFNULL(ars.interest,0.0) \'Original Interest\', \r\n  IFNULL(ars.prinPaid,0.0) \'Principal Paid\', \r\n  IFNULL(ars.intPaid,0.0) \'Interest Paid\', \r\n  IFNULL(ars.prinOverdue,0.0) \'Principal Overdue\', \r\n  IFNULL(ars.intOverdue,0.0)\'Interest Overdue\'\r\nFROM \r\n	/* full table of aging periods/currencies used combo to ensure each line represented */\r\n  (SELECT curs.code as currency, curs.name as currencyName, pers.* from\r\n	(SELECT \'On Schedule\' period_no,1 pid UNION\r\n		SELECT \'1\',2 UNION\r\n		SELECT \'2\',3 UNION\r\n		SELECT \'3\',4 UNION\r\n		SELECT \'4\',5 UNION\r\n		SELECT \'5\',6 UNION\r\n		SELECT \'6\',7 UNION\r\n		SELECT \'7\',8 UNION\r\n		SELECT \'8\',9 UNION\r\n		SELECT \'9\',10 UNION\r\n		SELECT \'10\',11 UNION\r\n		SELECT \'11\',12 UNION\r\n		SELECT \'12\',13 UNION\r\n		SELECT \'12+\',14) pers,\r\n	(SELECT distinctrow moc.code, moc.name\r\n  	FROM m_office mo2\r\n   	INNER JOIN m_office ounder2 ON ounder2.hierarchy \r\n				LIKE CONCAT(mo2.hierarchy, \'%\')\r\nAND ounder2.hierarchy like CONCAT(\'${currentUserHierarchy}\', \'%\')\r\n   	INNER JOIN m_client mc2 ON mc2.office_id=ounder2.id\r\n   	INNER JOIN m_loan ml2 ON ml2.client_id = mc2.id\r\n	INNER JOIN m_organisation_currency moc ON moc.code = ml2.currency_code\r\n	WHERE ml2.loan_status_id=300 /* active */\r\n	AND mo2.id=${officeId}\r\nAND (ml2.currency_code = \"${currencyId}\" or \"-1\" = \"${currencyId}\")) curs) periods\r\n\r\n\r\nLEFT JOIN /* table of aging periods per currency with gaps if no applicable loans */\r\n(SELECT \r\n  	z.currency, z.arrPeriod, \r\n	COUNT(z.loanId) as loanId, SUM(z.principal) as principal, SUM(z.interest) as interest, \r\n	SUM(z.prinPaid) as prinPaid, SUM(z.intPaid) as intPaid, \r\n	SUM(z.prinOverdue) as prinOverdue, SUM(z.intOverdue) as intOverdue\r\nFROM\r\n	/*derived table just used to get arrPeriod value (was much slower to\r\n	duplicate calc of minOverdueDate in inner query)\r\nmight not be now with derived fields but didn’t check */\r\n	(SELECT x.loanId, x.currency, x.principal, x.interest, x.prinPaid, x.intPaid, x.prinOverdue, x.intOverdue,\r\n		IF(DATEDIFF(CURDATE(), minOverdueDate)<1, \'On Schedule\', \r\n		IF(DATEDIFF(CURDATE(), minOverdueDate)<8, \'1\', \r\n		IF(DATEDIFF(CURDATE(), minOverdueDate)<15, \'2\', \r\n		IF(DATEDIFF(CURDATE(), minOverdueDate)<22, \'3\', \r\n		IF(DATEDIFF(CURDATE(), minOverdueDate)<29, \'4\', \r\n		IF(DATEDIFF(CURDATE(), minOverdueDate)<36, \'5\', \r\n		IF(DATEDIFF(CURDATE(), minOverdueDate)<43, \'6\', \r\n		IF(DATEDIFF(CURDATE(), minOverdueDate)<50, \'7\', \r\n		IF(DATEDIFF(CURDATE(), minOverdueDate)<57, \'8\', \r\n		IF(DATEDIFF(CURDATE(), minOverdueDate)<64, \'9\', \r\n		IF(DATEDIFF(CURDATE(), minOverdueDate)<71, \'10\', \r\n		IF(DATEDIFF(CURDATE(), minOverdueDate)<78, \'11\', \r\n		IF(DATEDIFF(CURDATE(), minOverdueDate)<85, \'12\',\r\n				 \'12+\'))))))))))))) AS arrPeriod\r\n\r\n	FROM /* get the individual loan details */\r\n		(SELECT ml.id AS loanId, ml.currency_code as currency,\r\n   			ml.principal_disbursed_derived as principal, \r\n			   ml.interest_charged_derived as interest, \r\n   			ml.principal_repaid_derived as prinPaid, \r\n			   ml.interest_repaid_derived intPaid,\r\n\r\n			   laa.principal_overdue_derived as prinOverdue,\r\n			   laa.interest_overdue_derived as intOverdue,\r\n\r\n			   IFNULL(laa.overdue_since_date_derived, curdate()) as minOverdueDate\r\n			  \r\n  		FROM m_office mo\r\n   		INNER JOIN m_office ounder ON ounder.hierarchy \r\n				LIKE CONCAT(mo.hierarchy, \'%\')\r\nAND ounder.hierarchy like CONCAT(\'${currentUserHierarchy}\', \'%\')\r\n   		INNER JOIN m_client mc ON mc.office_id=ounder.id\r\n   		INNER JOIN m_loan ml ON ml.client_id = mc.id\r\n		   LEFT JOIN m_loan_arrears_aging laa on laa.loan_id = ml.id\r\n		WHERE ml.loan_status_id=300 /* active */\r\n     		AND mo.id=${officeId}\r\n     AND (ml.currency_code = \"${currencyId}\" or \"-1\" = \"${currencyId}\")\r\n  		GROUP BY ml.id) x\r\n	) z \r\nGROUP BY z.currency, z.arrPeriod ) ars ON ars.arrPeriod=periods.period_no and ars.currency = periods.currency\r\nORDER BY periods.currency, periods.pid', 'Loan amount in arrears by branch', 1, 1, 0),
(54, 'Rescheduled Loans', 'Table', NULL, 'Loan', 'SELECT \r\nconcat(repeat(\"..\",   \r\n   ((LENGTH(ounder.`hierarchy`) - LENGTH(REPLACE(ounder.`hierarchy`, \'.\', \'\')) - 1))), ounder.`name`) as \"Office/Branch\",\r\nifnull(cur.display_symbol, ml.currency_code) as Currency,  \r\nc.account_no as \"Client Account No.\",\r\nc.display_name AS \'Client Name\',\r\nml.account_no AS \'Loan Account No.\',\r\nmpl.name AS \'Product Name\',\r\nml.disbursedon_date AS \'Disbursed Date\',\r\nlt.transaction_date AS \'Written Off date\',\r\nml.principal_amount as \"Loan Amount\",\r\nifnull(lt.principal_portion_derived, 0) AS \'Rescheduled Principal\',\r\nifnull(lt.interest_portion_derived, 0) AS \'Rescheduled Interest\',\r\nifnull(lt.fee_charges_portion_derived,0) AS \'Rescheduled Fees\',\r\nifnull(lt.penalty_charges_portion_derived,0) AS \'Rescheduled Penalties\',\r\nn.note AS \'Reason For Rescheduling\',\r\nIFNULL(ms.display_name,\'-\') AS \'Loan Officer Name\'\r\nFROM m_office o\r\nJOIN m_office ounder ON ounder.hierarchy like concat(o.hierarchy, \'%\')\r\nAND ounder.hierarchy like CONCAT(\'${currentUserHierarchy}\', \'%\')\r\nJOIN m_client c ON c.office_id = ounder.id\r\nJOIN m_loan ml ON ml.client_id = c.id\r\nJOIN m_product_loan mpl ON mpl.id=ml.product_id\r\nLEFT JOIN m_staff ms ON ms.id=ml.loan_officer_id\r\nJOIN m_loan_transaction lt ON lt.loan_id = ml.id\r\nLEFT JOIN m_note n ON n.loan_transaction_id = lt.id\r\nLEFT JOIN m_currency cur on cur.code = ml.currency_code\r\nWHERE lt.transaction_type_enum = 7 /*marked for rescheduling */\r\nAND lt.is_reversed is false \r\nAND ml.loan_status_id=602\r\nAND o.id=${officeId}\r\nAND (mpl.id=${loanProductId} OR ${loanProductId}=-1)\r\nAND lt.transaction_date BETWEEN \'${startDate}\' AND \'${endDate}\'\r\nAND (ml.currency_code = \"${currencyId}\" or \"-1\" = \"${currencyId}\")\r\nORDER BY ounder.hierarchy, ifnull(cur.display_symbol, ml.currency_code), ml.account_no', 'Individual Lending Report. Rescheduled Loans.  The ability to reschedule (or mark that you have rescheduled the loan elsewhere) is a legacy of the older Mifos product.  Needed for migration.', 1, 1, 0),
(55, 'Active Loans Passed Final Maturity', 'Table', NULL, 'Loan', 'select concat(repeat(\"..\",   \r\n   ((LENGTH(ounder.`hierarchy`) - LENGTH(REPLACE(ounder.`hierarchy`, \'.\', \'\')) - 1))), ounder.`name`) as \"Office/Branch\",\r\nifnull(cur.display_symbol, l.currency_code) as Currency,\r\nlo.display_name as \"Loan Officer\", \r\nc.display_name as \"Client\", l.account_no as \"Loan Account No.\", pl.`name` as \"Product\", \r\nf.`name` as Fund,  \r\nl.principal_amount as \"Loan Amount\", \r\nl.annual_nominal_interest_rate as \" Annual Nominal Interest Rate\", \r\ndate(l.disbursedon_date) as \"Disbursed Date\", \r\ndate(l.expected_maturedon_date) as \"Expected Matured On\",\r\n\r\nl.principal_repaid_derived as \"Principal Repaid\",\r\nl.principal_outstanding_derived as \"Principal Outstanding\",\r\nlaa.principal_overdue_derived as \"Principal Overdue\",\r\n\r\nl.interest_repaid_derived as \"Interest Repaid\",\r\nl.interest_outstanding_derived as \"Interest Outstanding\",\r\nlaa.interest_overdue_derived as \"Interest Overdue\",\r\n\r\nl.fee_charges_repaid_derived as \"Fees Repaid\",\r\nl.fee_charges_outstanding_derived  as \"Fees Outstanding\",\r\nlaa.fee_charges_overdue_derived as \"Fees Overdue\",\r\n\r\nl.penalty_charges_repaid_derived as \"Penalties Repaid\",\r\nl.penalty_charges_outstanding_derived as \"Penalties Outstanding\",\r\nlaa.penalty_charges_overdue_derived as \"Penalties Overdue\"\r\n\r\nfrom m_office o \r\njoin m_office ounder on ounder.hierarchy like concat(o.hierarchy, \'%\')\r\nand ounder.hierarchy like concat(\'${currentUserHierarchy}\', \'%\')\r\njoin m_client c on c.office_id = ounder.id\r\njoin m_loan l on l.client_id = c.id\r\njoin m_product_loan pl on pl.id = l.product_id\r\nleft join m_staff lo on lo.id = l.loan_officer_id\r\nleft join m_currency cur on cur.code = l.currency_code\r\nleft join m_fund f on f.id = l.fund_id\r\nleft join m_loan_arrears_aging laa on laa.loan_id = l.id\r\nwhere o.id = ${officeId}\r\nand (l.currency_code = \"${currencyId}\" or \"-1\" = \"${currencyId}\")\r\nand (l.product_id = \"${loanProductId}\" or \"-1\" = \"${loanProductId}\")\r\nand (ifnull(l.loan_officer_id, -10) = \"${loanOfficerId}\" or \"-1\" = \"${loanOfficerId}\")\r\nand (ifnull(l.fund_id, -10) = ${fundId} or -1 = ${fundId})\r\nand (ifnull(l.loanpurpose_cv_id, -10) = ${loanPurposeId} or -1 = ${loanPurposeId})\r\nand l.loan_status_id = 300\r\nand l.expected_maturedon_date < curdate()\r\ngroup by l.id\r\norder by ounder.hierarchy, l.currency_code, c.account_no, l.account_no', 'Individual Client \n\nReport', 1, 1, 0);
INSERT INTO `stretchy_report` (`id`, `report_name`, `report_type`, `report_subtype`, `report_category`, `report_sql`, `description`, `core_report`, `use_report`, `self_service_user_report`) VALUES
(56, 'Active Loans Passed Final Maturity Summary', 'Table', NULL, 'Loan', 'select concat(repeat(\"..\",   \r\n   ((LENGTH(mo.`hierarchy`) - LENGTH(REPLACE(mo.`hierarchy`, \'.\', \'\')) - 1))), mo.`name`) as \"Office/Branch\", x.currency as Currency,\r\n x.client_count as \"No. of Clients\", x.active_loan_count as \"No. Active Loans\", x. arrears_loan_count as \"No. of Loans in Arrears\",\r\nx.principal as \"Total Loans Disbursed\", x.principal_repaid as \"Principal Repaid\", x.principal_outstanding as \"Principal Outstanding\", x.principal_overdue as \"Principal Overdue\",\r\nx.interest as \"Total Interest\", x.interest_repaid as \"Interest Repaid\", x.interest_outstanding as \"Interest Outstanding\", x.interest_overdue as \"Interest Overdue\",\r\nx.fees as \"Total Fees\", x.fees_repaid as \"Fees Repaid\", x.fees_outstanding as \"Fees Outstanding\", x.fees_overdue as \"Fees Overdue\",\r\nx.penalties as \"Total Penalties\", x.penalties_repaid as \"Penalties Repaid\", x.penalties_outstanding as \"Penalties Outstanding\", x.penalties_overdue as \"Penalties Overdue\",\r\n\r\n	(case\r\n	when ${parType} = 1 then\r\n    cast(round((x.principal_overdue * 100) / x.principal_outstanding, 2) as char)\r\n	when ${parType} = 2 then\r\n    cast(round(((x.principal_overdue + x.interest_overdue) * 100) / (x.principal_outstanding + x.interest_outstanding), 2) as char)\r\n	when ${parType} = 3 then\r\n    cast(round(((x.principal_overdue + x.interest_overdue + x.fees_overdue) * 100) / (x.principal_outstanding + x.interest_outstanding + x.fees_outstanding), 2) as char)\r\n	when ${parType} = 4 then\r\n    cast(round(((x.principal_overdue + x.interest_overdue + x.fees_overdue + x.penalties_overdue) * 100) / (x.principal_outstanding + x.interest_outstanding + x.fees_outstanding + x.penalties_overdue), 2) as char)\r\n	else \"invalid PAR Type\"\r\n	end) as \"Portfolio at Risk %\"\r\n from m_office mo\r\njoin \r\n(select ounder.id as branch,\r\nifnull(cur.display_symbol, l.currency_code) as currency,\r\ncount(distinct(c.id)) as client_count, \r\ncount(distinct(l.id)) as  active_loan_count,\r\ncount(distinct(laa.loan_id)  ) as arrears_loan_count,\r\n\r\nsum(l.principal_disbursed_derived) as principal,\r\nsum(l.principal_repaid_derived) as principal_repaid,\r\nsum(l.principal_outstanding_derived) as principal_outstanding,\r\nsum(ifnull(laa.principal_overdue_derived,0)) as principal_overdue,\r\n\r\nsum(l.interest_charged_derived) as interest,\r\nsum(l.interest_repaid_derived) as interest_repaid,\r\nsum(l.interest_outstanding_derived) as interest_outstanding,\r\nsum(ifnull(laa.interest_overdue_derived,0)) as interest_overdue,\r\n\r\nsum(l.fee_charges_charged_derived) as fees,\r\nsum(l.fee_charges_repaid_derived) as fees_repaid,\r\nsum(l.fee_charges_outstanding_derived)  as fees_outstanding,\r\nsum(ifnull(laa.fee_charges_overdue_derived,0)) as fees_overdue,\r\n\r\nsum(l.penalty_charges_charged_derived) as penalties,\r\nsum(l.penalty_charges_repaid_derived) as penalties_repaid,\r\nsum(l.penalty_charges_outstanding_derived) as penalties_outstanding,\r\nsum(ifnull(laa.penalty_charges_overdue_derived,0)) as penalties_overdue\r\n\r\nfrom m_office o \r\njoin m_office ounder on ounder.hierarchy like concat(o.hierarchy, \'%\')\r\nand ounder.hierarchy like concat(\'${currentUserHierarchy}\', \'%\')\r\njoin m_client c on c.office_id = ounder.id\r\njoin m_loan l on l.client_id = c.id\r\nleft join m_currency cur on cur.code = l.currency_code\r\nleft join m_loan_arrears_aging laa on laa.loan_id = l.id\r\n\r\nwhere o.id = ${officeId}\r\nand (l.currency_code = \"${currencyId}\" or \"-1\" = \"${currencyId}\")\r\nand (l.product_id = \"${loanProductId}\" or \"-1\" = \"${loanProductId}\")\r\nand (ifnull(l.loan_officer_id, -10) = \"${loanOfficerId}\" or \"-1\" = \"${loanOfficerId}\")\r\nand (ifnull(l.fund_id, -10) = ${fundId} or -1 = ${fundId})\r\nand (ifnull(l.loanpurpose_cv_id, -10) = ${loanPurposeId} or -1 = ${loanPurposeId})\r\nand l.loan_status_id = 300\r\nand l.expected_maturedon_date < curdate()\r\ngroup by ounder.id, l.currency_code) x on x.branch = mo.id\r\norder by mo.hierarchy, x.Currency', NULL, 1, 1, 0),
(57, 'Active Loans in last installment', 'Table', NULL, 'Loan', 'select concat(repeat(\"..\",   \r\n   ((LENGTH(lastInstallment.`hierarchy`) - LENGTH(REPLACE(lastInstallment.`hierarchy`, \'.\', \'\')) - 1))), lastInstallment.branch) as \"Office/Branch\",\r\nlastInstallment.Currency,\r\nlastInstallment.`Loan Officer`, \r\nlastInstallment.`Client Account No`, lastInstallment.`Client`, \r\nlastInstallment.`Loan Account No`, lastInstallment.`Product`, \r\nlastInstallment.`Fund`,  lastInstallment.`Loan Amount`, \r\nlastInstallment.`Annual Nominal Interest Rate`, \r\nlastInstallment.`Disbursed`, lastInstallment.`Expected Matured On` ,\r\n\r\nl.principal_repaid_derived as \"Principal Repaid\",\r\nl.principal_outstanding_derived as \"Principal Outstanding\",\r\nlaa.principal_overdue_derived as \"Principal Overdue\",\r\n\r\nl.interest_repaid_derived as \"Interest Repaid\",\r\nl.interest_outstanding_derived as \"Interest Outstanding\",\r\nlaa.interest_overdue_derived as \"Interest Overdue\",\r\n\r\nl.fee_charges_repaid_derived as \"Fees Repaid\",\r\nl.fee_charges_outstanding_derived  as \"Fees Outstanding\",\r\nlaa.fee_charges_overdue_derived as \"Fees Overdue\",\r\n\r\nl.penalty_charges_repaid_derived as \"Penalties Repaid\",\r\nl.penalty_charges_outstanding_derived as \"Penalties Outstanding\",\r\nlaa.penalty_charges_overdue_derived as \"Penalties Overdue\"\r\n\r\nfrom \r\n(select l.id as loanId, l.number_of_repayments, min(r.installment), \r\nounder.id, ounder.hierarchy, ounder.`name` as branch, \r\nifnull(cur.display_symbol, l.currency_code) as Currency,\r\nlo.display_name as \"Loan Officer\", c.account_no as \"Client Account No\",\r\nc.display_name as \"Client\", l.account_no as \"Loan Account No\", pl.`name` as \"Product\", \r\nf.`name` as Fund,  l.principal_amount as \"Loan Amount\", \r\nl.annual_nominal_interest_rate as \"Annual Nominal Interest Rate\", \r\ndate(l.disbursedon_date) as \"Disbursed\", date(l.expected_maturedon_date) as \"Expected Matured On\"\r\nfrom m_office o \r\njoin m_office ounder on ounder.hierarchy like concat(o.hierarchy, \'%\')\r\nand ounder.hierarchy like concat(\'${currentUserHierarchy}\', \'%\')\r\njoin m_client c on c.office_id = ounder.id\r\njoin m_loan l on l.client_id = c.id\r\njoin m_product_loan pl on pl.id = l.product_id\r\nleft join m_staff lo on lo.id = l.loan_officer_id\r\nleft join m_currency cur on cur.code = l.currency_code\r\nleft join m_fund f on f.id = l.fund_id\r\nleft join m_loan_repayment_schedule r on r.loan_id = l.id\r\nwhere o.id = ${officeId}\r\nand (l.currency_code = \"${currencyId}\" or \"-1\" = \"${currencyId}\")\r\nand (l.product_id = \"${loanProductId}\" or \"-1\" = \"${loanProductId}\")\r\nand (ifnull(l.loan_officer_id, -10) = \"${loanOfficerId}\" or \"-1\" = \"${loanOfficerId}\")\r\nand (ifnull(l.fund_id, -10) = ${fundId} or -1 = ${fundId})\r\nand (ifnull(l.loanpurpose_cv_id, -10) = ${loanPurposeId} or -1 = ${loanPurposeId})\r\nand l.loan_status_id = 300\r\nand r.completed_derived is false\r\nand r.duedate >= curdate()\r\ngroup by l.id\r\nhaving l.number_of_repayments = min(r.installment)) lastInstallment\r\njoin m_loan l on l.id = lastInstallment.loanId\r\nleft join m_loan_arrears_aging laa on laa.loan_id = l.id\r\norder by lastInstallment.hierarchy, lastInstallment.Currency, lastInstallment.`Client Account No`, lastInstallment.`Loan Account No`', 'Individual Client \n\nReport', 1, 1, 0),
(58, 'Active Loans in last installment Summary', 'Table', NULL, 'Loan', 'select concat(repeat(\"..\",   \r\n   ((LENGTH(mo.`hierarchy`) - LENGTH(REPLACE(mo.`hierarchy`, \'.\', \'\')) - 1))), mo.`name`) as \"Office/Branch\", x.currency as Currency,\r\n x.client_count as \"No. of Clients\", x.active_loan_count as \"No. Active Loans\", x. arrears_loan_count as \"No. of Loans in Arrears\",\r\nx.principal as \"Total Loans Disbursed\", x.principal_repaid as \"Principal Repaid\", x.principal_outstanding as \"Principal Outstanding\", x.principal_overdue as \"Principal Overdue\",\r\nx.interest as \"Total Interest\", x.interest_repaid as \"Interest Repaid\", x.interest_outstanding as \"Interest Outstanding\", x.interest_overdue as \"Interest Overdue\",\r\nx.fees as \"Total Fees\", x.fees_repaid as \"Fees Repaid\", x.fees_outstanding as \"Fees Outstanding\", x.fees_overdue as \"Fees Overdue\",\r\nx.penalties as \"Total Penalties\", x.penalties_repaid as \"Penalties Repaid\", x.penalties_outstanding as \"Penalties Outstanding\", x.penalties_overdue as \"Penalties Overdue\",\r\n\r\n	(case\r\n	when ${parType} = 1 then\r\n    cast(round((x.principal_overdue * 100) / x.principal_outstanding, 2) as char)\r\n	when ${parType} = 2 then\r\n    cast(round(((x.principal_overdue + x.interest_overdue) * 100) / (x.principal_outstanding + x.interest_outstanding), 2) as char)\r\n	when ${parType} = 3 then\r\n    cast(round(((x.principal_overdue + x.interest_overdue + x.fees_overdue) * 100) / (x.principal_outstanding + x.interest_outstanding + x.fees_outstanding), 2) as char)\r\n	when ${parType} = 4 then\r\n    cast(round(((x.principal_overdue + x.interest_overdue + x.fees_overdue + x.penalties_overdue) * 100) / (x.principal_outstanding + x.interest_outstanding + x.fees_outstanding + x.penalties_overdue), 2) as char)\r\n	else \"invalid PAR Type\"\r\n	end) as \"Portfolio at Risk %\"\r\n from m_office mo\r\njoin \r\n(select lastInstallment.branchId as branchId,\r\nlastInstallment.Currency,\r\ncount(distinct(lastInstallment.clientId)) as client_count, \r\ncount(distinct(lastInstallment.loanId)) as  active_loan_count,\r\ncount(distinct(laa.loan_id)  ) as arrears_loan_count,\r\n\r\nsum(l.principal_disbursed_derived) as principal,\r\nsum(l.principal_repaid_derived) as principal_repaid,\r\nsum(l.principal_outstanding_derived) as principal_outstanding,\r\nsum(ifnull(laa.principal_overdue_derived,0)) as principal_overdue,\r\n\r\nsum(l.interest_charged_derived) as interest,\r\nsum(l.interest_repaid_derived) as interest_repaid,\r\nsum(l.interest_outstanding_derived) as interest_outstanding,\r\nsum(ifnull(laa.interest_overdue_derived,0)) as interest_overdue,\r\n\r\nsum(l.fee_charges_charged_derived) as fees,\r\nsum(l.fee_charges_repaid_derived) as fees_repaid,\r\nsum(l.fee_charges_outstanding_derived)  as fees_outstanding,\r\nsum(ifnull(laa.fee_charges_overdue_derived,0)) as fees_overdue,\r\n\r\nsum(l.penalty_charges_charged_derived) as penalties,\r\nsum(l.penalty_charges_repaid_derived) as penalties_repaid,\r\nsum(l.penalty_charges_outstanding_derived) as penalties_outstanding,\r\nsum(ifnull(laa.penalty_charges_overdue_derived,0)) as penalties_overdue\r\n\r\nfrom \r\n(select l.id as loanId, l.number_of_repayments, min(r.installment), \r\nounder.id as branchId, ounder.hierarchy, ounder.`name` as branch, \r\nifnull(cur.display_symbol, l.currency_code) as Currency,\r\nlo.display_name as \"Loan Officer\", c.id as clientId, c.account_no as \"Client Account No\",\r\nc.display_name as \"Client\", l.account_no as \"Loan Account No\", pl.`name` as \"Product\", \r\nf.`name` as Fund,  l.principal_amount as \"Loan Amount\", \r\nl.annual_nominal_interest_rate as \"Annual Nominal Interest Rate\", \r\ndate(l.disbursedon_date) as \"Disbursed\", date(l.expected_maturedon_date) as \"Expected Matured On\"\r\nfrom m_office o \r\njoin m_office ounder on ounder.hierarchy like concat(o.hierarchy, \'%\')\r\nand ounder.hierarchy like concat(\'${currentUserHierarchy}\', \'%\')\r\njoin m_client c on c.office_id = ounder.id\r\njoin m_loan l on l.client_id = c.id\r\njoin m_product_loan pl on pl.id = l.product_id\r\nleft join m_staff lo on lo.id = l.loan_officer_id\r\nleft join m_currency cur on cur.code = l.currency_code\r\nleft join m_fund f on f.id = l.fund_id\r\nleft join m_loan_repayment_schedule r on r.loan_id = l.id\r\nwhere o.id = ${officeId}\r\nand (l.currency_code = \"${currencyId}\" or \"-1\" = \"${currencyId}\")\r\nand (l.product_id = \"${loanProductId}\" or \"-1\" = \"${loanProductId}\")\r\nand (ifnull(l.loan_officer_id, -10) = \"${loanOfficerId}\" or \"-1\" = \"${loanOfficerId}\")\r\nand (ifnull(l.fund_id, -10) = ${fundId} or -1 = ${fundId})\r\nand (ifnull(l.loanpurpose_cv_id, -10) = ${loanPurposeId} or -1 = ${loanPurposeId})\r\nand l.loan_status_id = 300\r\nand r.completed_derived is false\r\nand r.duedate >= curdate()\r\ngroup by l.id\r\nhaving l.number_of_repayments = min(r.installment)) lastInstallment\r\njoin m_loan l on l.id = lastInstallment.loanId\r\nleft join m_loan_arrears_aging laa on laa.loan_id = l.id\r\ngroup by lastInstallment.branchId) x on x.branchId = mo.id\r\norder by mo.hierarchy, x.Currency', 'Individual Client \n\nReport', 1, 1, 0),
(59, 'Active Loans by Disbursal Period', 'Table', NULL, 'Loan', 'select concat(repeat(\"..\",   \r\n   ((LENGTH(ounder.`hierarchy`) - LENGTH(REPLACE(ounder.`hierarchy`, \'.\', \'\')) - 1))), ounder.`name`) as \"Office/Branch\",\r\nifnull(cur.display_symbol, l.currency_code) as Currency,\r\nc.account_no as \"Client Account No\", c.display_name as \"Client\", l.account_no as \"Loan Account No\", pl.`name` as \"Product\", \r\nf.`name` as Fund,  \r\nl.principal_amount as \"Loan Principal Amount\", \r\nl.annual_nominal_interest_rate as \" Annual Nominal Interest Rate\", \r\ndate(l.disbursedon_date) as \"Disbursed Date\", \r\n\r\nl.total_expected_repayment_derived as \"Total Loan (P+I+F+Pen)\",\r\nl.total_repayment_derived as \"Total Repaid (P+I+F+Pen)\",\r\nlo.display_name as \"Loan Officer\"\r\n\r\nfrom m_office o \r\njoin m_office ounder on ounder.hierarchy like concat(o.hierarchy, \'%\')\r\nand ounder.hierarchy like concat(\'${currentUserHierarchy}\', \'%\')\r\njoin m_client c on c.office_id = ounder.id\r\njoin m_loan l on l.client_id = c.id\r\njoin m_product_loan pl on pl.id = l.product_id\r\nleft join m_staff lo on lo.id = l.loan_officer_id\r\nleft join m_currency cur on cur.code = l.currency_code\r\nleft join m_fund f on f.id = l.fund_id\r\nleft join m_loan_arrears_aging laa on laa.loan_id = l.id\r\nwhere o.id = ${officeId}\r\nand (l.currency_code = \"${currencyId}\" or \"-1\" = \"${currencyId}\")\r\nand (l.product_id = \"${loanProductId}\" or \"-1\" = \"${loanProductId}\")\r\nand (ifnull(l.loan_officer_id, -10) = \"${loanOfficerId}\" or \"-1\" = \"${loanOfficerId}\")\r\nand (ifnull(l.fund_id, -10) = ${fundId} or -1 = ${fundId})\r\nand (ifnull(l.loanpurpose_cv_id, -10) = ${loanPurposeId} or -1 = ${loanPurposeId})\r\nand l.disbursedon_date between \'${startDate}\' and \'${endDate}\'\r\nand l.loan_status_id = 300\r\ngroup by l.id\r\norder by ounder.hierarchy, l.currency_code, c.account_no, l.account_no', 'Individual Client \n\nReport', 1, 1, 0),
(61, 'Aging Summary (Arrears in Months)', 'Table', NULL, 'Loan', 'SELECT \r\n  IFNULL(periods.currencyName, periods.currency) as currency, \r\n  periods.period_no \'Days In Arrears\', \r\n  IFNULL(ars.loanId, 0) \'No Of Loans\', \r\n  IFNULL(ars.principal,0.0) \'Original Principal\', \r\n  IFNULL(ars.interest,0.0) \'Original Interest\', \r\n  IFNULL(ars.prinPaid,0.0) \'Principal Paid\', \r\n  IFNULL(ars.intPaid,0.0) \'Interest Paid\', \r\n  IFNULL(ars.prinOverdue,0.0) \'Principal Overdue\', \r\n  IFNULL(ars.intOverdue,0.0)\'Interest Overdue\'\r\nFROM \r\n	/* full table of aging periods/currencies used combo to ensure each line represented */\r\n  (SELECT curs.code as currency, curs.name as currencyName, pers.* from\r\n	(SELECT \'On Schedule\' period_no,1 pid UNION\r\n		SELECT \'0 - 30\',2 UNION\r\n		SELECT \'30 - 60\',3 UNION\r\n		SELECT \'60 - 90\',4 UNION\r\n		SELECT \'90 - 180\',5 UNION\r\n		SELECT \'180 - 360\',6 UNION\r\n		SELECT \'> 360\',7 ) pers,\r\n	(SELECT distinctrow moc.code, moc.name\r\n  	FROM m_office mo2\r\n   	INNER JOIN m_office ounder2 ON ounder2.hierarchy \r\n				LIKE CONCAT(mo2.hierarchy, \'%\')\r\nAND ounder2.hierarchy like CONCAT(\'${currentUserHierarchy}\', \'%\')\r\n   	INNER JOIN m_client mc2 ON mc2.office_id=ounder2.id\r\n   	INNER JOIN m_loan ml2 ON ml2.client_id = mc2.id\r\n	INNER JOIN m_organisation_currency moc ON moc.code = ml2.currency_code\r\n	WHERE ml2.loan_status_id=300 /* active */\r\n	AND mo2.id=${officeId}\r\nAND (ml2.currency_code = \"${currencyId}\" or \"-1\" = \"${currencyId}\")) curs) periods\r\n\r\n\r\nLEFT JOIN /* table of aging periods per currency with gaps if no applicable loans */\r\n(SELECT \r\n  	z.currency, z.arrPeriod, \r\n	COUNT(z.loanId) as loanId, SUM(z.principal) as principal, SUM(z.interest) as interest, \r\n	SUM(z.prinPaid) as prinPaid, SUM(z.intPaid) as intPaid, \r\n	SUM(z.prinOverdue) as prinOverdue, SUM(z.intOverdue) as intOverdue\r\nFROM\r\n	/*derived table just used to get arrPeriod value (was much slower to\r\n	duplicate calc of minOverdueDate in inner query)\r\nmight not be now with derived fields but didn’t check */\r\n	(SELECT x.loanId, x.currency, x.principal, x.interest, x.prinPaid, x.intPaid, x.prinOverdue, x.intOverdue,\r\n		IF(DATEDIFF(CURDATE(), minOverdueDate)<1, \'On Schedule\', \r\n		IF(DATEDIFF(CURDATE(), minOverdueDate)<31, \'0 - 30\', \r\n		IF(DATEDIFF(CURDATE(), minOverdueDate)<61, \'30 - 60\', \r\n		IF(DATEDIFF(CURDATE(), minOverdueDate)<91, \'60 - 90\', \r\n		IF(DATEDIFF(CURDATE(), minOverdueDate)<181, \'90 - 180\', \r\n		IF(DATEDIFF(CURDATE(), minOverdueDate)<361, \'180 - 360\', \r\n				 \'> 360\')))))) AS arrPeriod\r\n\r\n	FROM /* get the individual loan details */\r\n		(SELECT ml.id AS loanId, ml.currency_code as currency,\r\n   			ml.principal_disbursed_derived as principal, \r\n			   ml.interest_charged_derived as interest, \r\n   			ml.principal_repaid_derived as prinPaid, \r\n			   ml.interest_repaid_derived intPaid,\r\n\r\n			   laa.principal_overdue_derived as prinOverdue,\r\n			   laa.interest_overdue_derived as intOverdue,\r\n\r\n			   IFNULL(laa.overdue_since_date_derived, curdate()) as minOverdueDate\r\n			  \r\n  		FROM m_office mo\r\n   		INNER JOIN m_office ounder ON ounder.hierarchy \r\n				LIKE CONCAT(mo.hierarchy, \'%\')\r\nAND ounder.hierarchy like CONCAT(\'${currentUserHierarchy}\', \'%\')\r\n   		INNER JOIN m_client mc ON mc.office_id=ounder.id\r\n   		INNER JOIN m_loan ml ON ml.client_id = mc.id\r\n		   LEFT JOIN m_loan_arrears_aging laa on laa.loan_id = ml.id\r\n		WHERE ml.loan_status_id=300 /* active */\r\n     		AND mo.id=${officeId}\r\n     AND (ml.currency_code = \"${currencyId}\" or \"-1\" = \"${currencyId}\")\r\n  		GROUP BY ml.id) x\r\n	) z \r\nGROUP BY z.currency, z.arrPeriod ) ars ON ars.arrPeriod=periods.period_no and ars.currency = periods.currency\r\nORDER BY periods.currency, periods.pid', 'Loan amount in arrears by branch', 1, 1, 0),
(91, 'Loan Account Schedule', 'Pentaho', NULL, 'Loan', NULL, NULL, 1, 0, 0),
(92, 'Branch Expected Cash Flow', 'Pentaho', NULL, 'Loan', NULL, NULL, 1, 1, 0),
(93, 'Expected Payments By Date - Basic', 'Table', NULL, 'Loan', 'SELECT \r\n      ounder.name \'Office\', \r\n      IFNULL(ms.display_name,\'-\') \'Loan Officer\',\r\n	  mc.account_no \'Client Account Number\',\r\n	  mc.display_name \'Name\',\r\n	  mp.name \'Product\',\r\n	  ml.account_no \'Loan Account Number\',\r\n	  mr.duedate \'Due Date\',\r\n	  mr.installment \'Installment\',\r\n	  cu.display_symbol \'Currency\',\r\n	  mr.principal_amount- IFNULL(mr.principal_completed_derived,0) \'Principal Due\',\r\n	  mr.interest_amount- IFNULL(IFNULL(mr.interest_completed_derived,mr.interest_waived_derived),0) \'Interest Due\', \r\n	  IFNULL(mr.fee_charges_amount,0)- IFNULL(IFNULL(mr.fee_charges_completed_derived,mr.fee_charges_waived_derived),0) \'Fees Due\', \r\n	  IFNULL(mr.penalty_charges_amount,0)- IFNULL(IFNULL(mr.penalty_charges_completed_derived,mr.penalty_charges_waived_derived),0) \'Penalty Due\',\r\n      (mr.principal_amount- IFNULL(mr.principal_completed_derived,0)) +\r\n       (mr.interest_amount- IFNULL(IFNULL(mr.interest_completed_derived,mr.interest_waived_derived),0)) + \r\n       (IFNULL(mr.fee_charges_amount,0)- IFNULL(IFNULL(mr.fee_charges_completed_derived,mr.fee_charges_waived_derived),0)) + \r\n       (IFNULL(mr.penalty_charges_amount,0)- IFNULL(IFNULL(mr.penalty_charges_completed_derived,mr.penalty_charges_waived_derived),0)) \'Total Due\', \r\n     mlaa.total_overdue_derived \'Total Overdue\'\r\n										 \r\n FROM m_office mo\r\n  JOIN m_office ounder ON ounder.hierarchy LIKE CONCAT(mo.hierarchy, \'%\')\r\n  \r\n  AND ounder.hierarchy like CONCAT(\'${currentUserHierarchy}\', \'%\')\r\n	\r\n  LEFT JOIN m_client mc ON mc.office_id=ounder.id\r\n  LEFT JOIN m_loan ml ON ml.client_id=mc.id AND ml.loan_status_id=300\r\n  LEFT JOIN m_loan_arrears_aging mlaa ON mlaa.loan_id=ml.id\r\n  LEFT JOIN m_loan_repayment_schedule mr ON mr.loan_id=ml.id AND mr.completed_derived=0\r\n  LEFT JOIN m_product_loan mp ON mp.id=ml.product_id\r\n  LEFT JOIN m_staff ms ON ms.id=ml.loan_officer_id\r\n  LEFT JOIN m_currency cu ON cu.code=ml.currency_code\r\n WHERE mo.id=${officeId}\r\n AND (IFNULL(ml.loan_officer_id, -10) = \"${loanOfficerId}\" OR \"-1\" = \"${loanOfficerId}\")\r\n AND mr.duedate BETWEEN \'${startDate}\' AND \'${endDate}\'\r\n ORDER BY ounder.id,mr.duedate,ml.account_no', 'Test', 1, 1, 0),
(94, 'Expected Payments By Date - Formatted', 'Pentaho', NULL, 'Loan', NULL, NULL, 1, 1, 0),
(96, 'GroupSummaryCounts', 'Table', NULL, NULL, '\n/*\nActive Client is a client linked to the \'group\' via m_group_client\nand with an active \'status_enum\'.)\nActive Borrowers - Borrower may be a client or a \'group\'\n*/\nselect x.*\nfrom m_office o,\nm_group g,\n\n(select a.activeClients,\n(b.activeClientLoans + c.activeGroupLoans) as activeLoans,\nb.activeClientLoans, c.activeGroupLoans,\n(b.activeClientBorrowers + c.activeGroupBorrowers) as activeBorrowers,\nb.activeClientBorrowers, c.activeGroupBorrowers,\n(b.overdueClientLoans +  c.overdueGroupLoans) as overdueLoans,\nb.overdueClientLoans, c.overdueGroupLoans\nfrom\n(select count(*) as activeClients\nfrom m_group topgroup\njoin m_group g on g.hierarchy like concat(topgroup.hierarchy, \'%\')\njoin m_group_client gc on gc.group_id = g.id\njoin m_client c on c.id = gc.client_id\nwhere topgroup.id = ${groupId}\nand c.status_enum = 300) a,\n\n(select count(*) as activeClientLoans,\ncount(distinct(l.client_id)) as activeClientBorrowers,\nifnull(sum(if(laa.loan_id is not null, 1, 0)), 0) as overdueClientLoans\nfrom m_group topgroup\njoin m_group g on g.hierarchy like concat(topgroup.hierarchy, \'%\')\njoin m_loan l on l.group_id = g.id and l.client_id is not null\nleft join m_loan_arrears_aging laa on laa.loan_id = l.id\nwhere topgroup.id = ${groupId}\nand l.loan_status_id = 300) b,\n\n(select count(*) as activeGroupLoans,\ncount(distinct(l.group_id)) as activeGroupBorrowers,\nifnull(sum(if(laa.loan_id is not null, 1, 0)), 0) as overdueGroupLoans\nfrom m_group topgroup\njoin m_group g on g.hierarchy like concat(topgroup.hierarchy, \'%\')\njoin m_loan l on l.group_id = g.id and l.client_id is null\nleft join m_loan_arrears_aging laa on laa.loan_id = l.id\nwhere topgroup.id = ${groupId}\nand l.loan_status_id = 300) c\n) x\n\nwhere g.id = ${groupId}\nand o.id = g.office_id\nand o.hierarchy like concat(\'${currentUserHierarchy}\', \'%\')\n', 'Utility query for getting group summary count details for a group_id', 1, 0, 0),
(97, 'GroupSummaryAmounts', 'Table', NULL, NULL, '\nselect ifnull(cur.display_symbol, l.currency_code) as currency,\nifnull(sum(l.principal_disbursed_derived),0) as totalDisbursedAmount,\nifnull(sum(l.principal_outstanding_derived),0) as totalLoanOutstandingAmount,\ncount(laa.loan_id) as overdueLoans, ifnull(sum(laa.total_overdue_derived), 0) as totalLoanOverdueAmount\nfrom m_group topgroup\njoin m_office o on o.id = topgroup.office_id and o.hierarchy like concat(\'${currentUserHierarchy}\', \'%\')\njoin m_group g on g.hierarchy like concat(topgroup.hierarchy, \'%\')\njoin m_loan l on l.group_id = g.id\nleft join m_loan_arrears_aging laa on laa.loan_id = l.id\nleft join m_currency cur on cur.code = l.currency_code\nwhere topgroup.id = ${groupId}\nand l.disbursedon_date is not null\ngroup by l.currency_code\n', 'Utility query for getting group summary currency amount details for a group_id', 1, 0, 0),
(106, 'TxnRunningBalances', 'Table', NULL, 'Transaction', '\nselect date(\'${startDate}\') as \'Transaction Date\', \'Opening Balance\' as `Transaction Type`, null as Office,\n    null as \'Loan Officer\', null as `Loan Account No`, null as `Loan Product`, null as `Currency`,\n    null as `Client Account No`, null as Client,\n    null as Amount, null as Principal, null as Interest,\n@totalOutstandingPrincipal :=\nifnull(round(sum(\n    if (txn.transaction_type_enum = 1 /* disbursement */,\n        ifnull(txn.amount,0.00),\n        ifnull(txn.principal_portion_derived,0.00) * -1))\n            ,2),0.00)  as \'Outstanding Principal\',\n\n@totalInterestIncome :=\nifnull(round(sum(\n    if (txn.transaction_type_enum in (2,5,8) /* repayment, repayment at disbursal, recovery repayment */,\n        ifnull(txn.interest_portion_derived,0.00),\n        0))\n            ,2),0.00) as \'Interest Income\',\n\n@totalWriteOff :=\nifnull(round(sum(\n    if (txn.transaction_type_enum = 6 /* write-off */,\n        ifnull(txn.principal_portion_derived,0.00),\n        0))\n            ,2),0.00) as \'Principal Write Off\'\nfrom m_office o\njoin m_office ounder on ounder.hierarchy like concat(o.hierarchy, \'%\')\n                          and ounder.hierarchy like concat(\'${currentUserHierarchy}\', \'%\')\njoin m_client c on c.office_id = ounder.id\njoin m_loan l on l.client_id = c.id\njoin m_product_loan lp on lp.id = l.product_id\njoin m_loan_transaction txn on txn.loan_id = l.id\nleft join m_currency cur on cur.code = l.currency_code\nwhere txn.is_reversed = false\nand txn.transaction_type_enum not in (10,11)\nand o.id = ${officeId}\nand txn.transaction_date < date(\'${startDate}\')\n\nunion all\n\nselect x.`Transaction Date`, x.`Transaction Type`, x.Office, x.`Loan Officer`, x.`Loan Account No`, x.`Loan Product`, x.`Currency`,\n    x.`Client Account No`, x.Client, x.Amount, x.Principal, x.Interest,\ncast(round(\n    if (x.transaction_type_enum = 1 /* disbursement */,\n        @totalOutstandingPrincipal := @totalOutstandingPrincipal + x.`Amount`,\n        @totalOutstandingPrincipal := @totalOutstandingPrincipal - x.`Principal`)\n            ,2) as decimal(19,2)) as \'Outstanding Principal\',\ncast(round(\n    if (x.transaction_type_enum in (2,5,8) /* repayment, repayment at disbursal, recovery repayment */,\n        @totalInterestIncome := @totalInterestIncome + x.`Interest`,\n        @totalInterestIncome)\n            ,2) as decimal(19,2)) as \'Interest Income\',\ncast(round(\n    if (x.transaction_type_enum = 6 /* write-off */,\n        @totalWriteOff := @totalWriteOff + x.`Principal`,\n        @totalWriteOff)\n            ,2) as decimal(19,2)) as \'Principal Write Off\'\nfrom\n(select txn.transaction_type_enum, txn.id as txn_id, txn.transaction_date as \'Transaction Date\',\ncast(\n    ifnull(re.enum_message_property, concat(\'Unknown Transaction Type Value: \' , txn.transaction_type_enum))\n    as char) as \'Transaction Type\',\nounder.`name` as Office, lo.display_name as \'Loan Officer\',\nl.account_no  as \'Loan Account No\', lp.`name` as \'Loan Product\',\nifnull(cur.display_symbol, l.currency_code) as Currency,\nc.account_no as \'Client Account No\', c.display_name as \'Client\',\nifnull(txn.amount,0.00) as Amount,\nifnull(txn.principal_portion_derived,0.00) as Principal,\nifnull(txn.interest_portion_derived,0.00) as Interest\nfrom m_office o\njoin m_office ounder on ounder.hierarchy like concat(o.hierarchy, \'%\')\n                          and ounder.hierarchy like concat(\'${currentUserHierarchy}\', \'%\')\njoin m_client c on c.office_id = ounder.id\njoin m_loan l on l.client_id = c.id\nleft join m_staff lo on lo.id = l.loan_officer_id\njoin m_product_loan lp on lp.id = l.product_id\njoin m_loan_transaction txn on txn.loan_id = l.id\nleft join m_currency cur on cur.code = l.currency_code\nleft join r_enum_value re on re.enum_name = \'transaction_type_enum\'\n                        and re.enum_id = txn.transaction_type_enum\nwhere txn.is_reversed = false\nand txn.transaction_type_enum not in (10,11)\nand (ifnull(l.loan_officer_id, -10) = \'${loanOfficerId}\' or \'-1\' = \'${loanOfficerId}\')\nand o.id = ${officeId}\nand txn.transaction_date >= date(\'${startDate}\')\nand txn.transaction_date <= date(\'${endDate}\')\norder by txn.transaction_date, txn.id) x\n', 'Running Balance Txn report for Individual Lending.\nSuitable for small MFI\'s.  Larger could use it using the branch or other parameters.\nBasically, suck it and see if its quick enough for you out-of-te box or whether it needs performance work in your situation.\n', 0, 0, 0),
(107, 'FieldAgentStats', 'Table', NULL, 'Quipo', '\nselect ifnull(cur.display_symbol, l.currency_code) as Currency,\n/*This query will return more than one entry if more than one currency is used */\ncount(distinct(c.id)) as activeClients, count(*) as activeLoans,\nsum(l.principal_disbursed_derived) as disbursedAmount,\nsum(l.principal_outstanding_derived) as loanOutstandingAmount,\nround((sum(l.principal_outstanding_derived) * 100) /  sum(l.principal_disbursed_derived),2) as loanOutstandingPC,\nsum(ifnull(lpa.principal_in_advance_derived,0.0)) as LoanPaidInAdvance,\nsum(\n    if(date_sub(curdate(), interval 28 day) > ifnull(laa.overdue_since_date_derived, curdate()),\n        l.principal_outstanding_derived,0)) as portfolioAtRisk,\n\nround((sum(\n    if(date_sub(curdate(), interval 28 day) > ifnull(laa.overdue_since_date_derived, curdate()),\n        l.principal_outstanding_derived,0)) * 100) / sum(l.principal_outstanding_derived), 2) as portfolioAtRiskPC,\n\ncount(distinct(\n        if(date_sub(curdate(), interval 28 day) > ifnull(laa.overdue_since_date_derived, curdate()),\n            c.id,null))) as clientsInDefault,\nround((count(distinct(\n        if(date_sub(curdate(), interval 28 day) > ifnull(laa.overdue_since_date_derived, curdate()),\n            c.id,null))) * 100) / count(distinct(c.id)),2) as clientsInDefaultPC,\n(sum(l.principal_disbursed_derived) / count(*))  as averageLoanAmount\nfrom m_staff fa\njoin m_office o on o.id = fa.office_id\n            and o.hierarchy like concat(\'${currentUserHierarchy}\', \'%\')\njoin m_group pgm on pgm.staff_id = fa.id\njoin m_loan l on l.group_id = pgm.id and l.client_id is not null\nleft join m_currency cur on cur.code = l.currency_code\nleft join m_loan_arrears_aging laa on laa.loan_id = l.id\nleft join m_loan_paid_in_advance lpa on lpa.loan_id = l.id\njoin m_client c on c.id = l.client_id\nwhere fa.id = ${staffId}\nand l.loan_status_id = 300\ngroup  by l.currency_code\n', 'Field Agent Statistics', 0, 0, 0),
(108, 'FieldAgentPrograms', 'Table', NULL, 'Quipo', '\nselect pgm.id, pgm.display_name as `name`, sts.enum_message_property as status\n from m_group pgm\n join m_office o on o.id = pgm.office_id\n            and o.hierarchy like concat(\'${currentUserHierarchy}\', \'%\')\n left join r_enum_value sts on sts.enum_name = \'status_enum\' and sts.enum_id = pgm.status_enum\n where pgm.staff_id = ${staffId}\n', 'List of Field Agent Programs', 0, 0, 0),
(109, 'ProgramDetails', 'Table', NULL, 'Quipo', '\n select l.id as loanId, l.account_no as loanAccountNo, c.id as clientId, c.account_no as clientAccountNo,\n pgm.display_name as programName,\n\n(select count(*)\nfrom m_loan cy\nwhere cy.group_id = pgm.id and cy.client_id =c.id\nand cy.disbursedon_date <= l.disbursedon_date) as loanCycleNo,\n\nc.display_name as clientDisplayName,\n ifnull(cur.display_symbol, l.currency_code) as Currency,\nifnull(l.principal_repaid_derived,0.0) as loanRepaidAmount,\nifnull(l.principal_outstanding_derived, 0.0) as loanOutstandingAmount,\nifnull(lpa.principal_in_advance_derived,0.0) as LoanPaidInAdvance,\n\nifnull(laa.principal_overdue_derived, 0.0) as loanInArrearsAmount,\nif(ifnull(laa.principal_overdue_derived, 0.00) > 0, \'Yes\', \'No\') as inDefault,\n\nif(date_sub(curdate(), interval 28 day) > ifnull(laa.overdue_since_date_derived, curdate()),\n        l.principal_outstanding_derived,0)  as portfolioAtRisk\n\n from m_group pgm\n join m_office o on o.id = pgm.office_id\n            and o.hierarchy like concat(\'${currentUserHierarchy}\', \'%\')\n join m_loan l on l.group_id = pgm.id and l.client_id is not null\n left join m_currency cur on cur.code = l.currency_code\n join m_client c on c.id = l.client_id\n left join m_loan_arrears_aging laa on laa.loan_id = l.id\n left join m_loan_paid_in_advance lpa on lpa.loan_id = l.id\n where pgm.id = ${programId}\n and l.loan_status_id = 300\norder by c.display_name, l.account_no\n\n', 'List of Loans in a Program', 0, 0, 0),
(110, 'ChildrenStaffList', 'Table', NULL, 'Quipo', '\n select s.id, s.display_name,\ns.firstname, s.lastname, s.organisational_role_enum,\ns.organisational_role_parent_staff_id,\nsp.display_name as `organisational_role_parent_staff_display_name`\nfrom m_staff s\njoin m_staff sp on s.organisational_role_parent_staff_id = sp.id\nwhere s.organisational_role_parent_staff_id = ${staffId}\n', 'Get Next Level Down Staff', 0, 0, 0),
(111, 'CoordinatorStats', 'Table', NULL, 'Quipo', '\nselect ifnull(cur.display_symbol, l.currency_code) as Currency,\n/*This query will return more than one entry if more than one currency is used */\ncount(distinct(c.id)) as activeClients, count(*) as activeLoans,\nsum(l.principal_disbursed_derived) as disbursedAmount,\nsum(l.principal_outstanding_derived) as loanOutstandingAmount,\nround((sum(l.principal_outstanding_derived) * 100) /  sum(l.principal_disbursed_derived),2) as loanOutstandingPC,\nsum(ifnull(lpa.principal_in_advance_derived,0.0)) as LoanPaidInAdvance,\nsum(\n    if(date_sub(curdate(), interval 28 day) > ifnull(laa.overdue_since_date_derived, curdate()),\n        l.principal_outstanding_derived,0)) as portfolioAtRisk,\n\nround((sum(\n    if(date_sub(curdate(), interval 28 day) > ifnull(laa.overdue_since_date_derived, curdate()),\n        l.principal_outstanding_derived,0)) * 100) / sum(l.principal_outstanding_derived), 2) as portfolioAtRiskPC,\n\ncount(distinct(\n        if(date_sub(curdate(), interval 28 day) > ifnull(laa.overdue_since_date_derived, curdate()),\n            c.id,null))) as clientsInDefault,\nround((count(distinct(\n        if(date_sub(curdate(), interval 28 day) > ifnull(laa.overdue_since_date_derived, curdate()),\n            c.id,null))) * 100) / count(distinct(c.id)),2) as clientsInDefaultPC,\n(sum(l.principal_disbursed_derived) / count(*))  as averageLoanAmount\nfrom m_staff coord\njoin m_staff fa on fa.organisational_role_parent_staff_id = coord.id\njoin m_office o on o.id = fa.office_id\n            and o.hierarchy like concat(\'${currentUserHierarchy}\', \'%\')\njoin m_group pgm on pgm.staff_id = fa.id\njoin m_loan l on l.group_id = pgm.id and l.client_id is not null\nleft join m_currency cur on cur.code = l.currency_code\nleft join m_loan_arrears_aging laa on laa.loan_id = l.id\nleft join m_loan_paid_in_advance lpa on lpa.loan_id = l.id\njoin m_client c on c.id = l.client_id\nwhere coord.id = ${staffId}\nand l.loan_status_id = 300\ngroup  by l.currency_code\n', 'Coordinator Statistics', 0, 0, 0),
(112, 'BranchManagerStats', 'Table', NULL, 'Quipo', '\nselect ifnull(cur.display_symbol, l.currency_code) as Currency,\n/*This query will return more than one entry if more than one currency is used */\ncount(distinct(c.id)) as activeClients, count(*) as activeLoans,\nsum(l.principal_disbursed_derived) as disbursedAmount,\nsum(l.principal_outstanding_derived) as loanOutstandingAmount,\nround((sum(l.principal_outstanding_derived) * 100) /  sum(l.principal_disbursed_derived),2) as loanOutstandingPC,\nsum(ifnull(lpa.principal_in_advance_derived,0.0)) as LoanPaidInAdvance,\nsum(\n    if(date_sub(curdate(), interval 28 day) > ifnull(laa.overdue_since_date_derived, curdate()),\n        l.principal_outstanding_derived,0)) as portfolioAtRisk,\n\nround((sum(\n    if(date_sub(curdate(), interval 28 day) > ifnull(laa.overdue_since_date_derived, curdate()),\n        l.principal_outstanding_derived,0)) * 100) / sum(l.principal_outstanding_derived), 2) as portfolioAtRiskPC,\n\ncount(distinct(\n        if(date_sub(curdate(), interval 28 day) > ifnull(laa.overdue_since_date_derived, curdate()),\n            c.id,null))) as clientsInDefault,\nround((count(distinct(\n        if(date_sub(curdate(), interval 28 day) > ifnull(laa.overdue_since_date_derived, curdate()),\n            c.id,null))) * 100) / count(distinct(c.id)),2) as clientsInDefaultPC,\n(sum(l.principal_disbursed_derived) / count(*))  as averageLoanAmount\nfrom m_staff bm\njoin m_staff coord on coord.organisational_role_parent_staff_id = bm.id\njoin m_staff fa on fa.organisational_role_parent_staff_id = coord.id\njoin m_office o on o.id = fa.office_id\n            and o.hierarchy like concat(\'${currentUserHierarchy}\', \'%\')\njoin m_group pgm on pgm.staff_id = fa.id\njoin m_loan l on l.group_id = pgm.id and l.client_id is not null\nleft join m_currency cur on cur.code = l.currency_code\nleft join m_loan_arrears_aging laa on laa.loan_id = l.id\nleft join m_loan_paid_in_advance lpa on lpa.loan_id = l.id\njoin m_client c on c.id = l.client_id\nwhere bm.id = ${staffId}\nand l.loan_status_id = 300\ngroup  by l.currency_code\n', 'Branch Manager Statistics', 0, 0, 0),
(113, 'ProgramDirectorStats', 'Table', NULL, 'Quipo', '\nselect ifnull(cur.display_symbol, l.currency_code) as Currency,\n/*This query will return more than one entry if more than one currency is used */\ncount(distinct(c.id)) as activeClients, count(*) as activeLoans,\nsum(l.principal_disbursed_derived) as disbursedAmount,\nsum(l.principal_outstanding_derived) as loanOutstandingAmount,\nround((sum(l.principal_outstanding_derived) * 100) /  sum(l.principal_disbursed_derived),2) as loanOutstandingPC,\nsum(ifnull(lpa.principal_in_advance_derived,0.0)) as LoanPaidInAdvance,\nsum(\n    if(date_sub(curdate(), interval 28 day) > ifnull(laa.overdue_since_date_derived, curdate()),\n        l.principal_outstanding_derived,0)) as portfolioAtRisk,\n\nround((sum(\n    if(date_sub(curdate(), interval 28 day) > ifnull(laa.overdue_since_date_derived, curdate()),\n        l.principal_outstanding_derived,0)) * 100) / sum(l.principal_outstanding_derived), 2) as portfolioAtRiskPC,\n\ncount(distinct(\n        if(date_sub(curdate(), interval 28 day) > ifnull(laa.overdue_since_date_derived, curdate()),\n            c.id,null))) as clientsInDefault,\nround((count(distinct(\n        if(date_sub(curdate(), interval 28 day) > ifnull(laa.overdue_since_date_derived, curdate()),\n            c.id,null))) * 100) / count(distinct(c.id)),2) as clientsInDefaultPC,\n(sum(l.principal_disbursed_derived) / count(*))  as averageLoanAmount\nfrom m_staff pd\njoin m_staff bm on bm.organisational_role_parent_staff_id = pd.id\njoin m_staff coord on coord.organisational_role_parent_staff_id = bm.id\njoin m_staff fa on fa.organisational_role_parent_staff_id = coord.id\njoin m_office o on o.id = fa.office_id\n            and o.hierarchy like concat(\'${currentUserHierarchy}\', \'%\')\njoin m_group pgm on pgm.staff_id = fa.id\njoin m_loan l on l.group_id = pgm.id and l.client_id is not null\nleft join m_currency cur on cur.code = l.currency_code\nleft join m_loan_arrears_aging laa on laa.loan_id = l.id\nleft join m_loan_paid_in_advance lpa on lpa.loan_id = l.id\njoin m_client c on c.id = l.client_id\nwhere pd.id = ${staffId}\nand l.loan_status_id = 300\ngroup  by l.currency_code\n', 'Program DirectorStatistics', 0, 0, 0),
(114, 'ProgramStats', 'Table', NULL, 'Quipo', '\nselect ifnull(cur.display_symbol, l.currency_code) as Currency,\n/*This query will return more than one entry if more than one currency is used */\ncount(distinct(c.id)) as activeClients, count(*) as activeLoans,\nsum(l.principal_disbursed_derived) as disbursedAmount,\nsum(l.principal_outstanding_derived) as loanOutstandingAmount,\nround((sum(l.principal_outstanding_derived) * 100) /  sum(l.principal_disbursed_derived),2) as loanOutstandingPC,\nsum(ifnull(lpa.principal_in_advance_derived,0.0)) as LoanPaidInAdvance,\nsum(\n    if(date_sub(curdate(), interval 28 day) > ifnull(laa.overdue_since_date_derived, curdate()),\n        l.principal_outstanding_derived,0)) as portfolioAtRisk,\n\nround((sum(\n    if(date_sub(curdate(), interval 28 day) > ifnull(laa.overdue_since_date_derived, curdate()),\n        l.principal_outstanding_derived,0)) * 100) / sum(l.principal_outstanding_derived), 2) as portfolioAtRiskPC,\n\ncount(distinct(\n        if(date_sub(curdate(), interval 28 day) > ifnull(laa.overdue_since_date_derived, curdate()),\n            c.id,null))) as clientsInDefault,\nround((count(distinct(\n        if(date_sub(curdate(), interval 28 day) > ifnull(laa.overdue_since_date_derived, curdate()),\n            c.id,null))) * 100) / count(distinct(c.id)),2) as clientsInDefaultPC,\n(sum(l.principal_disbursed_derived) / count(*))  as averageLoanAmount\nfrom m_group pgm\njoin m_office o on o.id = pgm.office_id\n            and o.hierarchy like concat(\'${currentUserHierarchy}\', \'%\')\njoin m_loan l on l.group_id = pgm.id and l.client_id is not null\nleft join m_currency cur on cur.code = l.currency_code\nleft join m_loan_arrears_aging laa on laa.loan_id = l.id\nleft join m_loan_paid_in_advance lpa on lpa.loan_id = l.id\njoin m_client c on c.id = l.client_id\nwhere pgm.id = ${programId}\nand l.loan_status_id = 300\ngroup  by l.currency_code\n', 'Program Statistics', 0, 0, 0),
(115, 'ClientSummary ', 'Table', NULL, NULL, 'SELECT x.* FROM m_client c, m_office o, \n(\n       SELECT a.loanCycle, a.activeLoans, b.lastLoanAmount, d.activeSavings, d.totalSavings FROM \n	(SELECT IFNULL(MAX(l.loan_counter),0) AS loanCycle, COUNT(l.id) AS activeLoans FROM m_loan l WHERE l.loan_status_id=300 AND l.client_id=${clientId}) a, \n	(SELECT count(l.id), IFNULL(l.principal_amount,0) AS \'lastLoanAmount\' FROM m_loan l WHERE l.client_id=${clientId} AND l.disbursedon_date = (SELECT IFNULL(MAX(disbursedon_date),NOW()) FROM m_loan where client_id=${clientId} and loan_status_id=300) group by l.principal_amount) b, \n	(SELECT COUNT(s.id) AS \'activeSavings\', IFNULL(SUM(s.account_balance_derived),0) AS \'totalSavings\' FROM m_savings_account s WHERE s.status_enum=300 AND s.client_id=${clientId}) d\n) x\nWHERE c.id=${clientId} AND o.id = c.office_id AND o.hierarchy LIKE CONCAT(\'${currentUserHierarchy}\', \'%\')', 'Utility query for getting the client summary details', 1, 0, 0),
(116, 'LoanCyclePerProduct', 'Table', NULL, NULL, 'SELECT lp.name AS \'productName\', MAX(l.loan_product_counter) AS \'loanProductCycle\' FROM m_loan l JOIN m_product_loan lp ON l.product_id=lp.id WHERE lp.include_in_borrower_cycle=1 AND l.loan_product_counter IS NOT NULL AND l.client_id=${clientId} GROUP BY l.product_id', 'Utility query for getting the client loan cycle details', 1, 0, 0),
(117, 'GroupSavingSummary', 'Table', NULL, NULL, 'select ifnull(cur.display_symbol, sa.currency_code) as currency,\ncount(sa.id) as totalSavingAccounts, ifnull(sum(sa.account_balance_derived),0) as totalSavings\nfrom m_group topgroup\njoin m_office o on o.id = topgroup.office_id and o.hierarchy like concat(\'${currentUserHierarchy}\', \'%\')\njoin m_group g on g.hierarchy like concat(topgroup.hierarchy, \'%\')\njoin m_savings_account sa on sa.group_id = g.id\nleft join m_currency cur on cur.code = sa.currency_code\nwhere topgroup.id = ${groupId}\nand sa.activatedon_date is not null\ngroup by sa.currency_code', 'Utility query for getting group or center saving summary details for a group_id', 1, 0, 0),
(118, 'Savings Transactions', 'Pentaho', NULL, 'Savings', NULL, NULL, 0, 1, 0),
(119, 'Client Savings Summary', 'Pentaho', NULL, 'Savings', NULL, NULL, 0, 1, 0),
(120, 'Active Loans - Details(Pentaho)', 'Pentaho', NULL, 'Loan', '(NULL)', '(NULL)', 1, 1, 0),
(121, 'Active Loans - Summary(Pentaho)', 'Pentaho', NULL, 'Loan', '(NULL)', '(NULL)', 1, 1, 0),
(122, 'Active Loans by Disbursal Period(Pentaho)', 'Pentaho', NULL, 'Loan', '(NULL)', '(NULL)', 1, 1, 0),
(123, 'Active Loans in last installment Summary(Pentaho)', 'Pentaho', NULL, 'Loan', '(NULL)', '(NULL)', 1, 1, 0),
(124, 'Active Loans in last installment(Pentaho)', 'Pentaho', NULL, 'Loan', '(NULL)', '(NULL)', 1, 1, 0),
(125, 'Active Loans Passed Final Maturity Summary(Pentaho)', 'Pentaho', NULL, 'Loan', '(NULL)', '(NULL)', 1, 1, 0),
(126, 'Active Loans Passed Final Maturity(Pentaho)', 'Pentaho', NULL, 'Loan', '(NULL)', '(NULL)', 1, 1, 0),
(127, 'Aging Detail(Pentaho)', 'Pentaho', NULL, 'Loan', '(NULL)', '(NULL)', 1, 1, 0),
(128, 'Aging Summary (Arrears in Months)(Pentaho)', 'Pentaho', NULL, 'Loan', '(NULL)', '(NULL)', 1, 1, 0),
(129, 'Aging Summary (Arrears in Weeks)(Pentaho)', 'Pentaho', NULL, 'Loan', '(NULL)', '(NULL)', 1, 1, 0),
(130, 'Client Listing(Pentaho)', 'Pentaho', NULL, 'Client', '(NULL)', '(NULL)', 1, 1, 0),
(131, 'Client Loans Listing(Pentaho)', 'Pentaho', NULL, 'Client', '(NULL)', '(NULL)', 1, 1, 0),
(132, 'Expected Payments By Date - Basic(Pentaho)', 'Pentaho', NULL, 'Loan', '(NULL)', '(NULL)', 1, 1, 0),
(133, 'Funds Disbursed Between Dates Summary by Office(Pentaho)', 'Pentaho', NULL, 'Fund', '(NULL)', '(NULL)', 1, 1, 0),
(134, 'Funds Disbursed Between Dates Summary(Pentaho)', 'Pentaho', NULL, 'Fund', '(NULL)', '(NULL)', 1, 1, 0),
(135, 'Loans Awaiting Disbursal Summary by Month(Pentaho)', 'Pentaho', NULL, 'Loan', '(NULL)', '(NULL)', 1, 1, 0),
(136, 'Loans Awaiting Disbursal Summary(Pentaho)', 'Pentaho', NULL, 'Loan', '(NULL)', '(NULL)', 1, 1, 0),
(137, 'Loans Awaiting Disbursal(Pentaho)', 'Pentaho', NULL, 'Loan', '(NULL)', '(NULL)', 1, 1, 0),
(138, 'Loans Pending Approval(Pentaho)', 'Pentaho', NULL, 'Loan', '(NULL)', '(NULL)', 1, 1, 0),
(139, 'Obligation Met Loans Details(Pentaho)', 'Pentaho', NULL, 'Loan', '(NULL)', '(NULL)', 1, 1, 0),
(140, 'Obligation Met Loans Summary(Pentaho)', 'Pentaho', NULL, 'Loan', '(NULL)', '(NULL)', 1, 1, 0),
(141, 'Portfolio at Risk by Branch(Pentaho)', 'Pentaho', NULL, 'Loan', '(NULL)', '(NULL)', 1, 1, 0),
(142, 'Portfolio at Risk(Pentaho)', 'Pentaho', NULL, 'Loan', '(NULL)', '(NULL)', 1, 1, 0),
(143, 'Rescheduled Loans(Pentaho)', 'Pentaho', NULL, 'Loan', '(NULL)', '(NULL)', 1, 1, 0),
(144, 'TxnRunningBalances(Pentaho)', 'Pentaho', NULL, 'Transaction', '(NULL)', '(NULL)', 1, 1, 0),
(145, 'Written-Off Loans(Pentaho)', 'Pentaho', NULL, 'Loan', '(NULL)', '(NULL)', 1, 1, 0),
(146, 'Client Saving Transactions', 'Pentaho', NULL, 'Savings', NULL, NULL, 0, 0, 0),
(147, 'Client Loan Account Schedule', 'Pentaho', NULL, 'Loan', NULL, NULL, 0, 0, 0),
(148, 'GroupNamesByStaff', 'Table', '', '', 'Select gr.id as id, gr.display_name as name from m_group gr where gr.level_id=1 and gr.staff_id = ${staffId}', '', 1, 0, 0),
(149, 'ClientTrendsByDay', 'Table', '', 'Client', 'SELECT 	COUNT(cl.id) AS count, \n		cl.activation_date AS days\nFROM m_office of \n	LEFT JOIN m_client cl on of.id = cl.office_id\nWHERE of.hierarchy like concat((select ino.hierarchy from m_office ino where ino.id = ${officeId}),\"%\" ) \n	AND (cl.activation_date BETWEEN DATE_SUB(CURDATE(), INTERVAL 12 DAY) AND DATE(NOW()- INTERVAL 1 DAY))\nGROUP BY days', 'Retrieves the number of clients joined in last 12 days', 1, 0, 0),
(150, 'ClientTrendsByWeek', 'Table', '', 'Client', 'SELECT 	COUNT(cl.id) AS count, \n		WEEK(cl.activation_date) AS Weeks\nFROM m_office of \n	LEFT JOIN m_client cl on of.id = cl.office_id\nWHERE of.hierarchy like concat((select ino.hierarchy from m_office ino where ino.id = ${officeId}),\"%\" ) \n	AND (cl.activation_date BETWEEN DATE_SUB(CURDATE(), INTERVAL 12 WEEK) AND DATE(NOW()))\nGROUP BY Weeks', '', 1, 0, 0),
(151, 'ClientTrendsByMonth', 'Table', '', 'Client', 'SELECT 	COUNT(cl.id) AS count, \n		MONTHNAME(cl.activation_date) AS Months\nFROM m_office of \n	LEFT JOIN m_client cl on of.id = cl.office_id\nWHERE of.hierarchy like concat((select ino.hierarchy from m_office ino where ino.id = ${officeId}),\"%\" ) \n	AND (cl.activation_date BETWEEN DATE_SUB(CURDATE(), INTERVAL 12 MONTH) AND DATE(NOW()))\nGROUP BY Months', '', 1, 0, 0),
(152, 'LoanTrendsByDay', 'Table', '', 'Loan', 'SELECT 	COUNT(ln.id) AS lcount, \n		ln.disbursedon_date AS days\nFROM m_office of \n	LEFT JOIN m_client cl on of.id = cl.office_id\n	LEFT JOIN m_loan ln on cl.id = ln.client_id\nWHERE of.hierarchy like concat((select ino.hierarchy from m_office ino where ino.id = ${officeId}),\"%\" ) \n	AND (ln.disbursedon_date BETWEEN DATE_SUB(CURDATE(), INTERVAL 12 DAY) AND DATE(NOW()- INTERVAL 1 DAY))\nGROUP BY days', 'Retrieves Number of loans disbursed for last 12 days', 1, 0, 0),
(153, 'LoanTrendsByWeek', 'Table', '', 'Loan', 'SELECT 	COUNT(ln.id) AS lcount, \n		WEEK(ln.disbursedon_date) AS Weeks\nFROM m_office of \n	LEFT JOIN m_client cl on of.id = cl.office_id\n	LEFT JOIN m_loan ln on cl.id = ln.client_id\nWHERE of.hierarchy like concat((select ino.hierarchy from m_office ino where ino.id = ${officeId}),\"%\" ) \n	AND (ln.disbursedon_date BETWEEN DATE_SUB(CURDATE(), INTERVAL 12 WEEK) AND DATE(NOW()))\nGROUP BY Weeks', '', 1, 0, 0),
(154, 'LoanTrendsByMonth', 'Table', '', 'Loan', 'SELECT 	COUNT(ln.id) AS lcount, \n		MONTHNAME(ln.disbursedon_date) AS Months\nFROM m_office of \n	LEFT JOIN m_client cl on of.id = cl.office_id\n	LEFT JOIN m_loan ln on cl.id = ln.client_id\nWHERE of.hierarchy like concat((select ino.hierarchy from m_office ino where ino.id = ${officeId}),\"%\" ) \n	AND (ln.disbursedon_date BETWEEN DATE_SUB(CURDATE(), INTERVAL 12 MONTH) AND DATE(NOW()))\nGROUP BY Months', '', 1, 0, 0);
INSERT INTO `stretchy_report` (`id`, `report_name`, `report_type`, `report_subtype`, `report_category`, `report_sql`, `description`, `core_report`, `use_report`, `self_service_user_report`) VALUES
(155, 'Demand_Vs_Collection', 'Table', '', 'Loan', 'select amount.AmountDue-amount.AmountPaid as AmountDue, amount.AmountPaid as AmountPaid from\n(SELECT \n(IFNULL(SUM(ls.principal_amount),0) - IFNULL(SUM(ls.principal_writtenoff_derived),0)\n + IFNULL(SUM(ls.interest_amount),0) - IFNULL(SUM(ls.interest_writtenoff_derived),0) \n - IFNULL(SUM(ls.interest_waived_derived),0)\n + IFNULL(SUM(ls.fee_charges_amount),0) - IFNULL(SUM(ls.fee_charges_writtenoff_derived),0) \n - IFNULL(SUM(ls.fee_charges_waived_derived),0)\n + IFNULL(SUM(ls.penalty_charges_amount),0) - IFNULL(SUM(ls.penalty_charges_writtenoff_derived),0) \n - IFNULL(SUM(ls.penalty_charges_waived_derived),0)\n) AS AmountDue, \n\n(IFNULL(SUM(ls.principal_completed_derived),0) - IFNULL(SUM(ls.principal_writtenoff_derived),0) + IFNULL(SUM(ls.interest_completed_derived),0) - IFNULL(SUM(ls.interest_writtenoff_derived),0) \n - IFNULL(SUM(ls.interest_waived_derived),0)\n + IFNULL(SUM(ls.fee_charges_completed_derived),0) - IFNULL(SUM(ls.fee_charges_writtenoff_derived),0) \n - IFNULL(SUM(ls.fee_charges_waived_derived),0)\n + IFNULL(SUM(ls.penalty_charges_completed_derived),0) - IFNULL(SUM(ls.penalty_charges_writtenoff_derived),0) \n - IFNULL(SUM(ls.penalty_charges_waived_derived),0)\n) AS AmountPaid\nFROM m_office of\nLEFT JOIN m_client cl ON of.id = cl.office_id\nLEFT JOIN m_loan ln ON cl.id = ln.client_id\nLEFT JOIN m_loan_repayment_schedule ls ON ln.id = ls.loan_id\nWHERE ls.duedate = DATE(NOW()) AND \n (of.hierarchy LIKE CONCAT((\nSELECT ino.hierarchy\nFROM m_office ino\nWHERE ino.id = ${officeId}),\"%\"))) as amount', 'Demand Vs Collection', 1, 0, 0),
(156, 'Disbursal_Vs_Awaitingdisbursal', 'Table', '', 'Loan', 'select awaitinddisbursal.amount-disbursedAmount.amount as amountToBeDisburse, disbursedAmount.amount as disbursedAmount from \n(\nSELECT 	COUNT(ln.id) AS noOfLoans, \n			IFNULL(SUM(ln.principal_amount),0) AS amount\nFROM \nm_office of\nLEFT JOIN m_client cl ON cl.office_id = of.id\nLEFT JOIN m_loan ln ON cl.id = ln.client_id\nWHERE \nln.expected_disbursedon_date = DATE(NOW()) AND \n(ln.loan_status_id=200 OR ln.loan_status_id=300) AND\n of.hierarchy like concat((select ino.hierarchy from m_office ino where ino.id = ${officeId}),\"%\" )\n) awaitinddisbursal,\n(\nSELECT 	COUNT(ltrxn.id) as count, \n			IFNULL(SUM(ltrxn.amount),0) as amount \nFROM \nm_office of\nLEFT JOIN m_client cl ON cl.office_id = of.id\nLEFT JOIN m_loan ln ON cl.id = ln.client_id\nLEFT JOIN m_loan_transaction ltrxn ON ln.id = ltrxn.loan_id\nWHERE \nltrxn.transaction_date = DATE(NOW()) AND \nltrxn.is_reversed = 0 AND\nltrxn.transaction_type_enum=1 AND\n of.hierarchy like concat((select ino.hierarchy from m_office ino where ino.id = ${officeId}),\"%\" ) \n) disbursedAmount', 'Disbursal_Vs_Awaitingdisbursal', 1, 0, 0),
(157, 'Savings Transaction Receipt', 'Pentaho', NULL, NULL, NULL, NULL, 0, 1, 0),
(158, 'Loan Transaction Receipt', 'Pentaho', NULL, NULL, NULL, NULL, 0, 1, 0),
(159, 'Staff Assignment History', 'Pentaho', NULL, NULL, NULL, NULL, 0, 1, 0),
(160, 'GeneralLedgerReport', 'Pentaho', NULL, 'Accounting', NULL, NULL, 0, 1, 0),
(161, 'Active Loan Summary per Branch', 'Pentaho', NULL, 'Loan', NULL, NULL, 0, 1, 0),
(162, 'Balance Outstanding', 'Pentaho', NULL, 'Loan', NULL, NULL, 0, 1, 0),
(163, 'Collection Report', 'Pentaho', NULL, 'Loan', NULL, NULL, 0, 1, 0),
(164, 'Disbursal Report', 'Pentaho', NULL, 'Loan', NULL, NULL, 0, 1, 0),
(165, 'Savings Accounts Dormancy Report', 'Table', NULL, 'Savings', 'select cl.display_name as \'Client Display Name\',\r\nsa.account_no as \'Account Number\',\r\ncl.mobile_no as \'Mobile Number\',\r\n@lastdate:=(select IFNULL(max(sat.transaction_date),sa.activatedon_date) \r\n            from m_savings_account_transaction as sat \r\n            where sat.is_reversed = 0 \r\n            and sat.transaction_type_enum in (1,2) \r\n            and sat.savings_account_id = sa.id) as \'Date of Last Activity\',\r\nDATEDIFF(now(), @lastdate) as \'Days Since Last Activity\'\r\nfrom m_savings_account as sa \r\ninner join m_savings_product as sp on (sa.product_id = sp.id and sp.is_dormancy_tracking_active = 1) \r\nleft join m_client as cl on sa.client_id = cl.id \r\nwhere sa.sub_status_enum = ${subStatus}\r\nand cl.office_id = ${officeId}', NULL, 1, 1, 0),
(166, 'Active Clients', 'SMS', 'NonTriggered', 'Client', 'SELECT c.id AS \"id\", \r\nc.firstname AS \"firstName\",\r\nc.middlename AS \"middleName\",\r\nc.lastname AS \"lastName\",\r\nc.display_name AS \"fullName\",\r\nc.mobile_no AS \"mobileNo\", CONCAT(REPEAT(\"..\", ((LENGTH(ounder.`hierarchy`) - LENGTH(\r\nREPLACE(ounder.`hierarchy`, \'.\', \'\')) - 1))), ounder.`name`) AS \"officeName\", \r\no.id AS \"officeNumber\"\r\nFROM m_office o\r\nJOIN m_office ounder ON ounder.hierarchy LIKE CONCAT(o.hierarchy, \'%\')\r\nJOIN m_client c ON c.office_id = ounder.id\r\nLEFT JOIN r_enum_value r ON r.enum_name = \'status_enum\' AND r.enum_id = c.status_enum\r\nWHERE o.id = ${officeId} AND c.status_enum = 300 AND (IFNULL(c.staff_id, -10) = ${loanOfficerId} OR \"-1\" = ${loanOfficerId})\r\nGROUP BY c.id\r\nORDER BY ounder.hierarchy, c.account_no', 'All clients with the status ‘Active’', 0, 1, 0),
(167, 'Prospective Clients', 'SMS', 'NonTriggered', 'Client', 'SELECT c.id AS \"id\", \r\nc.firstname AS \"firstName\",\r\nc.middlename AS \"middleName\",\r\nc.lastname AS \"lastName\",\r\nc.display_name AS \"fullName\",\r\nc.mobile_no AS \"mobileNo\", CONCAT(REPEAT(\"..\", ((LENGTH(ounder.`hierarchy`) - LENGTH(\r\nREPLACE(ounder.`hierarchy`, \'.\', \'\')) - 1))), ounder.`name`) AS \"officeName\", \r\no.id AS \"officeNumber\"\r\nFROM m_office o\r\nJOIN m_office ounder ON ounder.hierarchy LIKE CONCAT(o.hierarchy, \'%\')\r\nJOIN m_client c ON c.office_id = ounder.id\r\nLEFT JOIN r_enum_value r ON r.enum_name = \'status_enum\' AND r.enum_id = c.status_enum\r\nLEFT JOIN m_loan l ON l.client_id = c.id\r\nWHERE o.id = ${officeId} AND c.status_enum = 300 AND (IFNULL(c.staff_id, -10) = ${loanOfficerId} OR \"-1\" = ${loanOfficerId}) AND l.client_id IS NULL\r\nGROUP BY c.id\r\nORDER BY ounder.hierarchy, c.account_no', 'All clients with the status ‘Active’ who have never had a loan before', 0, 1, 0),
(168, 'Active Loan Clients', 'SMS', 'NonTriggered', 'Client', 'SELECT \r\nc.id AS \"id\", \r\nc.firstname AS \"firstName\",\r\nc.middlename AS \"middleName\",\r\nc.lastname AS \"lastName\",\r\nc.display_name AS \"fullName\",\r\nc.mobile_no AS \"mobileNo\", \r\nl.principal_amount AS \"loanAmount\", \r\n(IFNULL(l.principal_outstanding_derived, 0) + IFNULL(l.interest_outstanding_derived, 0) + IFNULL(l.fee_charges_outstanding_derived, 0) + IFNULL(l.penalty_charges_outstanding_derived, 0)) AS \"loanOutstanding\",\r\nl.principal_disbursed_derived AS \"loanDisbursed\",\r\nounder.id AS \"officeNumber\", \r\nl.account_no AS \"loanAccountId\", \r\ngua.lastname AS \"guarantorLastName\", COUNT(gua.id) AS \"numberOfGuarantors\",\r\ng.display_name AS \"groupName\"\r\n\r\nFROM m_office o\r\nJOIN m_office ounder ON ounder.hierarchy LIKE CONCAT(o.hierarchy, \'%\')\r\nJOIN m_client c ON c.office_id = ounder.id\r\nJOIN m_loan l ON l.client_id = c.id\r\nJOIN m_product_loan pl ON pl.id = l.product_id\r\nLEFT JOIN m_group_client gc ON gc.client_id = c.id\r\nLEFT JOIN m_group g ON g.id = gc.group_id\r\nLEFT JOIN m_staff lo ON lo.id = l.loan_officer_id\r\nLEFT JOIN m_currency cur ON cur.code = l.currency_code\r\nLEFT JOIN m_guarantor gua ON gua.loan_id = l.id\r\nWHERE o.id = ${officeId} AND (IFNULL(l.loan_officer_id, -10) = ${loanOfficerId} OR \"-1\" = ${loanOfficerId}) AND l.loan_status_id = 300 AND (DATEDIFF(CURDATE(), l.disbursedon_date) BETWEEN ${cycleX} AND ${cycleY})\r\nGROUP BY l.id\r\nORDER BY ounder.hierarchy, l.currency_code, c.account_no, l.account_no', 'All clients with an outstanding loan between cycleX and cycleY days', 0, 1, 0),
(169, 'Loan in arrears', 'SMS', 'NonTriggered', 'Loan', 'SELECT \r\nmc.id AS \"id\", \r\nmc.firstname AS \"firstName\",\r\nmc.middlename AS \"middleName\",\r\nmc.lastname AS \"lastName\",\r\nmc.display_name AS \"fullName\",\r\nmc.mobile_no AS \"mobileNo\", \r\nml.principal_amount AS \"loanAmount\", \r\n(IFNULL(ml.principal_outstanding_derived, 0) + IFNULL(ml.interest_outstanding_derived, 0) + IFNULL(ml.fee_charges_outstanding_derived, 0) + IFNULL(ml.penalty_charges_outstanding_derived, 0)) AS \"loanOutstanding\",\r\nml.principal_disbursed_derived AS \"loanDisbursed\",\r\nlaa.overdue_since_date_derived AS \"paymentDueDate\",\r\nIFNULL(laa.total_overdue_derived, 0) AS \"totalDue\",\r\nounder.id AS \"officeNumber\", \r\nml.account_no AS \"loanAccountId\", \r\ngua.lastname AS \"guarantorLastName\", \r\nCOUNT(gua.id) AS \"numberOfGuarantors\",\r\ng.display_name AS \"groupName\"\r\n\r\nFROM m_office mo\r\nJOIN m_office ounder ON ounder.hierarchy LIKE CONCAT(mo.hierarchy, \'%\')\r\nINNER JOIN m_client mc ON mc.office_id=ounder.id\r\nINNER JOIN m_loan ml ON ml.client_id = mc.id\r\nINNER JOIN r_enum_value rev ON rev.enum_id=ml.loan_status_id AND rev.enum_name = \'loan_status_id\'\r\nINNER JOIN m_loan_arrears_aging laa ON laa.loan_id=ml.id\r\nLEFT JOIN m_currency cur ON cur.code = ml.currency_code\r\nLEFT JOIN m_group_client gc ON gc.client_id = mc.id\r\nLEFT JOIN m_group g ON g.id = gc.group_id\r\nLEFT JOIN m_staff lo ON lo.id = ml.loan_officer_id\r\nLEFT JOIN m_guarantor gua ON gua.loan_id = ml.id\r\nWHERE ml.loan_status_id=300 AND mo.id=${officeId} AND (IFNULL(ml.loan_officer_id, -10) = ${loanOfficerId} OR \"-1\" = ${loanOfficerId}) AND (DATEDIFF(CURDATE(), laa.overdue_since_date_derived) BETWEEN ${fromX} AND ${toY})\r\nGROUP BY ml.id\r\nORDER BY ounder.hierarchy, ml.currency_code, mc.account_no, ml.account_no', 'All clients with an outstanding loan in arrears between fromX and toY days', 0, 1, 0),
(170, 'Loan payments due', 'SMS', 'NonTriggered', 'Loan', 'SELECT \r\ncl.id AS \"id\", \r\ncl.firstname AS \"firstName\",\r\ncl.middlename AS \"middleName\",\r\ncl.lastname AS \"lastName\",\r\ncl.display_name AS \"fullName\",\r\ncl.mobile_no AS \"mobileNo\", \r\nl.principal_amount AS \"loanAmount\",\r\nof.id AS \"officeNumber\",\r\n(IFNULL(l.principal_outstanding_derived, 0) + IFNULL(l.interest_outstanding_derived, 0) + IFNULL(l.fee_charges_outstanding_derived, 0) + IFNULL(l.penalty_charges_outstanding_derived, 0)) AS \"loanOutstanding\",\r\nl.principal_disbursed_derived AS \"loanDisbursed\",\r\nls.duedate AS \"paymentDueDate\",\r\n(IFNULL(SUM(ls.principal_amount),0) - IFNULL(SUM(ls.principal_writtenoff_derived),0)\r\n + IFNULL(SUM(ls.interest_amount),0) - IFNULL(SUM(ls.interest_writtenoff_derived),0) \r\n - IFNULL(SUM(ls.interest_waived_derived),0)\r\n + IFNULL(SUM(ls.fee_charges_amount),0) - IFNULL(SUM(ls.fee_charges_writtenoff_derived),0) \r\n - IFNULL(SUM(ls.fee_charges_waived_derived),0)\r\n + IFNULL(SUM(ls.penalty_charges_amount),0) - IFNULL(SUM(ls.penalty_charges_writtenoff_derived),0) \r\n - IFNULL(SUM(ls.penalty_charges_waived_derived),0)\r\n) AS \"totalDue\",\r\nlaa.total_overdue_derived AS \"totalOverdue\",\r\nl.account_no AS \"loanAccountId\",\r\ngua.lastname AS \"guarantorLastName\",\r\nCOUNT(gua.id) AS \"numberOfGuarantors\",\r\ngp.display_name AS \"groupName\"\r\n\r\nFROM m_office of\r\nLEFT JOIN m_client cl ON of.id = cl.office_id\r\nLEFT JOIN m_loan l ON cl.id = l.client_id\r\nLEFT JOIN m_group_client gc ON gc.client_id = cl.id\r\nLEFT JOIN m_group gp ON gp.id = l.group_id\r\nLEFT JOIN m_loan_repayment_schedule ls ON l.id = ls.loan_id\r\nLEFT JOIN m_guarantor gua ON gua.loan_id = l.id\r\nINNER JOIN m_loan_arrears_aging laa ON laa.loan_id=l.id\r\nWHERE of.id = ${officeId} AND (IFNULL(l.loan_officer_id, -10) = ${loanOfficerId} OR \"-1\" = ${loanOfficerId}) AND (DATEDIFF(CURDATE(), ls.duedate) BETWEEN ${fromX} AND ${toY}) \r\nAND (of.hierarchy LIKE CONCAT((\r\nSELECT ino.hierarchy\r\nFROM m_office ino\r\nWHERE ino.id = ${officeId}),\"%\"))\r\nGROUP BY l.id\r\nORDER BY of.hierarchy, l.currency_code, cl.account_no, l.account_no', 'All clients with an unpaid installment due on their loan between fromX and toY days', 0, 1, 0),
(171, 'Dormant Prospects', 'SMS', 'NonTriggered', 'Client', 'SELECT c.id AS \"id\", CONCAT(REPEAT(\"..\", ((LENGTH(ounder.`hierarchy`) - LENGTH(\r\nREPLACE(ounder.`hierarchy`, \'.\', \'\')) - 1))), ounder.`name`) AS \"officeName\", \r\nc.firstname AS \"firstName\",\r\nc.middlename AS \"middleName\",\r\nc.lastname AS \"lastName\",\r\nc.display_name AS \"fullName\",\r\nc.mobile_no AS \"mobileNo\",  \r\no.id AS \"officeNumber\", \r\nTIMESTAMPDIFF(MONTH, c.activation_date, CURDATE()) AS \"dormant\"\r\nFROM m_office o\r\nJOIN m_office ounder ON ounder.hierarchy LIKE CONCAT(o.hierarchy, \'%\')\r\nJOIN m_client c ON c.office_id = ounder.id\r\nLEFT JOIN r_enum_value r ON r.enum_name = \'status_enum\' AND r.enum_id = c.status_enum\r\nLEFT JOIN m_loan l ON l.client_id = c.id\r\nWHERE o.id = ${officeId} AND c.status_enum = 300 AND (IFNULL(c.staff_id, -10) = ${loanOfficerId} OR \"-1\" = ${loanOfficerId}) AND l.client_id IS NULL AND (TIMESTAMPDIFF(MONTH, c.activation_date, CURDATE()) > 3)\r\nGROUP BY c.id\r\nORDER BY ounder.hierarchy, c.account_no', 'All individuals who have not yet received a loan but were also entered into the system more than 3 months', 0, 1, 0),
(172, 'Active group leaders', 'SMS', 'NonTriggered', 'Client', 'SELECT c.id AS \"id\", \r\nc.firstname AS \"firstName\",\r\nc.middlename AS \"middleName\",\r\nc.lastname AS \"lastName\",\r\nc.display_name AS \"fullName\",\r\nc.mobile_no AS \"mobileNo\", CONCAT(REPEAT(\"..\", ((LENGTH(ounder.`hierarchy`) - LENGTH(\r\nREPLACE(ounder.`hierarchy`, \'.\', \'\')) - 1))), ounder.`name`) AS \"officeName\", \r\no.id AS \"officeNumber\"\r\nFROM m_office o\r\nJOIN m_office ounder ON ounder.hierarchy LIKE CONCAT(o.hierarchy, \'%\')\r\nJOIN m_group g ON g.office_id = ounder.id\r\nJOIN m_client c ON c.office_id = ounder.id\r\nLEFT JOIN m_group_client gc ON gc.group_id = g.id AND gc.client_id = c.id\r\nLEFT JOIN m_group_roles gr ON gr.group_id = g.id AND gr.client_id = c.id\r\nLEFT JOIN m_staff ms ON ms.id = c.staff_id\r\nLEFT JOIN r_enum_value r ON r.enum_name = \'status_enum\' AND r.enum_id = c.status_enum\r\nLEFT JOIN m_code_value cv ON cv.id = gr.role_cv_id\r\nLEFT JOIN m_code code ON code.id = cv.code_id\r\nWHERE o.id = ${officeId} AND g.status_enum = 300 AND c.status_enum = 300  AND (IFNULL(c.staff_id, -10) = ${loanOfficerId} OR \"-1\" = ${loanOfficerId}) AND code.code_name = \'GROUPROLE\' AND cv.code_value = \'Leader\'\r\nGROUP BY c.id\r\nORDER BY ounder.hierarchy, c.account_no', 'All active group chairmen', 0, 1, 0),
(173, 'Loan payments due (Overdue Loans)', 'SMS', 'NonTriggered', 'Loan', 'SELECT \r\nmc.id AS \"id\", \r\nmc.firstname AS \"firstName\",\r\nmc.middlename AS \"middleName\",\r\nmc.lastname AS \"lastName\",\r\nmc.display_name AS \"fullName\",\r\nmc.mobile_no AS \"mobileNo\", \r\nml.principal_amount AS \"loanAmount\", \r\n(IFNULL(ml.principal_outstanding_derived, 0) + IFNULL(ml.interest_outstanding_derived, 0) + IFNULL(ml.fee_charges_outstanding_derived, 0) + IFNULL(ml.penalty_charges_outstanding_derived, 0)) AS \"loanOutstanding\",\r\nml.principal_disbursed_derived AS \"loanDisbursed\",\r\nlaa.overdue_since_date_derived AS \"paymentDueDate\",\r\n(IFNULL(SUM(ls.principal_amount),0) - IFNULL(SUM(ls.principal_writtenoff_derived),0)\r\n + IFNULL(SUM(ls.interest_amount),0) - IFNULL(SUM(ls.interest_writtenoff_derived),0) \r\n - IFNULL(SUM(ls.interest_waived_derived),0)\r\n + IFNULL(SUM(ls.fee_charges_amount),0) - IFNULL(SUM(ls.fee_charges_writtenoff_derived),0) \r\n - IFNULL(SUM(ls.fee_charges_waived_derived),0)\r\n + IFNULL(SUM(ls.penalty_charges_amount),0) - IFNULL(SUM(ls.penalty_charges_writtenoff_derived),0) \r\n - IFNULL(SUM(ls.penalty_charges_waived_derived),0)\r\n) AS \"totalDue\",\r\nlaa.total_overdue_derived AS \"totalOverdue\",\r\nounder.id AS \"officeNumber\", \r\nml.account_no AS \"loanAccountId\", \r\ngua.lastname AS \"guarantorLastName\", \r\nCOUNT(gua.id) AS \"numberOfGuarantors\",\r\ng.display_name AS \"groupName\"\r\n\r\nFROM m_office mo\r\nJOIN m_office ounder ON ounder.hierarchy LIKE CONCAT(mo.hierarchy, \'%\')\r\nINNER JOIN m_client mc ON mc.office_id=ounder.id\r\nINNER JOIN m_loan ml ON ml.client_id = mc.id\r\nINNER JOIN r_enum_value rev ON rev.enum_id=ml.loan_status_id AND rev.enum_name = \'loan_status_id\'\r\nINNER JOIN m_loan_arrears_aging laa ON laa.loan_id=ml.id\r\nLEFT JOIN m_loan_repayment_schedule ls ON ls.loan_id = ml.id\r\nLEFT JOIN m_currency cur ON cur.code = ml.currency_code\r\nLEFT JOIN m_group_client gc ON gc.client_id = mc.id\r\nLEFT JOIN m_group g ON g.id = gc.group_id\r\nLEFT JOIN m_staff lo ON lo.id = ml.loan_officer_id\r\nLEFT JOIN m_guarantor gua ON gua.loan_id = ml.id\r\nWHERE ml.loan_status_id=300 AND mo.id=${officeId} AND (IFNULL(ml.loan_officer_id, -10) = ${loanOfficerId} OR \"-1\" = ${loanOfficerId}) \r\nAND (DATEDIFF(CURDATE(), ls.duedate) BETWEEN ${fromX} AND ${toY})\r\nAND (DATEDIFF(CURDATE(), laa.overdue_since_date_derived) BETWEEN ${overdueX} AND ${overdueY})\r\nGROUP BY ml.id\r\nORDER BY ounder.hierarchy, ml.currency_code, mc.account_no, ml.account_no', 'Loan Payments Due between fromX to toY days for clients in arrears between overdueX and overdueY days', 0, 1, 0),
(174, 'Loan payments received (Active Loans)', 'SMS', 'NonTriggered', 'Loan', 'SELECT \r\nmc.id AS \"id\", \r\nmc.firstname AS \"firstName\",\r\nmc.middlename AS \"middleName\",\r\nmc.lastname AS \"lastName\",\r\nmc.display_name AS \"fullName\",\r\nmc.mobile_no AS \"mobileNo\", \r\nml.principal_amount AS \"loanAmount\", \r\n(IFNULL(ml.principal_outstanding_derived, 0) + IFNULL(ml.interest_outstanding_derived, 0) + IFNULL(ml.fee_charges_outstanding_derived, 0) + IFNULL(ml.penalty_charges_outstanding_derived, 0)) AS \"loanOutstanding\",\r\nounder.id AS \"officeNumber\", \r\nml.account_no AS \"loanAccountNumber\",\r\nSUM(lt.amount) AS \"repaymentAmount\"\r\nFROM m_office mo\r\nJOIN m_office ounder ON ounder.hierarchy LIKE CONCAT(mo.hierarchy, \'%\')\r\nINNER JOIN m_client mc ON mc.office_id=ounder.id\r\nINNER JOIN m_loan ml ON ml.client_id = mc.id\r\nINNER JOIN r_enum_value rev ON rev.enum_id=ml.loan_status_id AND rev.enum_name = \'loan_status_id\'\r\nINNER JOIN m_loan_transaction lt ON lt.loan_id = ml.id\r\nINNER JOIN m_appuser au ON au.id = lt.appuser_id\r\nLEFT JOIN m_loan_arrears_aging laa ON laa.loan_id=ml.id\r\nLEFT JOIN m_payment_detail mpd ON mpd.id=lt.payment_detail_id\r\nLEFT JOIN m_currency cur ON cur.code = ml.currency_code\r\nLEFT JOIN m_group_client gc ON gc.client_id = mc.id\r\nLEFT JOIN m_group g ON g.id = gc.group_id\r\nLEFT JOIN m_staff lo ON lo.id = ml.loan_officer_id\r\nLEFT JOIN m_guarantor gua ON gua.loan_id = ml.id\r\nWHERE ml.loan_status_id=300 AND mo.id=${officeId} AND (IFNULL(ml.loan_officer_id, -10) = ${loanOfficerId} OR \"-1\" = ${loanOfficerId}) AND (DATEDIFF(CURDATE(), lt.transaction_date) BETWEEN ${fromX} AND ${toY}) AND lt.is_reversed=0 AND lt.transaction_type_enum=2 AND laa.loan_id IS NULL\r\nGROUP BY ml.id\r\nORDER BY ounder.hierarchy, ml.currency_code, mc.account_no, ml.account_no', 'Payments received in the last fromX to toY days for any loan with the status Active (on-time)', 0, 1, 0),
(175, 'Loan payments received (Overdue Loans)', 'SMS', 'NonTriggered', 'Loan', 'SELECT \r\nml.id AS \"loanId\", \r\nmc.id AS \"id\", \r\nmc.firstname AS \"firstName\",\r\nmc.middlename AS \"middleName\",\r\nmc.lastname AS \"lastName\",\r\nmc.display_name AS \"fullName\",\r\nmc.mobile_no AS \"mobileNo\", \r\nml.principal_amount AS \"loanAmount\", \r\n(IFNULL(ml.principal_outstanding_derived, 0) + IFNULL(ml.interest_outstanding_derived, 0) + IFNULL(ml.fee_charges_outstanding_derived, 0) + IFNULL(ml.penalty_charges_outstanding_derived, 0)) AS \"loanOutstanding\",\r\nounder.id AS \"officeNumber\", \r\nml.account_no AS \"loanAccountNumber\",\r\nSUM(lt.amount) AS \"repaymentAmount\"\r\nFROM m_office mo\r\nJOIN m_office ounder ON ounder.hierarchy LIKE CONCAT(mo.hierarchy, \'%\')\r\nINNER JOIN m_client mc ON mc.office_id=ounder.id\r\nINNER JOIN m_loan ml ON ml.client_id = mc.id\r\nINNER JOIN r_enum_value rev ON rev.enum_id=ml.loan_status_id AND rev.enum_name = \'loan_status_id\'\r\nINNER JOIN m_loan_arrears_aging laa ON laa.loan_id=ml.id\r\nINNER JOIN m_loan_transaction lt ON lt.loan_id = ml.id\r\nINNER JOIN m_appuser au ON au.id = lt.appuser_id\r\nLEFT JOIN m_payment_detail mpd ON mpd.id=lt.payment_detail_id\r\nLEFT JOIN m_currency cur ON cur.code = ml.currency_code\r\nLEFT JOIN m_group_client gc ON gc.client_id = mc.id\r\nLEFT JOIN m_group g ON g.id = gc.group_id\r\nLEFT JOIN m_staff lo ON lo.id = ml.loan_officer_id\r\nLEFT JOIN m_guarantor gua ON gua.loan_id = ml.id\r\nWHERE ml.loan_status_id=300 AND mo.id=${officeId} AND (IFNULL(ml.loan_officer_id, -10) = ${loanOfficerId} OR \"-1\" = ${loanOfficerId}) AND (DATEDIFF(CURDATE(), lt.transaction_date) BETWEEN ${fromX} AND ${toY}) AND (DATEDIFF(CURDATE(), laa.overdue_since_date_derived) BETWEEN ${overdueX} AND ${overdueY}) AND lt.is_reversed=0 AND lt.transaction_type_enum=2\r\nGROUP BY ml.id\r\nORDER BY ounder.hierarchy, ml.currency_code, mc.account_no, ml.account_no', 'Payments received in the last fromX to toY days for any loan with the status Overdue (arrears) between overdueX and overdueY days', 0, 1, 0),
(176, 'Happy Birthday', 'SMS', 'NonTriggered', 'Client', 'SELECT \r\nc.id AS \"id\", \r\nc.firstname AS \"firstName\",\r\nc.middlename AS \"middleName\",\r\nc.lastname AS \"lastName\",\r\nc.display_name AS \"fullName\",\r\nc.mobile_no AS \"mobileNo\", CONCAT(REPEAT(\"..\", ((LENGTH(ounder.`hierarchy`) - LENGTH(\r\nREPLACE(ounder.`hierarchy`, \'.\', \'\')) - 1))), ounder.`name`) AS \"officeName\", \r\no.id AS \"officeNumber\", \r\nc.date_of_birth AS \"dateOfBirth\",\r\nIF(c.date_of_birth IS NULL, 0, CEIL(DATEDIFF (NOW(), c.date_of_birth)/365)) AS \"age\"\r\nFROM m_office o\r\nJOIN m_office ounder ON ounder.hierarchy LIKE CONCAT(o.hierarchy, \'%\')\r\nJOIN m_client c ON c.office_id = ounder.id\r\nLEFT JOIN r_enum_value r ON r.enum_name = \'status_enum\' AND r.enum_id = c.status_enum\r\nLEFT JOIN m_staff ms ON ms.id = c.staff_id\r\nWHERE o.id = ${officeId} AND c.status_enum = 300 AND (IFNULL(c.staff_id, -10) = ${loanOfficerId} OR \"-1\" = ${loanOfficerId}) AND c.date_of_birth IS NOT NULL AND (DAY(c.date_of_birth)=DAY(NOW())) AND (MONTH(c.date_of_birth)=MONTH(NOW()))\r\nORDER BY ounder.hierarchy, c.account_no', 'This sends a message to all clients with the status Active on their Birthday', 0, 1, 0),
(177, 'Loan fully repaid', 'SMS', 'NonTriggered', 'Loan', 'SELECT \r\nc.id AS \"id\", \r\nc.firstname AS \"firstName\",\r\nc.middlename AS \"middleName\",\r\nc.lastname AS \"lastName\",\r\nc.display_name AS \"fullName\",\r\nc.mobile_no AS \"mobileNo\", \r\nl.principal_amount AS \"loanAmount\",\r\n(IFNULL(l.principal_outstanding_derived, 0) + IFNULL(l.interest_outstanding_derived, 0) + IFNULL(l.fee_charges_outstanding_derived, 0) + IFNULL(l.penalty_charges_outstanding_derived, 0)) AS \"loanOutstanding\",\r\nl.principal_disbursed_derived AS \"loanDisbursed\",\r\no.id AS \"officeNumber\",\r\nl.account_no AS \"loanAccountId\",\r\ngua.lastname AS \"guarantorLastName\", COUNT(gua.id) AS \"numberOfGuarantors\",\r\nls.duedate AS \"dueDate\",\r\nlaa.total_overdue_derived AS \"totalDue\",\r\ngp.display_name AS \"groupName\",\r\nl.total_repayment_derived AS \"totalFullyPaid\"\r\nFROM m_office o\r\nJOIN m_office ounder ON ounder.hierarchy LIKE CONCAT(o.hierarchy, \'%\')\r\nJOIN m_client c ON c.office_id = ounder.id\r\nJOIN m_loan l ON l.client_id = c.id\r\nLEFT JOIN m_staff lo ON lo.id = l.loan_officer_id\r\nLEFT JOIN m_currency cur ON cur.code = l.currency_code\r\nLEFT JOIN m_group_client gc ON gc.client_id = c.id\r\nLEFT JOIN m_group gp ON gp.id = l.group_id\r\nLEFT JOIN m_loan_repayment_schedule ls ON l.id = ls.loan_id\r\nLEFT JOIN m_guarantor gua ON gua.loan_id = l.id\r\nLEFT JOIN m_loan_arrears_aging laa ON laa.loan_id=l.id\r\nWHERE o.id = ${officeId} AND (IFNULL(l.loan_officer_id, -10) = ${loanOfficerId} OR \"-1\" = ${loanOfficerId}) AND \r\n(DATEDIFF(CURDATE(), l.closedon_date) BETWEEN ${fromX} AND ${toY})\r\n AND (l.loan_status_id IN (600, 700))\r\nGROUP BY l.id\r\nORDER BY ounder.hierarchy, l.currency_code, c.account_no, l.account_no', 'All loans that have been fully repaid (Closed or Overpaid) in the last fromX to toY days', 0, 1, 0),
(178, 'Loan outstanding after final instalment date', 'SMS', 'NonTriggered', 'Loan', 'SELECT \r\nc.id AS \"id\", \r\nc.firstname AS \"firstName\",\r\nc.middlename AS \"middleName\",\r\nc.lastname AS \"lastName\",\r\nc.display_name AS \"fullName\",\r\nc.mobile_no AS \"mobileNo\", \r\nl.principal_amount AS \"loanAmount\",\r\no.id AS \"officeNumber\",\r\n(IFNULL(l.principal_outstanding_derived, 0) + IFNULL(l.interest_outstanding_derived, 0) + IFNULL(l.fee_charges_outstanding_derived, 0) + IFNULL(l.penalty_charges_outstanding_derived, 0)) AS \"loanOutstanding\",\r\nl.principal_disbursed_derived AS \"loanDisbursed\",\r\nls.duedate AS \"paymentDueDate\",\r\n(IFNULL(SUM(ls.principal_amount),0) - IFNULL(SUM(ls.principal_writtenoff_derived),0)\r\n + IFNULL(SUM(ls.interest_amount),0) - IFNULL(SUM(ls.interest_writtenoff_derived),0) \r\n - IFNULL(SUM(ls.interest_waived_derived),0)\r\n + IFNULL(SUM(ls.fee_charges_amount),0) - IFNULL(SUM(ls.fee_charges_writtenoff_derived),0) \r\n - IFNULL(SUM(ls.fee_charges_waived_derived),0)\r\n + IFNULL(SUM(ls.penalty_charges_amount),0) - IFNULL(SUM(ls.penalty_charges_writtenoff_derived),0) \r\n - IFNULL(SUM(ls.penalty_charges_waived_derived),0)\r\n) AS \"totalDue\",\r\nlaa.total_overdue_derived AS \"totalOverdue\",\r\nl.account_no AS \"loanAccountId\",\r\ngua.lastname AS \"guarantorLastName\",\r\nCOUNT(gua.id) AS \"numberOfGuarantors\",\r\ngp.display_name AS \"groupName\"\r\n\r\nFROM m_office o\r\nJOIN m_office ounder ON ounder.hierarchy LIKE CONCAT(o.hierarchy, \'%\')\r\nJOIN m_client c ON c.office_id = ounder.id\r\nJOIN m_loan l ON l.client_id = c.id\r\nLEFT JOIN m_staff lo ON lo.id = l.loan_officer_id\r\nLEFT JOIN m_currency cur ON cur.code = l.currency_code\r\nLEFT JOIN m_loan_arrears_aging laa ON laa.loan_id = l.id\r\nLEFT JOIN m_group_client gc ON gc.client_id = c.id\r\nLEFT JOIN m_group gp ON gp.id = l.group_id\r\nLEFT JOIN m_loan_repayment_schedule ls ON l.id = ls.loan_id\r\nLEFT JOIN m_guarantor gua ON gua.loan_id = l.id\r\nWHERE o.id = ${officeId} AND (IFNULL(l.loan_officer_id, -10) = ${loanOfficerId} OR \"-1\" = ${loanOfficerId}) AND l.loan_status_id = 300 AND l.expected_maturedon_date < CURDATE() \r\nAND (DATEDIFF(CURDATE(), l.expected_maturedon_date) BETWEEN ${fromX} AND ${toY})\r\nGROUP BY l.id\r\nORDER BY ounder.hierarchy, l.currency_code, c.account_no, l.account_no', 'All active loans (with an outstanding balance) between fromX to toY days after the final instalment date on their loan schedule', 0, 1, 0),
(179, 'Loan Repayment', 'SMS', 'Triggered', NULL, 'select ml.id as loanId,mc.id, mc.firstname, ifnull(mc.middlename,\'\') as middlename, mc.lastname, mc.display_name as FullName, mobile_no as mobileNo, mc.group_name as GroupName, round(ml.principal_amount, ml.currency_digits) as LoanAmount, round(ml.`total_outstanding_derived`, ml.currency_digits) as LoanOutstanding,\nml.`account_no` as LoanAccountId, round(mlt.amountPaid, ml.currency_digits) as repaymentAmount\nFROM m_office mo\nJOIN m_office ounder ON ounder.hierarchy LIKE CONCAT(mo.hierarchy, \'%\')\nAND ounder.hierarchy like CONCAT(\'.\', \'%\')\nLEFT JOIN (\n select \n ml.id as loanId, \n ifnull(mc.id,mc2.id) as id, \n ifnull(mc.firstname,mc2.firstname) as firstname, \n ifnull(mc.middlename,ifnull(mc2.middlename,(\'\'))) as middlename, \n ifnull(mc.lastname,mc2.lastname) as lastname, \n ifnull(mc.display_name,mc2.display_name) as display_name, \n ifnull(mc.status_enum,mc2.status_enum) as status_enum,\n ifnull(mc.mobile_no,mc2.mobile_no) as mobile_no,\n ifnull(mg.office_id,mc2.office_id) as office_id,\n ifnull(mg.staff_id,mc2.staff_id) as staff_id,\n mg.id as group_id, \nmg.display_name as group_name\n from\n m_loan ml\n left join m_group mg on mg.id = ml.group_id\n left join m_group_client mgc on mgc.group_id = mg.id\n left join m_client mc on mc.id = mgc.client_id\n left join m_client mc2 on mc2.id = ml.client_id\n order by loanId\n ) mc on mc.office_id = ounder.id\nright join m_loan as ml on mc.loanId = ml.id\nright join(\nselect mlt.amount as amountPaid,mlt.id,mlt.loan_id\nfrom m_loan_transaction mlt\nwhere mlt.is_reversed = 0 \ngroup by mlt.loan_id\n) as mlt on mlt.loan_id = ml.id\nright join m_loan_repayment_schedule as mls1 on ml.id = mls1.loan_id and mls1.`completed_derived` = 0\nand mls1.installment = (SELECT MIN(installment) from m_loan_repayment_schedule where loan_id = ml.id and duedate <= CURDATE() and completed_derived=0)\nwhere mc.status_enum = 300 and mobile_no is not null and ml.`loan_status_id` = 300\nand (mo.id = ${officeId} or ${officeId} = -1)\nand (mc.staff_id = ${loanOfficerId} or ${loanOfficerId} = -1)\nand (ml.loan_type_enum = ${loanType} or ${loanType} = -1)\nand ml.id in (select mla.loan_id from m_loan_arrears_aging mla)\ngroup by ml.id', 'Loan Repayment', 0, 0, 0),
(180, 'Loan Approved', 'SMS', 'Triggered', NULL, 'SELECT mc.id, mc.firstname, mc.middlename as middlename, mc.lastname, mc.display_name as FullName, mc.mobile_no as mobileNo, mc.group_name as GroupName, mo.name as officename, ml.id as loanId, ml.account_no as accountnumber, ml.principal_amount_proposed as loanamount, ml.annual_nominal_interest_rate as annualinterestrate FROM m_office mo JOIN m_office ounder ON ounder.hierarchy LIKE CONCAT(mo.hierarchy, \'%\') AND ounder.hierarchy like CONCAT(\'.\', \'%\') LEFT JOIN ( select  ml.id as loanId,  ifnull(mc.id,mc2.id) as id,  ifnull(mc.firstname,mc2.firstname) as firstname,  ifnull(mc.middlename,ifnull(mc2.middlename,(\'\'))) as middlename,  ifnull(mc.lastname,mc2.lastname) as lastname,  ifnull(mc.display_name,mc2.display_name) as display_name,  ifnull(mc.status_enum,mc2.status_enum) as status_enum, ifnull(mc.mobile_no,mc2.mobile_no) as mobile_no, ifnull(mg.office_id,mc2.office_id) as office_id, ifnull(mg.staff_id,mc2.staff_id) as staff_id, mg.id as group_id, mg.display_name as group_name from m_loan ml left join m_group mg on mg.id = ml.group_id left join m_group_client mgc on mgc.group_id = mg.id left join m_client mc on mc.id = mgc.client_id left join m_client mc2 on mc2.id = ml.client_id order by loanId ) mc on mc.office_id = ounder.id  left join m_loan ml on ml.id = mc.loanId WHERE mc.status_enum = 300 and mc.mobile_no is not null and (mo.id = ${officeId} or ${officeId} = -1) and (mc.staff_id = ${loanOfficerId} or ${loanOfficerId} = -1)and (ml.id = ${loanId} or ${loanId} = -1)and (mc.id = ${clientId} or ${clientId} = -1)and (mc.group_id = ${groupId} or ${groupId} = -1)and (ml.loan_type_enum = ${loanType} or ${loanType} = -1)', 'Loan and client data of approved loan', 0, 0, 0),
(181, 'Loan Rejected', 'SMS', 'Triggered', NULL, 'SELECT mc.id, mc.firstname, mc.middlename as middlename, mc.lastname, mc.display_name as FullName, mc.mobile_no as mobileNo, mc.group_name as GroupName,  mo.name as officename, ml.id as loanId, ml.account_no as accountnumber, ml.principal_amount_proposed as loanamount, ml.annual_nominal_interest_rate as annualinterestrate  FROM  m_office mo  JOIN m_office ounder ON ounder.hierarchy LIKE CONCAT(mo.hierarchy, \'%\')  AND ounder.hierarchy like CONCAT(\'.\', \'%\')  LEFT JOIN (  select   ml.id as loanId,   ifnull(mc.id,mc2.id) as id,   ifnull(mc.firstname,mc2.firstname) as firstname,   ifnull(mc.middlename,ifnull(mc2.middlename,(\'\'))) as middlename,   ifnull(mc.lastname,mc2.lastname) as lastname,   ifnull(mc.display_name,mc2.display_name) as display_name,   ifnull(mc.status_enum,mc2.status_enum) as status_enum,  ifnull(mc.mobile_no,mc2.mobile_no) as mobile_no,  ifnull(mg.office_id,mc2.office_id) as office_id,  ifnull(mg.staff_id,mc2.staff_id) as staff_id,  mg.id as group_id,  mg.display_name as group_name  from  m_loan ml  left join m_group mg on mg.id = ml.group_id  left join m_group_client mgc on mgc.group_id = mg.id  left join m_client mc on mc.id = mgc.client_id  left join m_client mc2 on mc2.id = ml.client_id  order by loanId  ) mc on mc.office_id = ounder.id  left join m_loan ml on ml.id = mc.loanId  WHERE mc.status_enum = 300 and mc.mobile_no is not null  and (mo.id = ${officeId} or ${officeId} = -1)  and (mc.staff_id = ${loanOfficerId} or ${loanOfficerId} = -1) and (ml.id = ${loanId} or ${loanId} = -1) and (mc.id = ${clientId} or ${clientId} = -1) and (mc.group_id = ${groupId} or ${groupId} = -1)  and (ml.loan_type_enum = ${loanType} or ${loanType} = -1)', 'Loan and client data of rejected loan', 0, 0, 0),
(182, 'Client Rejected', 'SMS', 'Triggered', 'Client', 'SELECT c.id AS \"id\", \r\nc.firstname AS \"firstName\",\r\nc.middlename AS \"middleName\",\r\nc.lastname AS \"lastName\",\r\nc.display_name AS \"fullName\",\r\nc.mobile_no AS \"mobileNo\", CONCAT(REPEAT(\"..\", ((LENGTH(ounder.`hierarchy`) - LENGTH(\r\nREPLACE(ounder.`hierarchy`, \'.\', \'\')) - 1))), ounder.`name`) AS \"officeName\", \r\no.id AS \"officeNumber\"\r\nFROM m_office o\r\nJOIN m_office ounder ON ounder.hierarchy LIKE CONCAT(o.hierarchy, \'%\')\r\nJOIN m_client c ON c.office_id = ounder.id\r\nLEFT JOIN r_enum_value r ON r.enum_name = \'status_enum\' AND r.enum_id = c.status_enum\r\nWHERE o.id = ${officeId} AND c.id = ${clientId} AND (IFNULL(c.staff_id, -10) = ${loanOfficerId} OR \"-1\" = ${loanOfficerId})', 'Client Rejection', 0, 1, 0),
(183, 'Client Activated', 'SMS', 'Triggered', 'Client', 'SELECT c.id AS \"id\", \r\nc.firstname AS \"firstName\",\r\nc.middlename AS \"middleName\",\r\nc.lastname AS \"lastName\",\r\nc.display_name AS \"fullName\",\r\nc.mobile_no AS \"mobileNo\", CONCAT(REPEAT(\"..\", ((LENGTH(ounder.`hierarchy`) - LENGTH(\r\nREPLACE(ounder.`hierarchy`, \'.\', \'\')) - 1))), ounder.`name`) AS \"officeName\", \r\no.id AS \"officeNumber\"\r\nFROM m_office o\r\nJOIN m_office ounder ON ounder.hierarchy LIKE CONCAT(o.hierarchy, \'%\')\r\nJOIN m_client c ON c.office_id = ounder.id\r\nLEFT JOIN r_enum_value r ON r.enum_name = \'status_enum\' AND r.enum_id = c.status_enum\r\nWHERE o.id = ${officeId} AND c.id = ${clientId} AND (IFNULL(c.staff_id, -10) = ${loanOfficerId} OR \"-1\" = ${loanOfficerId})', 'Client Activation', 0, 1, 0),
(184, 'Savings Rejected', 'SMS', 'Triggered', 'Savings', 'SELECT \r\nc.id AS \"id\",\r\nc.firstname AS \"firstName\",\r\nc.middlename AS \"middleName\",\r\nc.lastname AS \"lastName\",\r\nc.display_name AS \"fullName\",\r\nc.mobile_no AS \"mobileNo\",\r\ns.account_no AS \"savingsAccountNo\",\r\nounder.id AS \"officeNumber\",\r\nounder.name AS \"officeName\"\r\n\r\nFROM m_office o\r\nJOIN m_office ounder ON ounder.hierarchy LIKE CONCAT(o.hierarchy, \'%\')\r\nJOIN m_client c ON c.office_id = ounder.id\r\nJOIN m_savings_account s ON s.client_id = c.id\r\nJOIN m_savings_product sp ON sp.id = s.product_id\r\nLEFT JOIN m_staff st ON st.id = s.field_officer_id\r\nLEFT JOIN m_currency cur ON cur.code = s.currency_code\r\nWHERE o.id = ${officeId} AND (IFNULL(s.field_officer_id, -10) = ${loanOfficerId} OR \"-1\" = ${loanOfficerId}) AND s.id = ${savingsId}', 'Savings Rejected', 0, 1, 0),
(185, 'Savings Activated', 'SMS', 'Triggered', 'Savings', 'SELECT \r\nc.id AS \"id\",\r\nc.firstname AS \"firstName\",\r\nc.middlename AS \"middleName\",\r\nc.lastname AS \"lastName\",\r\nc.display_name AS \"fullName\",\r\nc.mobile_no AS \"mobileNo\",\r\ns.account_no AS \"savingsAccountNo\",\r\nounder.id AS \"officeNumber\",\r\nounder.name AS \"officeName\"\r\n\r\nFROM m_office o\r\nJOIN m_office ounder ON ounder.hierarchy LIKE CONCAT(o.hierarchy, \'%\')\r\nJOIN m_client c ON c.office_id = ounder.id\r\nJOIN m_savings_account s ON s.client_id = c.id\r\nJOIN m_savings_product sp ON sp.id = s.product_id\r\nLEFT JOIN m_staff st ON st.id = s.field_officer_id\r\nLEFT JOIN m_currency cur ON cur.code = s.currency_code\r\nWHERE o.id = ${officeId} AND (IFNULL(s.field_officer_id, -10) = ${loanOfficerId} OR \"-1\" = ${loanOfficerId}) AND s.id = ${savingsId}', 'Savings Activation', 0, 1, 0),
(186, 'Savings Deposit', 'SMS', 'Triggered', NULL, 'SELECT sc.savingsId AS savingsId, sc.id AS clientId, sc.firstname, IFNULL(sc.middlename,\'\') AS middlename, sc.lastname, sc.display_name AS FullName, sc.mobile_no AS mobileNo,\r\nms.`account_no` AS savingsAccountNo, ROUND(mst.amountPaid, ms.currency_digits) AS depositAmount, ms.account_balance_derived AS balance, \r\nmst.transactionDate AS transactionDate\r\nFROM m_office mo\r\nJOIN m_office ounder ON ounder.hierarchy LIKE CONCAT(mo.hierarchy, \'%\') AND ounder.hierarchy LIKE CONCAT(\'.\', \'%\')\r\nLEFT JOIN (\r\nSELECT \r\n sa.id AS savingsId, mc.id AS id, mc.firstname AS firstname, mc.middlename AS middlename, mc.lastname AS lastname, \r\n mc.display_name AS display_name, mc.status_enum AS status_enum, \r\n mc.mobile_no AS mobile_no, mc.office_id AS office_id, \r\n mc.staff_id AS staff_id\r\nFROM\r\nm_savings_account sa\r\nLEFT JOIN m_client mc ON mc.id = sa.client_id\r\nORDER BY savingsId) sc ON sc.office_id = ounder.id\r\nRIGHT JOIN m_savings_account AS ms ON sc.savingsId = ms.id\r\nRIGHT JOIN(\r\nSELECT st.amount AS amountPaid, st.id, st.savings_account_id, st.id AS savingsTransactionId, st.transaction_date AS transactionDate\r\nFROM m_savings_account_transaction st\r\nWHERE st.is_reversed = 0\r\nGROUP BY st.savings_account_id\r\n) AS mst ON mst.savings_account_id = ms.id\r\nWHERE sc.mobile_no IS NOT NULL AND (mo.id = ${officeId} OR ${officeId} = -1) AND (sc.staff_id = ${loanOfficerId} OR ${loanOfficerId} = -1) AND mst.savingsTransactionId = ${savingsTransactionId}', 'Savings Deposit', 0, 1, 0),
(187, 'Savings Withdrawal', 'SMS', 'Triggered', NULL, 'SELECT sc.savingsId AS savingsId, sc.id AS clientId, sc.firstname, IFNULL(sc.middlename,\'\') AS middlename, sc.lastname, sc.display_name AS FullName, sc.mobile_no AS mobileNo,\r\nms.`account_no` AS savingsAccountNo, ROUND(mst.amountPaid, ms.currency_digits) AS withdrawAmount, ms.account_balance_derived AS balance, \r\nmst.transactionDate AS transactionDate\r\nFROM m_office mo\r\nJOIN m_office ounder ON ounder.hierarchy LIKE CONCAT(mo.hierarchy, \'%\') AND ounder.hierarchy LIKE CONCAT(\'.\', \'%\')\r\nLEFT JOIN (\r\nSELECT \r\n sa.id AS savingsId, mc.id AS id, mc.firstname AS firstname, mc.middlename AS middlename, mc.lastname AS lastname, \r\n mc.display_name AS display_name, mc.status_enum AS status_enum, \r\n mc.mobile_no AS mobile_no, mc.office_id AS office_id, \r\n mc.staff_id AS staff_id\r\nFROM\r\nm_savings_account sa\r\nLEFT JOIN m_client mc ON mc.id = sa.client_id\r\nORDER BY savingsId) sc ON sc.office_id = ounder.id\r\nRIGHT JOIN m_savings_account AS ms ON sc.savingsId = ms.id\r\nRIGHT JOIN(\r\nSELECT st.amount AS amountPaid, st.id, st.savings_account_id, st.id AS savingsTransactionId, st.transaction_date AS transactionDate\r\nFROM m_savings_account_transaction st\r\nWHERE st.is_reversed = 0\r\nGROUP BY st.savings_account_id\r\n) AS mst ON mst.savings_account_id = ms.id\r\nWHERE sc.mobile_no IS NOT NULL AND (mo.id = ${officeId} OR ${officeId} = -1) AND (sc.staff_id = ${loanOfficerId} OR ${loanOfficerId} = -1) AND mst.savingsTransactionId = ${savingsTransactionId}', 'Savings Withdrawal', 0, 1, 0),
(188, 'ReportCategoryList', 'Table', NULL, '(NULL)', '(NULL)', '(NULL)', 1, 1, 0),
(189, 'FullReportList', 'Table', NULL, '(NULL)', '(NULL)', '(NULL)', 1, 1, 0);

-- --------------------------------------------------------

--
-- Table structure for table `stretchy_report_parameter`
--

CREATE TABLE `stretchy_report_parameter` (
  `id` int(11) NOT NULL,
  `report_id` int(11) NOT NULL,
  `parameter_id` int(11) NOT NULL,
  `report_parameter_name` varchar(45) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `stretchy_report_parameter`
--

INSERT INTO `stretchy_report_parameter` (`id`, `report_id`, `parameter_id`, `report_parameter_name`) VALUES
(1, 1, 5, NULL),
(2, 2, 5, NULL),
(3, 2, 6, NULL),
(4, 2, 10, NULL),
(5, 2, 20, NULL),
(6, 2, 25, NULL),
(7, 2, 26, NULL),
(8, 5, 5, NULL),
(9, 5, 6, NULL),
(10, 5, 10, NULL),
(11, 5, 20, NULL),
(12, 5, 25, NULL),
(13, 5, 26, NULL),
(14, 6, 5, NULL),
(15, 6, 6, NULL),
(16, 6, 10, NULL),
(17, 6, 20, NULL),
(18, 6, 25, NULL),
(19, 6, 26, NULL),
(20, 7, 5, NULL),
(21, 7, 6, NULL),
(22, 7, 10, NULL),
(23, 7, 20, NULL),
(24, 7, 25, NULL),
(25, 7, 26, NULL),
(26, 8, 5, NULL),
(27, 8, 6, NULL),
(28, 8, 10, NULL),
(29, 8, 25, NULL),
(30, 8, 26, NULL),
(31, 11, 5, NULL),
(32, 11, 6, NULL),
(33, 11, 10, NULL),
(34, 11, 20, NULL),
(35, 11, 25, NULL),
(36, 11, 26, NULL),
(37, 11, 100, NULL),
(38, 12, 5, NULL),
(39, 12, 6, NULL),
(40, 12, 10, NULL),
(41, 12, 20, NULL),
(42, 12, 25, NULL),
(43, 12, 26, NULL),
(44, 13, 1, NULL),
(45, 13, 2, NULL),
(46, 13, 3, NULL),
(47, 13, 5, NULL),
(48, 13, 6, NULL),
(49, 13, 10, NULL),
(50, 13, 20, NULL),
(51, 13, 25, NULL),
(52, 13, 26, NULL),
(53, 14, 1, NULL),
(54, 14, 2, NULL),
(55, 14, 3, NULL),
(56, 14, 5, NULL),
(57, 14, 6, NULL),
(58, 14, 10, NULL),
(59, 14, 20, NULL),
(60, 14, 25, NULL),
(61, 14, 26, NULL),
(62, 15, 5, NULL),
(63, 15, 6, NULL),
(64, 15, 10, NULL),
(65, 15, 20, NULL),
(66, 15, 25, NULL),
(67, 15, 26, NULL),
(68, 15, 100, NULL),
(69, 16, 5, NULL),
(70, 16, 6, NULL),
(71, 16, 10, NULL),
(72, 16, 20, NULL),
(73, 16, 25, NULL),
(74, 16, 26, NULL),
(75, 16, 100, NULL),
(76, 20, 1, NULL),
(77, 20, 2, NULL),
(78, 20, 10, NULL),
(79, 20, 20, NULL),
(80, 21, 1, NULL),
(81, 21, 2, NULL),
(82, 21, 5, NULL),
(83, 21, 10, NULL),
(84, 21, 20, NULL),
(85, 48, 5, 'branch'),
(86, 48, 2, 'date'),
(87, 49, 5, 'branch'),
(88, 49, 1, 'fromDate'),
(89, 49, 2, 'toDate'),
(90, 50, 5, 'branch'),
(91, 50, 1, 'fromDate'),
(92, 50, 2, 'toDate'),
(93, 51, 1, NULL),
(94, 51, 2, NULL),
(95, 51, 5, NULL),
(96, 51, 10, NULL),
(97, 51, 25, NULL),
(98, 52, 5, NULL),
(99, 53, 5, NULL),
(100, 53, 10, NULL),
(101, 54, 1, NULL),
(102, 54, 2, NULL),
(103, 54, 5, NULL),
(104, 54, 10, NULL),
(105, 54, 25, NULL),
(106, 55, 5, NULL),
(107, 55, 6, NULL),
(108, 55, 10, NULL),
(109, 55, 20, NULL),
(110, 55, 25, NULL),
(111, 55, 26, NULL),
(112, 56, 5, NULL),
(113, 56, 6, NULL),
(114, 56, 10, NULL),
(115, 56, 20, NULL),
(116, 56, 25, NULL),
(117, 56, 26, NULL),
(118, 56, 100, NULL),
(119, 57, 5, NULL),
(120, 57, 6, NULL),
(121, 57, 10, NULL),
(122, 57, 20, NULL),
(123, 57, 25, NULL),
(124, 57, 26, NULL),
(125, 58, 5, NULL),
(126, 58, 6, NULL),
(127, 58, 10, NULL),
(128, 58, 20, NULL),
(129, 58, 25, NULL),
(130, 58, 26, NULL),
(131, 58, 100, NULL),
(132, 59, 1, NULL),
(133, 59, 2, NULL),
(134, 59, 5, NULL),
(135, 59, 6, NULL),
(136, 59, 10, NULL),
(137, 59, 20, NULL),
(138, 59, 25, NULL),
(139, 59, 26, NULL),
(140, 61, 5, NULL),
(141, 61, 10, NULL),
(142, 92, 1, 'fromDate'),
(143, 92, 5, 'selectOffice'),
(144, 92, 2, 'toDate'),
(145, 93, 1, NULL),
(146, 93, 2, NULL),
(147, 93, 5, NULL),
(148, 93, 6, NULL),
(149, 94, 2, 'endDate'),
(150, 94, 6, 'loanOfficerId'),
(151, 94, 5, 'officeId'),
(152, 94, 1, 'startDate'),
(256, 106, 2, NULL),
(257, 106, 6, NULL),
(258, 106, 5, NULL),
(259, 106, 1, NULL),
(263, 118, 1, 'fromDate'),
(264, 118, 2, 'toDate'),
(265, 118, 1004, 'accountNo'),
(266, 119, 1, 'fromDate'),
(267, 119, 2, 'toDate'),
(268, 119, 5, 'selectOffice'),
(269, 119, 1005, 'selectProduct'),
(270, 120, 5, 'branch'),
(271, 120, 6, 'loanOfficer'),
(272, 120, 10, 'currencyId'),
(273, 120, 20, 'fundId'),
(274, 120, 25, 'loanProductId'),
(275, 120, 26, 'loanPurposeId'),
(276, 121, 5, 'Branch'),
(277, 121, 6, 'loanOfficer'),
(278, 121, 10, 'CurrencyId'),
(279, 121, 20, 'fundId'),
(280, 121, 25, 'loanProductId'),
(281, 121, 26, 'loanPurposeId'),
(282, 121, 100, 'parType'),
(283, 122, 5, 'Branch'),
(284, 122, 6, 'loanOfficer'),
(285, 122, 10, 'CurrencyId'),
(286, 122, 20, 'fundId'),
(287, 122, 25, 'loanProductId'),
(288, 122, 26, 'loanPurposeId'),
(289, 122, 1, 'startDate'),
(290, 122, 2, 'endDate'),
(291, 123, 5, 'Branch'),
(292, 123, 6, 'Loan Officer'),
(293, 123, 10, 'CurrencyId'),
(294, 123, 20, 'fundId'),
(295, 123, 25, 'loanProductId'),
(296, 123, 26, 'loanPurposeId'),
(297, 123, 100, 'parType'),
(298, 124, 5, 'Branch'),
(299, 124, 6, 'Loan Officer'),
(300, 124, 10, 'CurrencyId'),
(301, 124, 20, 'fundId'),
(302, 124, 25, 'loanProductId'),
(303, 124, 26, 'loanPurposeId'),
(304, 125, 5, 'Branch'),
(305, 125, 6, 'Loan Officer'),
(306, 125, 10, 'CurrencyId'),
(307, 125, 20, 'fundId'),
(308, 125, 25, 'loanProductId'),
(309, 125, 26, 'loanPurposeId'),
(310, 125, 100, 'parType'),
(311, 126, 5, 'Branch'),
(312, 126, 6, 'Loan Officer'),
(313, 126, 10, 'CurrencyId'),
(314, 126, 20, 'fundId'),
(315, 126, 25, 'loanProductId'),
(316, 126, 26, 'loanPurposeId'),
(317, 127, 5, 'Branch'),
(318, 128, 5, 'Branch'),
(319, 128, 10, 'CurrencyId'),
(320, 129, 5, 'Branch'),
(321, 129, 10, 'CurrencyId'),
(322, 130, 5, 'selectOffice'),
(323, 131, 5, 'Branch'),
(324, 131, 6, 'Loan Officer'),
(325, 131, 10, 'CurrencyId'),
(326, 131, 20, 'fundId'),
(327, 131, 25, 'loanProductId'),
(328, 131, 26, 'loanPurposeId'),
(329, 132, 5, 'Branch'),
(330, 132, 6, 'Loan Officer'),
(331, 132, 1, 'startDate'),
(332, 132, 2, 'endDate'),
(333, 133, 5, 'Branch'),
(334, 133, 10, 'CurrencyId'),
(335, 133, 20, 'fundId'),
(336, 133, 1, 'startDate'),
(337, 133, 2, 'endDate'),
(338, 134, 10, 'CurrencyId'),
(339, 134, 20, 'fundId'),
(340, 134, 1, 'startDate'),
(341, 134, 2, 'endDate'),
(342, 135, 5, 'Branch'),
(343, 135, 6, 'Loan Officer'),
(344, 135, 10, 'CurrencyId'),
(345, 135, 20, 'fundId'),
(346, 135, 25, 'loanProductId'),
(347, 135, 26, 'loanPurposeId'),
(348, 136, 5, 'Branch'),
(349, 136, 6, 'Loan Officer'),
(350, 136, 10, 'CurrencyId'),
(351, 136, 20, 'fundId'),
(352, 136, 25, 'loanProductId'),
(353, 136, 26, 'loanPurposeId'),
(354, 137, 5, 'Branch'),
(355, 137, 6, 'Loan Officer'),
(356, 137, 10, 'CurrencyId'),
(357, 137, 20, 'fundId'),
(358, 137, 25, 'loanProductId'),
(359, 137, 26, 'loanPurposeId'),
(360, 138, 5, 'Branch'),
(361, 138, 6, 'Loan Officer'),
(362, 138, 10, 'CurrencyId'),
(363, 138, 20, 'fundId'),
(364, 138, 25, 'loanProductId'),
(365, 138, 26, 'loanPurposeId'),
(366, 139, 5, 'Branch'),
(367, 139, 6, 'Loan Officer'),
(368, 139, 10, 'CurrencyId'),
(369, 139, 20, 'fundId'),
(370, 139, 25, 'loanProductId'),
(371, 139, 26, 'loanPurposeId'),
(372, 139, 1, 'startDate'),
(373, 139, 2, 'endDate'),
(374, 139, 3, 'obligDateType'),
(375, 140, 5, 'Branch'),
(376, 140, 6, 'Loan Officer'),
(377, 140, 10, 'CurrencyId'),
(378, 140, 20, 'fundId'),
(379, 140, 25, 'loanProductId'),
(380, 140, 26, 'loanPurposeId'),
(381, 140, 1, 'Startdate'),
(382, 140, 2, 'Enddate'),
(383, 140, 3, 'obligDateType'),
(384, 141, 5, 'Branch'),
(385, 141, 6, 'Loan Officer'),
(386, 141, 10, 'CurrencyId'),
(387, 141, 20, 'fundId'),
(388, 141, 25, 'loanProductId'),
(389, 141, 26, 'loanPurposeId'),
(390, 141, 100, 'parType'),
(391, 142, 5, 'Branch'),
(392, 142, 6, 'loanOfficer'),
(393, 142, 10, 'CurrencyId'),
(394, 142, 20, 'fundId'),
(395, 142, 25, 'loanProductId'),
(396, 142, 26, 'loanPurposeId'),
(397, 142, 100, 'parType'),
(398, 143, 5, 'Branch'),
(399, 143, 10, 'CurrencyId'),
(400, 143, 25, 'loanProductId'),
(401, 143, 1, 'startDate'),
(402, 143, 2, 'endDate'),
(403, 144, 5, 'Branch'),
(404, 144, 6, 'Loan Officer'),
(405, 144, 1, 'startDate'),
(406, 144, 2, 'endDate'),
(407, 145, 5, 'Branch'),
(408, 145, 10, 'CurrencyId'),
(409, 145, 25, 'loanProductId'),
(410, 145, 1, 'startDate'),
(411, 145, 2, 'endDate'),
(412, 146, 1, 'startDate'),
(413, 146, 2, 'endDate'),
(414, 146, 1004, 'accountNo'),
(415, 147, 1, 'startDate'),
(416, 147, 2, 'endDate'),
(417, 147, 1004, 'selectLoan'),
(418, 149, 5, ''),
(419, 150, 5, ''),
(420, 151, 5, ''),
(421, 152, 5, ''),
(422, 153, 5, ''),
(423, 154, 5, ''),
(424, 155, 5, ''),
(425, 156, 5, ''),
(426, 157, 1006, 'transactionId'),
(427, 158, 1006, 'transactionId'),
(428, 159, 1007, 'centerId'),
(429, 160, 1008, 'account'),
(430, 160, 1, 'fromDate'),
(431, 160, 2, 'toDate'),
(432, 160, 5, 'branch'),
(433, 162, 5, 'branch'),
(434, 162, 1009, 'ondate'),
(435, 163, 5, 'branch'),
(436, 163, 1, 'fromDate'),
(437, 163, 2, 'toDate'),
(438, 164, 5, 'branch'),
(439, 164, 1, 'fromDate'),
(440, 164, 2, 'toDate'),
(441, 165, 1010, NULL),
(442, 165, 5, NULL),
(443, 166, 5, 'officeId'),
(444, 166, 6, 'loanOfficerId'),
(445, 167, 5, 'officeId'),
(446, 167, 6, 'loanOfficerId'),
(447, 168, 5, 'officeId'),
(448, 168, 6, 'loanOfficerId'),
(449, 168, 1011, 'cycleX'),
(450, 168, 1012, 'cycleY'),
(451, 169, 5, 'officeId'),
(452, 169, 6, 'loanOfficerId'),
(453, 169, 1013, 'fromX'),
(454, 169, 1014, 'toY'),
(455, 170, 5, 'officeId'),
(456, 170, 6, 'loanOfficerId'),
(457, 170, 1013, 'fromX'),
(458, 170, 1014, 'toY'),
(459, 171, 5, 'officeId'),
(460, 171, 6, 'loanOfficerId'),
(461, 172, 5, 'officeId'),
(462, 172, 6, 'loanOfficerId'),
(463, 173, 5, 'officeId'),
(464, 173, 6, 'loanOfficerId'),
(465, 173, 1013, 'fromX'),
(466, 173, 1014, 'toY'),
(467, 173, 1015, 'overdueX'),
(468, 173, 1016, 'overdueY'),
(469, 174, 5, 'officeId'),
(470, 174, 6, 'loanOfficerId'),
(471, 174, 1013, 'fromX'),
(472, 174, 1014, 'toY'),
(473, 175, 5, 'officeId'),
(474, 175, 6, 'loanOfficerId'),
(475, 175, 1013, 'fromX'),
(476, 175, 1014, 'toY'),
(477, 175, 1015, 'overdueX'),
(478, 175, 1016, 'overdueY'),
(479, 176, 5, 'officeId'),
(480, 176, 6, 'loanOfficerId'),
(481, 177, 5, 'officeId'),
(482, 177, 6, 'loanOfficerId'),
(483, 177, 1013, 'fromX'),
(484, 177, 1014, 'toY'),
(485, 178, 5, 'officeId'),
(486, 178, 6, 'loanOfficerId'),
(487, 178, 1013, 'fromX'),
(488, 178, 1014, 'toY'),
(489, 181, 5, 'officeId'),
(490, 180, 5, 'officeId'),
(491, 179, 5, 'officeId'),
(492, 181, 6, 'loanOfficerId'),
(493, 180, 6, 'loanOfficerId'),
(494, 179, 6, 'loanOfficerId'),
(495, 181, 1017, 'loanId'),
(496, 180, 1017, 'loanId'),
(497, 181, 1018, 'clientId'),
(498, 180, 1018, 'clientId'),
(499, 181, 1019, 'groupId'),
(500, 180, 1019, 'groupId'),
(501, 181, 1020, 'loanType'),
(502, 180, 1020, 'loanType'),
(503, 179, 1020, 'loanType'),
(504, 182, 5, 'officeId'),
(505, 183, 5, 'officeId'),
(506, 182, 6, 'loanOfficerId'),
(507, 183, 6, 'loanOfficerId'),
(508, 182, 1018, 'clientId'),
(509, 183, 1018, 'clientId'),
(510, 184, 5, 'officeId'),
(511, 184, 6, 'loanOfficerId'),
(512, 184, 1021, 'savingsId'),
(513, 185, 5, 'officeId'),
(514, 185, 6, 'loanOfficerId'),
(515, 185, 1021, 'savingsId'),
(516, 186, 5, 'officeId'),
(517, 186, 6, 'loanOfficerId'),
(518, 186, 1022, 'savingsTransactionId'),
(519, 187, 5, 'officeId'),
(520, 187, 6, 'loanOfficerId'),
(521, 187, 1022, 'savingsTransactionId');

-- --------------------------------------------------------

--
-- Table structure for table `topic`
--

CREATE TABLE `topic` (
  `id` bigint(20) NOT NULL,
  `title` varchar(100) NOT NULL,
  `enabled` tinyint(4) DEFAULT NULL,
  `entity_id` bigint(20) NOT NULL,
  `entity_type` text NOT NULL,
  `member_type` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `topic`
--

INSERT INTO `topic` (`id`, `title`, `enabled`, `entity_id`, `entity_type`, `member_type`) VALUES
(1, 'Self Service User of Head Office', 1, 1, 'OFFICE', 'SELF SERVICE USER'),
(2, 'Super user of Head Office', 1, 1, 'OFFICE', 'SUPER USER'),
(4, 'Super user of buruburu', 1, 2, 'BRANCH', 'SUPER USER'),
(5, 'Self Service User of buruburu', 1, 2, 'BRANCH', 'SELF SERVICE USER'),
(6, 'Teller of Head Office', 1, 1, 'OFFICE', 'TELLER'),
(7, 'Teller of buruburu', 1, 2, 'BRANCH', 'TELLER');

-- --------------------------------------------------------

--
-- Table structure for table `topic_subscriber`
--

CREATE TABLE `topic_subscriber` (
  `id` bigint(20) NOT NULL,
  `topic_id` bigint(20) NOT NULL,
  `user_id` bigint(20) NOT NULL,
  `subscription_date` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `topic_subscriber`
--

INSERT INTO `topic_subscriber` (`id`, `topic_id`, `user_id`, `subscription_date`) VALUES
(1, 2, 1, '2022-11-01'),
(2, 6, 11, '2022-11-22'),
(3, 1, 12, '2022-11-22');

-- --------------------------------------------------------

--
-- Table structure for table `twofactor_access_token`
--

CREATE TABLE `twofactor_access_token` (
  `id` bigint(20) NOT NULL,
  `token` varchar(32) NOT NULL,
  `appuser_id` bigint(20) NOT NULL,
  `valid_from` datetime NOT NULL,
  `valid_to` datetime NOT NULL,
  `enabled` bit(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `twofactor_configuration`
--

CREATE TABLE `twofactor_configuration` (
  `id` bigint(20) NOT NULL,
  `name` varchar(40) NOT NULL,
  `value` varchar(1024) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `twofactor_configuration`
--

INSERT INTO `twofactor_configuration` (`id`, `name`, `value`) VALUES
(1, 'otp-delivery-email-enable', 'true'),
(2, 'otp-delivery-email-subject', 'Fineract Two-Factor Authentication Token'),
(3, 'otp-delivery-email-body', 'Hello {{username}}.\nYour OTP login token is {{token}}.'),
(4, 'otp-delivery-sms-enable', 'false'),
(5, 'otp-delivery-sms-provider', '1'),
(6, 'otp-delivery-sms-text', 'Your authentication token for Fineract is {{token}}.'),
(7, 'otp-token-live-time', '300'),
(8, 'otp-token-length', '5'),
(9, 'access-token-live-time', '86400'),
(10, 'access-token-live-time-extended', '604800');

-- --------------------------------------------------------

--
-- Table structure for table `x_registered_table`
--

CREATE TABLE `x_registered_table` (
  `registered_table_name` varchar(50) NOT NULL,
  `application_table_name` varchar(50) NOT NULL,
  `category` int(11) NOT NULL DEFAULT '100'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `x_table_column_code_mappings`
--

CREATE TABLE `x_table_column_code_mappings` (
  `column_alias_name` varchar(50) NOT NULL,
  `code_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `acc_accounting_rule`
--
ALTER TABLE `acc_accounting_rule`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `accounting_rule_name_unique` (`name`),
  ADD KEY `FK_acc_accounting_rule_acc_gl_account_debit` (`debit_account_id`),
  ADD KEY `FK_acc_accounting_rule_acc_gl_account_credit` (`credit_account_id`),
  ADD KEY `FK_acc_accounting_rule_m_office` (`office_id`);

--
-- Indexes for table `acc_gl_account`
--
ALTER TABLE `acc_gl_account`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `acc_gl_code` (`gl_code`),
  ADD KEY `FK_ACC_0000000001` (`parent_id`),
  ADD KEY `FKGLACC000000002` (`tag_id`);

--
-- Indexes for table `acc_gl_closure`
--
ALTER TABLE `acc_gl_closure`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `office_id_closing_date` (`office_id`,`closing_date`),
  ADD KEY `FK_acc_gl_closure_m_office` (`office_id`),
  ADD KEY `FK_acc_gl_closure_m_appuser` (`createdby_id`),
  ADD KEY `FK_acc_gl_closure_m_appuser_2` (`lastmodifiedby_id`);

--
-- Indexes for table `acc_gl_financial_activity_account`
--
ALTER TABLE `acc_gl_financial_activity_account`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `financial_activity_type` (`financial_activity_type`),
  ADD KEY `FK_office_mapping_acc_gl_account` (`gl_account_id`);

--
-- Indexes for table `acc_gl_journal_entry`
--
ALTER TABLE `acc_gl_journal_entry`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FK_acc_gl_journal_entry_m_office` (`office_id`),
  ADD KEY `FK_acc_gl_journal_entry_m_appuser` (`createdby_id`),
  ADD KEY `FK_acc_gl_journal_entry_m_appuser_2` (`lastmodifiedby_id`),
  ADD KEY `FK_acc_gl_journal_entry_acc_gl_journal_entry` (`reversal_id`),
  ADD KEY `FK_acc_gl_journal_entry_acc_gl_account` (`account_id`),
  ADD KEY `FK_acc_gl_journal_entry_m_loan_transaction` (`loan_transaction_id`),
  ADD KEY `FK_acc_gl_journal_entry_m_savings_account_transaction` (`savings_transaction_id`),
  ADD KEY `FK_acc_gl_journal_entry_m_payment_detail` (`payment_details_id`),
  ADD KEY `FK_acc_gl_journal_entry_m_client_transaction` (`client_transaction_id`),
  ADD KEY `FK_acc_gl_journal_entry_m_share_account_transaction` (`share_transaction_id`),
  ADD KEY `transaction_date_index` (`transaction_date`);

--
-- Indexes for table `acc_product_mapping`
--
ALTER TABLE `acc_product_mapping`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FK_acc_product_mapping_m_charge` (`charge_id`),
  ADD KEY `FK_acc_product_mapping_m_payment_type` (`payment_type`);

--
-- Indexes for table `acc_rule_tags`
--
ALTER TABLE `acc_rule_tags`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `UNIQUE_ACCOUNT_RULE_TAGS` (`acc_rule_id`,`tag_id`,`acc_type_enum`),
  ADD KEY `FK_acc_accounting_rule_id` (`acc_rule_id`),
  ADD KEY `FK_m_code_value_id` (`tag_id`);

--
-- Indexes for table `client_device_registration`
--
ALTER TABLE `client_device_registration`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `registration_key_client_device_registration` (`registration_id`),
  ADD UNIQUE KEY `client_key_client_device_registration` (`client_id`),
  ADD KEY `FK1_client_device_registration_m_client` (`client_id`);

--
-- Indexes for table `c_account_number_format`
--
ALTER TABLE `c_account_number_format`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `account_type_enum` (`account_type_enum`);

--
-- Indexes for table `c_cache`
--
ALTER TABLE `c_cache`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `c_configuration`
--
ALTER TABLE `c_configuration`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `name_UNIQUE` (`name`);

--
-- Indexes for table `c_external_service`
--
ALTER TABLE `c_external_service`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `name_UNIQUE` (`name`);

--
-- Indexes for table `c_external_service_properties`
--
ALTER TABLE `c_external_service_properties`
  ADD KEY `FK_c_external_service_properties_c_external_service` (`external_service_id`);

--
-- Indexes for table `glim_accounts`
--
ALTER TABLE `glim_accounts`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `glim_account_no_UNIQUE` (`account_number`),
  ADD KEY `FK_group_id` (`group_id`);

--
-- Indexes for table `gsim_accounts`
--
ALTER TABLE `gsim_accounts`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `gsim_account_no_UNIQUE` (`account_number`),
  ADD KEY `FK_gsim_group_id` (`group_id`);

--
-- Indexes for table `interop_identifier`
--
ALTER TABLE `interop_identifier`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `uk_interop_identifier_account` (`account_id`,`type`),
  ADD UNIQUE KEY `uk_interop_identifier_value` (`type`,`a_value`,`sub_value_or_type`),
  ADD KEY `fk_interop_identifier_account` (`account_id`);

--
-- Indexes for table `job`
--
ALTER TABLE `job`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `job_parameters`
--
ALTER TABLE `job_parameters`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FK_job_id` (`job_id`);

--
-- Indexes for table `job_run_history`
--
ALTER TABLE `job_run_history`
  ADD PRIMARY KEY (`id`),
  ADD KEY `scheduledjobsFK` (`job_id`);

--
-- Indexes for table `mix_taxonomy`
--
ALTER TABLE `mix_taxonomy`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `mix_taxonomy_mapping`
--
ALTER TABLE `mix_taxonomy_mapping`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `mix_xbrl_namespace`
--
ALTER TABLE `mix_xbrl_namespace`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `UNQUE` (`prefix`);

--
-- Indexes for table `m_account_transfer_details`
--
ALTER TABLE `m_account_transfer_details`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FK_m_account_transfer_details_from_office` (`from_office_id`),
  ADD KEY `FK_m_account_transfer_details_to_office` (`to_office_id`),
  ADD KEY `FK_m_account_transfer_details_from_client` (`from_client_id`),
  ADD KEY `FK_m_account_transfer_details_to_client` (`to_client_id`),
  ADD KEY `FK_m_account_transfer_details_from_savings_account` (`from_savings_account_id`),
  ADD KEY `FK_m_account_transfer_details_to_savings_account` (`to_savings_account_id`),
  ADD KEY `FK_m_account_transfer_details_from_loan_account` (`from_loan_account_id`),
  ADD KEY `FK_m_account_transfer_details_to_loan_account` (`to_loan_account_id`);

--
-- Indexes for table `m_account_transfer_standing_instructions`
--
ALTER TABLE `m_account_transfer_standing_instructions`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `name` (`name`),
  ADD KEY `FK_m_standing_instructions_account_transfer_details` (`account_transfer_details_id`);

--
-- Indexes for table `m_account_transfer_standing_instructions_history`
--
ALTER TABLE `m_account_transfer_standing_instructions_history`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FK_m_account_transfer_standing_instructions_history` (`standing_instruction_id`);

--
-- Indexes for table `m_account_transfer_transaction`
--
ALTER TABLE `m_account_transfer_transaction`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FK_m_account_transfer_transaction_from_m_savings_transaction` (`from_savings_transaction_id`),
  ADD KEY `FK_m_account_transfer_transaction_to_m_savings_transaction` (`to_savings_transaction_id`),
  ADD KEY `FK_m_account_transfer_transaction_to_m_loan_transaction` (`to_loan_transaction_id`),
  ADD KEY `FK_m_account_transfer_transaction_from_m_loan_transaction` (`from_loan_transaction_id`),
  ADD KEY `FK_m_account_transfer_transaction_account_detail` (`account_transfer_details_id`);

--
-- Indexes for table `m_address`
--
ALTER TABLE `m_address`
  ADD PRIMARY KEY (`id`),
  ADD KEY `address_fields_codefk1` (`state_province_id`),
  ADD KEY `address_fields_codefk2` (`country_id`);

--
-- Indexes for table `m_adhoc`
--
ALTER TABLE `m_adhoc`
  ADD PRIMARY KEY (`id`),
  ADD KEY `createdby_id` (`createdby_id`),
  ADD KEY `lastmodifiedby_id` (`lastmodifiedby_id`);

--
-- Indexes for table `m_appuser`
--
ALTER TABLE `m_appuser`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `username_org` (`username`),
  ADD KEY `FKB3D587CE0DD567A` (`office_id`),
  ADD KEY `fk_m_appuser_002x` (`staff_id`),
  ADD KEY `last_time_password_updated` (`last_time_password_updated`);

--
-- Indexes for table `m_appuser_previous_password`
--
ALTER TABLE `m_appuser_previous_password`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `m_appuser_role`
--
ALTER TABLE `m_appuser_role`
  ADD PRIMARY KEY (`appuser_id`,`role_id`),
  ADD KEY `FK7662CE59B4100309` (`appuser_id`),
  ADD KEY `FK7662CE5915CEC7AB` (`role_id`);

--
-- Indexes for table `m_calendar`
--
ALTER TABLE `m_calendar`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `m_calendar_history`
--
ALTER TABLE `m_calendar_history`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FK_m_calendar_m_calendar_history` (`calendar_id`);

--
-- Indexes for table `m_calendar_instance`
--
ALTER TABLE `m_calendar_instance`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FK_m_calendar_m_calendar_instance` (`calendar_id`);

--
-- Indexes for table `m_cashiers`
--
ALTER TABLE `m_cashiers`
  ADD PRIMARY KEY (`id`),
  ADD KEY `IK_m_cashiers_m_staff` (`staff_id`),
  ADD KEY `IK_m_cashiers_m_teller` (`teller_id`);

--
-- Indexes for table `m_cashier_transactions`
--
ALTER TABLE `m_cashier_transactions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `IK_m_teller_transactions_m_cashier` (`cashier_id`);

--
-- Indexes for table `m_charge`
--
ALTER TABLE `m_charge`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `name` (`name`),
  ADD KEY `FK_m_charge_acc_gl_account` (`income_or_liability_account_id`),
  ADD KEY `FK_m_charge_m_tax_group` (`tax_group_id`);

--
-- Indexes for table `m_client`
--
ALTER TABLE `m_client`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `account_no_UNIQUE` (`account_no`),
  ADD UNIQUE KEY `external_id` (`external_id`),
  ADD UNIQUE KEY `mobile_no_UNIQUE` (`mobile_no`),
  ADD KEY `FKCE00CAB3E0DD567A` (`office_id`),
  ADD KEY `FK_m_client_m_image` (`image_id`),
  ADD KEY `client_staff_id` (`staff_id`),
  ADD KEY `FK_m_client_m_code` (`closure_reason_cv_id`),
  ADD KEY `FK_m_client_m_office` (`transfer_to_office_id`),
  ADD KEY `FK_m_client_m_savings_product` (`default_savings_product`),
  ADD KEY `FK_m_client_m_savings_account` (`default_savings_account`),
  ADD KEY `FK_m_client_type_m_code_value` (`client_type_cv_id`),
  ADD KEY `FK_m_client_classification_m_code_value` (`client_classification_cv_id`),
  ADD KEY `FK1_m_client_gender_m_code_value` (`gender_cv_id`),
  ADD KEY `FK_m_client_substatus_m_code_value` (`sub_status`),
  ADD KEY `FK_m_client_type_mcode_value_reject` (`reject_reason_cv_id`),
  ADD KEY `FK_m_client_type_m_code_value_withdraw` (`withdraw_reason_cv_id`);

--
-- Indexes for table `m_client_address`
--
ALTER TABLE `m_client_address`
  ADD PRIMARY KEY (`id`),
  ADD KEY `addressIdFk` (`address_id`),
  ADD KEY `address_codefk` (`address_type_id`),
  ADD KEY `clientaddressfk` (`client_id`);

--
-- Indexes for table `m_client_attendance`
--
ALTER TABLE `m_client_attendance`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `unique_client_meeting_attendance` (`client_id`,`meeting_id`),
  ADD KEY `FK_m_meeting_m_client_attendance` (`meeting_id`);

--
-- Indexes for table `m_client_charge`
--
ALTER TABLE `m_client_charge`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FK_m_client_charge_m_client` (`client_id`),
  ADD KEY `FK_m_client_charge_m_charge` (`charge_id`);

--
-- Indexes for table `m_client_charge_paid_by`
--
ALTER TABLE `m_client_charge_paid_by`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FK_m_client_charge_paid_by_m_client_transaction` (`client_transaction_id`),
  ADD KEY `FK_m_client_charge_paid_by_m_client_charge` (`client_charge_id`);

--
-- Indexes for table `m_client_identifier`
--
ALTER TABLE `m_client_identifier`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `unique_identifier_key` (`document_type_id`,`document_key`),
  ADD UNIQUE KEY `unique_active_client_identifier` (`client_id`,`document_type_id`,`active`),
  ADD KEY `FK_m_client_document_m_client` (`client_id`),
  ADD KEY `FK_m_client_document_m_code_value` (`document_type_id`);

--
-- Indexes for table `m_client_non_person`
--
ALTER TABLE `m_client_non_person`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `client_id` (`client_id`),
  ADD KEY `FK_client_id` (`client_id`);

--
-- Indexes for table `m_client_transaction`
--
ALTER TABLE `m_client_transaction`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `external_id` (`external_id`),
  ADD KEY `FK_m_client_transaction_m_client` (`client_id`),
  ADD KEY `FK_m_client_transaction_m_appuser` (`appuser_id`);

--
-- Indexes for table `m_client_transfer_details`
--
ALTER TABLE `m_client_transfer_details`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FK_m_client_transfer_details_m_client` (`client_id`),
  ADD KEY `FK_m_client_transfer_details_m_office` (`from_office_id`),
  ADD KEY `FK_m_client_transfer_details_m_office_2` (`to_office_id`),
  ADD KEY `FK_m_client_transfer_details_m_appuser` (`submitted_by`);

--
-- Indexes for table `m_code`
--
ALTER TABLE `m_code`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `code_name` (`code_name`);

--
-- Indexes for table `m_code_value`
--
ALTER TABLE `m_code_value`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `code_value` (`code_id`,`code_value`),
  ADD KEY `FKCFCEA42640BE071Z` (`code_id`);

--
-- Indexes for table `m_creditbureau`
--
ALTER TABLE `m_creditbureau`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `unique impl` (`name`,`product`,`country`,`implementationKey`);

--
-- Indexes for table `m_creditbureau_configuration`
--
ALTER TABLE `m_creditbureau_configuration`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `mcbconfig` (`configkey`,`organisation_creditbureau_id`),
  ADD KEY `cbConfigfk1` (`organisation_creditbureau_id`);

--
-- Indexes for table `m_creditbureau_loanproduct_mapping`
--
ALTER TABLE `m_creditbureau_loanproduct_mapping`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `cblpunique_key` (`organisation_creditbureau_id`,`loan_product_id`),
  ADD KEY `fk_cb_lp2` (`loan_product_id`);

--
-- Indexes for table `m_creditbureau_token`
--
ALTER TABLE `m_creditbureau_token`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `m_creditreport`
--
ALTER TABLE `m_creditreport`
  ADD PRIMARY KEY (`id`),
  ADD KEY `cbId` (`creditBureauId`);

--
-- Indexes for table `m_currency`
--
ALTER TABLE `m_currency`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `code` (`code`);

--
-- Indexes for table `m_deposit_account_on_hold_transaction`
--
ALTER TABLE `m_deposit_account_on_hold_transaction`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FK_deposit_on_hold_transaction_m_savings_account` (`savings_account_id`);

--
-- Indexes for table `m_deposit_account_recurring_detail`
--
ALTER TABLE `m_deposit_account_recurring_detail`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FKDARD00000000000001` (`savings_account_id`);

--
-- Indexes for table `m_deposit_account_term_and_preclosure`
--
ALTER TABLE `m_deposit_account_term_and_preclosure`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FKDATP00000000000001` (`savings_account_id`),
  ADD KEY `transfer_to_savings_account_id` (`transfer_to_savings_account_id`);

--
-- Indexes for table `m_deposit_product_interest_rate_chart`
--
ALTER TABLE `m_deposit_product_interest_rate_chart`
  ADD UNIQUE KEY `deposit_product_id_interest_rate_chart_id` (`deposit_product_id`,`interest_rate_chart_id`),
  ADD KEY `FKDPIRC00000000000002` (`interest_rate_chart_id`);

--
-- Indexes for table `m_deposit_product_recurring_detail`
--
ALTER TABLE `m_deposit_product_recurring_detail`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FKDPRD00000000000001` (`savings_product_id`);

--
-- Indexes for table `m_deposit_product_term_and_preclosure`
--
ALTER TABLE `m_deposit_product_term_and_preclosure`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FKDPTP00000000000001` (`savings_product_id`);

--
-- Indexes for table `m_document`
--
ALTER TABLE `m_document`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `m_entity_datatable_check`
--
ALTER TABLE `m_entity_datatable_check`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `unique_entity_check` (`application_table_name`,`x_registered_table_name`,`status_enum`,`product_id`),
  ADD KEY `x_registered_table_name` (`x_registered_table_name`),
  ADD KEY `product_id` (`product_id`);

--
-- Indexes for table `m_entity_relation`
--
ALTER TABLE `m_entity_relation`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `from_entity_type_to_entity_type_code_name` (`from_entity_type`,`to_entity_type`,`code_name`);

--
-- Indexes for table `m_entity_to_entity_access`
--
ALTER TABLE `m_entity_to_entity_access`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `id_uniq_m_entity_to_entity_access` (`entity_type`,`entity_id`,`access_type_code_value_id`,`second_entity_type`,`second_entity_id`),
  ADD KEY `IDX_OFFICE` (`entity_type`,`entity_id`),
  ADD KEY `FK_access_type_code_m_code_value` (`access_type_code_value_id`);

--
-- Indexes for table `m_entity_to_entity_mapping`
--
ALTER TABLE `m_entity_to_entity_mapping`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `rel_id_from_id_to_id` (`rel_id`,`from_id`,`to_id`);

--
-- Indexes for table `m_family_members`
--
ALTER TABLE `m_family_members`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FK_m_family_members_client_id_m_client` (`client_id`),
  ADD KEY `FK_m_family_members_relationship_m_code_value` (`relationship_cv_id`),
  ADD KEY `FK_m_family_members_marital_status_m_code_value` (`marital_status_cv_id`),
  ADD KEY `FK_m_family_members_gender_m_code_value` (`gender_cv_id`),
  ADD KEY `FK_m_family_members_profession_m_code_value` (`profession_cv_id`);

--
-- Indexes for table `m_field_configuration`
--
ALTER TABLE `m_field_configuration`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `m_floating_rates`
--
ALTER TABLE `m_floating_rates`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `unq_name` (`name`);

--
-- Indexes for table `m_floating_rates_periods`
--
ALTER TABLE `m_floating_rates_periods`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FK_mappings_m_floating_rates` (`floating_rates_id`);

--
-- Indexes for table `m_fund`
--
ALTER TABLE `m_fund`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `fund_name_org` (`name`),
  ADD UNIQUE KEY `fund_externalid_org` (`external_id`);

--
-- Indexes for table `m_group`
--
ALTER TABLE `m_group`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `name` (`display_name`,`level_id`),
  ADD UNIQUE KEY `external_id` (`external_id`,`level_id`),
  ADD UNIQUE KEY `external_id_UNIQUE` (`external_id`),
  ADD KEY `office_id` (`office_id`),
  ADD KEY `staff_id` (`staff_id`),
  ADD KEY `Parent_Id_reference` (`parent_id`),
  ADD KEY `FK_m_group_level` (`level_id`),
  ADD KEY `FK_m_group_m_code` (`closure_reason_cv_id`);

--
-- Indexes for table `m_group_client`
--
ALTER TABLE `m_group_client`
  ADD PRIMARY KEY (`group_id`,`client_id`),
  ADD KEY `client_id` (`client_id`);

--
-- Indexes for table `m_group_level`
--
ALTER TABLE `m_group_level`
  ADD PRIMARY KEY (`id`),
  ADD KEY `Parent_levelId_reference` (`parent_id`);

--
-- Indexes for table `m_group_roles`
--
ALTER TABLE `m_group_roles`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `UNIQUE_GROUP_ROLES` (`client_id`,`group_id`,`role_cv_id`),
  ADD KEY `FKGroupRoleClientId` (`client_id`),
  ADD KEY `FKGroupRoleGroupId` (`group_id`),
  ADD KEY `FK_grouprole_m_codevalue` (`role_cv_id`);

--
-- Indexes for table `m_guarantor`
--
ALTER TABLE `m_guarantor`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FK_m_guarantor_m_loan` (`loan_id`),
  ADD KEY `FK_m_guarantor_m_code_value` (`client_reln_cv_id`);

--
-- Indexes for table `m_guarantor_funding_details`
--
ALTER TABLE `m_guarantor_funding_details`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FK_m_guarantor_fund_details_m_guarantor` (`guarantor_id`),
  ADD KEY `FK_m_guarantor_fund_details_account_associations_id` (`account_associations_id`);

--
-- Indexes for table `m_guarantor_transaction`
--
ALTER TABLE `m_guarantor_transaction`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FK_guarantor_transaction_m_deposit_account_on_hold_transaction` (`deposit_on_hold_transaction_id`),
  ADD KEY `FK_guarantor_transaction_guarantor_fund_detail` (`guarantor_fund_detail_id`),
  ADD KEY `FK_guarantor_transaction_m_loan_transaction` (`loan_transaction_id`);

--
-- Indexes for table `m_holiday`
--
ALTER TABLE `m_holiday`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `holiday_name` (`name`,`from_date`);

--
-- Indexes for table `m_holiday_office`
--
ALTER TABLE `m_holiday_office`
  ADD PRIMARY KEY (`holiday_id`,`office_id`),
  ADD KEY `m_holiday_id_ibfk_1` (`holiday_id`),
  ADD KEY `m_office_id_ibfk_2` (`office_id`);

--
-- Indexes for table `m_hook`
--
ALTER TABLE `m_hook`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_template_id_idx` (`template_id`),
  ADD KEY `fk_ugd_template_id` (`ugd_template_id`);

--
-- Indexes for table `m_hook_configuration`
--
ALTER TABLE `m_hook_configuration`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_hook_id_idx` (`hook_id`);

--
-- Indexes for table `m_hook_registered_events`
--
ALTER TABLE `m_hook_registered_events`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_hook_id_idx` (`hook_id`);

--
-- Indexes for table `m_hook_schema`
--
ALTER TABLE `m_hook_schema`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_hook_template_id_idx` (`hook_template_id`);

--
-- Indexes for table `m_hook_templates`
--
ALTER TABLE `m_hook_templates`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `m_image`
--
ALTER TABLE `m_image`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `m_import_document`
--
ALTER TABLE `m_import_document`
  ADD PRIMARY KEY (`id`),
  ADD KEY `import_document_id` (`document_id`),
  ADD KEY `FK_m_import_m_appuser` (`createdby_id`);

--
-- Indexes for table `m_interest_incentives`
--
ALTER TABLE `m_interest_incentives`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FK_m_interest_incentives_m_interest_rate_slab` (`interest_rate_slab_id`);

--
-- Indexes for table `m_interest_rate_chart`
--
ALTER TABLE `m_interest_rate_chart`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `m_interest_rate_slab`
--
ALTER TABLE `m_interest_rate_slab`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FKIRS00000000000001` (`interest_rate_chart_id`);

--
-- Indexes for table `m_loan`
--
ALTER TABLE `m_loan`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `loan_account_no_UNIQUE` (`account_no`),
  ADD UNIQUE KEY `loan_externalid_UNIQUE` (`external_id`),
  ADD KEY `FKB6F935D87179A0CB` (`client_id`),
  ADD KEY `FKB6F935D8C8D4B434` (`product_id`),
  ADD KEY `FK7C885877240145` (`fund_id`),
  ADD KEY `FK_loan_ltp_strategy` (`loan_transaction_strategy_id`),
  ADD KEY `FK_m_loan_m_staff` (`loan_officer_id`),
  ADD KEY `group_id` (`group_id`),
  ADD KEY `FK_m_loanpurpose_codevalue` (`loanpurpose_cv_id`),
  ADD KEY `FK_submittedon_userid` (`submittedon_userid`),
  ADD KEY `FK_approvedon_userid` (`approvedon_userid`),
  ADD KEY `FK_rejectedon_userid` (`rejectedon_userid`),
  ADD KEY `FK_withdrawnon_userid` (`withdrawnon_userid`),
  ADD KEY `FK_disbursedon_userid` (`disbursedon_userid`),
  ADD KEY `FK_closedon_userid` (`closedon_userid`),
  ADD KEY `fk_m_group_client_001_idx` (`group_id`,`client_id`),
  ADD KEY `FK_writeoffreason_m_loan_m_code_value` (`writeoff_reason_cv_id`),
  ADD KEY `FK_glim_id` (`glim_id`);

--
-- Indexes for table `m_loanproduct_provisioning_entry`
--
ALTER TABLE `m_loanproduct_provisioning_entry`
  ADD PRIMARY KEY (`id`),
  ADD KEY `history_id` (`history_id`),
  ADD KEY `criteria_id` (`criteria_id`),
  ADD KEY `office_id` (`office_id`),
  ADD KEY `product_id` (`product_id`),
  ADD KEY `category_id` (`category_id`),
  ADD KEY `liability_account` (`liability_account`),
  ADD KEY `expense_account` (`expense_account`);

--
-- Indexes for table `m_loanproduct_provisioning_mapping`
--
ALTER TABLE `m_loanproduct_provisioning_mapping`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `product_id` (`product_id`),
  ADD KEY `criteria_id` (`criteria_id`);

--
-- Indexes for table `m_loan_arrears_aging`
--
ALTER TABLE `m_loan_arrears_aging`
  ADD PRIMARY KEY (`loan_id`);

--
-- Indexes for table `m_loan_charge`
--
ALTER TABLE `m_loan_charge`
  ADD PRIMARY KEY (`id`),
  ADD KEY `charge_id` (`charge_id`),
  ADD KEY `m_loan_charge_ibfk_2` (`loan_id`);

--
-- Indexes for table `m_loan_charge_paid_by`
--
ALTER TABLE `m_loan_charge_paid_by`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FK__m_loan_transaction` (`loan_transaction_id`),
  ADD KEY `FK__m_loan_charge` (`loan_charge_id`);

--
-- Indexes for table `m_loan_collateral`
--
ALTER TABLE `m_loan_collateral`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FK_collateral_m_loan` (`loan_id`),
  ADD KEY `FK_collateral_code_value` (`type_cv_id`);

--
-- Indexes for table `m_loan_disbursement_detail`
--
ALTER TABLE `m_loan_disbursement_detail`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FK_loan_disbursement_detail_loan_id` (`loan_id`);

--
-- Indexes for table `m_loan_installment_charge`
--
ALTER TABLE `m_loan_installment_charge`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FK_loan_charge_id_charge_schedule` (`loan_charge_id`),
  ADD KEY `FK_loan_schedule_id_charge_schedule` (`loan_schedule_id`);

--
-- Indexes for table `m_loan_interest_recalculation_additional_details`
--
ALTER TABLE `m_loan_interest_recalculation_additional_details`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FK_additional_details_repayment_schedule_id` (`loan_repayment_schedule_id`);

--
-- Indexes for table `m_loan_officer_assignment_history`
--
ALTER TABLE `m_loan_officer_assignment_history`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_m_loan_officer_assignment_history_0001` (`loan_id`),
  ADD KEY `fk_m_loan_officer_assignment_history_0002` (`loan_officer_id`);

--
-- Indexes for table `m_loan_overdue_installment_charge`
--
ALTER TABLE `m_loan_overdue_installment_charge`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FK_m_loan_overdue_installment_charge_m_loan_charge` (`loan_charge_id`),
  ADD KEY `FK_m_loan_overdue_installment_charge_m_loan_repayment_schedule` (`loan_schedule_id`);

--
-- Indexes for table `m_loan_paid_in_advance`
--
ALTER TABLE `m_loan_paid_in_advance`
  ADD PRIMARY KEY (`loan_id`);

--
-- Indexes for table `m_loan_rate`
--
ALTER TABLE `m_loan_rate`
  ADD PRIMARY KEY (`loan_id`,`rate_id`),
  ADD KEY `FK_M_LOAN_RATE_RATE` (`rate_id`);

--
-- Indexes for table `m_loan_recalculation_details`
--
ALTER TABLE `m_loan_recalculation_details`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FK_m_loan_m_loan_recalculation_details` (`loan_id`);

--
-- Indexes for table `m_loan_repayment_schedule`
--
ALTER TABLE `m_loan_repayment_schedule`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FK488B92AA40BE0710` (`loan_id`);

--
-- Indexes for table `m_loan_repayment_schedule_history`
--
ALTER TABLE `m_loan_repayment_schedule_history`
  ADD PRIMARY KEY (`id`),
  ADD KEY `loan_id` (`loan_id`),
  ADD KEY `loan_reschedule_request_id` (`loan_reschedule_request_id`);

--
-- Indexes for table `m_loan_reschedule_request`
--
ALTER TABLE `m_loan_reschedule_request`
  ADD PRIMARY KEY (`id`),
  ADD KEY `loan_id` (`loan_id`),
  ADD KEY `reschedule_reason_cv_id` (`reschedule_reason_cv_id`),
  ADD KEY `submitted_by_user_id` (`submitted_by_user_id`),
  ADD KEY `approved_by_user_id` (`approved_by_user_id`),
  ADD KEY `rejected_by_user_id` (`rejected_by_user_id`);

--
-- Indexes for table `m_loan_reschedule_request_term_variations_mapping`
--
ALTER TABLE `m_loan_reschedule_request_term_variations_mapping`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FK__m_loan_reschedule_request` (`loan_reschedule_request_id`),
  ADD KEY `FK__m_loan_term_variations` (`loan_term_variations_id`);

--
-- Indexes for table `m_loan_term_variations`
--
ALTER TABLE `m_loan_term_variations`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FK_loan_id_m_loan_id` (`loan_id`);

--
-- Indexes for table `m_loan_topup`
--
ALTER TABLE `m_loan_topup`
  ADD PRIMARY KEY (`id`),
  ADD KEY `m_loan_topup_FK_loan_id` (`loan_id`),
  ADD KEY `m_loan_topup_FK_closure_loan_id` (`closure_loan_id`),
  ADD KEY `m_loan_topup_FK_account_transfer_details_id` (`account_transfer_details_id`);

--
-- Indexes for table `m_loan_tranche_charges`
--
ALTER TABLE `m_loan_tranche_charges`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FK_m_loan_tranche_charges_m_loan` (`loan_id`),
  ADD KEY `FK_m_loan_tranche_charges_m_charge` (`charge_id`);

--
-- Indexes for table `m_loan_tranche_disbursement_charge`
--
ALTER TABLE `m_loan_tranche_disbursement_charge`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FK_m_loan_tranche_disbursement_charge_m_loan_charge` (`loan_charge_id`),
  ADD KEY `FK_m_loan_tranche_disbursement_charge_m_loan_disbursement_detail` (`disbursement_detail_id`);

--
-- Indexes for table `m_loan_transaction`
--
ALTER TABLE `m_loan_transaction`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `external_id_UNIQUE` (`external_id`),
  ADD KEY `FKCFCEA42640BE0710` (`loan_id`),
  ADD KEY `FK_m_loan_transaction_m_payment_detail` (`payment_detail_id`),
  ADD KEY `FK_m_loan_transaction_m_office` (`office_id`);

--
-- Indexes for table `m_loan_transaction_repayment_schedule_mapping`
--
ALTER TABLE `m_loan_transaction_repayment_schedule_mapping`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FK_mappings_m_loan_transaction` (`loan_transaction_id`),
  ADD KEY `FK_mappings_m_loan_repayment_schedule` (`loan_repayment_schedule_id`);

--
-- Indexes for table `m_mandatory_savings_schedule`
--
ALTER TABLE `m_mandatory_savings_schedule`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FKMSS0000000001` (`savings_account_id`);

--
-- Indexes for table `m_meeting`
--
ALTER TABLE `m_meeting`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `unique_calendar_instance_id_meeting_date` (`calendar_instance_id`,`meeting_date`);

--
-- Indexes for table `m_note`
--
ALTER TABLE `m_note`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FK7C9708924D26803` (`loan_transaction_id`),
  ADD KEY `FK7C97089541F0A56` (`createdby_id`),
  ADD KEY `FK7C970897179A0CB` (`client_id`),
  ADD KEY `FK_m_note_m_group` (`group_id`),
  ADD KEY `FK7C970898F889C3F` (`lastmodifiedby_id`),
  ADD KEY `FK7C9708940BE0710` (`loan_id`),
  ADD KEY `FK_savings_account_id` (`savings_account_id`),
  ADD KEY `savings_account_transaction_id` (`savings_account_transaction_id`);

--
-- Indexes for table `m_office`
--
ALTER TABLE `m_office`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `name_org` (`name`),
  ADD UNIQUE KEY `externalid_org` (`external_id`),
  ADD KEY `FK2291C477E2551DCC` (`parent_id`);

--
-- Indexes for table `m_office_transaction`
--
ALTER TABLE `m_office_transaction`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FK1E37728B93C6C1B6` (`to_office_id`),
  ADD KEY `FK1E37728B783C5C25` (`from_office_id`);

--
-- Indexes for table `m_organisation_creditbureau`
--
ALTER TABLE `m_organisation_creditbureau`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `morgcb` (`alias`,`creditbureau_id`),
  ADD KEY `orgcb_cbfk` (`creditbureau_id`);

--
-- Indexes for table `m_organisation_currency`
--
ALTER TABLE `m_organisation_currency`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `m_password_validation_policy`
--
ALTER TABLE `m_password_validation_policy`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `m_payment_detail`
--
ALTER TABLE `m_payment_detail`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FK_m_payment_detail_m_payment_type` (`payment_type_id`);

--
-- Indexes for table `m_payment_type`
--
ALTER TABLE `m_payment_type`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `m_permission`
--
ALTER TABLE `m_permission`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `code` (`code`);

--
-- Indexes for table `m_pocket`
--
ALTER TABLE `m_pocket`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `app_user_id` (`app_user_id`);

--
-- Indexes for table `m_pocket_accounts_mapping`
--
ALTER TABLE `m_pocket_accounts_mapping`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `unique_pocket_mapping` (`pocket_id`,`account_id`,`account_type`);

--
-- Indexes for table `m_portfolio_account_associations`
--
ALTER TABLE `m_portfolio_account_associations`
  ADD PRIMARY KEY (`id`),
  ADD KEY `account_association_loan_fk` (`loan_account_id`),
  ADD KEY `account_association_savings_fk` (`savings_account_id`),
  ADD KEY `linked_loan_fk` (`linked_loan_account_id`),
  ADD KEY `linked_savings_fk` (`linked_savings_account_id`);

--
-- Indexes for table `m_portfolio_command_source`
--
ALTER TABLE `m_portfolio_command_source`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FK_m_maker_m_appuser` (`maker_id`),
  ADD KEY `FK_m_checker_m_appuser` (`checker_id`),
  ADD KEY `action_name` (`action_name`),
  ADD KEY `entity_name` (`entity_name`,`resource_id`),
  ADD KEY `made_on_date` (`made_on_date`),
  ADD KEY `checked_on_date` (`checked_on_date`),
  ADD KEY `processing_result_enum` (`processing_result_enum`),
  ADD KEY `office_id` (`office_id`),
  ADD KEY `group_id` (`office_id`),
  ADD KEY `client_id` (`office_id`),
  ADD KEY `loan_id` (`office_id`);

--
-- Indexes for table `m_product_loan`
--
ALTER TABLE `m_product_loan`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `unq_name` (`name`),
  ADD UNIQUE KEY `unq_short_name` (`short_name`),
  ADD UNIQUE KEY `external_id_UNIQUE` (`external_id`),
  ADD KEY `FKA6A8A7D77240145` (`fund_id`),
  ADD KEY `FK_ltp_strategy` (`loan_transaction_strategy_id`);

--
-- Indexes for table `m_product_loan_charge`
--
ALTER TABLE `m_product_loan_charge`
  ADD PRIMARY KEY (`product_loan_id`,`charge_id`),
  ADD KEY `charge_id` (`charge_id`);

--
-- Indexes for table `m_product_loan_configurable_attributes`
--
ALTER TABLE `m_product_loan_configurable_attributes`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_m_product_loan_configurable_attributes_0001` (`loan_product_id`);

--
-- Indexes for table `m_product_loan_floating_rates`
--
ALTER TABLE `m_product_loan_floating_rates`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FK_mappings_m_product_loan_id` (`loan_product_id`),
  ADD KEY `FK_mappings_m_floating_rates_id` (`floating_rates_id`);

--
-- Indexes for table `m_product_loan_guarantee_details`
--
ALTER TABLE `m_product_loan_guarantee_details`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FK_guarantee_details_loan_product` (`loan_product_id`);

--
-- Indexes for table `m_product_loan_rate`
--
ALTER TABLE `m_product_loan_rate`
  ADD PRIMARY KEY (`product_loan_id`,`rate_id`),
  ADD KEY `FK_M_PRODUCT_LOAN_RATE_RATE` (`rate_id`);

--
-- Indexes for table `m_product_loan_recalculation_details`
--
ALTER TABLE `m_product_loan_recalculation_details`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FK_m_product_loan_m_product_loan_recalculation_details` (`product_id`);

--
-- Indexes for table `m_product_loan_variable_installment_config`
--
ALTER TABLE `m_product_loan_variable_installment_config`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FK_mappings_m_variable_product_loan_id` (`loan_product_id`);

--
-- Indexes for table `m_product_loan_variations_borrower_cycle`
--
ALTER TABLE `m_product_loan_variations_borrower_cycle`
  ADD PRIMARY KEY (`id`),
  ADD KEY `borrower_cycle_loan_product_FK` (`loan_product_id`);

--
-- Indexes for table `m_product_mix`
--
ALTER TABLE `m_product_mix`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FK_m_product_mix_product_id_to_m_product_loan` (`product_id`),
  ADD KEY `FK_m_product_mix_restricted_product_id_to_m_product_loan` (`restricted_product_id`);

--
-- Indexes for table `m_provisioning_criteria`
--
ALTER TABLE `m_provisioning_criteria`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `criteria_name` (`criteria_name`),
  ADD KEY `createdby_id` (`createdby_id`),
  ADD KEY `lastmodifiedby_id` (`lastmodifiedby_id`);

--
-- Indexes for table `m_provisioning_criteria_definition`
--
ALTER TABLE `m_provisioning_criteria_definition`
  ADD PRIMARY KEY (`id`),
  ADD KEY `criteria_id` (`criteria_id`),
  ADD KEY `category_id` (`category_id`),
  ADD KEY `liability_account` (`liability_account`),
  ADD KEY `expense_account` (`expense_account`);

--
-- Indexes for table `m_provisioning_history`
--
ALTER TABLE `m_provisioning_history`
  ADD PRIMARY KEY (`id`),
  ADD KEY `createdby_id` (`createdby_id`),
  ADD KEY `lastmodifiedby_id` (`lastmodifiedby_id`);

--
-- Indexes for table `m_provision_category`
--
ALTER TABLE `m_provision_category`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `category_name` (`category_name`);

--
-- Indexes for table `m_rate`
--
ALTER TABLE `m_rate`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FK_M_RATE_CREATE_USER` (`createdby_id`),
  ADD KEY `FK_M_RATE_APPROVE_USER` (`approve_user`);

--
-- Indexes for table `m_report_mailing_job`
--
ALTER TABLE `m_report_mailing_job`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `unique_name` (`name`),
  ADD KEY `createdby_id` (`createdby_id`),
  ADD KEY `lastmodifiedby_id` (`lastmodifiedby_id`),
  ADD KEY `stretchy_report_id` (`stretchy_report_id`),
  ADD KEY `run_as_userid` (`run_as_userid`);

--
-- Indexes for table `m_report_mailing_job_configuration`
--
ALTER TABLE `m_report_mailing_job_configuration`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `unique_name` (`name`);

--
-- Indexes for table `m_report_mailing_job_run_history`
--
ALTER TABLE `m_report_mailing_job_run_history`
  ADD PRIMARY KEY (`id`),
  ADD KEY `job_id` (`job_id`);

--
-- Indexes for table `m_role`
--
ALTER TABLE `m_role`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `unq_name` (`name`);

--
-- Indexes for table `m_role_permission`
--
ALTER TABLE `m_role_permission`
  ADD PRIMARY KEY (`role_id`,`permission_id`),
  ADD KEY `FK8DEDB04815CEC7AB` (`role_id`),
  ADD KEY `FK8DEDB048103B544B` (`permission_id`);

--
-- Indexes for table `m_savings_account`
--
ALTER TABLE `m_savings_account`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `sa_account_no_UNIQUE` (`account_no`),
  ADD UNIQUE KEY `sa_externalid_UNIQUE` (`external_id`),
  ADD KEY `FKSA00000000000001` (`client_id`),
  ADD KEY `FKSA00000000000002` (`group_id`),
  ADD KEY `FKSA00000000000003` (`product_id`),
  ADD KEY `FK_savings_account_tax_group` (`tax_group_id`),
  ADD KEY `FK_gsim_id` (`gsim_id`);

--
-- Indexes for table `m_savings_account_charge`
--
ALTER TABLE `m_savings_account_charge`
  ADD PRIMARY KEY (`id`),
  ADD KEY `charge_id` (`charge_id`),
  ADD KEY `m_savings_account_charge_ibfk_2` (`savings_account_id`);

--
-- Indexes for table `m_savings_account_charge_paid_by`
--
ALTER TABLE `m_savings_account_charge_paid_by`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FK__m_savings_account_transaction` (`savings_account_transaction_id`),
  ADD KEY `FK__m_savings_account_charge` (`savings_account_charge_id`);

--
-- Indexes for table `m_savings_account_interest_rate_chart`
--
ALTER TABLE `m_savings_account_interest_rate_chart`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FKSAIRC00000000000001` (`savings_account_id`);

--
-- Indexes for table `m_savings_account_interest_rate_slab`
--
ALTER TABLE `m_savings_account_interest_rate_slab`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FKSAIRS00000000000001` (`savings_account_interest_rate_chart_id`);

--
-- Indexes for table `m_savings_account_transaction`
--
ALTER TABLE `m_savings_account_transaction`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FKSAT0000000001` (`savings_account_id`),
  ADD KEY `FK_m_savings_account_transaction_m_payment_detail` (`payment_detail_id`),
  ADD KEY `FK_m_savings_account_transaction_m_office` (`office_id`);

--
-- Indexes for table `m_savings_account_transaction_tax_details`
--
ALTER TABLE `m_savings_account_transaction_tax_details`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FK_savings_account_transaction_tax_details_savings_transaction` (`savings_transaction_id`),
  ADD KEY `FK_savings_account_transaction_tax_details_tax_component` (`tax_component_id`);

--
-- Indexes for table `m_savings_interest_incentives`
--
ALTER TABLE `m_savings_interest_incentives`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FK_m_savings_interest_incentives_m_savings_interest_rate_slab` (`deposit_account_interest_rate_slab_id`);

--
-- Indexes for table `m_savings_officer_assignment_history`
--
ALTER TABLE `m_savings_officer_assignment_history`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_m_savings_officer_assignment_history_0001` (`account_id`),
  ADD KEY `fk_m_savings_officer_assignment_history_0002` (`savings_officer_id`);

--
-- Indexes for table `m_savings_product`
--
ALTER TABLE `m_savings_product`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `sp_unq_name` (`name`),
  ADD UNIQUE KEY `sp_unq_short_name` (`short_name`),
  ADD KEY `FK_savings_product_tax_group` (`tax_group_id`);

--
-- Indexes for table `m_savings_product_charge`
--
ALTER TABLE `m_savings_product_charge`
  ADD PRIMARY KEY (`savings_product_id`,`charge_id`),
  ADD KEY `charge_id` (`charge_id`);

--
-- Indexes for table `m_selfservice_beneficiaries_tpt`
--
ALTER TABLE `m_selfservice_beneficiaries_tpt`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `name` (`name`,`app_user_id`,`is_active`);

--
-- Indexes for table `m_selfservice_user_client_mapping`
--
ALTER TABLE `m_selfservice_user_client_mapping`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `appuser_id_client_id` (`appuser_id`,`client_id`),
  ADD UNIQUE KEY `unique_self_client` (`client_id`);

--
-- Indexes for table `m_share_account`
--
ALTER TABLE `m_share_account`
  ADD PRIMARY KEY (`id`),
  ADD KEY `m_share_account_ibfk_1` (`product_id`),
  ADD KEY `m_share_account_ibfk_2` (`savings_account_id`),
  ADD KEY `m_share_account_ibfk_3` (`submitted_userid`),
  ADD KEY `m_share_account_ibfk_4` (`approved_userid`),
  ADD KEY `m_share_account_ibfk_5` (`rejected_userid`),
  ADD KEY `m_share_account_ibfk_6` (`activated_userid`),
  ADD KEY `m_share_account_ibfk_7` (`closed_userid`),
  ADD KEY `m_share_account_ibfk_8` (`lastmodifiedby_id`),
  ADD KEY `m_share_account_ibfk_9` (`client_id`);

--
-- Indexes for table `m_share_account_charge`
--
ALTER TABLE `m_share_account_charge`
  ADD PRIMARY KEY (`id`),
  ADD KEY `charge_id` (`charge_id`),
  ADD KEY `m_share_account_charge_ibfk_2` (`account_id`);

--
-- Indexes for table `m_share_account_charge_paid_by`
--
ALTER TABLE `m_share_account_charge_paid_by`
  ADD PRIMARY KEY (`id`),
  ADD KEY `m_share_account_transactions_charge_mapping_ibfk1` (`share_transaction_id`),
  ADD KEY `m_share_account_transactions_charge_mapping_ibfk2` (`charge_transaction_id`);

--
-- Indexes for table `m_share_account_dividend_details`
--
ALTER TABLE `m_share_account_dividend_details`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FK_m_share_account_dividend_details_dividend_pay_out_id` (`dividend_pay_out_id`),
  ADD KEY `FK_m_share_account_dividend_details_account_id` (`account_id`);

--
-- Indexes for table `m_share_account_transactions`
--
ALTER TABLE `m_share_account_transactions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `m_share_account_purchased_shares_ibfk_1` (`account_id`);

--
-- Indexes for table `m_share_product`
--
ALTER TABLE `m_share_product`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `name` (`name`),
  ADD KEY `m_share_product_ibfk_1` (`createdby_id`),
  ADD KEY `m_share_product_ibfk_2` (`lastmodifiedby_id`);

--
-- Indexes for table `m_share_product_charge`
--
ALTER TABLE `m_share_product_charge`
  ADD PRIMARY KEY (`product_id`,`charge_id`),
  ADD KEY `m_share_product_charge_ibfk_1` (`charge_id`);

--
-- Indexes for table `m_share_product_dividend_pay_out`
--
ALTER TABLE `m_share_product_dividend_pay_out`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FK_m_share_product_dividend_pay_out_product_id` (`product_id`),
  ADD KEY `FK_m_share_product_dividend_pay_out_createdby_id` (`createdby_id`),
  ADD KEY `FK_m_share_product_dividend_pay_out_lastmodifiedby_id` (`lastmodifiedby_id`);

--
-- Indexes for table `m_share_product_market_price`
--
ALTER TABLE `m_share_product_market_price`
  ADD PRIMARY KEY (`id`),
  ADD KEY `m_share_product_market_price_ibfk_1` (`product_id`);

--
-- Indexes for table `m_staff`
--
ALTER TABLE `m_staff`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `display_name` (`display_name`),
  ADD UNIQUE KEY `external_id_UNIQUE` (`external_id`),
  ADD UNIQUE KEY `mobile_no_UNIQUE` (`mobile_no`),
  ADD KEY `FK_m_staff_m_office` (`office_id`),
  ADD KEY `FK_m_staff_m_image` (`image_id`);

--
-- Indexes for table `m_staff_assignment_history`
--
ALTER TABLE `m_staff_assignment_history`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FK_m_staff_assignment_history_centre_id_m_group` (`centre_id`),
  ADD KEY `FK_m_staff_assignment_history_m_staff` (`staff_id`);

--
-- Indexes for table `m_surveys`
--
ALTER TABLE `m_surveys`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `m_survey_components`
--
ALTER TABLE `m_survey_components`
  ADD PRIMARY KEY (`id`),
  ADD KEY `survey_id` (`survey_id`);

--
-- Indexes for table `m_survey_lookup_tables`
--
ALTER TABLE `m_survey_lookup_tables`
  ADD PRIMARY KEY (`id`),
  ADD KEY `survey_id` (`survey_id`);

--
-- Indexes for table `m_survey_questions`
--
ALTER TABLE `m_survey_questions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `survey_id` (`survey_id`);

--
-- Indexes for table `m_survey_responses`
--
ALTER TABLE `m_survey_responses`
  ADD PRIMARY KEY (`id`),
  ADD KEY `question_id` (`question_id`);

--
-- Indexes for table `m_survey_scorecards`
--
ALTER TABLE `m_survey_scorecards`
  ADD PRIMARY KEY (`id`),
  ADD KEY `survey_id` (`survey_id`),
  ADD KEY `question_id` (`question_id`),
  ADD KEY `response_id` (`response_id`),
  ADD KEY `user_id` (`user_id`),
  ADD KEY `client_id` (`client_id`);

--
-- Indexes for table `m_tax_component`
--
ALTER TABLE `m_tax_component`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FK_tax_component_debit_gl_account` (`debit_account_id`),
  ADD KEY `FK_tax_component_credit_gl_account` (`credit_account_id`),
  ADD KEY `FK_tax_component_createdby` (`createdby_id`),
  ADD KEY `FK_tax_component_lastmodifiedby` (`lastmodifiedby_id`);

--
-- Indexes for table `m_tax_component_history`
--
ALTER TABLE `m_tax_component_history`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FK_tax_component_history_tax_component_id` (`tax_component_id`),
  ADD KEY `FK_tax_component_history_createdby` (`createdby_id`),
  ADD KEY `FK_tax_component_history_lastmodifiedby` (`lastmodifiedby_id`);

--
-- Indexes for table `m_tax_group`
--
ALTER TABLE `m_tax_group`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FK_tax_group_createdby` (`createdby_id`),
  ADD KEY `FK_tax_group_lastmodifiedby` (`lastmodifiedby_id`);

--
-- Indexes for table `m_tax_group_mappings`
--
ALTER TABLE `m_tax_group_mappings`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FK_tax_group_mappings_tax_group` (`tax_group_id`),
  ADD KEY `FK_tax_group_mappings_tax_component` (`tax_component_id`),
  ADD KEY `FK_tax_group_mappings_createdby` (`createdby_id`),
  ADD KEY `FK_tax_group_mappings_lastmodifiedby` (`lastmodifiedby_id`);

--
-- Indexes for table `m_tellers`
--
ALTER TABLE `m_tellers`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `m_tellers_name_unq` (`name`),
  ADD KEY `IK_m_tellers_m_office` (`office_id`),
  ADD KEY `FK_m_tellers_gl_account_debit_account_id` (`debit_account_id`),
  ADD KEY `FK_m_tellers_gl_account_credit_account_id` (`credit_account_id`);

--
-- Indexes for table `m_template`
--
ALTER TABLE `m_template`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `unq_name` (`name`);

--
-- Indexes for table `m_templatemappers`
--
ALTER TABLE `m_templatemappers`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `m_template_m_templatemappers`
--
ALTER TABLE `m_template_m_templatemappers`
  ADD UNIQUE KEY `mappers_id` (`mappers_id`),
  ADD KEY `mappers_id_2` (`mappers_id`),
  ADD KEY `m_template_id` (`m_template_id`);

--
-- Indexes for table `m_working_days`
--
ALTER TABLE `m_working_days`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `notification_generator`
--
ALTER TABLE `notification_generator`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `notification_mapper`
--
ALTER TABLE `notification_mapper`
  ADD PRIMARY KEY (`id`),
  ADD KEY `notification_mapper` (`user_id`),
  ADD KEY `notification_id` (`notification_id`);

--
-- Indexes for table `oauth_client_details`
--
ALTER TABLE `oauth_client_details`
  ADD PRIMARY KEY (`client_id`);

--
-- Indexes for table `ppi_likelihoods`
--
ALTER TABLE `ppi_likelihoods`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `ppi_likelihoods_ppi`
--
ALTER TABLE `ppi_likelihoods_ppi`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `ppi_scores`
--
ALTER TABLE `ppi_scores`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `ref_loan_transaction_processing_strategy`
--
ALTER TABLE `ref_loan_transaction_processing_strategy`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `ltp_strategy_code` (`code`);

--
-- Indexes for table `request_audit_table`
--
ALTER TABLE `request_audit_table`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FK1_request_audit_table_m_client` (`client_id`);

--
-- Indexes for table `rpt_sequence`
--
ALTER TABLE `rpt_sequence`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `r_enum_value`
--
ALTER TABLE `r_enum_value`
  ADD PRIMARY KEY (`enum_name`,`enum_id`),
  ADD UNIQUE KEY `enum_message_property` (`enum_name`,`enum_message_property`),
  ADD UNIQUE KEY `enum_value` (`enum_name`,`enum_value`);

--
-- Indexes for table `scheduled_email_campaign`
--
ALTER TABLE `scheduled_email_campaign`
  ADD PRIMARY KEY (`id`),
  ADD KEY `scheduled_email_campaign_ibfk_1` (`stretchy_report_id`);

--
-- Indexes for table `scheduled_email_configuration`
--
ALTER TABLE `scheduled_email_configuration`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `unique_name` (`name`);

--
-- Indexes for table `scheduled_email_messages_outbound`
--
ALTER TABLE `scheduled_email_messages_outbound`
  ADD PRIMARY KEY (`id`),
  ADD KEY `SEFKGROUP000000001` (`group_id`),
  ADD KEY `SEFKCLIENT00000001` (`client_id`),
  ADD KEY `SEFKSTAFF000000001` (`staff_id`),
  ADD KEY `fk_schedule_email_campign1` (`email_campaign_id`);

--
-- Indexes for table `scheduler_detail`
--
ALTER TABLE `scheduler_detail`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `schema_version`
--
ALTER TABLE `schema_version`
  ADD PRIMARY KEY (`installed_rank`),
  ADD KEY `schema_version_s_idx` (`success`);

--
-- Indexes for table `sms_campaign`
--
ALTER TABLE `sms_campaign`
  ADD PRIMARY KEY (`id`),
  ADD KEY `report_id` (`report_id`);

--
-- Indexes for table `sms_messages_outbound`
--
ALTER TABLE `sms_messages_outbound`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FKGROUP000000001` (`group_id`),
  ADD KEY `FKCLIENT00000001` (`client_id`),
  ADD KEY `FKSTAFF000000001` (`staff_id`),
  ADD KEY `FKCAMPAIGN00000001` (`campaign_id`);

--
-- Indexes for table `stretchy_parameter`
--
ALTER TABLE `stretchy_parameter`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `name_UNIQUE` (`parameter_name`),
  ADD KEY `fk_stretchy_parameter_001_idx` (`parent_id`);

--
-- Indexes for table `stretchy_report`
--
ALTER TABLE `stretchy_report`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `report_name_UNIQUE` (`report_name`);

--
-- Indexes for table `stretchy_report_parameter`
--
ALTER TABLE `stretchy_report_parameter`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `report_parameter_unique` (`report_id`,`parameter_id`),
  ADD KEY `fk_report_parameter_001_idx` (`report_id`),
  ADD KEY `fk_report_parameter_002_idx` (`parameter_id`);

--
-- Indexes for table `topic`
--
ALTER TABLE `topic`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `title_UNIQUE` (`title`);

--
-- Indexes for table `topic_subscriber`
--
ALTER TABLE `topic_subscriber`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_topic_has_m_appuser_topic` (`topic_id`),
  ADD KEY `fk_topic_has_m_appuser_m_appuser1` (`user_id`);

--
-- Indexes for table `twofactor_access_token`
--
ALTER TABLE `twofactor_access_token`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `token_appuser_UNIQUE` (`token`,`appuser_id`),
  ADD KEY `user` (`appuser_id`),
  ADD KEY `token` (`token`);

--
-- Indexes for table `twofactor_configuration`
--
ALTER TABLE `twofactor_configuration`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `key_UNIQUE` (`name`);

--
-- Indexes for table `x_registered_table`
--
ALTER TABLE `x_registered_table`
  ADD PRIMARY KEY (`registered_table_name`);

--
-- Indexes for table `x_table_column_code_mappings`
--
ALTER TABLE `x_table_column_code_mappings`
  ADD PRIMARY KEY (`column_alias_name`),
  ADD KEY `FK_x_code_id` (`code_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `acc_accounting_rule`
--
ALTER TABLE `acc_accounting_rule`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `acc_gl_account`
--
ALTER TABLE `acc_gl_account`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=59;

--
-- AUTO_INCREMENT for table `acc_gl_closure`
--
ALTER TABLE `acc_gl_closure`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `acc_gl_financial_activity_account`
--
ALTER TABLE `acc_gl_financial_activity_account`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `acc_gl_journal_entry`
--
ALTER TABLE `acc_gl_journal_entry`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `acc_product_mapping`
--
ALTER TABLE `acc_product_mapping`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `acc_rule_tags`
--
ALTER TABLE `acc_rule_tags`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `client_device_registration`
--
ALTER TABLE `client_device_registration`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `c_account_number_format`
--
ALTER TABLE `c_account_number_format`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `c_cache`
--
ALTER TABLE `c_cache`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `c_configuration`
--
ALTER TABLE `c_configuration`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=35;

--
-- AUTO_INCREMENT for table `c_external_service`
--
ALTER TABLE `c_external_service`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `glim_accounts`
--
ALTER TABLE `glim_accounts`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `gsim_accounts`
--
ALTER TABLE `gsim_accounts`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `interop_identifier`
--
ALTER TABLE `interop_identifier`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `job`
--
ALTER TABLE `job`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=31;

--
-- AUTO_INCREMENT for table `job_parameters`
--
ALTER TABLE `job_parameters`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `job_run_history`
--
ALTER TABLE `job_run_history`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=513;

--
-- AUTO_INCREMENT for table `mix_taxonomy`
--
ALTER TABLE `mix_taxonomy`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=49;

--
-- AUTO_INCREMENT for table `mix_taxonomy_mapping`
--
ALTER TABLE `mix_taxonomy_mapping`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `mix_xbrl_namespace`
--
ALTER TABLE `mix_xbrl_namespace`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `m_account_transfer_details`
--
ALTER TABLE `m_account_transfer_details`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `m_account_transfer_standing_instructions`
--
ALTER TABLE `m_account_transfer_standing_instructions`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `m_account_transfer_standing_instructions_history`
--
ALTER TABLE `m_account_transfer_standing_instructions_history`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `m_account_transfer_transaction`
--
ALTER TABLE `m_account_transfer_transaction`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `m_address`
--
ALTER TABLE `m_address`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `m_adhoc`
--
ALTER TABLE `m_adhoc`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `m_appuser`
--
ALTER TABLE `m_appuser`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `m_appuser_previous_password`
--
ALTER TABLE `m_appuser_previous_password`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `m_calendar`
--
ALTER TABLE `m_calendar`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `m_calendar_history`
--
ALTER TABLE `m_calendar_history`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `m_calendar_instance`
--
ALTER TABLE `m_calendar_instance`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `m_cashiers`
--
ALTER TABLE `m_cashiers`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `m_cashier_transactions`
--
ALTER TABLE `m_cashier_transactions`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `m_charge`
--
ALTER TABLE `m_charge`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `m_client`
--
ALTER TABLE `m_client`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `m_client_address`
--
ALTER TABLE `m_client_address`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `m_client_attendance`
--
ALTER TABLE `m_client_attendance`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `m_client_charge`
--
ALTER TABLE `m_client_charge`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `m_client_charge_paid_by`
--
ALTER TABLE `m_client_charge_paid_by`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `m_client_identifier`
--
ALTER TABLE `m_client_identifier`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `m_client_non_person`
--
ALTER TABLE `m_client_non_person`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `m_client_transaction`
--
ALTER TABLE `m_client_transaction`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `m_client_transfer_details`
--
ALTER TABLE `m_client_transfer_details`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `m_code`
--
ALTER TABLE `m_code`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=34;

--
-- AUTO_INCREMENT for table `m_code_value`
--
ALTER TABLE `m_code_value`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT for table `m_creditbureau`
--
ALTER TABLE `m_creditbureau`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `m_creditbureau_configuration`
--
ALTER TABLE `m_creditbureau_configuration`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `m_creditbureau_loanproduct_mapping`
--
ALTER TABLE `m_creditbureau_loanproduct_mapping`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `m_creditbureau_token`
--
ALTER TABLE `m_creditbureau_token`
  MODIFY `id` int(128) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `m_creditreport`
--
ALTER TABLE `m_creditreport`
  MODIFY `id` int(128) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `m_currency`
--
ALTER TABLE `m_currency`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=164;

--
-- AUTO_INCREMENT for table `m_deposit_account_on_hold_transaction`
--
ALTER TABLE `m_deposit_account_on_hold_transaction`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `m_deposit_account_recurring_detail`
--
ALTER TABLE `m_deposit_account_recurring_detail`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `m_deposit_account_term_and_preclosure`
--
ALTER TABLE `m_deposit_account_term_and_preclosure`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `m_deposit_product_recurring_detail`
--
ALTER TABLE `m_deposit_product_recurring_detail`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `m_deposit_product_term_and_preclosure`
--
ALTER TABLE `m_deposit_product_term_and_preclosure`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `m_document`
--
ALTER TABLE `m_document`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `m_entity_datatable_check`
--
ALTER TABLE `m_entity_datatable_check`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `m_entity_relation`
--
ALTER TABLE `m_entity_relation`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `m_entity_to_entity_access`
--
ALTER TABLE `m_entity_to_entity_access`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `m_entity_to_entity_mapping`
--
ALTER TABLE `m_entity_to_entity_mapping`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `m_family_members`
--
ALTER TABLE `m_family_members`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `m_field_configuration`
--
ALTER TABLE `m_field_configuration`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- AUTO_INCREMENT for table `m_floating_rates`
--
ALTER TABLE `m_floating_rates`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `m_floating_rates_periods`
--
ALTER TABLE `m_floating_rates_periods`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `m_fund`
--
ALTER TABLE `m_fund`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `m_group`
--
ALTER TABLE `m_group`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `m_group_level`
--
ALTER TABLE `m_group_level`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `m_group_roles`
--
ALTER TABLE `m_group_roles`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `m_guarantor`
--
ALTER TABLE `m_guarantor`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `m_guarantor_funding_details`
--
ALTER TABLE `m_guarantor_funding_details`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `m_guarantor_transaction`
--
ALTER TABLE `m_guarantor_transaction`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `m_holiday`
--
ALTER TABLE `m_holiday`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `m_hook`
--
ALTER TABLE `m_hook`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `m_hook_configuration`
--
ALTER TABLE `m_hook_configuration`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `m_hook_registered_events`
--
ALTER TABLE `m_hook_registered_events`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `m_hook_schema`
--
ALTER TABLE `m_hook_schema`
  MODIFY `id` smallint(6) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `m_hook_templates`
--
ALTER TABLE `m_hook_templates`
  MODIFY `id` smallint(6) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `m_image`
--
ALTER TABLE `m_image`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `m_import_document`
--
ALTER TABLE `m_import_document`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `m_interest_incentives`
--
ALTER TABLE `m_interest_incentives`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `m_interest_rate_chart`
--
ALTER TABLE `m_interest_rate_chart`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `m_interest_rate_slab`
--
ALTER TABLE `m_interest_rate_slab`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `m_loan`
--
ALTER TABLE `m_loan`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `m_loanproduct_provisioning_entry`
--
ALTER TABLE `m_loanproduct_provisioning_entry`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `m_loanproduct_provisioning_mapping`
--
ALTER TABLE `m_loanproduct_provisioning_mapping`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `m_loan_arrears_aging`
--
ALTER TABLE `m_loan_arrears_aging`
  MODIFY `loan_id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `m_loan_charge`
--
ALTER TABLE `m_loan_charge`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `m_loan_charge_paid_by`
--
ALTER TABLE `m_loan_charge_paid_by`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `m_loan_collateral`
--
ALTER TABLE `m_loan_collateral`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `m_loan_disbursement_detail`
--
ALTER TABLE `m_loan_disbursement_detail`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `m_loan_installment_charge`
--
ALTER TABLE `m_loan_installment_charge`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `m_loan_interest_recalculation_additional_details`
--
ALTER TABLE `m_loan_interest_recalculation_additional_details`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `m_loan_officer_assignment_history`
--
ALTER TABLE `m_loan_officer_assignment_history`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `m_loan_overdue_installment_charge`
--
ALTER TABLE `m_loan_overdue_installment_charge`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `m_loan_recalculation_details`
--
ALTER TABLE `m_loan_recalculation_details`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `m_loan_repayment_schedule`
--
ALTER TABLE `m_loan_repayment_schedule`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `m_loan_repayment_schedule_history`
--
ALTER TABLE `m_loan_repayment_schedule_history`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `m_loan_reschedule_request`
--
ALTER TABLE `m_loan_reschedule_request`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `m_loan_reschedule_request_term_variations_mapping`
--
ALTER TABLE `m_loan_reschedule_request_term_variations_mapping`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `m_loan_term_variations`
--
ALTER TABLE `m_loan_term_variations`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `m_loan_topup`
--
ALTER TABLE `m_loan_topup`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `m_loan_tranche_charges`
--
ALTER TABLE `m_loan_tranche_charges`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `m_loan_tranche_disbursement_charge`
--
ALTER TABLE `m_loan_tranche_disbursement_charge`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `m_loan_transaction`
--
ALTER TABLE `m_loan_transaction`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `m_loan_transaction_repayment_schedule_mapping`
--
ALTER TABLE `m_loan_transaction_repayment_schedule_mapping`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `m_mandatory_savings_schedule`
--
ALTER TABLE `m_mandatory_savings_schedule`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `m_meeting`
--
ALTER TABLE `m_meeting`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `m_note`
--
ALTER TABLE `m_note`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `m_office`
--
ALTER TABLE `m_office`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `m_office_transaction`
--
ALTER TABLE `m_office_transaction`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `m_organisation_creditbureau`
--
ALTER TABLE `m_organisation_creditbureau`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `m_organisation_currency`
--
ALTER TABLE `m_organisation_currency`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;

--
-- AUTO_INCREMENT for table `m_password_validation_policy`
--
ALTER TABLE `m_password_validation_policy`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `m_payment_detail`
--
ALTER TABLE `m_payment_detail`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `m_payment_type`
--
ALTER TABLE `m_payment_type`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `m_permission`
--
ALTER TABLE `m_permission`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=872;

--
-- AUTO_INCREMENT for table `m_pocket`
--
ALTER TABLE `m_pocket`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `m_pocket_accounts_mapping`
--
ALTER TABLE `m_pocket_accounts_mapping`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `m_portfolio_account_associations`
--
ALTER TABLE `m_portfolio_account_associations`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `m_portfolio_command_source`
--
ALTER TABLE `m_portfolio_command_source`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT for table `m_product_loan`
--
ALTER TABLE `m_product_loan`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `m_product_loan_configurable_attributes`
--
ALTER TABLE `m_product_loan_configurable_attributes`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `m_product_loan_floating_rates`
--
ALTER TABLE `m_product_loan_floating_rates`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `m_product_loan_guarantee_details`
--
ALTER TABLE `m_product_loan_guarantee_details`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `m_product_loan_recalculation_details`
--
ALTER TABLE `m_product_loan_recalculation_details`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `m_product_loan_variable_installment_config`
--
ALTER TABLE `m_product_loan_variable_installment_config`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `m_product_loan_variations_borrower_cycle`
--
ALTER TABLE `m_product_loan_variations_borrower_cycle`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `m_product_mix`
--
ALTER TABLE `m_product_mix`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `m_provisioning_criteria`
--
ALTER TABLE `m_provisioning_criteria`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `m_provisioning_criteria_definition`
--
ALTER TABLE `m_provisioning_criteria_definition`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `m_provisioning_history`
--
ALTER TABLE `m_provisioning_history`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `m_provision_category`
--
ALTER TABLE `m_provision_category`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `m_rate`
--
ALTER TABLE `m_rate`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `m_report_mailing_job`
--
ALTER TABLE `m_report_mailing_job`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `m_report_mailing_job_configuration`
--
ALTER TABLE `m_report_mailing_job_configuration`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `m_report_mailing_job_run_history`
--
ALTER TABLE `m_report_mailing_job_run_history`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `m_role`
--
ALTER TABLE `m_role`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `m_savings_account`
--
ALTER TABLE `m_savings_account`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `m_savings_account_charge`
--
ALTER TABLE `m_savings_account_charge`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `m_savings_account_charge_paid_by`
--
ALTER TABLE `m_savings_account_charge_paid_by`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `m_savings_account_interest_rate_chart`
--
ALTER TABLE `m_savings_account_interest_rate_chart`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `m_savings_account_interest_rate_slab`
--
ALTER TABLE `m_savings_account_interest_rate_slab`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `m_savings_account_transaction`
--
ALTER TABLE `m_savings_account_transaction`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `m_savings_account_transaction_tax_details`
--
ALTER TABLE `m_savings_account_transaction_tax_details`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `m_savings_interest_incentives`
--
ALTER TABLE `m_savings_interest_incentives`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `m_savings_officer_assignment_history`
--
ALTER TABLE `m_savings_officer_assignment_history`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `m_savings_product`
--
ALTER TABLE `m_savings_product`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `m_selfservice_beneficiaries_tpt`
--
ALTER TABLE `m_selfservice_beneficiaries_tpt`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `m_selfservice_user_client_mapping`
--
ALTER TABLE `m_selfservice_user_client_mapping`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `m_share_account`
--
ALTER TABLE `m_share_account`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `m_share_account_charge`
--
ALTER TABLE `m_share_account_charge`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `m_share_account_charge_paid_by`
--
ALTER TABLE `m_share_account_charge_paid_by`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `m_share_account_dividend_details`
--
ALTER TABLE `m_share_account_dividend_details`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `m_share_account_transactions`
--
ALTER TABLE `m_share_account_transactions`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `m_share_product`
--
ALTER TABLE `m_share_product`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `m_share_product_dividend_pay_out`
--
ALTER TABLE `m_share_product_dividend_pay_out`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `m_share_product_market_price`
--
ALTER TABLE `m_share_product_market_price`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `m_staff`
--
ALTER TABLE `m_staff`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `m_staff_assignment_history`
--
ALTER TABLE `m_staff_assignment_history`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `m_surveys`
--
ALTER TABLE `m_surveys`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `m_survey_components`
--
ALTER TABLE `m_survey_components`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `m_survey_lookup_tables`
--
ALTER TABLE `m_survey_lookup_tables`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `m_survey_questions`
--
ALTER TABLE `m_survey_questions`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `m_survey_responses`
--
ALTER TABLE `m_survey_responses`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `m_survey_scorecards`
--
ALTER TABLE `m_survey_scorecards`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `m_tax_component`
--
ALTER TABLE `m_tax_component`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `m_tax_component_history`
--
ALTER TABLE `m_tax_component_history`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `m_tax_group`
--
ALTER TABLE `m_tax_group`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `m_tax_group_mappings`
--
ALTER TABLE `m_tax_group_mappings`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `m_tellers`
--
ALTER TABLE `m_tellers`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `m_template`
--
ALTER TABLE `m_template`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `m_templatemappers`
--
ALTER TABLE `m_templatemappers`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `m_working_days`
--
ALTER TABLE `m_working_days`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `notification_generator`
--
ALTER TABLE `notification_generator`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `notification_mapper`
--
ALTER TABLE `notification_mapper`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `ppi_likelihoods`
--
ALTER TABLE `ppi_likelihoods`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `ppi_likelihoods_ppi`
--
ALTER TABLE `ppi_likelihoods_ppi`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `ppi_scores`
--
ALTER TABLE `ppi_scores`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT for table `ref_loan_transaction_processing_strategy`
--
ALTER TABLE `ref_loan_transaction_processing_strategy`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `request_audit_table`
--
ALTER TABLE `request_audit_table`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `rpt_sequence`
--
ALTER TABLE `rpt_sequence`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `scheduled_email_campaign`
--
ALTER TABLE `scheduled_email_campaign`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `scheduled_email_configuration`
--
ALTER TABLE `scheduled_email_configuration`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `scheduled_email_messages_outbound`
--
ALTER TABLE `scheduled_email_messages_outbound`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `scheduler_detail`
--
ALTER TABLE `scheduler_detail`
  MODIFY `id` smallint(6) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `sms_campaign`
--
ALTER TABLE `sms_campaign`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `sms_messages_outbound`
--
ALTER TABLE `sms_messages_outbound`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `stretchy_parameter`
--
ALTER TABLE `stretchy_parameter`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1023;

--
-- AUTO_INCREMENT for table `stretchy_report`
--
ALTER TABLE `stretchy_report`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=190;

--
-- AUTO_INCREMENT for table `stretchy_report_parameter`
--
ALTER TABLE `stretchy_report_parameter`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=522;

--
-- AUTO_INCREMENT for table `topic`
--
ALTER TABLE `topic`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `topic_subscriber`
--
ALTER TABLE `topic_subscriber`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `twofactor_access_token`
--
ALTER TABLE `twofactor_access_token`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `twofactor_configuration`
--
ALTER TABLE `twofactor_configuration`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `acc_accounting_rule`
--
ALTER TABLE `acc_accounting_rule`
  ADD CONSTRAINT `FK_acc_accounting_rule_acc_gl_account_credit` FOREIGN KEY (`credit_account_id`) REFERENCES `acc_gl_account` (`id`),
  ADD CONSTRAINT `FK_acc_accounting_rule_acc_gl_account_debit` FOREIGN KEY (`debit_account_id`) REFERENCES `acc_gl_account` (`id`),
  ADD CONSTRAINT `FK_acc_accounting_rule_m_office` FOREIGN KEY (`office_id`) REFERENCES `m_office` (`id`);

--
-- Constraints for table `acc_gl_account`
--
ALTER TABLE `acc_gl_account`
  ADD CONSTRAINT `FKGLACC000000002` FOREIGN KEY (`tag_id`) REFERENCES `m_code_value` (`id`),
  ADD CONSTRAINT `FK_ACC_0000000001` FOREIGN KEY (`parent_id`) REFERENCES `acc_gl_account` (`id`);

--
-- Constraints for table `acc_gl_closure`
--
ALTER TABLE `acc_gl_closure`
  ADD CONSTRAINT `FK_acc_gl_closure_m_appuser` FOREIGN KEY (`createdby_id`) REFERENCES `m_appuser` (`id`),
  ADD CONSTRAINT `FK_acc_gl_closure_m_appuser_2` FOREIGN KEY (`lastmodifiedby_id`) REFERENCES `m_appuser` (`id`),
  ADD CONSTRAINT `FK_acc_gl_closure_m_office` FOREIGN KEY (`office_id`) REFERENCES `m_office` (`id`);

--
-- Constraints for table `acc_gl_financial_activity_account`
--
ALTER TABLE `acc_gl_financial_activity_account`
  ADD CONSTRAINT `FK_office_mapping_acc_gl_account` FOREIGN KEY (`gl_account_id`) REFERENCES `acc_gl_account` (`id`);

--
-- Constraints for table `acc_gl_journal_entry`
--
ALTER TABLE `acc_gl_journal_entry`
  ADD CONSTRAINT `FK_acc_gl_journal_entry_acc_gl_account` FOREIGN KEY (`account_id`) REFERENCES `acc_gl_account` (`id`),
  ADD CONSTRAINT `FK_acc_gl_journal_entry_acc_gl_journal_entry` FOREIGN KEY (`reversal_id`) REFERENCES `acc_gl_journal_entry` (`id`),
  ADD CONSTRAINT `FK_acc_gl_journal_entry_m_appuser` FOREIGN KEY (`createdby_id`) REFERENCES `m_appuser` (`id`),
  ADD CONSTRAINT `FK_acc_gl_journal_entry_m_appuser_2` FOREIGN KEY (`lastmodifiedby_id`) REFERENCES `m_appuser` (`id`),
  ADD CONSTRAINT `FK_acc_gl_journal_entry_m_client_transaction` FOREIGN KEY (`client_transaction_id`) REFERENCES `m_client_transaction` (`id`),
  ADD CONSTRAINT `FK_acc_gl_journal_entry_m_loan_transaction` FOREIGN KEY (`loan_transaction_id`) REFERENCES `m_loan_transaction` (`id`),
  ADD CONSTRAINT `FK_acc_gl_journal_entry_m_office` FOREIGN KEY (`office_id`) REFERENCES `m_office` (`id`),
  ADD CONSTRAINT `FK_acc_gl_journal_entry_m_payment_detail` FOREIGN KEY (`payment_details_id`) REFERENCES `m_payment_detail` (`id`),
  ADD CONSTRAINT `FK_acc_gl_journal_entry_m_savings_account_transaction` FOREIGN KEY (`savings_transaction_id`) REFERENCES `m_savings_account_transaction` (`id`),
  ADD CONSTRAINT `FK_acc_gl_journal_entry_m_share_account_transaction` FOREIGN KEY (`share_transaction_id`) REFERENCES `m_share_account_transactions` (`id`);

--
-- Constraints for table `acc_product_mapping`
--
ALTER TABLE `acc_product_mapping`
  ADD CONSTRAINT `FK_acc_product_mapping_m_charge` FOREIGN KEY (`charge_id`) REFERENCES `m_charge` (`id`),
  ADD CONSTRAINT `FK_acc_product_mapping_m_payment_type` FOREIGN KEY (`payment_type`) REFERENCES `m_payment_type` (`id`);

--
-- Constraints for table `acc_rule_tags`
--
ALTER TABLE `acc_rule_tags`
  ADD CONSTRAINT `FK_acc_accounting_rule_id` FOREIGN KEY (`acc_rule_id`) REFERENCES `acc_accounting_rule` (`id`),
  ADD CONSTRAINT `FK_m_code_value_id` FOREIGN KEY (`tag_id`) REFERENCES `m_code_value` (`id`);

--
-- Constraints for table `client_device_registration`
--
ALTER TABLE `client_device_registration`
  ADD CONSTRAINT `FK1_client_device_registration_m_client` FOREIGN KEY (`client_id`) REFERENCES `m_client` (`id`);

--
-- Constraints for table `c_external_service_properties`
--
ALTER TABLE `c_external_service_properties`
  ADD CONSTRAINT `FK_c_external_service_properties_c_external_service` FOREIGN KEY (`external_service_id`) REFERENCES `c_external_service` (`id`);

--
-- Constraints for table `glim_accounts`
--
ALTER TABLE `glim_accounts`
  ADD CONSTRAINT `FK_group_id` FOREIGN KEY (`group_id`) REFERENCES `m_group` (`id`);

--
-- Constraints for table `gsim_accounts`
--
ALTER TABLE `gsim_accounts`
  ADD CONSTRAINT `FK_gsim_group_id` FOREIGN KEY (`group_id`) REFERENCES `m_group` (`id`);

--
-- Constraints for table `interop_identifier`
--
ALTER TABLE `interop_identifier`
  ADD CONSTRAINT `fk_interop_identifier_account` FOREIGN KEY (`account_id`) REFERENCES `m_savings_account` (`id`);

--
-- Constraints for table `job_parameters`
--
ALTER TABLE `job_parameters`
  ADD CONSTRAINT `FK_job_id` FOREIGN KEY (`job_id`) REFERENCES `job` (`id`);

--
-- Constraints for table `job_run_history`
--
ALTER TABLE `job_run_history`
  ADD CONSTRAINT `scheduledjobsFK` FOREIGN KEY (`job_id`) REFERENCES `job` (`id`);

--
-- Constraints for table `m_account_transfer_details`
--
ALTER TABLE `m_account_transfer_details`
  ADD CONSTRAINT `FK_m_account_transfer_details_from_client` FOREIGN KEY (`from_client_id`) REFERENCES `m_client` (`id`),
  ADD CONSTRAINT `FK_m_account_transfer_details_from_loan_account` FOREIGN KEY (`from_loan_account_id`) REFERENCES `m_loan` (`id`),
  ADD CONSTRAINT `FK_m_account_transfer_details_from_office` FOREIGN KEY (`from_office_id`) REFERENCES `m_office` (`id`),
  ADD CONSTRAINT `FK_m_account_transfer_details_from_savings_account` FOREIGN KEY (`from_savings_account_id`) REFERENCES `m_savings_account` (`id`),
  ADD CONSTRAINT `FK_m_account_transfer_details_to_client` FOREIGN KEY (`to_client_id`) REFERENCES `m_client` (`id`),
  ADD CONSTRAINT `FK_m_account_transfer_details_to_loan_account` FOREIGN KEY (`to_loan_account_id`) REFERENCES `m_loan` (`id`),
  ADD CONSTRAINT `FK_m_account_transfer_details_to_office` FOREIGN KEY (`to_office_id`) REFERENCES `m_office` (`id`),
  ADD CONSTRAINT `FK_m_account_transfer_details_to_savings_account` FOREIGN KEY (`to_savings_account_id`) REFERENCES `m_savings_account` (`id`);

--
-- Constraints for table `m_account_transfer_standing_instructions`
--
ALTER TABLE `m_account_transfer_standing_instructions`
  ADD CONSTRAINT `FK_m_standing_instructions_account_transfer_details` FOREIGN KEY (`account_transfer_details_id`) REFERENCES `m_account_transfer_details` (`id`);

--
-- Constraints for table `m_account_transfer_standing_instructions_history`
--
ALTER TABLE `m_account_transfer_standing_instructions_history`
  ADD CONSTRAINT `FK_m_account_transfer_standing_instructions_m_history` FOREIGN KEY (`standing_instruction_id`) REFERENCES `m_account_transfer_standing_instructions` (`id`);

--
-- Constraints for table `m_account_transfer_transaction`
--
ALTER TABLE `m_account_transfer_transaction`
  ADD CONSTRAINT `FK_m_account_transfer_transaction_account_detail` FOREIGN KEY (`account_transfer_details_id`) REFERENCES `m_account_transfer_details` (`id`),
  ADD CONSTRAINT `FK_m_account_transfer_transaction_from_m_loan_transaction` FOREIGN KEY (`from_loan_transaction_id`) REFERENCES `m_loan_transaction` (`id`),
  ADD CONSTRAINT `FK_m_account_transfer_transaction_from_m_savings_transaction` FOREIGN KEY (`from_savings_transaction_id`) REFERENCES `m_savings_account_transaction` (`id`),
  ADD CONSTRAINT `FK_m_account_transfer_transaction_to_m_loan_transaction` FOREIGN KEY (`to_loan_transaction_id`) REFERENCES `m_loan_transaction` (`id`),
  ADD CONSTRAINT `FK_m_account_transfer_transaction_to_m_savings_transaction` FOREIGN KEY (`to_savings_transaction_id`) REFERENCES `m_savings_account_transaction` (`id`);

--
-- Constraints for table `m_address`
--
ALTER TABLE `m_address`
  ADD CONSTRAINT `address_fields_codefk1` FOREIGN KEY (`state_province_id`) REFERENCES `m_code_value` (`id`),
  ADD CONSTRAINT `address_fields_codefk2` FOREIGN KEY (`country_id`) REFERENCES `m_code_value` (`id`);

--
-- Constraints for table `m_adhoc`
--
ALTER TABLE `m_adhoc`
  ADD CONSTRAINT `createdby_id` FOREIGN KEY (`createdby_id`) REFERENCES `m_appuser` (`id`),
  ADD CONSTRAINT `lastmodifiedby_id` FOREIGN KEY (`lastmodifiedby_id`) REFERENCES `m_appuser` (`id`);

--
-- Constraints for table `m_appuser`
--
ALTER TABLE `m_appuser`
  ADD CONSTRAINT `FKB3D587CE0DD567A` FOREIGN KEY (`office_id`) REFERENCES `m_office` (`id`),
  ADD CONSTRAINT `fk_m_appuser_002` FOREIGN KEY (`staff_id`) REFERENCES `m_staff` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `m_appuser_previous_password`
--
ALTER TABLE `m_appuser_previous_password`
  ADD CONSTRAINT `m_appuser_previous_password_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `m_appuser` (`id`);

--
-- Constraints for table `m_appuser_role`
--
ALTER TABLE `m_appuser_role`
  ADD CONSTRAINT `FK7662CE5915CEC7AB` FOREIGN KEY (`role_id`) REFERENCES `m_role` (`id`),
  ADD CONSTRAINT `FK7662CE59B4100309` FOREIGN KEY (`appuser_id`) REFERENCES `m_appuser` (`id`);

--
-- Constraints for table `m_calendar_history`
--
ALTER TABLE `m_calendar_history`
  ADD CONSTRAINT `FK_m_calendar_m_calendar_history` FOREIGN KEY (`calendar_id`) REFERENCES `m_calendar` (`id`);

--
-- Constraints for table `m_calendar_instance`
--
ALTER TABLE `m_calendar_instance`
  ADD CONSTRAINT `FK_m_calendar_m_calendar_instance` FOREIGN KEY (`calendar_id`) REFERENCES `m_calendar` (`id`);

--
-- Constraints for table `m_cashiers`
--
ALTER TABLE `m_cashiers`
  ADD CONSTRAINT `FK_m_cashiers_m_staff` FOREIGN KEY (`staff_id`) REFERENCES `m_staff` (`id`),
  ADD CONSTRAINT `FK_m_cashiers_m_teller` FOREIGN KEY (`teller_id`) REFERENCES `m_tellers` (`id`);

--
-- Constraints for table `m_cashier_transactions`
--
ALTER TABLE `m_cashier_transactions`
  ADD CONSTRAINT `FK_m_teller_transactions_m_cashiers` FOREIGN KEY (`cashier_id`) REFERENCES `m_cashiers` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `m_charge`
--
ALTER TABLE `m_charge`
  ADD CONSTRAINT `FK_m_charge_acc_gl_account` FOREIGN KEY (`income_or_liability_account_id`) REFERENCES `acc_gl_account` (`id`),
  ADD CONSTRAINT `FK_m_charge_m_tax_group` FOREIGN KEY (`tax_group_id`) REFERENCES `m_tax_group` (`id`);

--
-- Constraints for table `m_client`
--
ALTER TABLE `m_client`
  ADD CONSTRAINT `FK1_m_client_gender_m_code_value` FOREIGN KEY (`gender_cv_id`) REFERENCES `m_code_value` (`id`),
  ADD CONSTRAINT `FKCE00CAB3E0DD567A` FOREIGN KEY (`office_id`) REFERENCES `m_office` (`id`),
  ADD CONSTRAINT `FK_m_client_classification_m_code_value` FOREIGN KEY (`client_classification_cv_id`) REFERENCES `m_code_value` (`id`),
  ADD CONSTRAINT `FK_m_client_m_code` FOREIGN KEY (`closure_reason_cv_id`) REFERENCES `m_code_value` (`id`),
  ADD CONSTRAINT `FK_m_client_m_image` FOREIGN KEY (`image_id`) REFERENCES `m_image` (`id`),
  ADD CONSTRAINT `FK_m_client_m_office` FOREIGN KEY (`transfer_to_office_id`) REFERENCES `m_office` (`id`),
  ADD CONSTRAINT `FK_m_client_m_savings_account` FOREIGN KEY (`default_savings_account`) REFERENCES `m_savings_account` (`id`),
  ADD CONSTRAINT `FK_m_client_m_savings_product` FOREIGN KEY (`default_savings_product`) REFERENCES `m_savings_product` (`id`),
  ADD CONSTRAINT `FK_m_client_m_staff` FOREIGN KEY (`staff_id`) REFERENCES `m_staff` (`id`),
  ADD CONSTRAINT `FK_m_client_substatus_m_code_value` FOREIGN KEY (`sub_status`) REFERENCES `m_code_value` (`id`),
  ADD CONSTRAINT `FK_m_client_type_m_code_value` FOREIGN KEY (`client_type_cv_id`) REFERENCES `m_code_value` (`id`),
  ADD CONSTRAINT `FK_m_client_type_m_code_value_withdraw` FOREIGN KEY (`withdraw_reason_cv_id`) REFERENCES `m_code_value` (`id`),
  ADD CONSTRAINT `FK_m_client_type_mcode_value_reject` FOREIGN KEY (`reject_reason_cv_id`) REFERENCES `m_code_value` (`id`);

--
-- Constraints for table `m_client_address`
--
ALTER TABLE `m_client_address`
  ADD CONSTRAINT `address_codefk` FOREIGN KEY (`address_type_id`) REFERENCES `m_code_value` (`id`),
  ADD CONSTRAINT `clientaddressfk` FOREIGN KEY (`client_id`) REFERENCES `m_client` (`id`);

--
-- Constraints for table `m_client_attendance`
--
ALTER TABLE `m_client_attendance`
  ADD CONSTRAINT `FK_m_client_m_client_attendance` FOREIGN KEY (`client_id`) REFERENCES `m_client` (`id`),
  ADD CONSTRAINT `FK_m_meeting_m_client_attendance` FOREIGN KEY (`meeting_id`) REFERENCES `m_meeting` (`id`);

--
-- Constraints for table `m_client_charge`
--
ALTER TABLE `m_client_charge`
  ADD CONSTRAINT `FK_m_client_charge_m_charge` FOREIGN KEY (`charge_id`) REFERENCES `m_charge` (`id`),
  ADD CONSTRAINT `FK_m_client_charge_m_client` FOREIGN KEY (`client_id`) REFERENCES `m_client` (`id`);

--
-- Constraints for table `m_client_charge_paid_by`
--
ALTER TABLE `m_client_charge_paid_by`
  ADD CONSTRAINT `FK_m_client_charge_paid_by_m_client_charge` FOREIGN KEY (`client_charge_id`) REFERENCES `m_client_charge` (`id`),
  ADD CONSTRAINT `FK_m_client_charge_paid_by_m_client_transaction` FOREIGN KEY (`client_transaction_id`) REFERENCES `m_client_transaction` (`id`);

--
-- Constraints for table `m_client_identifier`
--
ALTER TABLE `m_client_identifier`
  ADD CONSTRAINT `FK_m_client_document_m_client` FOREIGN KEY (`client_id`) REFERENCES `m_client` (`id`),
  ADD CONSTRAINT `FK_m_client_document_m_code_value` FOREIGN KEY (`document_type_id`) REFERENCES `m_code_value` (`id`);

--
-- Constraints for table `m_client_non_person`
--
ALTER TABLE `m_client_non_person`
  ADD CONSTRAINT `FK_client_id` FOREIGN KEY (`client_id`) REFERENCES `m_client` (`id`);

--
-- Constraints for table `m_client_transaction`
--
ALTER TABLE `m_client_transaction`
  ADD CONSTRAINT `FK_m_client_transaction_m_appuser` FOREIGN KEY (`appuser_id`) REFERENCES `m_appuser` (`id`),
  ADD CONSTRAINT `FK_m_client_transaction_m_client` FOREIGN KEY (`client_id`) REFERENCES `m_client` (`id`);

--
-- Constraints for table `m_client_transfer_details`
--
ALTER TABLE `m_client_transfer_details`
  ADD CONSTRAINT `FK_m_client_transfer_details_m_appuser` FOREIGN KEY (`submitted_by`) REFERENCES `m_appuser` (`id`),
  ADD CONSTRAINT `FK_m_client_transfer_details_m_client` FOREIGN KEY (`client_id`) REFERENCES `m_client` (`id`),
  ADD CONSTRAINT `FK_m_client_transfer_details_m_office` FOREIGN KEY (`from_office_id`) REFERENCES `m_office` (`id`),
  ADD CONSTRAINT `FK_m_client_transfer_details_m_office_2` FOREIGN KEY (`to_office_id`) REFERENCES `m_office` (`id`);

--
-- Constraints for table `m_code_value`
--
ALTER TABLE `m_code_value`
  ADD CONSTRAINT `FKCFCEA42640BE071Z` FOREIGN KEY (`code_id`) REFERENCES `m_code` (`id`);

--
-- Constraints for table `m_creditbureau_configuration`
--
ALTER TABLE `m_creditbureau_configuration`
  ADD CONSTRAINT `cbConfigfk1` FOREIGN KEY (`organisation_creditbureau_id`) REFERENCES `m_creditbureau` (`id`);

--
-- Constraints for table `m_creditbureau_loanproduct_mapping`
--
ALTER TABLE `m_creditbureau_loanproduct_mapping`
  ADD CONSTRAINT `cblpfk2` FOREIGN KEY (`organisation_creditbureau_id`) REFERENCES `m_organisation_creditbureau` (`id`),
  ADD CONSTRAINT `fk_cb_lp2` FOREIGN KEY (`loan_product_id`) REFERENCES `m_product_loan` (`id`);

--
-- Constraints for table `m_creditreport`
--
ALTER TABLE `m_creditreport`
  ADD CONSTRAINT `cbId` FOREIGN KEY (`creditBureauId`) REFERENCES `m_creditbureau` (`id`);

--
-- Constraints for table `m_deposit_account_on_hold_transaction`
--
ALTER TABLE `m_deposit_account_on_hold_transaction`
  ADD CONSTRAINT `FK_deposit_on_hold_transaction_m_savings_account` FOREIGN KEY (`savings_account_id`) REFERENCES `m_savings_account` (`id`);

--
-- Constraints for table `m_deposit_account_recurring_detail`
--
ALTER TABLE `m_deposit_account_recurring_detail`
  ADD CONSTRAINT `FKDARD00000000000001` FOREIGN KEY (`savings_account_id`) REFERENCES `m_savings_account` (`id`);

--
-- Constraints for table `m_deposit_account_term_and_preclosure`
--
ALTER TABLE `m_deposit_account_term_and_preclosure`
  ADD CONSTRAINT `FKDATP00000000000001` FOREIGN KEY (`savings_account_id`) REFERENCES `m_savings_account` (`id`),
  ADD CONSTRAINT `m_deposit_account_term_and_preclosure_ibfk_1` FOREIGN KEY (`transfer_to_savings_account_id`) REFERENCES `m_savings_account` (`id`);

--
-- Constraints for table `m_deposit_product_interest_rate_chart`
--
ALTER TABLE `m_deposit_product_interest_rate_chart`
  ADD CONSTRAINT `FKDPIRC00000000000001` FOREIGN KEY (`deposit_product_id`) REFERENCES `m_savings_product` (`id`),
  ADD CONSTRAINT `FKDPIRC00000000000002` FOREIGN KEY (`interest_rate_chart_id`) REFERENCES `m_interest_rate_chart` (`id`);

--
-- Constraints for table `m_deposit_product_recurring_detail`
--
ALTER TABLE `m_deposit_product_recurring_detail`
  ADD CONSTRAINT `FKDPRD00000000000001` FOREIGN KEY (`savings_product_id`) REFERENCES `m_savings_product` (`id`);

--
-- Constraints for table `m_deposit_product_term_and_preclosure`
--
ALTER TABLE `m_deposit_product_term_and_preclosure`
  ADD CONSTRAINT `FKDPTP00000000000001` FOREIGN KEY (`savings_product_id`) REFERENCES `m_savings_product` (`id`);

--
-- Constraints for table `m_entity_datatable_check`
--
ALTER TABLE `m_entity_datatable_check`
  ADD CONSTRAINT `m_entity_datatable_check_ibfk_1` FOREIGN KEY (`x_registered_table_name`) REFERENCES `x_registered_table` (`registered_table_name`);

--
-- Constraints for table `m_entity_to_entity_access`
--
ALTER TABLE `m_entity_to_entity_access`
  ADD CONSTRAINT `FK_access_type_code_m_code_value` FOREIGN KEY (`access_type_code_value_id`) REFERENCES `m_code_value` (`id`);

--
-- Constraints for table `m_entity_to_entity_mapping`
--
ALTER TABLE `m_entity_to_entity_mapping`
  ADD CONSTRAINT `FK__rel_id_m_entity_relation_id` FOREIGN KEY (`rel_id`) REFERENCES `m_entity_relation` (`id`);

--
-- Constraints for table `m_family_members`
--
ALTER TABLE `m_family_members`
  ADD CONSTRAINT `FK_m_family_members_client_id_m_client` FOREIGN KEY (`client_id`) REFERENCES `m_client` (`id`),
  ADD CONSTRAINT `FK_m_family_members_gender_m_code_value` FOREIGN KEY (`gender_cv_id`) REFERENCES `m_code_value` (`id`),
  ADD CONSTRAINT `FK_m_family_members_marital_status_m_code_value` FOREIGN KEY (`marital_status_cv_id`) REFERENCES `m_code_value` (`id`),
  ADD CONSTRAINT `FK_m_family_members_profession_m_code_value` FOREIGN KEY (`profession_cv_id`) REFERENCES `m_code_value` (`id`),
  ADD CONSTRAINT `FK_m_family_members_relationship_m_code_value` FOREIGN KEY (`relationship_cv_id`) REFERENCES `m_code_value` (`id`);

--
-- Constraints for table `m_floating_rates_periods`
--
ALTER TABLE `m_floating_rates_periods`
  ADD CONSTRAINT `FK_mappings_m_floating_rates` FOREIGN KEY (`floating_rates_id`) REFERENCES `m_floating_rates` (`id`);

--
-- Constraints for table `m_group`
--
ALTER TABLE `m_group`
  ADD CONSTRAINT `FK_m_group_level` FOREIGN KEY (`level_id`) REFERENCES `m_group_level` (`id`),
  ADD CONSTRAINT `FK_m_group_m_code` FOREIGN KEY (`closure_reason_cv_id`) REFERENCES `m_code_value` (`id`),
  ADD CONSTRAINT `FK_m_group_m_staff` FOREIGN KEY (`staff_id`) REFERENCES `m_staff` (`id`),
  ADD CONSTRAINT `Parent_Id_reference` FOREIGN KEY (`parent_id`) REFERENCES `m_group` (`id`),
  ADD CONSTRAINT `m_group_ibfk_1` FOREIGN KEY (`office_id`) REFERENCES `m_office` (`id`);

--
-- Constraints for table `m_group_client`
--
ALTER TABLE `m_group_client`
  ADD CONSTRAINT `m_group_client_ibfk_1` FOREIGN KEY (`group_id`) REFERENCES `m_group` (`id`),
  ADD CONSTRAINT `m_group_client_ibfk_2` FOREIGN KEY (`client_id`) REFERENCES `m_client` (`id`);

--
-- Constraints for table `m_group_level`
--
ALTER TABLE `m_group_level`
  ADD CONSTRAINT `Parent_levelId_reference` FOREIGN KEY (`parent_id`) REFERENCES `m_group_level` (`id`);

--
-- Constraints for table `m_group_roles`
--
ALTER TABLE `m_group_roles`
  ADD CONSTRAINT `FKGroupRoleClientId` FOREIGN KEY (`client_id`) REFERENCES `m_client` (`id`),
  ADD CONSTRAINT `FKGroupRoleGroupId` FOREIGN KEY (`group_id`) REFERENCES `m_group` (`id`),
  ADD CONSTRAINT `FK_grouprole_m_codevalue` FOREIGN KEY (`role_cv_id`) REFERENCES `m_code_value` (`id`);

--
-- Constraints for table `m_guarantor`
--
ALTER TABLE `m_guarantor`
  ADD CONSTRAINT `FK_m_guarantor_m_code_value` FOREIGN KEY (`client_reln_cv_id`) REFERENCES `m_code_value` (`id`),
  ADD CONSTRAINT `FK_m_guarantor_m_loan` FOREIGN KEY (`loan_id`) REFERENCES `m_loan` (`id`);

--
-- Constraints for table `m_guarantor_funding_details`
--
ALTER TABLE `m_guarantor_funding_details`
  ADD CONSTRAINT `FK_m_guarantor_fund_details_account_associations_id` FOREIGN KEY (`account_associations_id`) REFERENCES `m_portfolio_account_associations` (`id`),
  ADD CONSTRAINT `FK_m_guarantor_fund_details_m_guarantor` FOREIGN KEY (`guarantor_id`) REFERENCES `m_guarantor` (`id`);

--
-- Constraints for table `m_guarantor_transaction`
--
ALTER TABLE `m_guarantor_transaction`
  ADD CONSTRAINT `FK_guarantor_transaction_guarantor_fund_detail` FOREIGN KEY (`guarantor_fund_detail_id`) REFERENCES `m_guarantor_funding_details` (`id`),
  ADD CONSTRAINT `FK_guarantor_transaction_m_deposit_account_on_hold_transaction` FOREIGN KEY (`deposit_on_hold_transaction_id`) REFERENCES `m_deposit_account_on_hold_transaction` (`id`),
  ADD CONSTRAINT `FK_guarantor_transaction_m_loan_transaction` FOREIGN KEY (`loan_transaction_id`) REFERENCES `m_loan_transaction` (`id`);

--
-- Constraints for table `m_holiday_office`
--
ALTER TABLE `m_holiday_office`
  ADD CONSTRAINT `m_holiday_id_ibfk_1` FOREIGN KEY (`holiday_id`) REFERENCES `m_holiday` (`id`),
  ADD CONSTRAINT `m_office_id_ibfk_2` FOREIGN KEY (`office_id`) REFERENCES `m_office` (`id`);

--
-- Constraints for table `m_hook`
--
ALTER TABLE `m_hook`
  ADD CONSTRAINT `fk_template_id` FOREIGN KEY (`template_id`) REFERENCES `m_hook_templates` (`id`),
  ADD CONSTRAINT `fk_ugd_template_id` FOREIGN KEY (`ugd_template_id`) REFERENCES `m_template` (`id`);

--
-- Constraints for table `m_hook_configuration`
--
ALTER TABLE `m_hook_configuration`
  ADD CONSTRAINT `fk_hook_id_cfg` FOREIGN KEY (`hook_id`) REFERENCES `m_hook` (`id`);

--
-- Constraints for table `m_hook_registered_events`
--
ALTER TABLE `m_hook_registered_events`
  ADD CONSTRAINT `fk_hook_idc` FOREIGN KEY (`hook_id`) REFERENCES `m_hook` (`id`);

--
-- Constraints for table `m_hook_schema`
--
ALTER TABLE `m_hook_schema`
  ADD CONSTRAINT `fk_hook_template_id` FOREIGN KEY (`hook_template_id`) REFERENCES `m_hook_templates` (`id`);

--
-- Constraints for table `m_import_document`
--
ALTER TABLE `m_import_document`
  ADD CONSTRAINT `FK_m_import_m_appuser` FOREIGN KEY (`createdby_id`) REFERENCES `m_appuser` (`id`),
  ADD CONSTRAINT `FK_m_import_m_document` FOREIGN KEY (`document_id`) REFERENCES `m_document` (`id`);

--
-- Constraints for table `m_interest_incentives`
--
ALTER TABLE `m_interest_incentives`
  ADD CONSTRAINT `FK_m_interest_incentives_m_interest_rate_slab` FOREIGN KEY (`interest_rate_slab_id`) REFERENCES `m_interest_rate_slab` (`id`);

--
-- Constraints for table `m_interest_rate_slab`
--
ALTER TABLE `m_interest_rate_slab`
  ADD CONSTRAINT `FKIRS00000000000001` FOREIGN KEY (`interest_rate_chart_id`) REFERENCES `m_interest_rate_chart` (`id`);

--
-- Constraints for table `m_loan`
--
ALTER TABLE `m_loan`
  ADD CONSTRAINT `FK7C885877240145` FOREIGN KEY (`fund_id`) REFERENCES `m_fund` (`id`),
  ADD CONSTRAINT `FKB6F935D87179A0CB` FOREIGN KEY (`client_id`) REFERENCES `m_client` (`id`),
  ADD CONSTRAINT `FKB6F935D8C8D4B434` FOREIGN KEY (`product_id`) REFERENCES `m_product_loan` (`id`),
  ADD CONSTRAINT `FK_approvedon_userid` FOREIGN KEY (`approvedon_userid`) REFERENCES `m_appuser` (`id`),
  ADD CONSTRAINT `FK_closedon_userid` FOREIGN KEY (`closedon_userid`) REFERENCES `m_appuser` (`id`),
  ADD CONSTRAINT `FK_disbursedon_userid` FOREIGN KEY (`disbursedon_userid`) REFERENCES `m_appuser` (`id`),
  ADD CONSTRAINT `FK_glim_id` FOREIGN KEY (`glim_id`) REFERENCES `glim_accounts` (`id`),
  ADD CONSTRAINT `FK_loan_ltp_strategy` FOREIGN KEY (`loan_transaction_strategy_id`) REFERENCES `ref_loan_transaction_processing_strategy` (`id`),
  ADD CONSTRAINT `FK_m_loan_m_staff` FOREIGN KEY (`loan_officer_id`) REFERENCES `m_staff` (`id`),
  ADD CONSTRAINT `FK_m_loanpurpose_codevalue` FOREIGN KEY (`loanpurpose_cv_id`) REFERENCES `m_code_value` (`id`),
  ADD CONSTRAINT `FK_rejectedon_userid` FOREIGN KEY (`rejectedon_userid`) REFERENCES `m_appuser` (`id`),
  ADD CONSTRAINT `FK_submittedon_userid` FOREIGN KEY (`submittedon_userid`) REFERENCES `m_appuser` (`id`),
  ADD CONSTRAINT `FK_withdrawnon_userid` FOREIGN KEY (`withdrawnon_userid`) REFERENCES `m_appuser` (`id`),
  ADD CONSTRAINT `FK_writeoffreason_m_loan_m_code_value` FOREIGN KEY (`writeoff_reason_cv_id`) REFERENCES `m_code_value` (`id`),
  ADD CONSTRAINT `m_loan_ibfk_1` FOREIGN KEY (`group_id`) REFERENCES `m_group` (`id`);

--
-- Constraints for table `m_loanproduct_provisioning_entry`
--
ALTER TABLE `m_loanproduct_provisioning_entry`
  ADD CONSTRAINT `m_loanproduct_provisioning_entry_ibfk_1` FOREIGN KEY (`history_id`) REFERENCES `m_provisioning_history` (`id`),
  ADD CONSTRAINT `m_loanproduct_provisioning_entry_ibfk_2` FOREIGN KEY (`criteria_id`) REFERENCES `m_provisioning_criteria` (`id`),
  ADD CONSTRAINT `m_loanproduct_provisioning_entry_ibfk_3` FOREIGN KEY (`office_id`) REFERENCES `m_office` (`id`),
  ADD CONSTRAINT `m_loanproduct_provisioning_entry_ibfk_4` FOREIGN KEY (`product_id`) REFERENCES `m_product_loan` (`id`),
  ADD CONSTRAINT `m_loanproduct_provisioning_entry_ibfk_5` FOREIGN KEY (`category_id`) REFERENCES `m_provision_category` (`id`),
  ADD CONSTRAINT `m_loanproduct_provisioning_entry_ibfk_6` FOREIGN KEY (`liability_account`) REFERENCES `acc_gl_account` (`id`),
  ADD CONSTRAINT `m_loanproduct_provisioning_entry_ibfk_7` FOREIGN KEY (`expense_account`) REFERENCES `acc_gl_account` (`id`);

--
-- Constraints for table `m_loanproduct_provisioning_mapping`
--
ALTER TABLE `m_loanproduct_provisioning_mapping`
  ADD CONSTRAINT `m_loanproduct_provisioning_mapping_ibfk_1` FOREIGN KEY (`product_id`) REFERENCES `m_product_loan` (`id`),
  ADD CONSTRAINT `m_loanproduct_provisioning_mapping_ibfk_2` FOREIGN KEY (`criteria_id`) REFERENCES `m_provisioning_criteria` (`id`);

--
-- Constraints for table `m_loan_arrears_aging`
--
ALTER TABLE `m_loan_arrears_aging`
  ADD CONSTRAINT `m_loan_arrears_aging_ibfk_1` FOREIGN KEY (`loan_id`) REFERENCES `m_loan` (`id`);

--
-- Constraints for table `m_loan_charge`
--
ALTER TABLE `m_loan_charge`
  ADD CONSTRAINT `m_loan_charge_ibfk_1` FOREIGN KEY (`charge_id`) REFERENCES `m_charge` (`id`),
  ADD CONSTRAINT `m_loan_charge_ibfk_2` FOREIGN KEY (`loan_id`) REFERENCES `m_loan` (`id`);

--
-- Constraints for table `m_loan_charge_paid_by`
--
ALTER TABLE `m_loan_charge_paid_by`
  ADD CONSTRAINT `FK__m_loan_charge` FOREIGN KEY (`loan_charge_id`) REFERENCES `m_loan_charge` (`id`),
  ADD CONSTRAINT `FK__m_loan_transaction` FOREIGN KEY (`loan_transaction_id`) REFERENCES `m_loan_transaction` (`id`);

--
-- Constraints for table `m_loan_collateral`
--
ALTER TABLE `m_loan_collateral`
  ADD CONSTRAINT `FK_collateral_code_value` FOREIGN KEY (`type_cv_id`) REFERENCES `m_code_value` (`id`),
  ADD CONSTRAINT `FK_collateral_m_loan` FOREIGN KEY (`loan_id`) REFERENCES `m_loan` (`id`);

--
-- Constraints for table `m_loan_disbursement_detail`
--
ALTER TABLE `m_loan_disbursement_detail`
  ADD CONSTRAINT `FK_loan_disbursement_detail_loan_id` FOREIGN KEY (`loan_id`) REFERENCES `m_loan` (`id`);

--
-- Constraints for table `m_loan_installment_charge`
--
ALTER TABLE `m_loan_installment_charge`
  ADD CONSTRAINT `FK_loan_charge_id_charge_schedule` FOREIGN KEY (`loan_charge_id`) REFERENCES `m_loan_charge` (`id`),
  ADD CONSTRAINT `FK_loan_schedule_id_charge_schedule` FOREIGN KEY (`loan_schedule_id`) REFERENCES `m_loan_repayment_schedule` (`id`);

--
-- Constraints for table `m_loan_interest_recalculation_additional_details`
--
ALTER TABLE `m_loan_interest_recalculation_additional_details`
  ADD CONSTRAINT `FK_additional_details_repayment_schedule_id` FOREIGN KEY (`loan_repayment_schedule_id`) REFERENCES `m_loan_repayment_schedule` (`id`);

--
-- Constraints for table `m_loan_officer_assignment_history`
--
ALTER TABLE `m_loan_officer_assignment_history`
  ADD CONSTRAINT `fk_m_loan_officer_assignment_history_0001` FOREIGN KEY (`loan_id`) REFERENCES `m_loan` (`id`),
  ADD CONSTRAINT `fk_m_loan_officer_assignment_history_0002` FOREIGN KEY (`loan_officer_id`) REFERENCES `m_staff` (`id`);

--
-- Constraints for table `m_loan_overdue_installment_charge`
--
ALTER TABLE `m_loan_overdue_installment_charge`
  ADD CONSTRAINT `FK_m_loan_overdue_installment_charge_m_loan_charge` FOREIGN KEY (`loan_charge_id`) REFERENCES `m_loan_charge` (`id`),
  ADD CONSTRAINT `FK_m_loan_overdue_installment_charge_m_loan_repayment_schedule` FOREIGN KEY (`loan_schedule_id`) REFERENCES `m_loan_repayment_schedule` (`id`);

--
-- Constraints for table `m_loan_paid_in_advance`
--
ALTER TABLE `m_loan_paid_in_advance`
  ADD CONSTRAINT `m_loan_paid_in_advance_ibfk_1` FOREIGN KEY (`loan_id`) REFERENCES `m_loan` (`id`);

--
-- Constraints for table `m_loan_rate`
--
ALTER TABLE `m_loan_rate`
  ADD CONSTRAINT `FK_M_LOAN_RATE_LOAN` FOREIGN KEY (`loan_id`) REFERENCES `m_loan` (`id`),
  ADD CONSTRAINT `FK_M_LOAN_RATE_RATE` FOREIGN KEY (`rate_id`) REFERENCES `m_rate` (`id`);

--
-- Constraints for table `m_loan_recalculation_details`
--
ALTER TABLE `m_loan_recalculation_details`
  ADD CONSTRAINT `FK_m_loan_m_loan_recalculation_details` FOREIGN KEY (`loan_id`) REFERENCES `m_loan` (`id`);

--
-- Constraints for table `m_loan_repayment_schedule`
--
ALTER TABLE `m_loan_repayment_schedule`
  ADD CONSTRAINT `FK488B92AA40BE0710` FOREIGN KEY (`loan_id`) REFERENCES `m_loan` (`id`);

--
-- Constraints for table `m_loan_repayment_schedule_history`
--
ALTER TABLE `m_loan_repayment_schedule_history`
  ADD CONSTRAINT `m_loan_repayment_schedule_history_ibfk_1` FOREIGN KEY (`loan_id`) REFERENCES `m_loan` (`id`),
  ADD CONSTRAINT `m_loan_repayment_schedule_history_ibfk_2` FOREIGN KEY (`loan_reschedule_request_id`) REFERENCES `m_loan_reschedule_request` (`id`);

--
-- Constraints for table `m_loan_reschedule_request`
--
ALTER TABLE `m_loan_reschedule_request`
  ADD CONSTRAINT `m_loan_reschedule_request_ibfk_1` FOREIGN KEY (`loan_id`) REFERENCES `m_loan` (`id`),
  ADD CONSTRAINT `m_loan_reschedule_request_ibfk_2` FOREIGN KEY (`reschedule_reason_cv_id`) REFERENCES `m_code_value` (`id`),
  ADD CONSTRAINT `m_loan_reschedule_request_ibfk_3` FOREIGN KEY (`submitted_by_user_id`) REFERENCES `m_appuser` (`id`),
  ADD CONSTRAINT `m_loan_reschedule_request_ibfk_4` FOREIGN KEY (`approved_by_user_id`) REFERENCES `m_appuser` (`id`),
  ADD CONSTRAINT `m_loan_reschedule_request_ibfk_5` FOREIGN KEY (`rejected_by_user_id`) REFERENCES `m_appuser` (`id`);

--
-- Constraints for table `m_loan_reschedule_request_term_variations_mapping`
--
ALTER TABLE `m_loan_reschedule_request_term_variations_mapping`
  ADD CONSTRAINT `FK__m_loan_reschedule_request` FOREIGN KEY (`loan_reschedule_request_id`) REFERENCES `m_loan_reschedule_request` (`id`),
  ADD CONSTRAINT `FK__m_loan_term_variations` FOREIGN KEY (`loan_term_variations_id`) REFERENCES `m_loan_term_variations` (`id`);

--
-- Constraints for table `m_loan_term_variations`
--
ALTER TABLE `m_loan_term_variations`
  ADD CONSTRAINT `FK_loan_id_m_loan_id` FOREIGN KEY (`loan_id`) REFERENCES `m_loan` (`id`);

--
-- Constraints for table `m_loan_topup`
--
ALTER TABLE `m_loan_topup`
  ADD CONSTRAINT `m_loan_topup_FK_account_transfer_details_id` FOREIGN KEY (`account_transfer_details_id`) REFERENCES `m_account_transfer_details` (`id`),
  ADD CONSTRAINT `m_loan_topup_FK_closure_loan_id` FOREIGN KEY (`closure_loan_id`) REFERENCES `m_loan` (`id`),
  ADD CONSTRAINT `m_loan_topup_FK_loan_id` FOREIGN KEY (`loan_id`) REFERENCES `m_loan` (`id`);

--
-- Constraints for table `m_loan_tranche_charges`
--
ALTER TABLE `m_loan_tranche_charges`
  ADD CONSTRAINT `FK_m_loan_tranche_charges_m_charge` FOREIGN KEY (`charge_id`) REFERENCES `m_charge` (`id`),
  ADD CONSTRAINT `FK_m_loan_tranche_charges_m_loan` FOREIGN KEY (`loan_id`) REFERENCES `m_loan` (`id`);

--
-- Constraints for table `m_loan_tranche_disbursement_charge`
--
ALTER TABLE `m_loan_tranche_disbursement_charge`
  ADD CONSTRAINT `FK_m_loan_tranche_disbursement_charge_m_loan_charge` FOREIGN KEY (`loan_charge_id`) REFERENCES `m_loan_charge` (`id`),
  ADD CONSTRAINT `FK_m_loan_tranche_disbursement_charge_m_loan_disbursement_detail` FOREIGN KEY (`disbursement_detail_id`) REFERENCES `m_loan_disbursement_detail` (`id`);

--
-- Constraints for table `m_loan_transaction`
--
ALTER TABLE `m_loan_transaction`
  ADD CONSTRAINT `FKCFCEA42640BE0710` FOREIGN KEY (`loan_id`) REFERENCES `m_loan` (`id`),
  ADD CONSTRAINT `FK_m_loan_transaction_m_office` FOREIGN KEY (`office_id`) REFERENCES `m_office` (`id`),
  ADD CONSTRAINT `FK_m_loan_transaction_m_payment_detail` FOREIGN KEY (`payment_detail_id`) REFERENCES `m_payment_detail` (`id`);

--
-- Constraints for table `m_loan_transaction_repayment_schedule_mapping`
--
ALTER TABLE `m_loan_transaction_repayment_schedule_mapping`
  ADD CONSTRAINT `FK_mappings_m_loan_repayment_schedule` FOREIGN KEY (`loan_repayment_schedule_id`) REFERENCES `m_loan_repayment_schedule` (`id`),
  ADD CONSTRAINT `FK_mappings_m_loan_transaction` FOREIGN KEY (`loan_transaction_id`) REFERENCES `m_loan_transaction` (`id`);

--
-- Constraints for table `m_mandatory_savings_schedule`
--
ALTER TABLE `m_mandatory_savings_schedule`
  ADD CONSTRAINT `FKMSS0000000001` FOREIGN KEY (`savings_account_id`) REFERENCES `m_savings_account` (`id`);

--
-- Constraints for table `m_meeting`
--
ALTER TABLE `m_meeting`
  ADD CONSTRAINT `FK_m_calendar_instance_m_meeting` FOREIGN KEY (`calendar_instance_id`) REFERENCES `m_calendar_instance` (`id`);

--
-- Constraints for table `m_note`
--
ALTER TABLE `m_note`
  ADD CONSTRAINT `FK7C9708924D26803` FOREIGN KEY (`loan_transaction_id`) REFERENCES `m_loan_transaction` (`id`),
  ADD CONSTRAINT `FK7C9708940BE0710` FOREIGN KEY (`loan_id`) REFERENCES `m_loan` (`id`),
  ADD CONSTRAINT `FK7C97089541F0A56` FOREIGN KEY (`createdby_id`) REFERENCES `m_appuser` (`id`),
  ADD CONSTRAINT `FK7C970897179A0CB` FOREIGN KEY (`client_id`) REFERENCES `m_client` (`id`),
  ADD CONSTRAINT `FK7C970898F889C3F` FOREIGN KEY (`lastmodifiedby_id`) REFERENCES `m_appuser` (`id`),
  ADD CONSTRAINT `FK_m_note_m_group` FOREIGN KEY (`group_id`) REFERENCES `m_group` (`id`),
  ADD CONSTRAINT `FK_savings_account_id` FOREIGN KEY (`savings_account_id`) REFERENCES `m_savings_account` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `m_office`
--
ALTER TABLE `m_office`
  ADD CONSTRAINT `FK2291C477E2551DCC` FOREIGN KEY (`parent_id`) REFERENCES `m_office` (`id`);

--
-- Constraints for table `m_office_transaction`
--
ALTER TABLE `m_office_transaction`
  ADD CONSTRAINT `FK1E37728B783C5C25` FOREIGN KEY (`from_office_id`) REFERENCES `m_office` (`id`),
  ADD CONSTRAINT `FK1E37728B93C6C1B6` FOREIGN KEY (`to_office_id`) REFERENCES `m_office` (`id`);

--
-- Constraints for table `m_organisation_creditbureau`
--
ALTER TABLE `m_organisation_creditbureau`
  ADD CONSTRAINT `orgcb_cbfk` FOREIGN KEY (`creditbureau_id`) REFERENCES `m_creditbureau` (`id`);

--
-- Constraints for table `m_payment_detail`
--
ALTER TABLE `m_payment_detail`
  ADD CONSTRAINT `FK_m_payment_detail_m_payment_type` FOREIGN KEY (`payment_type_id`) REFERENCES `m_payment_type` (`id`);

--
-- Constraints for table `m_pocket`
--
ALTER TABLE `m_pocket`
  ADD CONSTRAINT `FK__m_appuser__pocket` FOREIGN KEY (`app_user_id`) REFERENCES `m_appuser` (`id`);

--
-- Constraints for table `m_pocket_accounts_mapping`
--
ALTER TABLE `m_pocket_accounts_mapping`
  ADD CONSTRAINT `FK__m_pocket` FOREIGN KEY (`pocket_id`) REFERENCES `m_pocket` (`id`);

--
-- Constraints for table `m_portfolio_account_associations`
--
ALTER TABLE `m_portfolio_account_associations`
  ADD CONSTRAINT `account_association_loan_fk` FOREIGN KEY (`loan_account_id`) REFERENCES `m_loan` (`id`),
  ADD CONSTRAINT `account_association_savings_fk` FOREIGN KEY (`savings_account_id`) REFERENCES `m_savings_account` (`id`),
  ADD CONSTRAINT `linked_loan_fk` FOREIGN KEY (`linked_loan_account_id`) REFERENCES `m_loan` (`id`),
  ADD CONSTRAINT `linked_savings_fk` FOREIGN KEY (`linked_savings_account_id`) REFERENCES `m_savings_account` (`id`);

--
-- Constraints for table `m_portfolio_command_source`
--
ALTER TABLE `m_portfolio_command_source`
  ADD CONSTRAINT `FK_m_checker_m_appuser` FOREIGN KEY (`checker_id`) REFERENCES `m_appuser` (`id`),
  ADD CONSTRAINT `FK_m_maker_m_appuser` FOREIGN KEY (`maker_id`) REFERENCES `m_appuser` (`id`);

--
-- Constraints for table `m_product_loan`
--
ALTER TABLE `m_product_loan`
  ADD CONSTRAINT `FKA6A8A7D77240145` FOREIGN KEY (`fund_id`) REFERENCES `m_fund` (`id`),
  ADD CONSTRAINT `FK_ltp_strategy` FOREIGN KEY (`loan_transaction_strategy_id`) REFERENCES `ref_loan_transaction_processing_strategy` (`id`);

--
-- Constraints for table `m_product_loan_charge`
--
ALTER TABLE `m_product_loan_charge`
  ADD CONSTRAINT `m_product_loan_charge_ibfk_1` FOREIGN KEY (`charge_id`) REFERENCES `m_charge` (`id`),
  ADD CONSTRAINT `m_product_loan_charge_ibfk_2` FOREIGN KEY (`product_loan_id`) REFERENCES `m_product_loan` (`id`);

--
-- Constraints for table `m_product_loan_configurable_attributes`
--
ALTER TABLE `m_product_loan_configurable_attributes`
  ADD CONSTRAINT `fk_m_product_loan_configurable_attributes_0001` FOREIGN KEY (`loan_product_id`) REFERENCES `m_product_loan` (`id`);

--
-- Constraints for table `m_product_loan_floating_rates`
--
ALTER TABLE `m_product_loan_floating_rates`
  ADD CONSTRAINT `FK_mappings_m_floating_rates_id` FOREIGN KEY (`floating_rates_id`) REFERENCES `m_floating_rates` (`id`),
  ADD CONSTRAINT `FK_mappings_m_product_loan_id` FOREIGN KEY (`loan_product_id`) REFERENCES `m_product_loan` (`id`);

--
-- Constraints for table `m_product_loan_guarantee_details`
--
ALTER TABLE `m_product_loan_guarantee_details`
  ADD CONSTRAINT `FK_guarantee_details_loan_product` FOREIGN KEY (`loan_product_id`) REFERENCES `m_product_loan` (`id`);

--
-- Constraints for table `m_product_loan_rate`
--
ALTER TABLE `m_product_loan_rate`
  ADD CONSTRAINT `FK_M_PRODUCT_LOAN_RATE_LOAN` FOREIGN KEY (`product_loan_id`) REFERENCES `m_product_loan` (`id`),
  ADD CONSTRAINT `FK_M_PRODUCT_LOAN_RATE_RATE` FOREIGN KEY (`rate_id`) REFERENCES `m_rate` (`id`);

--
-- Constraints for table `m_product_loan_recalculation_details`
--
ALTER TABLE `m_product_loan_recalculation_details`
  ADD CONSTRAINT `FK_m_product_loan_m_product_loan_recalculation_details` FOREIGN KEY (`product_id`) REFERENCES `m_product_loan` (`id`);

--
-- Constraints for table `m_product_loan_variable_installment_config`
--
ALTER TABLE `m_product_loan_variable_installment_config`
  ADD CONSTRAINT `FK_mappings_m_variable_product_loan_id` FOREIGN KEY (`loan_product_id`) REFERENCES `m_product_loan` (`id`);

--
-- Constraints for table `m_product_loan_variations_borrower_cycle`
--
ALTER TABLE `m_product_loan_variations_borrower_cycle`
  ADD CONSTRAINT `borrower_cycle_loan_product_FK` FOREIGN KEY (`loan_product_id`) REFERENCES `m_product_loan` (`id`);

--
-- Constraints for table `m_product_mix`
--
ALTER TABLE `m_product_mix`
  ADD CONSTRAINT `FK_m_product_mix_product_id_to_m_product_loan` FOREIGN KEY (`product_id`) REFERENCES `m_product_loan` (`id`),
  ADD CONSTRAINT `FK_m_product_mix_restricted_product_id_to_m_product_loan` FOREIGN KEY (`restricted_product_id`) REFERENCES `m_product_loan` (`id`);

--
-- Constraints for table `m_provisioning_criteria`
--
ALTER TABLE `m_provisioning_criteria`
  ADD CONSTRAINT `m_provisioning_criteria_ibfk_1` FOREIGN KEY (`createdby_id`) REFERENCES `m_appuser` (`id`),
  ADD CONSTRAINT `m_provisioning_criteria_ibfk_2` FOREIGN KEY (`lastmodifiedby_id`) REFERENCES `m_appuser` (`id`);

--
-- Constraints for table `m_provisioning_criteria_definition`
--
ALTER TABLE `m_provisioning_criteria_definition`
  ADD CONSTRAINT `m_provisioning_criteria_definition_ibfk_1` FOREIGN KEY (`criteria_id`) REFERENCES `m_provisioning_criteria` (`id`),
  ADD CONSTRAINT `m_provisioning_criteria_definition_ibfk_2` FOREIGN KEY (`category_id`) REFERENCES `m_provision_category` (`id`),
  ADD CONSTRAINT `m_provisioning_criteria_definition_ibfk_3` FOREIGN KEY (`liability_account`) REFERENCES `acc_gl_account` (`id`),
  ADD CONSTRAINT `m_provisioning_criteria_definition_ibfk_4` FOREIGN KEY (`expense_account`) REFERENCES `acc_gl_account` (`id`);

--
-- Constraints for table `m_provisioning_history`
--
ALTER TABLE `m_provisioning_history`
  ADD CONSTRAINT `m_provisioning_history_ibfk_1` FOREIGN KEY (`createdby_id`) REFERENCES `m_appuser` (`id`),
  ADD CONSTRAINT `m_provisioning_history_ibfk_2` FOREIGN KEY (`lastmodifiedby_id`) REFERENCES `m_appuser` (`id`);

--
-- Constraints for table `m_rate`
--
ALTER TABLE `m_rate`
  ADD CONSTRAINT `FK_M_RATE_APPROVE_USER` FOREIGN KEY (`approve_user`) REFERENCES `m_appuser` (`id`),
  ADD CONSTRAINT `FK_M_RATE_CREATE_USER` FOREIGN KEY (`createdby_id`) REFERENCES `m_appuser` (`id`);

--
-- Constraints for table `m_report_mailing_job`
--
ALTER TABLE `m_report_mailing_job`
  ADD CONSTRAINT `m_report_mailing_job_ibfk_1` FOREIGN KEY (`createdby_id`) REFERENCES `m_appuser` (`id`),
  ADD CONSTRAINT `m_report_mailing_job_ibfk_2` FOREIGN KEY (`lastmodifiedby_id`) REFERENCES `m_appuser` (`id`),
  ADD CONSTRAINT `m_report_mailing_job_ibfk_3` FOREIGN KEY (`stretchy_report_id`) REFERENCES `stretchy_report` (`id`),
  ADD CONSTRAINT `m_report_mailing_job_ibfk_4` FOREIGN KEY (`run_as_userid`) REFERENCES `m_appuser` (`id`);

--
-- Constraints for table `m_report_mailing_job_run_history`
--
ALTER TABLE `m_report_mailing_job_run_history`
  ADD CONSTRAINT `m_report_mailing_job_run_history_ibfk_1` FOREIGN KEY (`job_id`) REFERENCES `m_report_mailing_job` (`id`);

--
-- Constraints for table `m_role_permission`
--
ALTER TABLE `m_role_permission`
  ADD CONSTRAINT `FK8DEDB048103B544B` FOREIGN KEY (`permission_id`) REFERENCES `m_permission` (`id`),
  ADD CONSTRAINT `FK8DEDB04815CEC7AB` FOREIGN KEY (`role_id`) REFERENCES `m_role` (`id`);

--
-- Constraints for table `m_savings_account`
--
ALTER TABLE `m_savings_account`
  ADD CONSTRAINT `FKSA00000000000001` FOREIGN KEY (`client_id`) REFERENCES `m_client` (`id`),
  ADD CONSTRAINT `FKSA00000000000002` FOREIGN KEY (`group_id`) REFERENCES `m_group` (`id`),
  ADD CONSTRAINT `FKSA00000000000003` FOREIGN KEY (`product_id`) REFERENCES `m_savings_product` (`id`),
  ADD CONSTRAINT `FK_gsim_id` FOREIGN KEY (`gsim_id`) REFERENCES `gsim_accounts` (`id`),
  ADD CONSTRAINT `FK_savings_account_tax_group` FOREIGN KEY (`tax_group_id`) REFERENCES `m_tax_group` (`id`);

--
-- Constraints for table `m_savings_account_charge`
--
ALTER TABLE `m_savings_account_charge`
  ADD CONSTRAINT `m_savings_account_charge_ibfk_1` FOREIGN KEY (`charge_id`) REFERENCES `m_charge` (`id`),
  ADD CONSTRAINT `m_savings_account_charge_ibfk_2` FOREIGN KEY (`savings_account_id`) REFERENCES `m_savings_account` (`id`);

--
-- Constraints for table `m_savings_account_charge_paid_by`
--
ALTER TABLE `m_savings_account_charge_paid_by`
  ADD CONSTRAINT `FK__m_savings_account_charge` FOREIGN KEY (`savings_account_charge_id`) REFERENCES `m_savings_account_charge` (`id`),
  ADD CONSTRAINT `FK__m_savings_account_transaction` FOREIGN KEY (`savings_account_transaction_id`) REFERENCES `m_savings_account_transaction` (`id`);

--
-- Constraints for table `m_savings_account_interest_rate_chart`
--
ALTER TABLE `m_savings_account_interest_rate_chart`
  ADD CONSTRAINT `FKSAIRC00000000000001` FOREIGN KEY (`savings_account_id`) REFERENCES `m_savings_account` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `m_savings_account_interest_rate_slab`
--
ALTER TABLE `m_savings_account_interest_rate_slab`
  ADD CONSTRAINT `FKSAIRS00000000000001` FOREIGN KEY (`savings_account_interest_rate_chart_id`) REFERENCES `m_savings_account_interest_rate_chart` (`id`);

--
-- Constraints for table `m_savings_account_transaction`
--
ALTER TABLE `m_savings_account_transaction`
  ADD CONSTRAINT `FKSAT0000000001` FOREIGN KEY (`savings_account_id`) REFERENCES `m_savings_account` (`id`),
  ADD CONSTRAINT `FK_m_savings_account_transaction_m_office` FOREIGN KEY (`office_id`) REFERENCES `m_office` (`id`),
  ADD CONSTRAINT `FK_m_savings_account_transaction_m_payment_detail` FOREIGN KEY (`payment_detail_id`) REFERENCES `m_payment_detail` (`id`);

--
-- Constraints for table `m_savings_account_transaction_tax_details`
--
ALTER TABLE `m_savings_account_transaction_tax_details`
  ADD CONSTRAINT `FK_savings_account_transaction_tax_details_savings_transaction` FOREIGN KEY (`savings_transaction_id`) REFERENCES `m_savings_account_transaction` (`id`),
  ADD CONSTRAINT `FK_savings_account_transaction_tax_details_tax_component` FOREIGN KEY (`tax_component_id`) REFERENCES `m_tax_component` (`id`);

--
-- Constraints for table `m_savings_interest_incentives`
--
ALTER TABLE `m_savings_interest_incentives`
  ADD CONSTRAINT `FK_m_savings_interest_incentives_m_savings_interest_rate_slab` FOREIGN KEY (`deposit_account_interest_rate_slab_id`) REFERENCES `m_savings_account_interest_rate_slab` (`id`);

--
-- Constraints for table `m_savings_officer_assignment_history`
--
ALTER TABLE `m_savings_officer_assignment_history`
  ADD CONSTRAINT `fk_m_savings_officer_assignment_history_0001` FOREIGN KEY (`account_id`) REFERENCES `m_savings_account` (`id`),
  ADD CONSTRAINT `fk_m_savings_officer_assignment_history_0002` FOREIGN KEY (`savings_officer_id`) REFERENCES `m_staff` (`id`);

--
-- Constraints for table `m_savings_product`
--
ALTER TABLE `m_savings_product`
  ADD CONSTRAINT `FK_savings_product_tax_group` FOREIGN KEY (`tax_group_id`) REFERENCES `m_tax_group` (`id`);

--
-- Constraints for table `m_savings_product_charge`
--
ALTER TABLE `m_savings_product_charge`
  ADD CONSTRAINT `m_savings_product_charge_ibfk_1` FOREIGN KEY (`charge_id`) REFERENCES `m_charge` (`id`),
  ADD CONSTRAINT `m_savings_product_charge_ibfk_2` FOREIGN KEY (`savings_product_id`) REFERENCES `m_savings_product` (`id`);

--
-- Constraints for table `m_selfservice_user_client_mapping`
--
ALTER TABLE `m_selfservice_user_client_mapping`
  ADD CONSTRAINT `m_selfservice_appuser_id` FOREIGN KEY (`appuser_id`) REFERENCES `m_appuser` (`id`),
  ADD CONSTRAINT `m_selfservice_client_id` FOREIGN KEY (`client_id`) REFERENCES `m_client` (`id`);

--
-- Constraints for table `m_share_account`
--
ALTER TABLE `m_share_account`
  ADD CONSTRAINT `m_share_account_ibfk_1` FOREIGN KEY (`product_id`) REFERENCES `m_share_product` (`id`),
  ADD CONSTRAINT `m_share_account_ibfk_2` FOREIGN KEY (`savings_account_id`) REFERENCES `m_savings_account` (`id`),
  ADD CONSTRAINT `m_share_account_ibfk_3` FOREIGN KEY (`submitted_userid`) REFERENCES `m_appuser` (`id`),
  ADD CONSTRAINT `m_share_account_ibfk_4` FOREIGN KEY (`approved_userid`) REFERENCES `m_appuser` (`id`),
  ADD CONSTRAINT `m_share_account_ibfk_5` FOREIGN KEY (`rejected_userid`) REFERENCES `m_appuser` (`id`),
  ADD CONSTRAINT `m_share_account_ibfk_6` FOREIGN KEY (`activated_userid`) REFERENCES `m_appuser` (`id`),
  ADD CONSTRAINT `m_share_account_ibfk_7` FOREIGN KEY (`closed_userid`) REFERENCES `m_appuser` (`id`),
  ADD CONSTRAINT `m_share_account_ibfk_8` FOREIGN KEY (`lastmodifiedby_id`) REFERENCES `m_appuser` (`id`),
  ADD CONSTRAINT `m_share_account_ibfk_9` FOREIGN KEY (`client_id`) REFERENCES `m_client` (`id`);

--
-- Constraints for table `m_share_account_charge`
--
ALTER TABLE `m_share_account_charge`
  ADD CONSTRAINT `m_share_account_charge_ibfk_1` FOREIGN KEY (`charge_id`) REFERENCES `m_charge` (`id`),
  ADD CONSTRAINT `m_share_account_charge_ibfk_2` FOREIGN KEY (`account_id`) REFERENCES `m_share_account` (`id`);

--
-- Constraints for table `m_share_account_charge_paid_by`
--
ALTER TABLE `m_share_account_charge_paid_by`
  ADD CONSTRAINT `m_share_account_transactions_charge_mapping_ibfk1` FOREIGN KEY (`share_transaction_id`) REFERENCES `m_share_account_transactions` (`id`),
  ADD CONSTRAINT `m_share_account_transactions_charge_mapping_ibfk2` FOREIGN KEY (`charge_transaction_id`) REFERENCES `m_share_account_charge` (`id`);

--
-- Constraints for table `m_share_account_dividend_details`
--
ALTER TABLE `m_share_account_dividend_details`
  ADD CONSTRAINT `FK_m_share_account_dividend_details_account_id` FOREIGN KEY (`account_id`) REFERENCES `m_share_account` (`id`),
  ADD CONSTRAINT `FK_m_share_account_dividend_details_dividend_pay_out_id` FOREIGN KEY (`dividend_pay_out_id`) REFERENCES `m_share_product_dividend_pay_out` (`id`);

--
-- Constraints for table `m_share_account_transactions`
--
ALTER TABLE `m_share_account_transactions`
  ADD CONSTRAINT `m_share_account_purchased_shares_ibfk_1` FOREIGN KEY (`account_id`) REFERENCES `m_share_account` (`id`);

--
-- Constraints for table `m_share_product`
--
ALTER TABLE `m_share_product`
  ADD CONSTRAINT `m_share_product_ibfk_1` FOREIGN KEY (`createdby_id`) REFERENCES `m_appuser` (`id`),
  ADD CONSTRAINT `m_share_product_ibfk_2` FOREIGN KEY (`lastmodifiedby_id`) REFERENCES `m_appuser` (`id`);

--
-- Constraints for table `m_share_product_charge`
--
ALTER TABLE `m_share_product_charge`
  ADD CONSTRAINT `m_share_product_charge_ibfk_1` FOREIGN KEY (`charge_id`) REFERENCES `m_charge` (`id`),
  ADD CONSTRAINT `m_share_product_charge_ibfk_2` FOREIGN KEY (`product_id`) REFERENCES `m_share_product` (`id`);

--
-- Constraints for table `m_share_product_dividend_pay_out`
--
ALTER TABLE `m_share_product_dividend_pay_out`
  ADD CONSTRAINT `FK_m_share_product_dividend_pay_out_createdby_id` FOREIGN KEY (`createdby_id`) REFERENCES `m_appuser` (`id`),
  ADD CONSTRAINT `FK_m_share_product_dividend_pay_out_lastmodifiedby_id` FOREIGN KEY (`lastmodifiedby_id`) REFERENCES `m_appuser` (`id`),
  ADD CONSTRAINT `FK_m_share_product_dividend_pay_out_product_id` FOREIGN KEY (`product_id`) REFERENCES `m_share_product` (`id`);

--
-- Constraints for table `m_share_product_market_price`
--
ALTER TABLE `m_share_product_market_price`
  ADD CONSTRAINT `m_share_product_market_price_ibfk_1` FOREIGN KEY (`product_id`) REFERENCES `m_share_product` (`id`);

--
-- Constraints for table `m_staff`
--
ALTER TABLE `m_staff`
  ADD CONSTRAINT `FK_m_staff_m_image` FOREIGN KEY (`image_id`) REFERENCES `m_image` (`id`),
  ADD CONSTRAINT `FK_m_staff_m_office` FOREIGN KEY (`office_id`) REFERENCES `m_office` (`id`);

--
-- Constraints for table `m_staff_assignment_history`
--
ALTER TABLE `m_staff_assignment_history`
  ADD CONSTRAINT `FK_m_staff_assignment_history_centre_id_m_group` FOREIGN KEY (`centre_id`) REFERENCES `m_group` (`id`),
  ADD CONSTRAINT `FK_m_staff_assignment_history_m_staff` FOREIGN KEY (`staff_id`) REFERENCES `m_staff` (`id`);

--
-- Constraints for table `m_survey_components`
--
ALTER TABLE `m_survey_components`
  ADD CONSTRAINT `m_survey_components_ibfk_1` FOREIGN KEY (`survey_id`) REFERENCES `m_surveys` (`id`);

--
-- Constraints for table `m_survey_lookup_tables`
--
ALTER TABLE `m_survey_lookup_tables`
  ADD CONSTRAINT `m_survey_lookup_tables_ibfk_1` FOREIGN KEY (`survey_id`) REFERENCES `m_surveys` (`id`);

--
-- Constraints for table `m_survey_questions`
--
ALTER TABLE `m_survey_questions`
  ADD CONSTRAINT `m_survey_questions_ibfk_1` FOREIGN KEY (`survey_id`) REFERENCES `m_surveys` (`id`);

--
-- Constraints for table `m_survey_responses`
--
ALTER TABLE `m_survey_responses`
  ADD CONSTRAINT `m_survey_responses_ibfk_1` FOREIGN KEY (`question_id`) REFERENCES `m_survey_questions` (`id`);

--
-- Constraints for table `m_survey_scorecards`
--
ALTER TABLE `m_survey_scorecards`
  ADD CONSTRAINT `m_survey_scorecards_ibfk_1` FOREIGN KEY (`survey_id`) REFERENCES `m_surveys` (`id`),
  ADD CONSTRAINT `m_survey_scorecards_ibfk_2` FOREIGN KEY (`question_id`) REFERENCES `m_survey_questions` (`id`),
  ADD CONSTRAINT `m_survey_scorecards_ibfk_3` FOREIGN KEY (`response_id`) REFERENCES `m_survey_responses` (`id`),
  ADD CONSTRAINT `m_survey_scorecards_ibfk_4` FOREIGN KEY (`user_id`) REFERENCES `m_appuser` (`id`),
  ADD CONSTRAINT `m_survey_scorecards_ibfk_5` FOREIGN KEY (`client_id`) REFERENCES `m_client` (`id`);

--
-- Constraints for table `m_tax_component`
--
ALTER TABLE `m_tax_component`
  ADD CONSTRAINT `FK_tax_component_createdby` FOREIGN KEY (`createdby_id`) REFERENCES `m_appuser` (`id`),
  ADD CONSTRAINT `FK_tax_component_credit_gl_account` FOREIGN KEY (`credit_account_id`) REFERENCES `acc_gl_account` (`id`),
  ADD CONSTRAINT `FK_tax_component_debit_gl_account` FOREIGN KEY (`debit_account_id`) REFERENCES `acc_gl_account` (`id`),
  ADD CONSTRAINT `FK_tax_component_lastmodifiedby` FOREIGN KEY (`lastmodifiedby_id`) REFERENCES `m_appuser` (`id`);

--
-- Constraints for table `m_tax_component_history`
--
ALTER TABLE `m_tax_component_history`
  ADD CONSTRAINT `FK_tax_component_history_createdby` FOREIGN KEY (`createdby_id`) REFERENCES `m_appuser` (`id`),
  ADD CONSTRAINT `FK_tax_component_history_lastmodifiedby` FOREIGN KEY (`lastmodifiedby_id`) REFERENCES `m_appuser` (`id`),
  ADD CONSTRAINT `FK_tax_component_history_tax_component_id` FOREIGN KEY (`tax_component_id`) REFERENCES `m_tax_component` (`id`);

--
-- Constraints for table `m_tax_group`
--
ALTER TABLE `m_tax_group`
  ADD CONSTRAINT `FK_tax_group_createdby` FOREIGN KEY (`createdby_id`) REFERENCES `m_appuser` (`id`),
  ADD CONSTRAINT `FK_tax_group_lastmodifiedby` FOREIGN KEY (`lastmodifiedby_id`) REFERENCES `m_appuser` (`id`);

--
-- Constraints for table `m_tax_group_mappings`
--
ALTER TABLE `m_tax_group_mappings`
  ADD CONSTRAINT `FK_tax_group_mappings_createdby` FOREIGN KEY (`createdby_id`) REFERENCES `m_appuser` (`id`),
  ADD CONSTRAINT `FK_tax_group_mappings_lastmodifiedby` FOREIGN KEY (`lastmodifiedby_id`) REFERENCES `m_appuser` (`id`),
  ADD CONSTRAINT `FK_tax_group_mappings_tax_component` FOREIGN KEY (`tax_component_id`) REFERENCES `m_tax_component` (`id`),
  ADD CONSTRAINT `FK_tax_group_mappings_tax_group` FOREIGN KEY (`tax_group_id`) REFERENCES `m_tax_group` (`id`);

--
-- Constraints for table `m_tellers`
--
ALTER TABLE `m_tellers`
  ADD CONSTRAINT `FK_m_tellers_gl_account_credit_account_id` FOREIGN KEY (`credit_account_id`) REFERENCES `acc_gl_account` (`id`),
  ADD CONSTRAINT `FK_m_tellers_gl_account_debit_account_id` FOREIGN KEY (`debit_account_id`) REFERENCES `acc_gl_account` (`id`),
  ADD CONSTRAINT `FK_m_tellers_m_office` FOREIGN KEY (`office_id`) REFERENCES `m_office` (`id`);

--
-- Constraints for table `notification_mapper`
--
ALTER TABLE `notification_mapper`
  ADD CONSTRAINT `notification_mapper_ibfk_2` FOREIGN KEY (`user_id`) REFERENCES `m_appuser` (`id`),
  ADD CONSTRAINT `notification_mapper_ibfk_3` FOREIGN KEY (`notification_id`) REFERENCES `notification_generator` (`id`);

--
-- Constraints for table `request_audit_table`
--
ALTER TABLE `request_audit_table`
  ADD CONSTRAINT `FK1_request_audit_table_m_client` FOREIGN KEY (`client_id`) REFERENCES `m_client` (`id`);

--
-- Constraints for table `scheduled_email_campaign`
--
ALTER TABLE `scheduled_email_campaign`
  ADD CONSTRAINT `scheduled_email_campaign_ibfk_1` FOREIGN KEY (`stretchy_report_id`) REFERENCES `stretchy_report` (`id`);

--
-- Constraints for table `scheduled_email_messages_outbound`
--
ALTER TABLE `scheduled_email_messages_outbound`
  ADD CONSTRAINT `SEFKCLIENT00000001` FOREIGN KEY (`client_id`) REFERENCES `m_client` (`id`),
  ADD CONSTRAINT `SEFKGROUP000000001` FOREIGN KEY (`group_id`) REFERENCES `m_group` (`id`),
  ADD CONSTRAINT `SEFKSTAFF000000001` FOREIGN KEY (`staff_id`) REFERENCES `m_staff` (`id`),
  ADD CONSTRAINT `fk_schedule_email_campign1` FOREIGN KEY (`email_campaign_id`) REFERENCES `scheduled_email_campaign` (`id`);

--
-- Constraints for table `sms_campaign`
--
ALTER TABLE `sms_campaign`
  ADD CONSTRAINT `sms_campaign_ibfk_1` FOREIGN KEY (`report_id`) REFERENCES `stretchy_report` (`id`);

--
-- Constraints for table `sms_messages_outbound`
--
ALTER TABLE `sms_messages_outbound`
  ADD CONSTRAINT `FKCAMPAIGN00000001` FOREIGN KEY (`campaign_id`) REFERENCES `sms_campaign` (`id`),
  ADD CONSTRAINT `FKCLIENT00000001` FOREIGN KEY (`client_id`) REFERENCES `m_client` (`id`),
  ADD CONSTRAINT `FKGROUP000000001` FOREIGN KEY (`group_id`) REFERENCES `m_group` (`id`),
  ADD CONSTRAINT `FKSTAFF000000001` FOREIGN KEY (`staff_id`) REFERENCES `m_staff` (`id`);

--
-- Constraints for table `stretchy_parameter`
--
ALTER TABLE `stretchy_parameter`
  ADD CONSTRAINT `fk_stretchy_parameter_001` FOREIGN KEY (`parent_id`) REFERENCES `stretchy_parameter` (`id`);

--
-- Constraints for table `stretchy_report_parameter`
--
ALTER TABLE `stretchy_report_parameter`
  ADD CONSTRAINT `fk_report_parameter_001` FOREIGN KEY (`report_id`) REFERENCES `stretchy_report` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_report_parameter_002` FOREIGN KEY (`parameter_id`) REFERENCES `stretchy_parameter` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `topic_subscriber`
--
ALTER TABLE `topic_subscriber`
  ADD CONSTRAINT `fk_topic_has_m_appuser_m_appuser1` FOREIGN KEY (`user_id`) REFERENCES `m_appuser` (`id`),
  ADD CONSTRAINT `fk_topic_has_m_appuser_topic` FOREIGN KEY (`topic_id`) REFERENCES `topic` (`id`);

--
-- Constraints for table `twofactor_access_token`
--
ALTER TABLE `twofactor_access_token`
  ADD CONSTRAINT `fk_2fa_access_token_user_id` FOREIGN KEY (`appuser_id`) REFERENCES `m_appuser` (`id`);

--
-- Constraints for table `x_table_column_code_mappings`
--
ALTER TABLE `x_table_column_code_mappings`
  ADD CONSTRAINT `FK_x_code_id` FOREIGN KEY (`code_id`) REFERENCES `m_code` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
