module CurrentCart

  private

    def set_cart
      @cart = Cart.find(session[:card_id])
    rescue ActiveRecord::RecordNotFound
      @cart = Cart.create
      session[:card_id] = @card_id
    end
end