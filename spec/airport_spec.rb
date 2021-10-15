require 'airport'

describe Airport do

  let (:plane) { double("plane") }

  describe '#instruct_to_land' do 
  
    it 'can instruct an airplane to land' do 
      expect(subject).to respond_to(:instruct_to_land).with(1).argument
    end

    it 'can instruct planes to land up to the airports variable capacity' do 
      capacity = 10
      airport = Airport.new (capacity)
      expect { capacity.times { airport.instruct_to_land(plane) } }.not_to raise_error
    end

    it 'does not allow to land a plane if the airport is full' do 
      capacity = 10
      airport = Airport.new(capacity)
      capacity.times { airport.instruct_to_land(plane) }
      expect { airport.instruct_to_land(plane) }.to raise_error("AirportFull")
    end

  end
  
  describe '#instruct_to_take_off' do 
  
    it 'can instruct an airplane to take off' do 
      expect(subject).to respond_to(:instruct_to_take_off).with(2).arguments
    end

    it 'prevents take-off, when the weather is stormy' do
      subject.instruct_to_land(plane)
      allow(subject).to receive(:weather) { 'stormy' }
      subject.instruct_to_take_off(plane, subject.weather)
      expect(subject.plane_at_airport?(plane)).to eq true 
    end

  end

  describe '#plane_at_airport?' do 

    it 'can confirm, that a plane left the airport' do 
      subject.instruct_to_land(plane)
      allow(subject).to receive(:weather) { 'sunny' }
      subject.instruct_to_take_off(plane, subject.weather)
      expect(subject.plane_at_airport?(plane)).to eq false
    end

  end

  describe '#weather' do 
  
    it 'returns mostly sunny' do 
      # rand is implemented in Kernel. But calling it, the receiver is our Object.
      # https://stackoverflow.com/questions/45761380/how-to-stub-rand-in-rspec
      allow(subject).to receive(:rand) { rand(91) }
      expect(subject.weather).to eq 'sunny'
    end

    it 'returns sometimes stormy' do
      allow(subject).to receive(:rand) { rand(91..100) } 
      expect(subject.weather).to eq 'stormy'
    end

  end

end
