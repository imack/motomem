class DailyMailer < ActionMailer::Base
  default from: "contact@placeling.com"

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
      google_place ={"geometry"=>{"location"=>{"lat"=>49.264316, "lng"=>-123.172865}}, "icon"=>"http://maps.gstatic.com/mapfiles/place_api/icons/generic_business-71.png", "id"=>"227eda8780805995c178f614fbf7aab34090f187", "name"=>"Calhoun's Bakery, Cafe, Catering", "rating"=>3.7, "reference"=>"CoQBfgAAAKlyjSPQjYwmoVqu9_kTCNu16QXqY3sBcFWOwA5lo2ezol1DNN5i-NBbdcQCt8R8WI0ryrxULOMq9pLGoGYyF_dMusbxBfU1EX2UaPssw3ExE7Q4yovtG2ea7UJNy9ry3wVD7oVnP0KT2YcTluwVAkeF3xMYG9X6vqnIKfZWmN0KEhARRZqgJnTY7NHgsIrWbC7xGhTsbvbuGeq6Id_qs2rX5fVzlDkrDg", "types"=>["food", "establishment"], "vicinity"=>"3035 West Broadway, Vancouver"}
      mail = DailyMailer.daily(user.id, fb_place, google_place)
      mail
    end
  end
end
