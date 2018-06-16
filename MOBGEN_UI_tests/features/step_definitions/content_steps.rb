And /^I create new module$/ do
  @module = on(ContentPage).create_new_module
end

And /^I create module with name "([^"]*)"$/ do |name|
  on(ContentPage).create_new_module(name)
end

When /^I search for/ do
  on(ContentPage).search_for(@module)
end

Then /^I should( not)? see module in the list$/ do |opt|
  # usually tables are parsed by rows and columns but this
  # is an easy and fast way to find created module by text
  # used in div, we can use it as we use it because we
  # create unique names for helpers
    on(ContentPage) do |p|
      sleep 2
      opt ? (p.div.text.should_not include @module) : (p.div.text.should include @module)
    end
  end

Then /^I should see error message "([^"]*)"$/ do |error|
  sleep 2
  expect(on(ContentPage).text).to include error
end

And /^I delete / do
  on(ContentPage).delete_module @module
  on(ContentPage).confirm_deletion
end