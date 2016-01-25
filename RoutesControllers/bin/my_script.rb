require 'addressable/uri'
require 'rest-client'

def create_user
  url = Addressable::URI.new(
    scheme: 'http',
    host: 'localhost',
    port: 3000,
    path: '/users.json'
  ).to_s


  # puts RestClient.get(url)
  #
  begin
    puts RestClient.post(
      url,
      { user: { name: "Donald Trump", email: 'president@gmail.gov' } }
    )
  rescue
    puts 'Rescued'
  end

  # puts RestClient.delete(url)
end

create_user
