require 'airport.rb'
require 'weather.rb'

describe Airport do

  let(:weather) { double("weather", :check => "Sunny") }
  let(:plane) { double("plane", :landed= => nil, :landed => false) }

  it 'expects an airport to exist' do
    expect(subject).to equal subject
  end

  it 'expects an airport to accept a plane to land' do
    expect(subject.land(plane,weather)).to eq subject.planes
  end

  it 'expects an airport to be able to list its current planes' do
    plane_1 = double(:plane, :landed= => nil, :landed => false)
    plane_2 = double(:plane, :landed= => nil, :landed => false)
    subject.land(plane_1,weather)
    subject.land(plane_2,weather)
    expect(subject.planes).to eq [plane_1 , plane_2]
  end

  it 'expects a plane to take off from an airport if the weather is Sunny' do
    subject.land(plane,weather)
    expect(subject.take_off(plane,weather)).to eq plane
  end

  it 'expects an airport not to contain a plane in it once taken off' do
    subject.land(plane,weather)
    subject.take_off(plane,weather.check)
    expect(subject.planes).to be_empty
  end

  it 'expects the plane not to be allowed to take off if the weather is bad' do
    weather = double("weather", :check => "Stormy")
    subject.land(plane,weather)
    weather = weather.check
    expect{subject.take_off(plane, weather)}.to raise_error("Cannot take off in stormy weather")
  end

  it 'expects an airport not to accept a plane to land if the weather is bad' do
    weather = double("weather", :check => "Stormy")
    weather = weather.check
    expect{subject.land(plane,weather)}.to raise_error "Cannot land planes if the weather if stormy"
  end

  it 'tests for the capacity of the airport to equal 12' do
    expect(subject.capacity).to eq 12
  end

  it "tests that 12 planes can land at the airport" do
    12.times{subject.land(double(:plane, :landed= => nil, :landed => false),weather)}
    expect(subject.planes.count).to eq 12
  end

  it 'tests that no more that 12 planes can land at an airport' do

    12.times{subject.land(double(:plane, :landed= => nil, :landed => false),weather)}
    expect{subject.land(plane,weather)}.to raise_error "Sorry, Airport is full, please fly to another"
  end

  it 'test that the airport capacity can be changed if required' do
    airport2 = Airport.new(24)
    expect(airport2.capacity).to eq 24
  end

end

describe 'Edgecase Tests' do
  let(:weather) { double("weather", :check => "Sunny") }
  let(:plane) { double("plane", :landed= => nil, :landed => true) }

  it 'expects the airport to not let the same plane land twice' do
    subject = Airport.new
    expect{subject.land(plane, weather)}.to raise_error "This plane has already landed"
  end

  it 'expects the airport to not let the same plane take off twice' do
    subject = Airport.new
    expect{subject.take_off(plane, weather)}.to raise_error "That plane is not in this airport"
  end

end
