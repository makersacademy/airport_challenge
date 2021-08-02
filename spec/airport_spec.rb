require 'airport'

describe Airport do
  subject { Airport.new }
  let(:plane) { Plane.new }

  describe "#land" do
    it 'responds to land' do
      expect(subject).to respond_to(:land).with(1).argument
    end

    it 'lands a plane at an airport' do
      expect(subject.land(plane)).to eq [plane]
    end

    it 'raises an error to prevent landing when the airport is full' do
      Airport::DEFAULT_CAPACITY.times { subject.land(plane) }
      expect { subject.land(plane) }.to raise_error "Landing is not permmited- the airport is full"
    end
  end

  describe "#take_off" do
    it 'responds to take off' do
      expect(subject).to respond_to(:take_off).with(1).argument
    end

    it 'gets the plane to take off' do
      subject.land(plane)
      expect(subject.take_off(plane)).to eq plane
    end
  end

end
