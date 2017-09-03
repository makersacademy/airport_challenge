require 'airport'
require 'plane'
require 'weather'

describe Airport do

  let(:airport) { Airport.new }
  let(:plane) { double :plane }
  let(:weather) { double :weather}
  #let(:weather) {double :weather}

  it 'creates new airports' do
    expect(:airport).to eq(:airport)
  end

  it 'accepts landed planes' do
    subject.land(:plane)
    expect(subject.landed).to be(true)
  end
=begin
  it 'lets planes take-off' do
    subject.land(:plane)
    subject.depart(:plane)
    expect(subject.landed).to be(false)
  end
=end


 describe '#initialize' do
  it 'initializes a planes array when airport is instantiated' do
    expect(airport.planes).to be_an_instance_of(Array)
  end

  it 'initializes the plane to be landed to be nil upon instantiation' do
    expect(airport.landed).to be nil
  end

  it 'instantiates a new weather object upon initialization' do
    weather = airport.weather
    expect(airport.weather).to eq weather
  end
end

 describe '#land' do
   it 'adds a plane to the planes array when landed' do
    subject.land(:plane)
    expect(subject.planes).to eq [:plane]
  end

  it 'will not land a plane that is already landed' do

    subject.land(:plane)
    expect {subject.land(:plane)}.to raise_error("You can't land this plane again!")
  end
end

  describe '#depart' do
=begin
  it 'will not allow a plane to take off when it is stormy' do
   weather = Weather.new
   allow(weather).to receive(:stormy?).and_return true
   expect{subject.depart(plane)}.to raise_error("The plane can't set off because it is stormy")
   end
end
=end
end

  describe '#full' do
    it 'will raise an error when the airport is too full' do
    20.times do
    plane = Plane.new
    subject.land(plane)
    end
    expect(subject.full?).to eq(true)
    end
  end
end
