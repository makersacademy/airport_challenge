# frozen_string_literal: true

require 'airport'

describe Airport do
  # Creating plane double
  let(:plane) { double :plane }

  # Testing response to method land
  it { is_expected.to respond_to(:land).with(1).argument }
  
   # Testing response to method take_off
  it { is_expected.to respond_to(:take_off).with(1).argument }

  describe 'landing planes' do 
    # Testing plane landing
    it 'lets a plane land' do
      expect(subject).to receive(:land)
      subject.land plane
    end
    
    # Raising an error when airport is full
    it 'gives an error when trying to land at full airport' do
      subject.capacity.times { subject.land(plane) }
      expect{subject.land(plane)}.to raise_error("Airport is full")
    end
  end
  
  # Tests that need land to be called
  describe 'tests that need to call land' do
    before do
      allow(plane).to receive(:land)
    end
    
    # Testing airport has plane after landing
    it 'has the plane after landing' do
      subject.land(plane)
      expect(subject.planes).to include plane
    end
  end
  
  describe 'planes taking off' do
    # Testing plane taking off
    it 'lets a plane take off' do
      expect(subject).to respond_to(:take_off)
    end
  end
end
