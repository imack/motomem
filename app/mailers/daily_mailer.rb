class DailyMailer < ActionMailer::Base
  default from: "contact@placeling.com"

  include Resque::Mailer

  def daily(user_id, facebook_place, google_place)

    user = User.find( user_id )
    @facebook_place = facebook_place
    @google_place = google_place


    mail(:to => user.email, :subject => "How was your visit to #{facebook_place["name"]}?") do |format|
      format.html
    end
  end

end
