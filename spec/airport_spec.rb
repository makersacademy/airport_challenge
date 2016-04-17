require 'airport'
require 'weather'
describe Airport do

  let(:plane) { Plane.new }

  describe 'initialization' do
    subject = Airport.new
    it 'defaults capacity' do
      Airport::DEFAULT_CAPACITY.times { subject.land(plane) }
    expect{ subject.land(plane) }.to raise_error 'The airport is full'
    end
  end

  describe '#land' do
    it {is_expected.to respond_to(:land).with(1).argument}

    it 'allows planes to land' do
      expect {subject.land(plane).to eq plane}
    end
    it 'raises an error when trying to land in a full airport' do
      airport = Airport.new
      Airport::DEFAULT_CAPACITY.times {subject.land(plane)}
      expect {subject.land(plane)}.to raise_error "The airport is full"
    end
  end

  describe '#take_off' do
    it {is_expected.to respond_to(:take_off).with(1).argument}

    it 'allows planes to take off' do
      expect {subject.take_off(plane).to eq plane}
    end
    it 'raises an error when trying to take off from an empty airport' do
      expect {subject.take_off(plane)}.to raise_error "No planes at the airport"
    end
  end
end
