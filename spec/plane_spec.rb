require 'plane'

describe Plane do
  it {is_expected.to respond_to(:land).with(1).argument}
  it {is_expected.to respond_to(:take_off)}

  describe '#land' do
    let(:airport){double('airport', :planes => [], :weather => "fine", :is_full? => nil)}

    it 'lands self at an airport' do
      subject.land(airport)
      expect(airport.planes).to include(subject)
    end
    it 'raises an error when airport.weather is stormy' do
      allow(airport).to receive(:weather){:stormy}
      expect{subject.land(airport)}.to raise_error "It's stormy here. Cannot land at this airport"
    end
    it 'raises and error when the airport is full' do
      allow(airport).to receive(:is_full?){true}
      expect{subject.land(airport)}.to raise_error "This airport is full. Cannot land here"
    end
  end

  describe '#take_off' do
    let(:airport){double('airport', :planes => [], :weather => "fine", :is_full? => nil)}

    it 'takes off from its current airport' do
      subject.land(airport)
      subject.take_off
      expect(airport.planes).to eql([])
    end

    it 'confirms self is no longer at the airport' do
      subject.land(airport)
      expect{subject.take_off}.to output('Plane has left airport').to_stdout
    end

    it 'raises an error when airport.weather is stormy' do
      subject.land(airport)
      allow(airport).to receive(:weather){:stormy}
      expect{subject.take_off}.to raise_error "It's stormy. Cannot take off from this airport"
    end

  end

end
