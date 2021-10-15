require 'airport'

describe Airport do

  let (:plane) { double(flying?: true, land: nil) }

  describe '#instruct_to_land' do 
  
    it 'can instruct an airplane to land' do 
      expect(subject).to respond_to(:instruct_to_land).with(1).argument
    end

    it 'can instruct planes to land up to the airports variable capacity' do 
      capacity = 100
      airport = Airport.new (capacity)
      allow_any_instance_of(Airport).to receive(:weather) { 'sunny' }
      expect { capacity.times { airport.instruct_to_land(double(flying?: true, land: nil)) } }.not_to raise_error
    end

    it 'does not allow a plane to land if the airport is full' do 
      capacity = 1000
      airport = Airport.new(capacity)
      allow_any_instance_of(Airport).to receive(:weather) { 'sunny' }
      capacity.times { airport.instruct_to_land(double(flying?: true, land: nil)) }
      expect { airport.instruct_to_land(double(flying?: true, land: nil)) }.to raise_error("AirportFull")
    end

    it 'does not allow a plane to land if the weather is stormy' do
      allow_any_instance_of(Airport).to receive(:weather) { 'stormy' }
      subject.instruct_to_land(plane)
      expect(subject.plane_at_airport?(plane)).to eq false
    end

    it 'does not allow you, to land the same airplane twice' do
      allow_any_instance_of(Airport).to receive(:weather) { 'sunny' } 
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
      allow_any_instance_of(Airport).to receive(:weather) { 'stormy' }
      subject.instruct_to_take_off(plane)
      expect(subject.plane_at_airport?(plane)).to eq true 
    end

    it 'does not allow an airplane to take off, that is not in the airport' do
      allow_any_instance_of(Airport).to receive(:weather) { 'stormy' }
      expect { subject.instruct_to_take_off(plane) }.to raise_error("PlaneNotAtAirport")
    end

  end

  describe '#plane_at_airport?' do 

    it 'can confirm, that a plane left the airport' do 
      allow_any_instance_of(Airport).to receive(:weather) { 'sunny' }
      subject.instruct_to_land(plane)
      subject.instruct_to_take_off(plane)
      expect(subject.plane_at_airport?(plane)).to eq false
    end

  end

  describe '#weather' do 
  
    it 'returns mostly sunny' do 
      # rand is implemented in Kernel. But calling it, the receiver is our Object.
      # https://stackoverflow.com/questions/45761380/how-to-stub-rand-in-rspec
      expected = Array.new(91, 'sunny')
      actual = []
      91.times do |i| 
        allow(subject).to receive(:rand) { i }
        actual << subject.weather
      end
      expect(actual).to eq expected
    end

    it 'returns sometimes stormy' do
      expected = Array.new(10, 'stormy')
      actual = []
      10.times do |i| 
        allow(subject).to receive(:rand) { i + 91 }
        actual << subject.weather
      end
      expect(actual).to eq expected
    end

  end

end
