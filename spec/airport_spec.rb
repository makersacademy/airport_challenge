require 'airport'

describe Airport do

let(:airport) { described_class.new}

  describe '#instruct_takeoff' do
    it 'responds to instruct_takeoff' do
      expect(airport).to respond_to :instruct_takeoff
    end

    it 'instructs a plane to take off, which is then flying' do
      plane = airport.instruct_takeoff
      plane.take_off
      expect(plane).to be_flying
    end
  end

  describe '#instruct_landing' do
    it {is_expected.to respond_to(:instruct_landing).with(1).argument}

    it 'instructs a plane to land' do
      plane = Plane.new
      expect(airport.instruct_landing(plane)).to eq plane
    end

    it 'instructs a plane to land, which is then no longer flying' do
      plane = Plane.new
      airport.instruct_landing(plane)
      plane.land
      expect(plane).not_to be_flying
    end

    it 'instructs a plane to land and remembers which plane has landed' do
      plane = Plane.new
      airport.instruct_landing(plane)
      expect(airport.plane).to eq plane
    end

    it 'raises an error when airport gate is full' do
      plane = Plane.new
      airport.instruct_landing(plane)
      expect { airport.instruct_landing(plane) }.to raise_error 'Airport already full'
    end

  end

end