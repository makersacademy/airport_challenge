require 'airport'
<<<<<<< HEAD
require 'weather'
describe Airport do
=======

describe Airport do

  describe '#land' do
    # it 'raises an error when landing and the weather is stormy' do
      # airport = Airport.new
      # message = "Landing not allowed due to stormy weather"
      # expect {subject.land(Plane.new)}.to raise_error message
    # end
    it 'raises an error when airport is full' do
      airport = Airport.new
      expect { airport.land(Plane.new)}.to raise_error "Airport is full"
    end

  end

  # describe '#take_off' do
    # it 'raises an error when taking off and the weather is stormy' do
      # airport = Airport.new
      # message = "Planes won't take off due to stormy weather"
      # expect {subject.take_off(Plane.new)}.to raise_error message
  #  end
  # end
>>>>>>> master

  describe 'initialization' do
    subject = Airport.new
    let(:plane) { Plane.new }
    it 'defaults capacity' do
      Airport::DEFAULT_CAPACITY.times do
      subject.land(plane)
      end
    expect{ subject.land(plane) }.to raise_error 'The airport is full'
    end
  end

  describe '#land' do
    it {is_expected.to respond_to(:land).with(1).argument}

    it 'allows planes to land' do
      plane = double(:plane)
      expect {subject.land(plane).to eq plane}
    end
    it 'raises an error when trying to land in a full airport' do
      plane = double(:plane)
      Airport::DEFAULT_CAPACITY.times {subject.land(plane)}
      expect {subject.land(plane)}.to raise_error "The airport is full"
    end
  end

  describe '#take_off' do
    it {is_expected.to respond_to(:take_off).with(1).argument}

    it 'allows planes to take off' do
      plane = double(:plane)
      expect {subject.take_off(plane).to eq plane}
    end

    it 'raises an error when trying to take off from a empty airport' do
      expect {subject.take_off(double (:plane))}.to raise_error "No planes at the airport"
    end
  end
end
