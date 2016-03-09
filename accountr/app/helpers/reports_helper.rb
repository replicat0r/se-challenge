module ReportsHelper


	def reject_column_name(column)
		column.attributes.except!("id", "created_at","updated_at")
	end

	def sum_pre(hash)
		hash.map
	end
end
