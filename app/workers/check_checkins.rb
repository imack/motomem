class CheckCheckins


  @queue = :service_queue

  def self.perform(user_id)
    user = User.find( user_id )

    checkins = user.facebook.get_object("me/locations")

    for checkin in checkins
      if DateTime.iso8601(checkin['created_time']) < 1.days.ago
        return
      end

      if user.checked_places.include? checkin['place']['id']
        next
      end

      @facebook_place = user.facebook.get_object( checkin['place']['id'] )
      puts @facebook_place


      @google_place = getGooglePlace( @facebook_place )

      DailyMailer.daily( user.id, @facebook_place, @google_place).deliver!

      user.checked_places << checkin['place']['id']
      user.save!

    end
  end
end