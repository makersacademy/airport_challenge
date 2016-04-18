require 'airport'

describe Airport do
  subject(:airport) { described_class.new }
  let(:plane) {double :plane}

  describe 'initialize' do

    it 'expects an airport to be created with an empty hanger' do
      expect{subject.takeoff(plane)}.to raise_error "That plane is not currently in this airport."
    end

    it 'expects airport to have a capacity that is set to the default capacity if nothing is specified' do
      expect(subject.capacity).to eq described_class::DEFAULT_CAPACITY
    end

    it 'expects the capacity to be able to be set when initialized' do
      airport = Airport.new 13
      expect(airport.capacity).to eq 13
    end

  end

  describe 'land' do

    before {allow(subject).to receive(:is_landed?).and_return(false)}

    it 'expects the plane to land into the airport when weather is fine' do
      allow(plane).to receive(:make_landed).and_return(true)
      allow(subject).to receive(:is_stormy?).and_return(false)
      subject.land(plane)
      allow(subject).to receive(:is_landed?).and_return(true)
      allow(plane).to receive(:took_off).and_return(true)
      subject.takeoff(plane)
      expect(plane).to eq(plane)
    end

    it 'expects landing to be prevented when weather is stormy' do
      allow(plane).to receive(:make_landed).and_return(true)
      allow(subject).to receive(:is_stormy?).and_return(true)
      expect{subject.land(plane)}.to raise_error "It's too stormy to land."
    end

    it 'expects landing to be prevented when airport is full' do
      allow(plane).to receive(:make_landed).and_return(true)
      allow(subject).to receive(:is_stormy?).and_return(false)
      10.times{subject.land(plane)}
      expect{subject.land(plane)}.to raise_error "Airport is full! Plane cannot land."
    end

    it 'expects planes not to be allowed to land if they are already landed' do
      allow(subject).to receive(:is_landed?).and_return(true)
      expect{subject.land(plane)}.to raise_error "That plane has already landed."
    end

  end

  describe 'takeoff' do

    before do
      allow(subject).to receive(:is_landed?).and_return(false)
      allow(plane).to receive(:make_landed).and_return(true)
      allow(subject).to receive(:is_stormy?).and_return(false)
      subject.land(plane)
      allow(subject).to receive(:is_landed?).and_return(true)
    end

    it 'expects the plane to take off from the airport when weather is fine' do
      allow(plane).to receive(:took_off).and_return(true)
      allow(subject).to receive(:is_stormy?).and_return(false)
      subject.takeoff(plane)
      expect{subject.takeoff(plane)}.to raise_error "That plane is not currently in this airport."
    end

    it 'expects takeoff to be prevented when weather is stormy' do
      allow(plane).to receive(:took_off).and_return(true)
      allow(subject).to receive(:is_stormy?).and_return(true)
      expect{subject.takeoff(plane)}.to raise_error "It's too stormy to take-off."
    end

    it 'expects planes to not be allowed to take off if they are already in the air' do
      allow(subject).to receive(:is_landed?).and_return(false)
      expect{subject.takeoff(plane)}.to raise_error "That plane has already taken-off."
    end

    it 'expects plane to not be able to takeoff from an airport it is not in' do
      plane2 = double(:plane, is_landed?: true)
      allow(plane2).to receive(:took_off).and_return(false)
      expect{subject.takeoff(plane2)}.to raise_error "That plane is not currently in this airport."
    end

  end

end
