require 'rubygems'
require 'nokogiri' 
require 'open-uri'
PAGE_URL = "http://annuaire-des-mairies.com/95/vaureal.html"

#Tout d'abord, écris une méthode get_the_email_of_a_townhal_from_its_webpage qui, comme son nom l'indique, récupère l'adresse email à partir de l'url d'une mairie, par exemple celle de Vauréal
page = Nokogiri::HTML(open(PAGE_URL))
emailformat = /[@]/
get_the_email_of_a_townhal_from_its_webpage = page.css("p.Style22").select{|i| i.text =~ emailformat}   
get_the_email_of_a_townhal_from_its_webpage.each {|email| puts email}      

#Ensuite, écris une méthode get_all_the_urls_of_val_doise_townhalls qui, comme son nom l'indique, récupère toutes les url de villes du Val d'Oise. C'est recommandé de le faire de cette page web
page2 = Nokogiri::HTML(open("http://annuaire-des-mairies.com/val-d-oise.html"))
get_all_the_urls_of_val_doise_townhalls = page2.css("a.lientxt")
get_all_the_urls_of_val_doise_townhalls.each {|links| puts links["href"]} 

#Tu n'as plus qu'à recoller les méthodes ensemble et à toi la gloire : pour chaque ville de l'annuaire, va sélectionner un email de contact
page3 = Nokogiri::HTML(open("http://annuaire-des-mairies.com/val-d-oise.html"))
get_all_the_urls_of_val_doise_townhalls = page3.css("a.lientxt")
page_URLville = [] 	#Crée un array vide, l'objectif est d'y ranger les adresses mail de toutes les villes
get_all_the_urls_of_val_doise_townhalls.each {|links| page_URLville.push "http://annuaire-des-mairies.com/"+links["href"]} #comment retirer le ./ pour que la bonne adresse apparaissent?
page_URLville.each {|page| 
					page = Nokogiri::HTML(open(page))
					emailformat = /[@]/
					get_the_email_of_a_townhal_from_its_webpage = page.css("p.Style22").select{|i| i.text =~ emailformat}   
					get_the_email_of_a_townhal_from_its_webpage.each {|email| puts email} 
					} 
#Le programme marche et récolte les adresses, le problème, c'est qu'il récupere la ligne entiere sur laquelle apparait le mail de contact, y compris les balises html
