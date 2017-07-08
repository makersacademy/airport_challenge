require 'plane'

describe Plane do
  let(:plane) { described_class.new }
  let(:airport) { double(:airport, :name => 'London Heathrow') }

  it { is_expected.to respond_to(:land).with(1).arguments }
  it { is_expected.to respond_to(:status) }

  describe '#land' do

    it 'can land at an airport' do
      plane.land(airport)
      expect(plane.status).to eq "Plane is at airport #{airport.name}"
    end

    it 'cannot land unless flying' do
      plane = Plane.new(double(:airport, :name => 'London Heathrow'))
      expect { plane.land(airport) }.to raise_error "Cannot land a plane that is not flying"
    end
  end

  describe '#takeoff' do

    it 'can takeoff from an airport' do
      plane = Plane.new(double(:airport, :name => 'London Heathrow'))
      plane.takeoff(airport)
      expect(plane.status).to eq "Plane is flying"
    end

    it 'cannot takeoff unless at an airport' do
      expect { plane.takeoff(airport) }.to raise_error "Cannot takeoff a plane that is already flying"
    end

  end

  describe '#new' do

    it 'responds to 1 argument' do
      expect(Plane).to respond_to(:new).with(1).argument
    end

    it 'is flying unless an airport is specified' do
      expect(plane.status).to eq "Plane is flying"
    end

  end
end
