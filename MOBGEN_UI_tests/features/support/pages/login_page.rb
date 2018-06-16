class LoginPage
  include PageObject

  page_url('https://halo-stage.mobgen.com/')
  text_field(:username, name: 'email')
  text_field(:password, name: 'password')
  button(:login, type: 'submit')

  def login_with(username, password)
    self.username = username
    self.password = password
    login
  end

end