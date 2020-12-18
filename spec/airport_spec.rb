require 'airport'

describe Airport do

  let(:airport) { Airport.new }

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
end
