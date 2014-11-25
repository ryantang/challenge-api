require 'sinatra'
require 'json'

get '/getstring' do
  'zedonk'
end

post "/validatestring" do
  request.body.rewind # in case someone already read it
  data = JSON.parse request.body.read
  reversed_string = data['string']
  if reversed_string == 'knodez'
    status 200
    body "Excellent #{reversed_string} is the correct answer!\n"
  else
    status 400
    body "Sorry, #{reversed_string} is incorrect\n"
  end
end
