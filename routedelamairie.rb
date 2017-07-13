require 'rubygems'
require 'nokogiri' 
require 'open-uri'
PAGE_URL = "http://annuaire-des-mairies.com/95/vaureal.html"


page = Nokogiri::HTML(open(PAGE_URL))
emailformat = /[@]/
get_the_email_of_a_townhal_from_its_webpage = page.css("p.Style22").select{|text| text.match emailformat}   
get_the_email_of_a_townhal_from_its_webpage.each {|email| puts "#{email}"}   
