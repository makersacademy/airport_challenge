require 'airport'

describe Airport do

  let (:plane) { double(flying?: true, land: nil) }
  let (:in_sunny_weather) { allow_any_instance_of(Airport).to receive(:weather) { :sunny } } 
  let (:in_stormy_weather) { allow_any_instance_of(Airport).to receive(:weather) { :stormy } } 

  describe '#instruct_to_land' do 
  
    it 'can instruct an airplane to land' do 
      expect(subject).to respond_to(:instruct_to_land).with(1).argument
    end

    it 'does not allow a plane to land if the airports variable capacity is full' do 
      capacity = 1_000
      airport = Airport.new(capacity)
      in_sunny_weather
      capacity.times do
        new_plane = double(flying?: true, land: nil)
        airport.instruct_to_land(new_plane) 
      end 
      one_more_plane = double(flying?: true, land: nil)
      expect { airport.instruct_to_land(one_more_plane) }.to raise_error("AirportFull")
    end

    it 'does not allow a plane to land if the weather is stormy' do
      in_stormy_weather
      subject.instruct_to_land(plane)
      expect(subject.plane_at_airport?(plane)).to eq false
    end

    it 'does not allow you, to land the same airplane twice' do
      in_sunny_weather
      one_plane = plane
      subject.instruct_to_land(one_plane)
      expect { subject.instruct_to_land(one_plane) }.to raise_error("PlaneAlreadyThere")
    end

  end
  
  describe '#instruct_to_take_off' do 
  
    it 'can instruct an airplane to take off' do 
      expect(subject).to respond_to(:instruct_to_take_off).with(1).arguments
    end

    it 'prevents take-off, when the weather is stormy' do
      subject.instruct_to_land(plane)
      in_stormy_weather
      subject.instruct_to_take_off(plane)
      expect(subject.plane_at_airport?(plane)).to eq true 
    end

    it 'does not allow an airplane to take off, that is not in the airport' do
      in_sunny_weather
      expect { subject.instruct_to_take_off(plane) }.to raise_error("PlaneNotAtAirport")
    end

  end

  describe '#plane_at_airport?' do 

    it 'can confirm, that a plane left the airport' do 
      in_sunny_weather
      subject.instruct_to_land(plane)
      subject.instruct_to_take_off(plane)
      expect(subject.plane_at_airport?(plane)).to eq false
    end

  end

end
