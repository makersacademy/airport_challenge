require 'airport'

describe Airport do
  it 'instructs plane to land' do
    plane = Plane.new
    expect(subject.plane_land(plane)).to eq(true)
  end 
  
  it 'confirms that a plane is no longer in airport once it has taken off' do
    plane = Plane.new
    subject.plane_land(plane)
    expect(subject.plane_take_off).to eq(plane)
  end 

  it 'raises an error when airport is full' do 
    2.times { subject.plane_land Plane.new }
    expect { subject.plane_land Plane.new }.to raise_error 'Airport is full'
  end 

  #needs to be fixed
  it "checks random weather generator" do 
    weather = Weather.new
    airport = Airport.new
    airport.forecast
    expect (weather.todays_weather).to receive(:rand).and_return(["stormy"])
    # expect { subject.weather_check "stormy" }.to eq("No take off")
    end 

  # it "prevents takeoff if weather is stormy" do 
  #   airport = Airport.new
  #   weather = airport.stormy?
  #   allow(airport.plane_take_off).to receive(:stormy?).and_return(true)
  #   expect{subject.plane_take_off}.to raise_error 'No take off: stormy weather'
  # end

  #tried a test using Test Doubles and Stubs
  # it "testing random weather generator" do 
  #   weather = Weather.new
  #   stormy_weather = double("stormy").as_null_object
  #   expect(stormy_weather).not_to receive(stormy)
  #   stormy_weather.stormy
  #   # allow(subject.plane_take_off).to receive(:stormy_weather)
  #   #expect{subject.plane_take_off}.to raise_error 'No take off: stormy weather'
  # end

  
end 


describe 'initialization' do 
  it 'tests that default airport capacity works' do
    airport = Airport.new
    expect(airport.capacity).to eq Airport::DEFAULT_CAPACITY
  end 

  it 'tests that the default airport capacity can be overridden' do 
    airport = Airport.new(5)
    5.times { airport.plane_land Plane.new}
    expect{ airport.plane_land Plane.new }.to raise_error 'Airport is full'
  end
end 




