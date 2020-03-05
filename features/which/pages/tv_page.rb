class TvPage

  def initialize(browser)
    @browser = browser
    @chooseMoreFilters = @browser.element(:xpath => "//span[contains(.,'More filters')]")
    @chooseSamsungBrand = @browser.element(:xpath => "//div/div/div[3]/section/ul/li/div/label/div")
    @chooseLgBrand = @browser.element(:xpath => "//div/div/div[3]/section/ul/li[2]/div/label/div")
    @doneButton = @browser.element(:css => ".\_2LKhj:nth-child(4) .\_2blko")
    @resultText = @browser.element(:xpath => "//h1")
  end

  def visit(url)
    @browser.window.maximize
    @browser.goto url
  end

  def clickMoreFilters
    @chooseMoreFilters.wait_until_present
    @chooseMoreFilters.click

  end

  def chooseBrand(brand)
    sleep 2
    if (brand == "Samsung")
      @chooseSamsungBrand.wait_until_present.click
    else
      @chooseLgBrand.wait_until_present.click
    end
  end

  def clickDoneButton
    sleep 2
    @doneButton.click
  end

  def verifyUrl(brand)
    url = @browser.url
    expect(url).to include(brand)
  end




end