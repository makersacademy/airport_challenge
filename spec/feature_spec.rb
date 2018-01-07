require_relative "../lib/airport.rb"

describe "airport takes planes" do 
  let(:weather) { double("weather") }
  
  def i_land_seven_planes_in_good_weather  	
    7.times { @sandown.land(Plane.new) }
    expect(@sandown.hanger.length).to eq 7
  end

  def three_take_off_in_good_weather
    3.times { @sandown.take_off(@sandown.hanger[0]) }
    expect(@sandown.hanger.length).to eq 4
  end

  def one_tries_to_take_off_in_bad_weather
    allow(weather).to receive(:forecast).and_return("stormy")
    plane = @sandown.hanger[0]
    expect { @sandown.take_off(plane, weather.forecast) }.to raise_error("Weather too bad")
  end

  def one_tries_to_land_in_bad_weather
    allow(weather).to receive(:forecast).and_return("stormy")
    expect { @sandown.land(Plane.new, weather.forecast) }.to raise_error("Weather too bad")
  end

  def the_airport_should_have_4_planes 
    expect(@sandown.hanger.length).to eq 4
  end

  it "four planes should be left in the airport" do
    @sandown = Airport.new()
    i_land_seven_planes_in_good_weather   # +7 planes   (7)
    three_take_off_in_good_weather        # -3 planes   (4)
    one_tries_to_take_off_in_bad_weather # -0 planes (4)
    one_tries_to_land_in_bad_weather # -0 planes (4)
    the_airport_should_have_4_planes 
  end

end
