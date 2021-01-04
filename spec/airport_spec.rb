require 'airport'

describe Airport do

  subject(:airport) { described_class.new }

  describe '#land' do
    it 'takes a plane and puts it in the hangar' do
      # arrange -> gather all the objects we need
      #act -> execute the method under test
      airport.land('BA123')
      # assert -> place some assertion regarding what the method should have done
      expect(airport.hangar).to include 'BA123'
    end

    it 'raises an error when full' do
      airport.land('BA123')
      expect{ airport.land('BA123') }.to raise_error 'Airport is full'
    end
  end

  describe '#take_off' do
    it 'takes a plane and removes it from the hangar' do
      # arrange
      airport.land('BA123')
      #act
      airport.take_off('BA123')
      # assert
      expect(airport.hangar).not_to include 'BA123'
    end
  end

  it 'has a default airport capacity' do
    expect(airport.capacity).to eq Airport::DEFAULT_CAPACITY
  end

  it 'default capacity can be overriden as appropriate' do
    expect(airport.capacity = 50).to eq 50
  end
end

#   it 'default airport capacity that can be overridden as appropriate' do
#     airport.capacity = 10
#     expect(airport.capacity).to eq(10)
#   end
