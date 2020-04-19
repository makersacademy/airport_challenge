# understading airport object
require 'airport'
describe Airport do
  subject(:airport) { described_class.new }
  let(:plane) { Plane.new }

  it 'initialize' do
    expect(airport).to respond_to :plane
  end

  describe '#land' do
    it { is_expected.to respond_to(:land).with(1).argument }

    it 'is instruct a plane to land' do
      airport.land(plane)
      expect(airport.plane).to be plane
    end

    it 'raise an error when airport is full' do
      airport.land(plane)
      plane1 = Plane.new
      expect { airport.land(plane1) } .to raise_error('Airport is full now')
    end
  end

  describe '#takeoff' do
    it { is_expected.to respond_to(:takeoff) }

    it 'confirm that plane which is taken off flyies' do
      airport.land(plane)
      expect(airport.takeoff).to be_flying
    end
  end
end
