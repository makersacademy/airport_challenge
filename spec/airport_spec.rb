require 'airport'

describe Airport do

let(:airport) { described_class.new}

  describe 'initialization' do
    it 'sets defualt capacity if no argument passed' do
      50.times {airport.instruct_landing(Plane.new)}
      expect{airport.instruct_landing(Plane.new)}.to raise_error 'Airport full'
    end
    it 'sets capacity to argument passed' do
      airport1 = Airport.new(30)
      30.times {airport1.instruct_landing(Plane.new)}
      expect{airport1.instruct_landing(Plane.new)}.to raise_error 'Airport full'
    end
  end

  describe '#instruct_takeoff' do
    it 'responds to instruct_takeoff' do
      expect(airport).to respond_to :instruct_takeoff
    end

    it 'instructs a plane to take off, which is then flying' do
      airport.instruct_landing(Plane.new)
      plane = airport.instruct_takeoff
      plane.take_off
      expect(plane).to be_flying
    end

    it 'raises an error when there are no planes to take off' do
      expect { airport.instruct_takeoff }.to raise_error 'No planes in airport'
    end
  end

  describe '#instruct_landing' do
    it {is_expected.to respond_to(:instruct_landing).with(1).argument}

    it 'instructs a plane to land' do
      plane = Plane.new
      expect(airport.instruct_landing(plane)).to include plane
    end

    it 'instructs a plane to land, which is then no longer flying' do
      plane = Plane.new
      airport.instruct_landing(plane)
      plane.land
      expect(plane).not_to be_flying
    end

    # made attr_reader :planes private so can no longer test airport.planes
    #it 'instructs a plane to land and remembers which plane has landed' do
      #plane = Plane.new
      #airport.instruct_landing(plane)
      #expect(airport.planes).to include plane
    #end

    it 'raises an error when airport capacity is full' do
      plane = Plane.new
      airport.capacity.times {airport.instruct_landing(plane)}
      expect { airport.instruct_landing(plane) }.to raise_error 'Airport full'
    end
  end

  it 'has default capacity (if no capacity set at initialization' do
      expect(airport.capacity).to eq Airport::DEFAULT_CAPACITY
    end

   #optional
  it 'changes capacity of airport' do
    airport.capacity = 52
    52.times {airport.instruct_landing(Plane.new)}
    expect{airport.instruct_landing(Plane.new)}.to raise_error 'Airport full'
  end

end