Environment setup: 

1. Install rvm: (refer to https://rvm.io/rvm/install)

> brew install gpg

> gpg --keyserver hkp://keys.gnupg.net --recv-keys 409B6B1796C275462A1 703113804BB82D39DC0E3

> \curl -sSL https://get.rvm.io | bash -s stable --ruby=2.3.1

2. Set default ruby in rvm:

> rvm --default use ruby-2.3.1@global

3. Install Cucumber, Bundler and Watir:

> gem install cucumber

> gem install rake bundler yard watir-webdriver 

4. Download Chrome browser, ChromeDriver and folder add with executable file to your PATH:
> https://www.google.com/intl/en/chrome/

> http://chromedriver.chromium.org/ 

5. Checkout repository and from both MOBGEN_UI_tests and MOBGEN_API_tests folder install required gems:

> bundle install

To run all tests (please run tests from different folders as it is made as 2 projects to avoid sharing libs):
> cucumber
