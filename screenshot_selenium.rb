require 'selenium-webdriver'


options = Selenium::WebDriver::Chrome::Options.new
options.add_argument('--headless')
options.add_argument('--disable-gpu')

driver = Selenium::WebDriver.for :chrome, options: options

# driver = Selenium::WebDriver.for :chrome


driver.navigate.to "https://www.google.com"
driver.manage.timeouts.implicit_wait = 3
driver.save_screenshot `./#{driver.title}.png`
puts "screenshot saved"
puts driver.title
driver.quit





# require 'selenium-webdriver'
# require "capybara/dsl"

# # Capybara.register_driver :chrome do |app|
# #   Capybara::Selenium::Driver.new(app, :browser => :chrome)
# # end

# # Capybara.register_driver :chrome do |app|
# #   Capybara::Selenium::Driver.new(app, browser: :chrome)
# # end

# Capybara.register_driver :headless_chrome do |app|
#   capabilities = Selenium::WebDriver::Remote::Capabilities.chrome(
#     chromeOptions: { args: %w(--headless --disable-gpu) }
#   )

#   Capybara::Selenium::Driver.new app,
#     browser: :chrome,
#     desired_capabilities: capabilities
# end

# # Capybara.javascript_driver = :headless_chrome

# Capybara.current_driver = :headless_chrome

# class Screenshot
#   include Capybara::DSL

#   # Captures a screenshot of +url+ saving it to +path+.

#   def capture(url, path)
#     # Open page
#     visit url

#     page.save_screenshot(path, :full => true)
#     puts "screenshot saved"

#   end
# end

# url = 'https://www.google.com'
# screenshot = Screenshot.new
# screenshot.capture url, "screenshot.png"