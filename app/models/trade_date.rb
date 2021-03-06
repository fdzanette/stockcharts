class TradeDate < ApplicationRecord
  belongs_to :stock

  def self.set_stock_price_history(stock_name)
    workbook = SimpleXlsxReader.open '/home/fabricio/Documents/Parsing_cotações.xlsx'
    worksheets = workbook.sheets
    chart_data = []
    worksheets.each do |worksheet|
      num_rows = 0
      if stock_name == worksheet.name
          worksheet.rows.drop(1).each do |row|
            row_cells = row
             chart_data << TradeDate.new(day:row[0], open:row[1], high:row[2], low:row[3], close:row[4])
            num_rows += 1
          end
      end
    end
  chart_data
  end

end
