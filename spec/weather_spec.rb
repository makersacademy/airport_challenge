require "weather"
describe Weather do

  describe ".new" do
    it "should be an instance of the Weather class" do
      expect(Weather.new).to be_an_instance_of Weather
    end
    it "should have an attribute called weather that is either 'Sunny' or 'Stormy'" do
      expect(subject).to have_attributes(:weather => "Sunny").or have_attributes(:weather => "Stormy")
    end
  end

end
