require "application_system_test_case"

class OrdersTest < ApplicationSystemTestCase
  # test "visiting the index" do
  #   visit orders_url
  #
  #   assert_selector "h1", text: "Order"
  # end

  test "check pay type check" do
    visit store_index_url

    first('.catalog li').click_on 'Add to Cart'

    click_on 'Checkout'

    fill_in 'order_name', with: 'Dave Thomas'
    fill_in 'order_address', with: '123 Main Street'
    fill_in 'order_email', with: 'dave@example.com'

    assert_no_selector "#order_routing_number"
    select 'Check', from: 'pay_type'
    assert_selector "#order_routing_number"
    assert_selector "#order_account_number"

    fill_in "Routing #", with: "123456"
    fill_in "Account #", with: "987654"
  end

  test "check pay type credit card" do
    visit store_index_url

    first('.catalog li').click_on 'Add to Cart'

    click_on 'Checkout'

    fill_in 'order_name', with: 'Dave Thomas'
    fill_in 'order_address', with: '123 Main Street'
    fill_in 'order_email', with: 'dave@example.com'

    assert_no_selector "#order_credit_card_number"
    select 'Credit card', from: 'pay_type'
    assert_selector "#order_credit_card_number"
    assert_selector "#order_expiration_date"

    fill_in "CC #", with: "123456"
    fill_in "Expiry", with: "03/19"
  end

  test "check pay type purchase order" do
    visit store_index_url

    first('.catalog li').click_on 'Add to Cart'

    click_on 'Checkout'

    fill_in 'order_name', with: 'Dave Thomas'
    fill_in 'order_address', with: '123 Main Street'
    fill_in 'order_email', with: 'dave@example.com'

    assert_no_selector "#order_po_number"
    select 'Purchase order', from: 'pay_type'
    assert_selector "#order_po_number"


    fill_in "PO #", with: "123456"
  end
end
