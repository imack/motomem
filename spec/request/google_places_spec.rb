require 'spec_helper'
require 'google_places'

describe GooglePlaces do
  before(:each) do
    @gp = GooglePlaces.new
  end

  describe "it should normalize " do

    it "a unique place like district 319" do
      #hard coded values from facebook
      nearby = @gp.find_nearby(49.28246885, -123.1029883, "District 319")
      nearby.first.id.should == "73df1b590b2f838f7b1293e1862861aac10fc49f"
    end

    it "a generic place like a starbucks" do
      #hard coded values from facebook
      nearby = @gp.find_nearby(49.284265140914, -123.10865453678, "Starbucks, Gastown")
      nearby.first.id.should == "f7a40a97455b07cac4bb25f6b899ab1efe2665a2"
    end

    it "awkward places like YVR" do
      #hard coded values from facebook
      nearby = @gp.find_nearby(49.19531201084, -123.17837396613, "Vancouver International Airport")
      # google places has lat/lng as 49.1957, -123.1778
      nearby.first.id.should == "f7a40a97455b07cac4bb25f6b899ab1efe2665a2"
    end

    it "should work through the application helper class" do
      facebook_place ={"id"=>"178044952237224", "name"=>"Calhouns", "location"=>{"city"=>"Vancouver", "state"=>"BC", "country"=>"Canada", "latitude"=>49.264249085313, "longitude"=>-123.17269132736}}
      place = ApplicationHelper.getGooglePlace( facebook_place )
      place.id.should == "227eda8780805995c178f614fbf7aab34090f187"
    end


  end

end