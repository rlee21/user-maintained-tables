class ProductsController < ApplicationController
  def index
    @products = Product.all
    respond_to do |format|
      format.html
      format.csv { send_data @products.to_csv }
    end
  end

  def import
    Product.import(params[:file])
    redirect_to root_url, notice: "CSV successfully imported"
  end

end
