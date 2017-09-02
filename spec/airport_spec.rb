# spec/airport_spec.rb

require 'airport'
require 'airplane'

RSpec.describe Airport do
  subject(:airport) { described_class.new }

  describe '#land' do
    it 'lands a plane in the airport' do
      airplane = Airplane.new
      airport.land(airplane)
      expect(airplane.landed).to be true
    end


  end
end
