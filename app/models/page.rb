require 'simple_xlsx_reader'

class Page < ApplicationRecord

  def self.set_chart_data
    workbook = SimpleXlsxReader.open '/home/fabricio/Documents/Parsing_cotações.xlsx'

    worksheets = workbook.sheets
    chart_data = []
    worksheets.each do |worksheet|
      num_rows = 0
      worksheet.rows.each do |row|
        row_cells = row
         chart_data << Page.create(trade_date:row[0], price:row[1])
        num_rows += 1
      end
    end
  end
end