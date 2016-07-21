require 'csv'

namespace :db do
  task :seed_csv => :environment do |t, args|
    base_path = "#{Rails.root}/public/seed_data/"

    puts "Parsing Customers!"
    CSV.foreach("#{base_path}customers.csv", :headers => true, :encoding => 'ISO-8859-1:UTF-8') do |row|
      customer = Customer.new(row.to_hash)
      if customer.valid?
        customer.save
      else
        "Didn't save #{row.to_hash.inspect}!"
      end

    end
    puts "Parsed Customers!"

    puts "Parsing Merchants!"
    CSV.foreach("#{base_path}merchants.csv", :headers => true, :encoding => 'ISO-8859-1:UTF-8') do |row|
      merchant = Merchant.new(row.to_hash)
      if merchant.valid?
        merchant.save
      else
        "Didn't save #{row.to_hash.inspect}!"
      end
    end
    puts "Parsed Merchants!"

    puts "Parsing Items!"
    CSV.foreach("#{base_path}items.csv", :headers => true, :encoding => 'ISO-8859-1:UTF-8') do |row|
      item = Item.new(row.to_hash)
      if item.valid?
        item.save
      else
        "Didn't save #{row.to_hash.inspect}!"
      end
    end
    puts "Parsed Items!"

    puts "Parsing Invoices!"
    CSV.foreach("#{base_path}invoices.csv", :headers => true, :encoding => 'ISO-8859-1:UTF-8') do |row|
      invoice = Invoice.new(row.to_hash)
      if invoice.valid?
        invoice.save
      else
        "Didn't save #{row.to_hash.inspect}!"
      end
    end
    puts "Parsed Invoices!"

    puts "Parsing Invoice Items!"
    CSV.foreach("#{base_path}invoice_items.csv", :headers => true, :encoding => 'ISO-8859-1:UTF-8') do |row|
      invoice_item = InvoiceItem.new(row.to_hash)
      if invoice_item.valid?
        invoice_item.save
      else
        "Didn't save #{row.to_hash.inspect}!"
      end
    end
    puts "Parsed InvoiceItem!"

    puts "Parsing Transactions!"
    CSV.foreach("#{base_path}transactions.csv", :headers => true, :encoding => 'ISO-8859-1:UTF-8') do |row|
      transaction = Transaction.new(row.to_hash)
      if transaction.valid?
        transaction.save
      else
        "Didn't save #{row.to_hash.inspect}!"
      end
    end
    puts "Parsed Transactions!"
  end
end
