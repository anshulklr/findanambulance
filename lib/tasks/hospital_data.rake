desc "Fetch Hospital Data"
task :fetch_hospital => :environment do
	require 'nokogiri'
    require 'open-uri'
    
    for u in 1..40
	url = "http://www.indiacom.com/yellow-pages/hospitals/bangalore/?page=#{u}"

	doc = Nokogiri::HTML(open(url))
	

		doc.css(".Info_listing .MoreInfo a").each do |x|
  			a = x[:href]
  		puts "www.indiacom.com"+"#{a}"
  			y="www.indiacom.com#{a}"
  		b=Hospitaldata.new({:url => y})
  		b.save
 		end 
	end
end
