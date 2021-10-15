require 'airport'

describe Airport do

  let (:plane) { double("plane") }

  describe '#instruct_to_land' do 
  
    it 'can instruct an airplane to land' do 
      expect(subject).to respond_to(:instruct_to_land).with(1).argument
    end

    it 'does not allow to land a plane if the airport is full' do 
      subject.instruct_to_land(plane)
      expect { subject.instruct_to_land(plane) }.to raise_error("AirportFull")
    end

  end
  
  describe '#instruct_to_take_off' do 
  
    it 'can instruct an airplane to take off' do 
      expect(subject).to respond_to(:instruct_to_take_off).with(1).argument
    end

  end

  describe '#plane_at_airport?' do 

    it 'can confirm, that a plane left the airport' do 
      subject.instruct_to_land(plane)
      subject.instruct_to_take_off(plane)
      expect(subject.plane_at_airport?(plane)).to eq false
    end

  end

end
