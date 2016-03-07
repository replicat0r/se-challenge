module ReportsHelper


	def reject_column_name(column)
		column.attributes.except!("id", "created_at","updated_at")
		
	end
end
