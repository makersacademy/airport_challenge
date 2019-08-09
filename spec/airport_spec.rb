require 'airport'

describe Airport do
  describe '#land' do
    it 'can instruct a plane to land' do
      plane = Plane.new
      subject.land(plane)
      expect(subject.planes).to include(plane)
    end

    it 'raises an error if the plane is already in the airport' do
      plane = Plane.new
      subject.land(plane)
      error_message = "Plane already landed cannot land again"
      expect{ subject.land(plane) }.to raise_error error_message
    end

    it 'raises an error when the airport is full' do
      plane = Plane.new
      subject.land(plane)
      allow(subject).to receive(:full?).and_return(true)
      error_message = "Airport is full, no landing allowed"
      expect{ subject.land(plane) }.to raise_error error_message
    end
  end

  describe '#takeoff' do
    it 'can instruct a plane to takeoff' do
      plane = Plane.new
      subject.land(plane)
      subject.takeoff(plane)
      expect(subject.planes).not_to include(plane)
    end

    it 'raises an error if plane is not in the airport' do
      plane = Plane.new
      error_message = "Plane not in the airport cannot takeoff"
      expect{ subject.takeoff(plane) }.to raise_error error_message
    end
  end

   it { is_expected.to respond_to :full? }

  # describe '#full?' do
  #   it 'prevent landing and raises an error when the airport is full' do
  #     plane = Plane.new
  #     subject.land(plane)
  #     expect{ subject.}
  #   end
  # end

end
