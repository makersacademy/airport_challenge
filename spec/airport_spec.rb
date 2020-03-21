require 'airport'

describe '#land(plane)' do
  subject(:airport) { Airport.new }
  context 'Airport can #land(plane)' do
    it 'Airport responds to land(plane)' do
      expect(airport).to respond_to(:land)
    end
  end
end
