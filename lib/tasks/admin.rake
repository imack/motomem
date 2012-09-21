
namespace "motomem" do


  desc "enqueues all people in the system"
  task :daily => :environment do
    User.all.each do |user|
      Resque.enqueue(CheckCheckins, user.id)
    end
  end
end

