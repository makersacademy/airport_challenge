require 'weather' 

describe Weather do

  # describe "weather" do 
  #   it "returns the weather" do
  #     expect( subject.send :weather ).to eq :good
  #   end
  # end
 
  # describe "set_weather" do
  #   it "randomly choose a weather" do
  #     expect([:bad, :good]).to include subject.weather
  #   end
  # end

  describe "to_sym" do
    it "returns a string" do
      expect( subject.to_sym ).to be_a Symbol
    end
  end

end
