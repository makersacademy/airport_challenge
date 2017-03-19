require 'airport'
describe Airport do
  let (:plane) {double :plane}
  let (:number) {double :number}

  describe '#land' do
    it {is_expected.to respond_to(:land)}

    it { is_expected.to respond_to(:land).with(1).argument }

    it 'should tell the plane to land' do
      plane = double(:plane, landed?: false)
      allow(subject.weather).to receive(:stormy_weather?).and_return(false)
      allow(plane).to receive(:land_plane)
      expect(subject).to receive(:land)
      subject.land(plane)
    end

    it 'should land planes in the Airport' do
      plane = double(:plane, landed?: false)
      allow(subject.weather).to receive(:stormy_weather?).and_return(false)
      allow(plane).to receive(:land_plane)
      subject.land(plane)
      expect(subject.planes).to include plane
    end


    it 'should not allow landing when weather is stormy' do
      plane = double(:plane, landed?: false)
      allow(subject.weather).to receive(:stormy_weather?).and_return(true)
      allow(plane).to receive(:land_plane)
      expect{ subject.land(plane) }.to raise_error("Bad weather today. Cannot land.")
    end

    it 'should not allow landing when airport is full' do
      plane = double(:plane, landed?: false)
      allow(plane).to receive(:land_plane)
      allow(subject.weather).to receive(:stormy_weather?).and_return(false)
      subject.capacity.times {subject.land(plane)}
      expect{subject.land(plane)}.to raise_error("Sorry. Airport full. Go away.")
    end

    it 'should raise error when trying to land a landed plane' do
      plane = double(:plane, landed?: true)
      allow(plane).to receive(:land_plane)
      allow(subject.weather).to receive(:stormy_weather?).and_return(false)
      expect{ subject.land(plane) }.to raise_error("This plane is already landed.")
    end

  end

  describe '#take_off' do
    it { is_expected.to respond_to(:take_off) }

    it { is_expected.to respond_to(:take_off).with(1).argument }

    it 'should tell the airport to take off the plane' do
      plane = double(:plane, landed?: true)
      allow(subject.weather).to receive(:stormy_weather?).and_return(false)
      allow(plane).to receive(:take_off_plane)
      expect(subject).to receive(:take_off)
      subject.take_off(plane)
    end

    it 'should allow planes to take off from Airport' do
      plane = double(:plane, landed?: true)
      allow(subject.weather).to receive(:stormy_weather?).and_return(false)
      allow(plane).to receive(:take_off_plane)
      subject.planes.push(plane)
      subject.take_off(plane)
      expect(subject.planes).not_to include [plane]
    end

    it 'should not allow take off when weather is stormy' do
      plane = double(:plane)
            allow(subject.weather).to receive(:stormy_weather?).and_return(true)
      expect{ subject.take_off(plane) }.to raise_error("Bad weather today. Cannot take off.")
    end

    it 'should raise an error when plane is not in airport' do
      plane = double(:plane, landed?: true)
      allow(subject.weather).to receive(:stormy_weather?).and_return(false)
      allow(plane).to receive(:take_off_plane)
      subject.planes.delete(plane)
      expect { subject.take_off(plane) }.to raise_error("That plane is not in this airport")
    end
  end

  describe '#set_capacity' do
    it {is_expected.to respond_to(:set_capacity)}

    it { is_expected.to respond_to(:set_capacity).with(1).argument }

    it 'should change the capacity to a different number' do
      number = double(:number)
      subject.set_capacity(number)
      expect(subject.capacity).to eq number
    end
  end

end
