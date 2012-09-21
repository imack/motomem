class DailyMailer < ActionMailer::Base
  default from: "facebookhackathon@gmail.com"

  include Resque::Mailer

  def daily(user_id, facebook_place, google_place)

    @user = User.find( user_id )
    @facebook_place = facebook_place
    @google_place = google_place


    mail(:to => @user.email, :subject => "How was your visit to #{facebook_place["name"]}?") do |format|
      format.html
    end
  end



  class Preview < MailView

    def daily
      user = User.first
      fb_place = {"id"=>"178044952237224", "name"=>"Calhouns", "location"=>{"city"=>"Vancouver", "state"=>"BC", "country"=>"Canada", "latitude"=>49.264249085313, "longitude"=>-123.17269132736}}
      google_place ={"address_components"=>[{"long_name"=>"3035", "short_name"=>"3035", "types"=>["street_number"]}, {"long_name"=>"West Broadway", "short_name"=>"West Broadway", "types"=>["route"]}, {"long_name"=>"Vancouver", "short_name"=>"Vancouver", "types"=>["locality", "political"]}, {"long_name"=>"Greater Vancouver Regional District", "short_name"=>"Greater Vancouver Regional District", "types"=>["administrative_area_level_2", "political"]}, {"long_name"=>"BC", "short_name"=>"BC", "types"=>["administrative_area_level_1", "political"]}, {"long_name"=>"CA", "short_name"=>"CA", "types"=>["country", "political"]}, {"long_name"=>"V6K 2G9", "short_name"=>"V6K 2G9", "types"=>["postal_code"]}], "formatted_address"=>"3035 West Broadway, Vancouver, BC, Canada", "formatted_phone_number"=>"(604) 737-7062", "geometry"=>{"location"=>{"lat"=>49.264316, "lng"=>-123.172865}}, "icon"=>"http://maps.gstatic.com/mapfiles/place_api/icons/generic_business-71.png", "id"=>"227eda8780805995c178f614fbf7aab34090f187", "international_phone_number"=>"+1 604-737-7062", "name"=>"Calhoun's Bakery, Cafe, Catering", "rating"=>3.7, "reference"=>"CoQBfgAAAIW_lZM0iEyGoziAThHLxaf5iItdJMN5E1ma-IfxTrvy-uHCKQDvI2P9UGRsq78mGwHmiYNpvPdT22UBB1suxiuUIqRPNTMThRX5FfWMwOy3mgYHtyg-a8yC0goNZljjjzmVwYxLw56o2EVpKLez1G-gXAlaVpbEtmQdXeMPU5ZREhCCGLN8-0YHxaiUlWTjZYJrGhTDXe4zTlp8h6PfQJRfzWOJQ2Pjug", "reviews"=>[{"aspects"=>[{"rating"=>3, "type"=>"overall"}], "author_name"=>"Graham Knights", "author_url"=>"https://plus.google.com/112589057354943846487", "text"=>"Great coffee, food, treats, and funky atmosphere!", "time"=>1331435304}, {"aspects"=>[{"rating"=>1, "type"=>"overall"}], "author_name"=>"Michael Greenwell", "author_url"=>"https://plus.google.com/115588034260398177501", "text"=>"I wasn&#39;t really a fan of their Chai Latte, the large was quit big but quite bland, I would have really appreciated a spicier preparation.", "time"=>1324196725}, {"aspects"=>[{"rating"=>0, "type"=>"overall"}], "author_name"=>"A Google User", "text"=>"MAJOR ANNOYANCE: If you are using their wifi, you will be disconnected after about 2 hours. This is deliberate. When you connect to a wireless network, your laptop is identified on the network by its own unique identifier code (something called a MAC address). With this identifier, the network operator is able to see which computers are connected, and for how long they&#39;ve been connected. If you&#39;ve been there too long, you&#39;ll be disconnected (in Windows it will actually just say &quot;no internet access&quot;). Your average person will just think there&#39;s something wrong with his/her laptop. I can sort of see why they do this, but at the same time it&#39;s pretty underhanded. Calhouns needs to remember why people come there in the first place. It&#39;s an off-campus, busy, study spot. No one is coming here for the food (some things are good, some aren&#39;t, but most if not all are overpriced), but we buy it anyways because it&#39;s convenient and we&#39;re occupying their space.", "time"=>1328043986}, {"aspects"=>[{"rating"=>2, "type"=>"overall"}], "author_name"=>"A Google User", "text"=>"I applaud your Going Green policy. Great food too!! If I have a chance for catering, will use you guys as I have heard great things. Only comment is a suggestion - consider using hybrid vehicles for the future.", "time"=>1215310400}, {"aspects"=>[{"rating"=>3, "type"=>"overall"}], "author_name"=>"A Google User", "text"=>"I had the chance to try Calhoun&#39;s Catering at an event. The food was fresh, wholesome and generous. They are going green too. A+++", "time"=>1213756798}], "types"=>["food", "establishment"], "url"=>"https://plus.google.com/106721328754484656110/about?hl=en-US", "utc_offset"=>-420, "vicinity"=>"3035 West Broadway, Vancouver", "website"=>"http://www.calhouns.bc.ca/"}
      mail = DailyMailer.daily(user.id, fb_place, google_place)
      mail
    end
  end
end
