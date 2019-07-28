require 'airport'
require 'plane'
# Within the Airport class
describe Airport do
# Specifies the details of the Airport interface
  it { is_expected.to respond_to(:land).with(1).argument }
  it { is_expected.to respond_to(:take_off) }

  # Capacity can be set upon initialization
  describe 'initialization' do
    it 'has a variable capacity' do
      airport = Airport.new(50)
      50.times { airport.land(Plane.new) }
      expect { airport.land(Plane.new) }.to raise_error 'Airport is full'
    end
  end
  # Capcity has a default 
  describe 'initialization' do
    it 'has a default capacity' do
      described_class::DEFAULT_CAPACITY.times do
        subject.land(Plane.new)
      end
      expect { subject.land(Plane.new) }.to raise_error 'Airport is full'
    end
  end

  describe '#airport_capacity' do
    # Declares user input as the airport capacity
    it 'has a capacity that can be overridden as necessary' do
      # Airport has a capacity of 10
    10.times { subject.land(Plane.new) }
		expect { subject.land(Plane.new) }.to raise_error 'Airport is full'
		end
  end

  describe '#land' do
    # Raises an error when airport is full
    it 'raises an error when airport is full' do
      # Airport has a capacity of 10
    10.times { subject.land(Plane.new) }
		expect { subject.land(Plane.new) }.to raise_error 'Airport is full'
		end
  end

  describe '#take_off' do
    # Raises an error when airport is empty 
    it 'raises an error when airport is full' do
      expect { subject.take_off }.to raise_error 'Airport is empty'
    end
  end
end
