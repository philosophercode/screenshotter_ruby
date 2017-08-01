# require 'capybara'
# require 'capybara/dsl'
# require 'headless'

# Headless.ly do
#   driver = Selenium::WebDriver.for :firefox
#   driver.navigate.to 'http://google.com'
#   puts driver.title 
# end

require 'selenium-webdriver'

Selenium::WebDriver::Safari.driver_path = "/Applications/Safari\ Technology\ Preview.app/Contents/MacOS/safaridriver"

print "URL? "
website = gets.chomp
puts website


wd = Selenium::WebDriver.for :safari


# wd.navigate.to 'https://en.wikipedia.org/wiki/Philosophy'
# wd.navigate.to 'https://google.com'
wd.navigate.to website

# Get the actual page dimensions using javascript
#
width  = wd.execute_script("return Math.max(document.body.scrollWidth, document.body.offsetWidth, document.documentElement.clientWidth, document.documentElement.scrollWidth, document.documentElement.offsetWidth);")
height = wd.execute_script("return Math.max(document.body.scrollHeight, document.body.offsetHeight, document.documentElement.clientHeight, document.documentElement.scrollHeight, document.documentElement.offsetHeight);")

# Add some pixels on top of the calculated dimensions for good
# measure to make the scroll bars disappear
#
wd.manage.window.resize_to(width+100, height+100)

img = wd.screenshot_as(:png)
localDir = '/Users/isaacs/Desktop/play/ruby_screenshot/screenshots_safari'


Dir.chdir(localDir) do
    File.open("#{wd.title}.png", 'w+') do |fh|
        fh.write img
        puts "#{wd.title} Screenshot!"
    end
end

wd.quit()
# wd.close()
