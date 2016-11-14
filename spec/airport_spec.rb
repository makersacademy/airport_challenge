require 'airport.rb'

describe Airport do

  let(:weather) { double("weather", :check => "Sunny") }
  let(:plane) { double("plane", :land => nil, :take_off => nil, :landed= => nil, :landed => false) }

  it 'Checks that an airport exists' do
    expect(subject).to be_kind_of(Airport)
  end

  it 'Checks that a plane can land' do
    expect(subject.land(plane,(weather).check)).to eq subject.planes
  end

  it 'Checks that an airport is able to list its current planes' do
    plane_1 = double(:plane,:land => nil, :landed= => nil, :landed => false)
    plane_2 = double(:plane,:land => nil, :landed= => nil, :landed => false)
    subject.land(plane_1, (weather).check)
    subject.land(plane_2, (weather).check)
    expect(subject.planes).to eq [plane_1 , plane_2]
  end

  it 'Checks that a plane can take off from an airport if the weather is Sunny' do
    subject.land(plane, (weather).check)
    expect(subject.take_off(plane,(weather).check)).to eq plane
  end

  it 'Checks that a plane is not in airport once taken off' do
    subject.land(plane, (weather).check)
    subject.take_off(plane, (weather).check)
    expect(subject.planes).to be_empty
  end

  it 'Checks that a plane can take off from an airport if the weather is bad' do
    subject.land(plane, (weather).check)
    weather = double("weather", :check => "Stormy")
    message = "Cannot take off in stormy weather"
    expect{subject.take_off(plane, (weather).check)}.to raise_error message
  end

  it 'Checks that a plane cannot land at an airport if the weather is bad' do
    weather = double("weather", :check => "Stormy")
    message = "Cannot land planes if the weather is stormy"
    expect{subject.land(plane, (weather).check)}.to raise_error message
  end

  it 'Checks that only 12 planes(the "DEFAULT_CAPACITY") can land at an airport' do
    subject.capacity.times{subject.land(double(:plane,:land => nil, :landed= => nil, :landed => false), (weather).check)}
    expect(subject.planes.count).to eq subject.capacity
  end

  it 'Checks that planes cannot land at an airport when full' do
    subject.capacity.times{subject.land(double(:plane,:land => nil, :landed= => nil, :landed => false), (weather).check)}
    message =  "Sorry, Airport is full, please fly to another"
    expect{subject.land(plane, (weather).check)}.to raise_error message
  end

  it 'Checks for the capacity of the airport to equal 24' do
    airport2 = Airport.new(24)
    expect(airport2.capacity).to eq 24
  end

  context 'Edgecase Tests' do
    subject = Airport.new

    let(:weather) { double("weather", :check => "Sunny") }
    let(:plane) { double("plane", :landed= => nil, :landed => true) }

    it 'Checks that the same plane cannot land twice' do
      message =  "This plane has already landed"
      expect{subject.land(plane, (weather).check)}.to raise_error message
    end

    it 'Checks that the same plane cannot take off twice' do
      message = "That plane is not in this airport"
      expect{subject.take_off(plane, (weather).check)}.to raise_error message
    end

  end

end
