require 'rubygems'
require 'nokogiri' 
require 'open-uri'
PAGE_URL = "https://coinmarketcap.com/all/views/all/"

=begin
	
Lehman Brothers, impressionné par tes algorithmes de trading de la dernière fois, veut faire encore appel à toi. Leur Chief Digital Officer, très hype, a entendu parler au JT de TF1 d'un "truc révolutionnaire qui s'appelle je crois le bloque chienne" et voudrait du coup cnnaître le cours des cryptomonnaies.

Va sur CoinMarketCap et fait un programme qui va récupérer le cours de toutes les cryptomonnaies, et les enregistrer bien proprement dans une array de hashs.
	
=end

page = Nokogiri::HTML(open(PAGE_URL))

def traderdelobscur
valeurCryptomonnaies = page.css("a.price").select {|i| puts i["data-usd"]}
nomCryptomonnaies = page.css("td.no-wrap.currency-name  > a").text
puts nomCryptomonnaies
end


