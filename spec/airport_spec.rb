require 'airport'
require 'plane'
# Within the Airport class
describe Airport do
# Specifies the details of the Airport interface
  it { is_expected.to respond_to(:land).with(1).argument }
  it { is_expected.to respond_to(:take_off) }

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

  # Within the plane.rb
  describe Plane do
    it { is_expected.to respond_to(:a_plane?) }
  end

end
