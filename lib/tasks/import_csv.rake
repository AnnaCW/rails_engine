require 'csv'

namespace :db do
  task :seed_csv => :environment do |t, args|
    base_path = "#{Rails.root}/public/seed_data/"

    puts "Parsing Customers!"
    CSV.foreach("#{base_path}customers.csv", :headers => true, :encoding => 'ISO-8859-1:UTF-8') do |row|
      Customer.create(row.to_hash)
    end
    puts "Parsed Customers!"

    puts "Parsing Merchants!"
    CSV.foreach("#{base_path}merchants.csv", :headers => true, :encoding => 'ISO-8859-1:UTF-8') do |row|
      Merchant.create(row.to_hash)
    end
    puts "Parsed Merchants!"

    puts "Parsing Items!"
    CSV.foreach("#{base_path}items.csv", :headers => true, :encoding => 'ISO-8859-1:UTF-8') do |row|
      Item.create(row.to_hash)
    end
    puts "Parsed Items!"

    puts "Parsing Invoices!"
    CSV.foreach("#{base_path}invoices.csv", :headers => true, :encoding => 'ISO-8859-1:UTF-8') do |row|
      Invoice.create(row.to_hash)
    end
    puts "Parsed Invoices!"

    puts "Parsing Invoice Items!"
    CSV.foreach("#{base_path}invoice_items.csv", :headers => true, :encoding => 'ISO-8859-1:UTF-8') do |row|
      InvoiceItem.create(row.to_hash)
    end
    puts "Parsed InvoiceItem!"

    puts "Parsing Transactions!"
    CSV.foreach("#{base_path}transactions.csv", :headers => true, :encoding => 'ISO-8859-1:UTF-8') do |row|
      Transaction.create(row.to_hash)
    end
    puts "Parsed Transactions!"
  end
end
