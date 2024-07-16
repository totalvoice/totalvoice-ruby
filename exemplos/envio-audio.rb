require_relative '../lib/totalvoice-ruby.rb'
include TotalVoice

@client = TotalVoice::API.new("seu-token")
puts @client.audio.enviar("+5510999999999", "http://seuaudio.com/audio.mp3")
