require 'airport'

describe Airport do
  it { is_expected.to respond_to(:land).with(1).argument }
  
  it { is_expected.to respond_to(:take_off).with(1).argument }
  
  it { is_expected.to respond_to(:planes) }

  it { is_expected.to respond_to(:weather) }

  describe "#land" do 
    it 'lands a plane at the airport' do
      plane = Plane.new
      expect(subject.land(plane)).to eq plane
    end
   
    it 'raises error when airport is full' do
      Airport::DEFAULT_CAPACITY.times { subject.land(Plane.new) }
      expect { subject.land(Plane.new) }.to raise_error 'Airport full'
    end
  end

  describe "#take_off" do
    it 'shows when a plane has left the airport' do
      plane = Plane.new
      airport = Airport.new
      airport.land(plane)
      expect(airport.take_off(plane)).to eq Airport::DEFAULT_TAKE_OFF_MESSAGE
    end
  end

  describe 'initialization' do
    it 'can override airport capacity' do
      airport = Airport.new(Airport::DEFAULT_CAPACITY)
      Airport::DEFAULT_CAPACITY.times { airport.land(Plane.new) }
      expect { airport.land(Plane.new) }.to raise_error 'Airport full'
    end
    # subject { Airport.new }
    # let(:plane) { Plane.new }
    # it 'can override airport capacity' do
    #   described_class::DEFAULT_CAPACITY.times do
    #     subject.land(plane)
    #   end
    #   expect { subject.land(plane) }.to raise_error 'Airport full'
    # end
  end

  it 'stops plane taking off in stormy weather' do 
    plane = Plane.new
    subject.land(plane)
    allow(subject).to receive(:weather) { 'stormy' }
  end
end
