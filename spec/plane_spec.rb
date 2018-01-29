require 'plane'

describe Plane do
  it { is_expected.to respond_to(:land).with(1).argument }
  it { is_expected.to respond_to(:take_off) }

  describe '#land' do
    let(:airport) { double('airport', :planes => [], :weather => :fine, :full? => nil) }

    it 'lands self at an airport' do
      subject.land(airport)
      expect(airport.planes).to include(subject)
    end
    it 'raises an error when airport.weather is stormy' do
      allow(airport).to receive(:weather) { :stormy }
      expect { subject.land(airport) }.to raise_error "It's stormy here. Cannot land at this airport"
    end
    it 'raises an error when the airport is full' do
      allow(airport).to receive(:full?) { true }
      expect { subject.land(airport) }.to raise_error "This airport is full. Cannot land here"
    end
    it 'raises an error when already landed' do
      subject.land(airport)
      expect { subject.land(airport) }.to raise_error "Cannot land while plane is landed already"
    end

  end

  describe '#take_off' do
    let(:airport) { double('airport', :planes => [], :weather => :fine, :full? => nil) }

    it 'takes off from its current airport' do
      subject.land(airport)
      subject.take_off
      expect(airport.planes).to eql([])
    end

    it 'confirms self is no longer at the airport' do
      subject.land(airport)
      expect { subject.take_off }.to output('Plane has left airport').to_stdout
    end

    it 'raises an error when airport.weather is stormy' do
      subject.land(airport)
      allow(airport).to receive(:weather) { :stormy }
      expect { subject.take_off }.to raise_error "It's stormy. Cannot take off from this airport"
    end

    it 'raises an error when airplane is in flight' do
      expect { subject.take_off }.to raise_error "You are currently in flight"
    end

  end

end
