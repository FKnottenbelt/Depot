require "application_system_test_case"

class CartsTest < ApplicationSystemTestCase
  # test "visiting the index" do
  #   visit carts_url
  #
  #   assert_selector "h1", text: "Cart"
  # end

  test "add to cart button show cart" do
    visit store_index_url

    first('.catalog li').click_on 'Add to Cart'
    assert_selector "#cart"
  end

  test "empty cart button hides cart" do
    visit store_index_url

    first('.catalog li').click_on 'Add to Cart'
    assert_selector "#cart"

    accept_alert 'Are you sure?' do
     click_button('Empty cart')
    end

    assert_no_selector "#cart"
  end
end
