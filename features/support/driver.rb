require 'rubygems'
require 'rspec'
require 'watir-webdriver'

include Selenium

#Creating Remote WebDriver


Before do |scenario|
  browser = Watir::Browser.new :chrome
  @browser = browser
end

After do |scenario|
  @browser.driver.quit
end