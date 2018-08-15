require 'airport'

describe Airport do

  let(:plane) { double :plane }
  let(:new_airport) { Airport.new }

  describe "Landing" do

    context 'When the weather is not stormy' do
      before(:example) do
        allow(subject).to receive(:stormy?) { false }
      end


      it 'stores the names of the planes landing in an array' do
        subject.land(plane)
        expect(subject.planes_on_ground).to eq [plane]
      end


      it 'does not let a plane already in the airport land again' do
        subject.land(plane)
        expect { subject.land(plane) }.to raise_error 'plane is already in the airport'
      end

      it 'adds a named plane to @planes_on_ground array when it lands and #stormy? == false' do
        expect(subject.land(plane)).to eq [plane]
      end

    end

    it 'raises an error if a named plane tries to land and #stormy? == true' do
      allow(subject).to receive(:stormy?) { true }
      expect { subject.land(plane) }.to raise_error 'landing denied, weather is stormy'
    end

  end

  describe "Taking Off" do

    it 'does not let a plane take off if it is not in the airport' do
      expect { subject.take_off(plane) }.to raise_error 'plane is not currently at this airport'
    end

    it 'removes a named plane from @planes_on_ground when it takes off and #stormy? == false' do
      allow(subject).to receive(:stormy?) { false }
      subject.land(plane)
      expect(subject.take_off(plane)).to eq plane
    end

    it 'raises an error if a named plane from @planes_on_ground tries to take off and #stormy? == true' do
      subject.instance_variable_set("@planes_on_ground", [plane])
      allow(subject).to receive(:stormy?) { true }
      expect { subject.take_off(plane) }.to raise_error 'weather is stormy, plane can not take off'
    end

  end

  describe "Airport Capacity" do

    it 'creates a default capacity of 8 for the number of planes it can hold' do
      expect(subject.capacity).to eq(8)
    end

    it 'denies a plane landing if the airport is at capacity' do
      subject.instance_variable_set(:@planes_on_ground, [*1..8])
      expect { subject.land(plane) }.to raise_error 'landing denied, airport full'
    end

    it 'can set the capacity to 30 when creating new instance of Airport class' do
      new_airport = Airport.new(30)
      expect(new_airport.capacity).to eq 30
    end

  end

  describe "Airport Weather Check" do

    it 'expects a return of true or false from #weather_stormy?' do
      expect(subject.send :weather_stormy?).to be(true).or be(false)
    end

  end

end
