class StaticPagesController < ApplicationController
  include ProductsHelper

  def home
    load_products
  end
end
