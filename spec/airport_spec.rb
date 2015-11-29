require 'airport'

describe Airport do

  describe '#initialize' do
    it 'should have a default capacity' do
      expect(subject.capacity).to eq described_class::DEFAULT_CAPACITY
    end

    it 'should allow the capacity to be overridden' do
      subject = Airport.new(20)
      expect(subject.capacity).to eq 20
    end
  end

  describe '#instruct_to_land' do
    it {is_expected.to respond_to :instruct_to_land}

    it 'should land a plane' do
      plane = double(:plane, in_airport?: false, land: true)
      allow(subject).to receive(:stormy?).and_return false
      allow(subject).to receive(:full?).and_return false
      subject.instruct_to_land(plane)
      expect(subject.landed_planes).to eq [plane]
    end

    it 'should check that the plane is in the airport' do
      plane = double(:plane, in_airport?: false, land: true)
      allow(subject).to receive(:stormy?).and_return false
      allow(subject).to receive(:full?).and_return false
      subject.instruct_to_land(plane)
      expect(subject.landed_planes).to eq [plane]
    end

    it "it should change the plane's status to 'in airport'" do
      plane = double(:plane, in_airport?: true, land: true)
      plane.land
      expect(plane.in_airport?).to eq true
    end

    it "it should raise an error if the plane is already in the airport" do
      plane = double(:plane, in_airport?: true)
      allow(subject).to receive(:stormy?).and_return false
      expect{ subject.instruct_to_land(plane) }.to raise_error "The plane is already in the airport"
    end

    it 'should raise an error if the weather is stormy' do
      plane = double(:plane, in_airport?: false, land: false)
      allow(subject).to receive(:stormy?).and_return true
      expect { subject.instruct_to_land(plane) }.to raise_error "No planes can land as it is stormy"
    end

    it 'should raise an error if the airport is full' do
      plane = double(:plane, in_airport?: false, land: false)
      allow(subject).to receive(:stormy?).and_return false
      allow(subject).to receive(:full?).and_return true
      expect { subject.instruct_to_land(plane) }.to raise_error "The airport is full, so no more planes can land"
    end
  end

  describe '#instruct_take_off' do
    it {is_expected.to respond_to :instruct_take_off}

    it 'should let a plane take off' do
      plane = double(:plane, in_airport?: false, take_off: true, land: true)
      allow(subject).to receive(:stormy?).and_return false
      allow(subject).to receive(:full?).and_return false
      subject.instruct_to_land(plane)
      subject.instruct_take_off
      expect(subject.landed_planes).not_to eq [plane]
    end

    it 'should raise an error if no planes are available to take off' do
      landed_planes = []
      allow(subject).to receive(:stormy?).and_return false
      expect { subject.instruct_take_off }.to raise_error "There are no planes in the airport"
    end

    it 'should raise an error if the weather is stormy' do
      plane = double(:plane, in_airport?: false, land: true, take_off: false)
      allow(subject).to receive(:full?).and_return false
      allow(subject).to receive(:stormy?).and_return true
      expect { subject.instruct_take_off }.to raise_error "No planes can take off as it is stormy"
    end

    it "should change the plane's status to not in airport" do
      plane = double(:plane, in_airport?: false)
      expect(plane.in_airport?).to eq false
    end
  end

  describe '#weather' do
    it 'should set a weather condition' do
      subject.weather
      expect(subject.weather_condition).not_to be_nil
    end
  end

  describe '#full?' do
    it 'should return true if airport is full' do
      plane = double(:plane, in_airport?: false, land: true)
      allow(subject).to receive(:stormy?).and_return false
      Airport::DEFAULT_CAPACITY.times do
        subject.instruct_to_land(plane)
      end
      expect(subject.full?).to eq true
    end
  end
end
