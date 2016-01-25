require 'Airport'
require 'Weather'

describe Airport do 

  subject(:airport) { described_class.new }
  let(:plane) { double :plane }
  let(:weather) { double :weather }
  before do
    allow(plane).to receive(:takes_off)
    allow(plane).to receive(:land)
  end 

  describe '#landing' do

    # it 'tells a plane to land' do
    #   expect(airport).to respond_to(:land)
    # end 
    # => Test irrelevant due to test below

    it 'confirms plane has landed' do
      allow(weather).to receive(:stormy?).and_return(:false)
      expect{airport.land(plane)}.to change{airport.landed_planes.length}.by(1)
    end
  end 

  describe '#take off' do

    # it 'tells a plane to take off' do
    #   expect(airport).to respond_to(:take_off)
    # end 
     # => Test irrelevant due to being tested in test below

    it 'confirms a plane has taken off' do
      allow(weather).to receive(:stormy?).and_return(:false)
      expect{airport.take_off(plane)}.to change{airport.flying_planes.length}.by(1)
    end 
  end 

  context 'bad weather' do

    # before do (add this to stub out random weather)

    it 'prevents take off when weather is stormy' do
      allow(weather).to receive(:stormy?).and_return(:true)
      expect{airport.take_off(plane)}.to raise_error 'No take off due to stormy weather'
    end

    it 'prevents landing when weather is stormy' do
      allow(weather).to receive(:stormy?).and_return(:true)
      expect {airport.land(plane)}.to raise_error 'No landing due to stormy weather'
    end 
  end 

  describe 'maximum_capacity' do 

    it'has a max capacity' do
      # @maximum_capacity = 10 => not needed as already set
      expect(airport.capacity).to eq(Airport::MAXIMUM_CAPACITY)
    end
  end 
end


