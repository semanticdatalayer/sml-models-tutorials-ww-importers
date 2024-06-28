--- Load ww_importers data
--
-- NOTE: if possible, create a project name `atscale-tutorial-data` first and run these scripts there
--
--
CREATE SCHEMA IF NOT EXISTS `ww_importers`;

LOAD DATA OVERWRITE ww_importers.city (city_key INT64, wwi_city_id INT64, city STRING, state_province STRING, country STRING, continent STRING, sales_territory STRING, region STRING, subregion STRING, location INT64, latest_recorded_population TIMESTAMP, valid_from TIMESTAMP, valid_to INT64, lineage_key INT64) FROM FILES (format = 'CSV', field_delimiter = '\t', null_marker = '(null)', skip_leading_rows = 1, uris = ['gs://atscale_tutorial_data/ww_importers/ww_importers_table_WORLDWIDE_IMPORTERS.CITY.csv']);

LOAD DATA OVERWRITE ww_importers.customer (customer_key INT64, wwi_customer_id INT64, customer STRING, bill_to_customer STRING, category STRING, buying_group STRING, primary_contact STRING, postal_code STRING, valid_from TIMESTAMP, valid_to TIMESTAMP, lineage_key INT64) FROM FILES (format = 'CSV', field_delimiter = '\t', null_marker = '(null)', skip_leading_rows = 1, uris = ['gs://atscale_tutorial_data/ww_importers/ww_importers_table_WORLDWIDE_IMPORTERS.CUSTOMER.csv']);

LOAD DATA OVERWRITE ww_importers.date (date DATE, day_number INT64, day INT64, month STRING, short_month STRING, calendar_month_number INT64, calendar_month_label STRING, calendar_year INT64, calendar_year_label STRING, fiscal_month_number INT64, fiscal_month_label STRING, fiscal_year INT64, fiscal_year_label STRING, iso_week_number INT64) FROM FILES (format = 'CSV', field_delimiter = '\t', null_marker = '(null)', skip_leading_rows = 1, uris = ['gs://atscale_tutorial_data/ww_importers/ww_importers_table_WORLDWIDE_IMPORTERS.DATE.csv']);

LOAD DATA OVERWRITE ww_importers.employee (employee_key INT64, wwi_employee_id INT64, employee STRING, preferred_name STRING, is_salesperson BOOLEAN, valid_from TIMESTAMP, valid_to TIMESTAMP, lineage_key INT64) FROM FILES (format = 'CSV', field_delimiter = '\t', null_marker = '(null)', skip_leading_rows = 1, uris = ['gs://atscale_tutorial_data/ww_importers/ww_importers_table_WORLDWIDE_IMPORTERS.EMPLOYEE.csv']);

LOAD DATA OVERWRITE ww_importers.fact_movement (movement_key INT64, date_key DATE, stock_item_key INT64, customer_key INT64, supplier_key INT64, transaction_type_key INT64, wwi_stock_item_transaction_id INT64, wwi_invoice_id INT64, wwi_purchase_order_id INT64, quantity INT64, lineage_key INT64) FROM FILES (format = 'CSV', field_delimiter = '\t', null_marker = '(null)', skip_leading_rows = 1, uris = ['gs://atscale_tutorial_data/ww_importers/ww_importers_table_WORLDWIDE_IMPORTERS.FACT_MOVEMENT.csv']);

LOAD DATA OVERWRITE ww_importers.fact_order (order_key INT64, city_key INT64, customer_key INT64, stock_item_key INT64, order_date_key DATE, picked_date_key DATE, salesperson_key INT64, picker_key INT64, wwi_order_id INT64, wwi_backorder_id INT64, description STRING, package STRING, quantity INT64, unit_price INT64, tax_rate INT64, total_excluding_tax INT64, tax_amount INT64, total_including_tax INT64, lineage_key INT64) FROM FILES (format = 'CSV', field_delimiter = '\t', null_marker = '(null)', skip_leading_rows = 1, uris = ['gs://atscale_tutorial_data/ww_importers/ww_importers_table_WORLDWIDE_IMPORTERS.FACT_ORDER.csv']);

LOAD DATA OVERWRITE ww_importers.fact_purchase (purchase_key INT64, date_key DATE, supplier_key INT64, stock_item_key INT64, wwi_purchase_order_id INT64, ordered_outers INT64, ordered_quantity INT64, received_outers INT64, package STRING, is_order_finalized BOOLEAN, lineage_key INT64) FROM FILES (format = 'CSV', field_delimiter = '\t', null_marker = '(null)', skip_leading_rows = 1, uris = ['gs://atscale_tutorial_data/ww_importers/ww_importers_table_WORLDWIDE_IMPORTERS.FACT_PURCHASE.csv']);

