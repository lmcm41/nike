Given(/^I am on the Nike site$/) do
  @browser.goto "http://www.nike.com/us/en_us/"
  @browser.img(class:"exp-geodetect-notifier__flag", index:1).click
  sleep 3
end

When(/^I enter to the login page$/) do
  @sign_msg="YOUR ACCOUNT FOR EVERYTHING NIKE"
  @browser.img(class:"exp-geodetect-notifier__flag", index:1).click
  @browser.button(class:"js-rootItem").click
  expect(@browser.div(class: "view-header").text).to include @sign_msg
end

And(/^Enter the my credentials$/) do
  @email="automation.testing0918@gmail.com"
  @pass="Testing1234"
  @browser.text_field(type:"email").send_keys @email
  @browser.text_field(type: "password").send_keys "Testing1234"
  @browser.input(type: "button").click
  sleep 3
end

Then(/^I should be logged in with the name "([^"]*)"$/) do |name|
  expect(@browser.span(class: "nsg-font-family--base").text).to include name
end

When(/^I search for "([^"]*)"$/) do |search|
  @browser.input(id: "gnav-bar--search-input").send_keys(search)
  @browser.send_keys :enter
  sleep 2
end

And(/^Select an item from the results$/) do
  @browser.p(class: "product-display-name nsg-font-family--base edf-font-size--regular nsg-text--dark-grey", index: 0).click
  @name = @browser.p(class: "product-display-name nsg-font-family--base edf-font-size--regular nsg-text--dark-grey", index: 0).text.capitalize
  sleep 2
end

Then(/^I should be on the information page of the selected item$/) do
  puts @name
  puts @browser.h1(class: "exp-product-title nsg-font-family--platform").text.capitalize
  expect(@browser.h1(class: "exp-product-title nsg-font-family--platform").text.capitalize).to include @name

end