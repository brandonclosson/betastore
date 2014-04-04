require 'test_helper'

class CreateProductTest < ActionDispatch::IntegrationTest
  def test_manage
    visit "/admin/products"

    click_on "Create New"
    fill_in "Name", with: "Example Product"
    fill_in "Price", with: "14.99"
    click_on "Save"
    
    assert page.has_content?("Product #{Product.last.id} was created")
    within("tr.product-#{Product.last.id}") { click_on "Edit" }

    fill_in "product[price]", with: "15.99"
    click_on "Save"
    
    assert page.has_content?("Product #{Product.last.id} was updated")
    within("tr.product-#{Product.last.id}") { click_on "#{Product.last.id}" }
    
    assert page.has_content?("15.99")
    click_on "Delete"

    refute page.has_content?("Example Product")
  end
end