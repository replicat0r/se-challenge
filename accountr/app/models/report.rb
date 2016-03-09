class Report < ActiveRecord::Base
  require 'roo'

  def self.process_file(file)
    import_file = Roo::CSV.new(file.path)

    header = process_header(import_file.row(1))
   

    (2..import_file.last_row).each do |i|
      
      row = Hash[[header, import_file.row(i)].transpose]

      report = new
      report.attributes = sanitize_data(row).to_hash.slice(*report.attribute_names())
      
      report.save!
    end
  end

  def self.sanitize_data(row)
    new_data = {"date" => format_date(row["date"]), "pre_tax_amount" => format_number(row["pre_tax_amount"])}
    row.merge(new_data)
      

  end

  def self.format_number(number)
    number.to_s.gsub(/,/, '')

  end

  def self.format_date(date)
    Chronic.parse(date).to_s
  end


  def self.process_header(header)
  	output = header.map  { |h| h.tr(' -','_')}
  end


end
