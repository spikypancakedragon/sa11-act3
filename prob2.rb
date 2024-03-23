def parse_invoices(invoice_data)
  date_pattern = /\d{4}-\d{2}-\d{2}/
  num_pattern = /INV\d{3}/
  name_pattern = /(?<=-\s)\w+(?:\s\w+)*(?=\s-\s\$)/
  amt_pattern = /\$\d+/

  dates = invoice_data.scan(date_pattern)
  nums = invoice_data.scan(num_pattern)
  names = invoice_data.scan(name_pattern)
  amts = invoice_data.scan(amt_pattern)

  num_entries = dates.length
  for i in 0...num_entries
    puts "Date: #{dates[i]}, Invoice Number: #{nums[i]}, Client: #{names[i]}, Amount: #{amts[i]}"
  end

end

invoice_entries = <<-INVOICES
2023-03-01 - INV001 - Acme Corp - $1000
2023-03-02 - INV002 - Beta LLC - $2050
2023-03-03 - INV003 - Gamma Inc - $3500
INVOICES
p parse_invoices(invoice_entries)

'''
Expected output:
Date: 2023-03-01, Invoice Number: INV001, Client: Acme Corp, Amount: $1000
Date: 2023-03-02, Invoice Number: INV002, Client: Beta LLC, Amount: $2050
Date: 2023-03-03, Invoice Number: INV003, Client: Gamma Inc, Amount: $3500
'''
