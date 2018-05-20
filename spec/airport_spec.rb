require 'airport'

describe Airport do
  it 'responds to #land' do
    expect(subject). to respond_to :land
  end

  it 'responds to #take_off' do
    expect(subject). to respond_to :take_off
  end

  describe '#land' do
    it 'instructs a plane to land at an airport' do
      airport = Airport.new
      plane = Plane.new
      expect(airport.land(plane)).to eq "The following plane: #{plane} has landed"
    end
  end

  describe '#take_off' do
    it 'instructs a plane to take off from an airport' do
      airport = Airport.new
      plane = Plane.new
      expect(airport.take_off(plane)).to eq "The following plane: #{plane} has taken off"
    end
  end

end
