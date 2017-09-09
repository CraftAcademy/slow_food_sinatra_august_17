Given(/^I visit the site$/) do
  visit '/'
end

Then(/^I should see a message saying "([^"]*)"$/) do |message|
  expect(page).to have_content message
end

Given(/^there is a dish named "([^"]*)" in our database$/) do |dish_name|
  @dish = Dish.create(name: dish_name)
end

Given(/^its dish price is "([^"]*)" in our database$/) do |dish_price|
  @dish.update(price: dish_price)
end

Then(/^I should se a message saying "([^"]*)"$/) do |message|
  expect(page).to have_content message
end

Given(/^the Carbonara has the category "([^"]*)" in our database$/) do |dish_category|
  dish = Dish.first(name: 'Carbonara')
  dish.update(category: dish_category)
 end

 Then(/^I should see message saying "([^"]*)"$/) do |message|
   expect(page).to have_content message
 end

Given(/^its dish desription is "([^"]*)" in our database$/) do |dish_description|
  dish = Dish.first(name: 'Carbonara')
  dish.update(description: dish_description)
end

Given(/^I click "([^"]*)" for "([^"]*)"$/) do |button, dish_name|
  dish = Dish.first(name: dish_name)
  within("#dish_#{dish.id}") do
    click_link_or_button button
  end
end

And(/^my order should contain "([^"]*)" item$/) do |count|
  order = Order.last
  expect(order.order_items.count).to eq count.to_i
end