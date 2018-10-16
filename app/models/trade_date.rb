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
             chart_data << TradeDate.new(day:row[0], open:row[1], high:row[1], low:row[1], close:row[1])
            num_rows += 1
          end
      end
    end
  chart_data
  end

  # def self.set_stock_name
  #   workbook = SimpleXlsxReader.open '/home/fabricio/Documents/Parsing_cotações.xlsx'
  #   worksheets = workbook.sheets
  #   stock_name = ""
  #   worksheets.each do |worksheet|
  #     stock_name = worksheet.name
  #   end
  #   stock_name
  # end

end
