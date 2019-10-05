class AddPriceToLineItems < ActiveRecord::Migration[5.1]
  def change
    add_column :line_items, :price, :decimal, precision: 8, scale: 2

    LineItem.all.each do |item|
      item.price = item.product.price
      item.save!
    end
  end
end
