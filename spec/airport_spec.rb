require 'airport'

describe Airport do
  let(:plane) {Plane.new}

  it 'it has a default capacity' do
    expect(subject.capacity).to eq Airport::DEFAULT_CAPACITY
  end

  describe 'approve_take_off' do

    before(:each) do
      expect(subject).to receive(:weather) {:sunny}
      subject.approve_landing plane
    end

    it 'instructs a plane to take off' do
      expect(subject).to receive(:weather) {:sunny}
      expect(subject.approve_take_off plane).to eq plane.flying
    end

    it 'releases a plane' do
      expect(subject).to receive(:weather) {:sunny}
      subject.approve_take_off plane
      expect(subject).to be_empty
    end
  end

  describe 'approve_landing' do
    before(:each) {expect(subject).to receive(:weather) {:sunny}}

    it 'instructs a plane to land' do
      expect(subject.approve_landing plane).to eq plane.land
    end

    it 'recieves a plane' do
      subject.approve_landing plane
      expect(subject).not_to be_empty
    end

  end

  describe 'traffic control' do

    context 'when airport is full' do
      before (:each) {expect(subject).to receive(:full?) {true}}

      it 'does not allow a plane to land' do
        expect { subject.approve_landing plane }.to raise_error "airport is full"
      end

    end

    context 'when weather conditions are stormy' do
      it 'does not allow a plane to take off' do
        expect(subject).to receive(:weather) {:sunny}
        subject.approve_landing plane
        expect(subject).to receive(:weather) {:stormy}
        expect {subject.approve_take_off plane }.to raise_error "stormy weather can't take off"
      end


      it 'does not allow a plane to land' do
        expect(subject).to receive(:weather) {:stormy}
        expect {subject.approve_landing plane}.to raise_error "stormy weather can't land"
      end

    end
  end
end
