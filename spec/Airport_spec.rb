require 'Airport.rb'

describe Airport do
  let(:plane) {double :plane}
  let(:weather) {double :weather}

  describe 'Airport Capacity' do
    it 'is possible to set the airport capacity to a user defined number' do
      plane_capacity = 6666
      big_airport = Airport.new(plane_capacity)
      expect(big_airport.capacity).to eq(plane_capacity)
    end

    it 'has a default capaicty of 40' do
      expect(subject.capacity).to eq(40)
    end
  end

  it 'a plane is docked when it lands' do
    expect(subject.add_plane(plane)).to eq(subject.docked_planes)
  end

  it 'removes a plane when the plane takes off' do
    subject.add_plane(plane)
    expect(subject.remove_plane(plane)).to eq(subject.docked_planes)
  end
end
