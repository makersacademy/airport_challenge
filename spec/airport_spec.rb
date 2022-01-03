require "airport"

describe Airport do
  it { is_expected.to respond_to :land_plane }
  it { is_expected.to respond_to :take_off }

  # it "expects planes to reduce by one when a plane takes off"

  it "allows airport capacity to be changed" do 
    airport = Airport.new(30)
    expect(airport.capacity).to eq 30
  end 

  it "raises an error when the airport is full" do 
    subject.capacity.times { subject.land_plane(:plane) }
    expect { subject.land_plane(:plane) }.to raise_error "You cannot land"
  end 

    it "raises an error when the weather is stormy to stop take off" do 
      weather = Weather.new 
      weather.todays_weather
        expect { weather.stormy? }.to raise_error "You cannot take off"
    end 
end 
  
