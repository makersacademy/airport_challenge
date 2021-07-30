require 'airport'

describe Airport do
  subject { Airport.new }
  let(:plane) { Plane.new }

  context "#land" do
    it 'should respond to land' do
      expect(subject).to respond_to(:land).with(1).argument
    end

    it 'should land a plane at an airport' do
      expect(subject.land(plane)).to eq [plane]
    end

    it 'should prevent landing when the airport is full' do
      Airport::DEFAULT_CAPACITY.times { subject.land(plane) }
      expect { subject.land(plane) }.to raise_error "The airport is full, cannot allow landing"
    end
  end

  context "#take_off" do
    it 'should respond to take off' do
      expect(subject).to respond_to(:take_off).with(1).argument
    end

    it 'should get the plane to take off' do
      subject.land(plane)
      expect(subject.take_off(plane)).to eq plane
    end
  end

end
