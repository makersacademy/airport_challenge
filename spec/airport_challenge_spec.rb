require 'airport_challenge'

# <!-- Method that tells plane land at airport -->
# As an air traffic controller 
# So I can get passengers to a destination 
# I want to instruct a plane to land at an airport
# -done

describe Airport do
  subject(:airport) { described_class.new }

  describe 'Plane can take off and land' do 
    it { is_expected.to respond_to(:take_off) }
    it { is_expected.to respond_to(:land).with(1).argument }
  end

  describe 'initialize' do 
    subject { Airport.new }
    let(:plane) { Plane.new }
    it 'defaults capacity' do 
      described_class::DEFAULT_CAPACITY.times do 
        subject.land(plane)
      end
      expect { subject.land(plane) }.to raise_error 'Airport is full'
    end
  end

  
  describe '#take_off' do
    it 'raises an error when there are no planes avialable' do
      expect { subject.take_off }.to raise_error 'No planes available'
    end
  end

  describe '#land' do 
    it 'raises an error when full' do 
      subject.capacity.times { subject.land Plane.new }
      # expect { subject.land (Plane.new) }.to raise_error 'Airport is full'
    end
  end
end
