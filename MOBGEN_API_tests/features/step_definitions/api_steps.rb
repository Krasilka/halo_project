
Given /^I request authorization token/ do
  @access_token = APIMethods.access_token
end

Given /^I request the list of modules on page/ do
  @response = APIMethods.module_list_response(1, 10, @access_token)
end

When /^I send request to create module$/ do
  @response = APIMethods.create_new_module(@access_token)
  @name = JSON.parse(@response)['name']
  @module_id = JSON.parse(@response)['id']
end

When /^I send request to create duplicated module/ do
  @response = APIMethods.create_duplicated_module(name=@name, @access_token)
end

When /^I send request to delete exact module/ do
  APIMethods.delete_module(@module_id, @access_token)
end

Then /^I get (\d+) response code$/ do |code|
  expect(@response.code).to eq code
end

Then /^I get non\-empty body$/ do
  expect(JSON.parse(@response.body)).not_to eq '{}'
end

Then /^response should include exact module name/ do
  expect(@response.body).to include @name
end

Then /^response should not include exact module name$/ do
  expect(@response.body).not_to include @name
end






