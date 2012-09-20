class CheckCheckins
  @queue = :service_queue

  def self.perform(user_id)
    user = User.find( user_id )


  end

end