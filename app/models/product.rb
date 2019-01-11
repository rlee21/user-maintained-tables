class Product < ApplicationRecord
  validates :product_name, presence: true, uniqueness: { case_sensitive: false }
  validates :reporting_name, presence: true

  def self.to_csv(options = {})
    CSV.generate(options) do |csv|
      csv << column_names
      all.each do |product|
        csv << product.attributes.values_at(*column_names)
      end
    end
  end

  def self.accessible_attributes
    ['id', 'product_name', 'reporting_name', 'created_at', 'updated_at']
  end

  def self.import(file)
    CSV.foreach(file.path, headers: true ) do |row|
      product = find_by_id(row["id"]) || new
      product.attributes = row.to_hash.slice(*accessible_attributes)
      product.save!
    end
  end

end
