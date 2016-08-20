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

  describe '.dock_plane' do
    it 'is possible to dock a plane in the airport' do
      subject.dock_plane(plane)
      expect(subject.docked_planes).to eq([plane])
    end

    it 'is not possible do dock more planes than there are capacity spaces' do
      subject.capacity.times do
        subject.dock_plane(plane)
      end
      expect(subject.dock_plane(plane)).to eq("There are too many planes in the airport")
    end


  end


  describe '.undock_plane' do


  end



end
