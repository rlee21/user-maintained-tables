class Product < ApplicationRecord
  validates :product_name, presence: true, uniqueness: { case_sensitive: false }
  validates :reporting_name, presence: true

  def self.to_csv(options = {})
    CSV.generate(options) do |csv|
      header = ['id', 'product_name', 'reporting_name']
      csv.add_row(header)
      # require 'pry'; binding.pry
      all.each do |product|
        # csv << product.attributes.values_at(*cols)
        values = product.attributes.values_at(*header)
        # values = product.attributes.values
        csv.add_row(values)
      end
    end
  end

  # def self.accessible_attributes
  #   # ['id', 'product_name', 'reporting_name', 'created_at', 'updated_at']
  #   ['id', 'product_name', 'reporting_name']
  # end

  def self.import(file)
    CSV.foreach(file.path, headers: true ) do |row|
      product = find_by_id(row["id"]) || new
      # product.attributes = row.to_hash.slice(*accessible_attributes)
      product.attributes = row.to_hash.slice(*row.to_hash.keys())
      product.save!
    end
  end

end
