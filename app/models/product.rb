class Product < ApplicationRecord
  validates :product_name, presence: true, uniqueness: { case_sensitive: false }
  validates :reporting_name, presence: true

  def self.to_csv(options = {})
    CSV.generate(options) do |csv|
      header = ['id', 'product_name', 'reporting_name']
      # require 'pry'; binding.pry
      csv.add_row(header)
      all.each do |product|
        values = product.attributes.values_at(*header)
        csv.add_row(values)
      end
    end
  end

  def self.import(file)
    CSV.foreach(file.path, headers: true ) do |row|
      product = find_by_id(row["id"]) || new
      product.attributes = row.to_hash
      product.save!
    end
  end

end
