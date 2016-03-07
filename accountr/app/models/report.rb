class Report < ActiveRecord::Base
  require 'roo'

  def self.process_file(file)
    import_file = Roo::CSV.new(file.path)

    header = process_header(import_file.row(1))
   

    (2..import_file.last_row).each do |i|
      row = Hash[[header, import_file.row(i)].transpose]

      report = new
      report.attributes = row.to_hash.slice(*report.attribute_names())
      
      report.save!
    end
  end


  def self.process_header(header)
  	output = header.map  { |h| h.tr(' -','_')}
  end


end
