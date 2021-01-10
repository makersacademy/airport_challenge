require "plane"
require "airport"
require "weather"

describe Airport do
  context 'when not stormy' do
    before do
      allow(subject).to receive(:stormy?).and_return false
    end

    # As an air traffic controller
    # So I can get passengers to a destination
    # I want to instruct a plane to land at an airport
    it 'instructs a plane to land' do
      expect(subject).to respond_to(:land).with(1).argument
    end

    # it 'raises an error when plane has already landed' do
    #   plane = Plane.new
    #   subject.land(plane)
    #   expect { subject.land(plane) }.to raise_error "Plane has already landed"
    # end

    # As an air traffic controller
    # So I can get passengers on the way to their destination
    # I want to instruct a plane to take off from an airport and confirm that it is no longer in the airport
    it { is_expected.to respond_to(:takeoff).with(1).argument }
    it 'should instruct a plane to take off' do
      plane = Plane.new
      subject.land(plane)
      expect(subject.takeoff(plane)).to eq "#{plane} has left the Airport"
    end

    it "should raise an error when we call takeoff but the plane is flying" do
      plane = Plane.new
      expect { subject.takeoff(plane) }.to raise_error "Plane is flying"
    end

    context 'when airport is full' do
        # As an air traffic controller
        # To ensure safety
        # I want to prevent landing when the airport is full
      it 'should raise error when airport full' do
        plane = Plane.new
        subject.capacity.times { subject.land(plane) }
        expect { subject.land(plane) }.to raise_error "Airport is full"
      end
    end
  end

  context 'when it is stormy' do
    before do
      allow(subject).to receive(:stormy?).and_return true
    end
    it 'prevents a plane from landing when stormy' do
      expect { subject.land(Plane.new) }.to raise_error "No landings allowed due to bad weather"
    end
  end

  # As an air traffic controller
  # To ensure safety
  # I want to prevent takeoff when weather is stormy
  it "should not allow takeoffs when weather is stormy" do
    allow(subject).to receive(:stormy?).and_return false
    subject.land(Plane.new)
    allow(subject).to receive(:stormy?).and_return true
    expect { subject.takeoff(Plane.new) }.to raise_error "No take offs allowed due to bad weather"
  end

  context 'checking if the airport is full' do
    it 'should return true or false if full' do
      expect(subject.send(:full?)).to eq false
      allow(subject).to receive(:stormy?).and_return false
      subject.capacity.times { subject.land(Plane.new) }
      expect(subject.send(:full?)).to eq true
    end
  end
end