LOAD DATA OVERWRITE ww_importers.fact_sale (sale_key INT64, city_key INT64, customer_key INT64, bill_to_customer_key INT64, stock_item_key INT64, invoice_date_key DATE, delivery_date_key DATE, salesperson_key INT64, wwi_invoice_id INT64, description STRING, package STRING, quantity INT64, unit_price INT64, tax_rate INT64, total_excluding_tax INT64, tax_amount INT64, profit INT64, total_including_tax INT64, total_dry_items INT64, total_chiller_items INT64, lineage_key INT64) FROM FILES (format = 'CSV', field_delimiter = '\t', null_marker = '(null)', skip_leading_rows = 1, uris = ['gs://atscale_tutorial_data/ww_importers/ww_importers_table_WORLDWIDE_IMPORTERS.FACT_SALE.csv']);

LOAD DATA OVERWRITE ww_importers.fact_stockholding (stock_holding_key INT64, stock_item_key INT64, quantity_on_hand INT64, bin_location STRING, last_stocktake_quantity INT64, last_cost_price INT64, reorder_level INT64, target_stock_level INT64, lineage_key INT64) FROM FILES (format = 'CSV', field_delimiter = '\t', null_marker = '(null)', skip_leading_rows = 1, uris = ['gs://atscale_tutorial_data/ww_importers/ww_importers_table_WORLDWIDE_IMPORTERS.FACT_STOCKHOLDING.csv']);

LOAD DATA OVERWRITE ww_importers.fact_transaction (transaction_key INT64, date_key DATE, customer_key INT64, bill_to_customer_key INT64, supplier_key INT64, transaction_type_key INT64, payment_method_key INT64, wwi_customer_transaction_id INT64, wwi_supplier_transaction_id STRING, wwi_invoice_id INT64, wwi_purchase_order_id STRING, supplier_invoice_number STRING, total_excluding_tax INT64, tax_amount INT64, total_including_tax INT64, outstanding_balance INT64, is_finalized BOOLEAN, lineage_key INT64) FROM FILES (format = 'CSV', field_delimiter = '\t', null_marker = '(null)', skip_leading_rows = 1, uris = ['gs://atscale_tutorial_data/ww_importers/ww_importers_table_WORLDWIDE_IMPORTERS.FACT_TRANSACTION.csv']);

LOAD DATA OVERWRITE ww_importers.paymentmethod (payment_method_key INT64, wwi_payment_method_id INT64, payment_method STRING, valid_from TIMESTAMP, valid_to TIMESTAMP, lineage_key INT64) FROM FILES (format = 'CSV', field_delimiter = '\t', null_marker = '(null)', skip_leading_rows = 1, uris = ['gs://atscale_tutorial_data/ww_importers/ww_importers_table_WORLDWIDE_IMPORTERS.PAYMENTMETHOD.csv']);

LOAD DATA OVERWRITE ww_importers.stockitem (stock_item_key INT64, wwi_stock_item_id INT64, stock_item STRING, color STRING, selling_package STRING, buying_package STRING, brand STRING, size STRING, lead_time_days INT64, quantity_per_outer INT64, is_chiller_stock BOOLEAN, barcode STRING, tax_rate INT64, unit_price INT64, recommended_retail_price INT64, typical_weight_per_unit INT64, valid_from TIMESTAMP, valid_to TIMESTAMP, lineage_key INT64) FROM FILES (format = 'CSV', field_delimiter = '\t', null_marker = '(null)', skip_leading_rows = 1, uris = ['gs://atscale_tutorial_data/ww_importers/ww_importers_table_WORLDWIDE_IMPORTERS.STOCKITEM.csv']);

LOAD DATA OVERWRITE ww_importers.supplier (supplier_key INT64, wwi_supplier_id INT64, supplier STRING, category STRING, primary_contact STRING, supplier_reference STRING, payment_days INT64, postal_code STRING, valid_from TIMESTAMP, valid_to TIMESTAMP, lineage_key INT64) FROM FILES (format = 'CSV', field_delimiter = '\t', null_marker = '(null)', skip_leading_rows = 1, uris = ['gs://atscale_tutorial_data/ww_importers/ww_importers_table_WORLDWIDE_IMPORTERS.SUPPLIER.csv']);

LOAD DATA OVERWRITE ww_importers.transactiontype (transaction_type_key INT64, wwi_transaction_type_id INT64, transaction_type STRING, valid_from TIMESTAMP, valid_to TIMESTAMP, lineage_key INT64) FROM FILES (format = 'CSV', field_delimiter = '\t', null_marker = '(null)', skip_leading_rows = 1, uris = ['gs://atscale_tutorial_data/ww_importers/ww_importers_table_WORLDWIDE_IMPORTERS.TRANSACTIONTYPE.csv']);