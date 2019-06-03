require 'Plane'
require 'Airport'

  describe Plane do
    it 'should create an instance of Plane' do
      expect(described_class).to eq(Plane)
    end


  it 'can land at an airport' do
    plane = Plane.new
    it (subject.land).to respond_to (:airport) do
  end
end 
