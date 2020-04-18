require 'airport'

describe Airport do
  subject { described_class.new 10 }
  let(:plane) { double(:plane) }

  describe '#initialize' do
    # As the system designer
    # So that the software can be used for many different airports
    # I would like a default airport capacity that can be overridden as appropriate
    it 'has a default capacity argument value' do
      subject = described_class.new
      described_class::DEFAULT_CAPACITY.times { subject.land(plane) }
      expect { subject.land(plane) }.to raise_error 'Airport is full!'
    end
  end

  describe '#land' do
    # As an air traffic controller
    # So I can get passengers to a destination
    # I want to instruct a plane to land at an airport
    it 'instructs a plane to land' do
      expect(subject).to respond_to(:land).with(1).argument
    end

    it 'stores a plane after landing' do
      expect(subject.land(plane)).to include plane
    end
    # As an air traffic controller
    # To ensure safety
    # I want to prevent landing when the airport is full
    context 'when airport is full'
      it 'prevents landing' do
        10.times { subject.land(plane) }
        expect { subject.land(double :plane) }.to raise_error 'Airport is full!'
      end
  end

  describe '#take_off' do
    # As an air traffic controller
    # So I can get passengers on the way to their destination
    # I want to instruct a plane to take off from an airport
    # and confirm that it is no longer in the airport
    it 'instructs a plane to take off' do
      expect(subject).to respond_to(:take_off)
    end

    it 'confirms that a plane is no longer at the airport after take_off' do
      subject.land(plane)
      expect(subject.take_off).to eq plane
    end
  end


end
