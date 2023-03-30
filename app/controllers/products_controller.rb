class ProductsController < ApplicationController
    include ProductsHelper
    before_action :load_filter, only: :index
  
    def index
      @pagy, @products = pagy(Product.all, items: 10)
    end
  end