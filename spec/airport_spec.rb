require 'airport'

describe Airport do

  let (:plane) { double(flying?: true, land: nil) }

  describe '#instruct_to_land' do 

    it 'does not allow a plane to land if the airports variable capacity is full' do 
      capacity = 1_000
      airport = Airport.new(capacity)
      capacity.times do
        new_plane = double(flying?: true, land: nil)
        airport.instruct_to_land(new_plane, :sunny) 
      end 
      one_more_plane = double(flying?: true, land: nil)
      expect { airport.instruct_to_land(one_more_plane, :sunny) }.to raise_error("AirportFull")
    end

    it 'does not allow you, to land the same airplane twice' do
      one_plane = plane
      subject.instruct_to_land(one_plane, :sunny)
      expect { subject.instruct_to_land(one_plane, :sunny) }.to raise_error("PlaneAlreadyThere")
    end

    it 'does not allow a plane to land if the weather is stormy' do
      subject.instruct_to_land(plane, :stormy)
      expect(subject.plane_at_airport?(plane)).to eq false
    end

  end
  
  describe '#instruct_to_take_off' do 

    it 'prevents take-off, when the weather is stormy' do
      subject.instruct_to_land(plane, :sunny)
      subject.instruct_to_take_off(plane, :stormy)
      expect(subject.plane_at_airport?(plane)).to eq true 
    end

    it 'does not allow an airplane to take off, that is not in the airport' do
      expect { subject.instruct_to_take_off(plane, :stormy) }.to raise_error("PlaneNotAtAirport")
    end

  end

  describe '#plane_at_airport?' do 

    it 'can confirm, that a plane left the airport' do 
      subject.instruct_to_land(plane, :sunny)
      subject.instruct_to_take_off(plane, :sunny)
      expect(subject.plane_at_airport?(plane)).to eq false
    end

  end

end
