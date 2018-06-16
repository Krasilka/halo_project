class APIMethods
  include RestClient

  DATA = {
      'host' =>'https://halo-stage.mobgen.com',
      'content' => 'https://halo-stage.mobgen.com/api/generalcontent/module/',
      'auth' => 'https://halo-stage.mobgen.com/api/oauth/token?_admin=/'
  }

  def self.module_list_response(page, limit, token)
    RestClient.get(DATA['content'],
                   {'Authorization' => "Bearer #{token}",
                    'Content-Type' => 'application/json'})
  end

  def self.create_new_module(name = FFaker::Name.name, token)
    puts name
    body = {
        name: name,
        isSingle: true
    }.to_json

    RestClient.post(DATA['content'],
                    body,
                    {'Authorization' => "Bearer #{token}",
                     'Content-Type' => 'application/json'})
  end

  def self.create_duplicated_module(name, token)
    begin
      self.create_new_module(name, token)
    rescue => e
      e.response
    end
  end

  def self.delete_module(module_id, token)
    RestClient.delete(DATA['content'] + "#{module_id}",
                      {'Authorization' => "Bearer #{token}",
                       'Content-Type' => 'application/json'})
  end

  def self.access_token
    user = {email: 'mobgen.qa.assignment+1@gmail.com', password: 'H4L0$Test_1'}

    body = {
        grant_type: 'password',
        username: user[:email],
        password: user[:password],
        gdpr_consent: 'yes'
    }.to_json

    response = RestClient.post(DATA['auth'],
                               body,
                               {'Authorization' => 'Basic Base64(username:password)',
                                'Content-Type' => 'application/json'})

    JSON.parse(response)['access_token']
  end
end