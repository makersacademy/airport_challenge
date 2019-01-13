require 'weather.rb'

RSpec.describe Weather do
  it "check that it responds to weather" do
    is_expected.to respond_to(:weather)
  end
  
  it "check that the class rand works ok" do
    option1 = Weather.new
    allow(option1).to receive(:rand).and_return(7)

    expect(option1.weather).to eq false
  end
end
