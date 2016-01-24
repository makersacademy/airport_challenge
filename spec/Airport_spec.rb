require 'Airport'
require 'Weather'

describe Airport do 

  subject(:airport) { described_class.new }
  let(:plane) { double :plane }
  let(:weather) { double :weather }


  describe '#landing' do

    it 'tells a plane to land' do
      expect(airport).to respond_to(:land)
    end

    it 'confirms plane has landed' do
      expect{airport.land(plane)}.to change{airport.landed_planes.length}.by(1)
    end
  end 

  describe '#take off' do

    it 'tells a plane to take off' do
      expect(airport).to respond_to(:take_off)
    end 

    it 'confirms a plane has taken off' do
      allow(weather).to receive(:sunny?)
      expect{airport.take_off(plane)}.to change{airport.flying_planes.length}.by(1)
    end 
  end 

  # context 'bad weather' do

  #   it 'prevents take off when weather is stormy' do
  #     allow(weather).to receive(:stormy?)
  #     expect{airport.take_off}.to raise_error 'No take off due to stormy weather'
  #   end

  #   it 'prevents landing when weather is stormy' do
  #     allow(weather).to receive(:stormy?)
  #     expect {airport.land}.to raise_error 'No landing due to stormy weather'
  #   end 
  # end 

  describe 'maximum_capacity' do 

    it'has a max capacity' do
      @maximum_capacity = 10
      expect(airport.capacity).to eq(@maximum_capacity)
    end

  end 

end


