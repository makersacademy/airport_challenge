require 'airport'

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

end
