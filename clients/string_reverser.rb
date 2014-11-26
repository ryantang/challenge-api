require 'net/http'
require 'json'
require 'uri'

class MagicString
  def self.get
    uri = URI('http://challenge-api.ketchup.cf-app.com/getstring')

    get_response = Net::HTTP.get_response(uri)
    word = get_response.body
    puts "API server response: #{word}\n\n"
    word
  end

  def self.post(answer)
    uri = URI('http://challenge-api.ketchup.cf-app.com/validatestring')

    http = Net::HTTP.new(uri.host, uri.port)
    json_headers = {"Content-Type" => "application/json",
                    "Accept" => "application/json"}
    json_body = {'string' => answer}.to_json

    post_response = http.post(uri.path, json_body, json_headers)
    puts "API server response: #{post_response.body}\n\n"
  end
end

puts 'Getting magic string from "/getstring"'
word = MagicString.get
answer = word.reverse
sleep 2

puts "posting to /validatestring wrong answer 'foo'"
MagicString.post('foo')
sleep 2

puts "posting to /validatestring correct answer #{answer}"
MagicString.post(answer)






