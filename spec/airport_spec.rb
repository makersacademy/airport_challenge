require 'airport'

describe Airport do
  let(:plane) { double(:airplane) }

  describe ' #call_takeoff' do
    before(:each) do
      allow(plane).to receive("land")
      subject.call_landing(plane)
      allow(plane).to receive("takeoff")
    end

    it 'instructs a plane to take off' do
      expect(subject).to respond_to(:call_takeoff)
    end

    it 'releases a plane' do
      expect(subject.call_takeoff).to eq(plane)
    end
  end

  describe ' #call_landing' do
    before(:each) do
      allow(plane).to receive(:land)
    end

    it 'instructs a plane to land' do
      expect(subject).to respond_to(:call_landing).with(1).argument
    end

    it 'receives a plane' do
      expect(subject.call_landing plane).to eq(plane)
    end
  end

  describe 'traffic control' do
    context 'when airport is full' do
      before(:each) do
        allow(plane).to receive("land")
      end

      it 'does not allow a plane to land' do
        subject.capacity.times { subject.call_landing(plane)}
        expect{subject.call_landing(plane)}.to raise_error "Airport is full, keep flying"
      end
    end
  end


#    context 'when weather conditions are stormy' do
#      xit 'does not allow a plane to take off'
#
#      xit 'does not allow a plane to land'
#    end
#  end
end
