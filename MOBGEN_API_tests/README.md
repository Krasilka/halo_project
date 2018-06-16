Environment setup: If you have already set up rvm and ruby environment, start with step 4.

1. Install rvm: (refer to https://rvm.io/rvm/install)

> brew install gpg

> gpg --keyserver hkp://keys.gnupg.net --recv-keys 409B6B1796C275462A1 703113804BB82D39DC0E3

> \curl -sSL https://get.rvm.io | bash -s stable --ruby=2.3.1

2. Set default ruby in rvm:

> rvm --default use ruby-2.3.1@global

3. Install Cucumber and Bundler:

> gem install cucumber

> gem install bundler

Checkout repository and from MOBGEN_API_tests folder install required gems:

> bundle install

To run all tests
> cucumber
