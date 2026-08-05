exec bronze.load_bronze
create or alter procedure bronze.load_bronze as
begin
	declare @start_time datetime, @end_time datetime;
	begin try
		print'=============================================';
		print'Loading bronze layer';
		print'=============================================';

		print'---------------------------------------------';
		print'Loading crm tables';
		print'---------------------------------------------';

		set @start_time = GETDATE();
		print'Truncating bronze.crm_cust_info';
		truncate table  bronze.crm_cust_info;

		print'Inserting data into bronze.crm_cust_info';
		bulk insert bronze.crm_cust_info
		from 'C:\Users\ACER\OneDrive\Desktop\databaraa\sql-data-warehouse-project\datasets\source_crm\cust_info.csv'
		with (
			firstrow = 2,
			fieldterminator = ',',
			tablock
		);
		set @end_time = GETDATE();
		print'>> Load duration' + cast(datediff(second,@start_time,@end_time) as nvarchar) + 'seconds';

		print'Truncating bronze.crm_prd_info';
		truncate table  bronze.crm_prd_info;

		print'Inserting data into bronze.crm_prd_info';
		bulk insert bronze.crm_prd_info
		from 'C:\Users\ACER\OneDrive\Desktop\databaraa\sql-data-warehouse-project\datasets\source_crm\prd_info.csv'
		with (
			firstrow = 2,
			fieldterminator = ',',
			tablock
		);

		print'Truncating bronze.crm_cust_sales_details';
		truncate table  bronze.crm_sales_details;

		print'Inserting data into bronze.crm_sales_details';
		bulk insert bronze.crm_sales_details
		from 'C:\Users\ACER\OneDrive\Desktop\databaraa\sql-data-warehouse-project\datasets\source_crm\sales_details.csv'
		with (
			firstrow = 2,
			fieldterminator = ',',
			tablock
		);

		print'---------------------------------------------';
		print'Loading erp tables';
		print'---------------------------------------------';

		print'Truncating bronze.erp_cust_az12';
		truncate table  bronze.erp_cust_az12;

		print'Inserting data into bronze.erp_cust_az12';
		bulk insert bronze.erp_cust_az12
		from 'C:\Users\ACER\OneDrive\Desktop\databaraa\sql-data-warehouse-project\datasets\source_erp\CUST_AZ12.csv'
		with (
			firstrow = 2,
			fieldterminator = ',',
			tablock
		);

		print'Truncating bronze.erp_loc_a101'
		truncate table  bronze.erp_loc_a101;

		print'Inserting data into bronze.erp_loc_a101';
		bulk insert bronze.erp_loc_a101
		from 'C:\Users\ACER\OneDrive\Desktop\databaraa\sql-data-warehouse-project\datasets\source_erp\LOC_A101.csv'
		with (
			firstrow = 2,
			fieldterminator = ',',
			tablock
		);

		print'Truncating bronze.erp_px_cat_v1g2'
		truncate table  bronze.erp_px_cat_v1g2;

		print'Inserting data into bronze.erp_px_cat_v1g2';
		bulk insert bronze.erp_px_cat_v1g2
		from 'C:\Users\ACER\OneDrive\Desktop\databaraa\sql-data-warehouse-project\datasets\source_erp\PX_CAT_G1V2.csv'
		with (
			firstrow = 2,
			fieldterminator = ',',
			tablock
		);
	end try
	begin catch
		print'===================================================';
		print'Error occured during loading bronze layer';
		print'Error message'+ cast (error_message() as nvarchar);
		print'Error number'+ cast (error_number() as nvarchar);
		print'===================================================';

	end catch
end



