Given(/^I navigate to page "([^"]*)"$/) do |url|
  @TvPage = TvPage.new(@browser)
  @TvPage.visit(url)
end

When(/^I filtered "([^"]*)" as a brand$/) do |brand|
  @TvPage.clickMoreFilters
  @TvPage.chooseBrand(brand)
  @TvPage.clickDoneButton
end

#Below code is with out Page object Model. Just wanted to show you the difference.
Then(/^I should see url contains "([^"]*)"$/) do |brand|
  url = @browser.url
  expect(url).to include(brand.downcase)
end

And(/^I should see television reviews for Samsung "([^"]*)"$/) do |review|
  actual_review_result = @browser.element(:xpath => "//h1").text
  expect(actual_review_result).to include(review)
end