require 'airport'

describe Airport do

  describe '#instruct_to_land' do 
  
    it 'can instruct an airplane to land' do 
      plane = double("plane")
      expect(subject).to respond_to(:instruct_to_land).with(1).argument
    end

  end
  
  describe '#instruct_to_take_off' do 
  
    it 'can instruct an airplane to take off' do 
      plane = double("plane")
      expect(subject).to respond_to(:instruct_to_take_off).with(1).argument
    end

  end

  describe '#plane_at_airport?' do 

    it 'can confirm, that a plane left the airport' do 
      plane = double("plane")
      subject.instruct_to_land(plane)
      subject.instruct_to_take_off(plane)
      expect(subject.plane_at_airport?(plane)).to eq false
    end

  end

end
