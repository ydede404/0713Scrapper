require 'rubygems'
require 'nokogiri' 
require 'open-uri'
PAGE_URL = "http://annuaire-des-mairies.com/95/vaureal.html"


#Tout d'abord, écris une méthode get_the_email_of_a_townhal_from_its_webpage qui, comme son nom l'indique, récupère l'adresse email à partir de l'url d'une mairie, par exemple celle de Vauréal
def get_the_email_of_a_townhal_from_its_webpage()
	page = Nokogiri::HTML(open(PAGE_URL))
	email = page.css("p.Style22")[11].text  
	puts email
end

get_the_email_of_a_townhal_from_its_webpage()


#Ensuite, écris une méthode get_all_the_urls_of_val_doise_townhalls qui, comme son nom l'indique, récupère toutes les url de villes du Val d'Oise. C'est recommandé de le faire de cette page web
def get_all_the_urls_of_val_doise_townhalls()
	page2 = Nokogiri::HTML(open("http://annuaire-des-mairies.com/val-d-oise.html"))
	adressePage = page2.css("a.lientxt")
	adressePage.each {|links| puts links["href"]} 
end

get_all_the_urls_of_val_doise_townhalls()


#Tu n'as plus qu'à recoller les méthodes ensemble et à toi la gloire : pour chaque ville de l'annuaire, va sélectionner un email de contact
def contact()
	page3 = Nokogiri::HTML(open("http://annuaire-des-mairies.com/val-d-oise.html"))
	get_all_the_urls_of_val_doise_townhalls = page3.css("a.lientxt")
	page_URLville = [] 	#Crée un array vide, l'objectif est d'y ranger les adresses mail de toutes les villes
	get_all_the_urls_of_val_doise_townhalls.each {|links| page_URLville.push "http://annuaire-des-mairies.com/"+links["href"]} #comment retirer le ./ pour que la bonne adresse apparaissent?
	page_URLville.each {|page| 
						page = Nokogiri::HTML(open(page))
						#emailformat = /[@]/
						get_the_email_of_a_townhal_from_its_webpage = page.css("p.Style22")[11].text
						#Faux: get_the_email_of_a_townhal_from_its_webpage = page.css("p.Style22")[11].text #.select{|i| i.text =~ emailformat}   
						puts get_the_email_of_a_townhal_from_its_webpage
						} 
end			

contact()		



