class StoreController < ApplicationController
  def index
    @products = Product.order(:title)

    if session[:store_access_counter].nil?
      session[:store_access_counter] = 0
    else
      session[:store_access_counter] += 1
    end

    @access_counter = session[:store_access_counter]
  end
end
