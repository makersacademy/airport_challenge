require 'airport.rb'
require 'plane.rb'

describe Airport do
  subject(:airport) { described_class.new }
  let(:plane) { double :plane }

  describe 'landing planes' do
    #it 'instructs the plane to land' do
    #  expect(plane).to receive(:land)
    #  airport.land plane
  #  end

    it 'has the plane after it has landed' do
      allow(plane).to receive(:land)
      airport.land plane
      expect(airport.planes).to include plane
    end
  end

  describe 'planes taking off' do
    it 'instructs the plane to take off' do
      expect(plane).to receive(:take_off)
      airport.take_off plane
    end

    it 'it no longer has the plane after it has taken off' do
      allow(plane).to receive(:take_off)
      airport.take_off plane
      expect(airport.planes).not_to include plane
    end
  end
end
