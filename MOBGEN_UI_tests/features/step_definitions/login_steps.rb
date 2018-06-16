Given /^I am logged in/ do
  visit(LoginPage).login_with('mobgen.qa.assignment+1@gmail.com', 'H4L0$Test_1')
end