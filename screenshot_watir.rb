require 'watir'

browser = Watir::Browser.new :chrome,
                       switches: %w(--window-size=1080,1080 --headless --disable-gpu)
# browser.goto 'google.com'
browser.goto 'https://en.wikipedia.org/'

# browser.select(:title).wait_until_present
# browser.driver.manage.timeouts.implicit_wait = 5
browser.screenshot.save 'screenshot.png'
# browser.text_field(title: 'Search').set 'Hello World!'
# browser.button(type: 'submit').click

puts browser.title
# => 'Hello World! - Google Search'
browser.close