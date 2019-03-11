require 'airport'
require 'plane'
describe Airport do
  describe 'LANDING TESTS 🛬' do
    it { is_expected.to respond_to(:land).with(1).argument }

    it 'Test that plane lands at airport when instructed if weather permits...' do
      subject.stormy = false
      expect { subject.land(double(:plane)) }.not_to raise_error
    end

    it "Test that if weather is too treacherous – plane will not land at an airport..." do
      subject.stormy = true
      plane = Plane.new
      expect { subject.land(plane) }.to raise_error("IT'S TOO STORMY TO LAND!!! ⛈️ ⛈️ ⛈️")
    end

    it "Test that plane will not land at airport if already landed..." do
      plane = Plane.new
      subject.land(plane)
      expect { subject.land(plane) }.to raise_error("Plane has already landed!")
    end

    it 'Test that plane is at the aiport after landing...' do
      plane = Plane.new
      subject.land(plane)
      expect(subject.planes.include?(plane)).to eq true
    end

    it 'Test that plane is not in the airport before landing...' do
      plane = Plane.new
      expect(subject.planes.include?(plane)).to eq false
    end

    it 'Test that plane is not at the aiport after taking off...' do
      plane = Plane.new
      subject.land(plane)
      subject.take_off(plane)
      expect(subject.planes.include?(plane)).to eq false
    end

    it 'To test that if an airport is full – planes will not land there...' do
      p "Landing 20 Planes..."
      20.times { subject.land(Plane.new) }
      expect { subject.land(Plane) }.to raise_error("Airport is full!")
    end
  end

  describe 'TAKE OFF TESTS 🛫' do
    it { is_expected.to respond_to(:take_off).with(1).argument }
    it 'Plane will take off provided it is not too stormy...' do
      plane = Plane.new
      subject.land(plane)
      subject.stormy = false
      expect { subject.take_off(plane) }.not_to raise_error
    end

    it "Test that plane will remain airborn whilst weather is stormy..." do
      subject.stormy = true
      plane = Plane.new
      expect { subject.take_off(plane) }.to raise_error("IT'S TOO STORMY TO TAKE OFF!!! ⛈️ ⛈️ ⛈️")
    end

    it 'Test that plane leaves the airport when instructed...' do
      plane = Plane.new
      subject.land(plane)
      before = subject.planes.length
      subject.take_off(plane)
      after = subject.planes.length
      expect(before - after).to eq 1
    end

    it 'Test that plane only takes off if it is in the airport...' do
      plane = Plane.new
      subject.land(plane)
      rogue_plane = "I'm not in the airport!"
      expect { subject.take_off(rogue_plane) }.to raise_error("This plane is not at the airport!")
    end
  end

  describe 'WEATHER TESTS 🌡️' do
    it 'Test that weather can be set to stormy...' do
      subject.stormy = true
      expect(subject.stormy?).to eq true
    end
  end

  describe 'CAPACITY TESTS' do
    it 'Test that airport has a default capacity of 20...' do
      expect(Airport::DEFAULT_CAPACITY).to eq 20
    end

    it 'Test that airport has a method for capacity...' do
      expect(subject).to respond_to(:capacity)
    end

    it 'Test that airport capacity can be updated...' do
      subject.capacity = 100
      expect(subject.capacity).to eq 100
    end
  end
end
