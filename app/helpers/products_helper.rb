module ProductsHelper
  
    def load_products
      @pagy, @products = pagy(Product.all, items: 9)
    end
  end