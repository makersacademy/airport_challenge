require 'airport'

describe Airport do
  let(:plane) {Plane.new}

  it { expect(subject.stormy?).to be(true).or be(false)}
  it { expect(subject.full?).to be(true).or be(false)}

  context 'When weather is sunny' do
    before do
      allow(subject).to receive(:stormy?).and_return(false)
    end

    it { expect(subject.land(plane)).to be_a Plane}

    describe 'Plane take off not allowed' do
      it 'Denies take off from a different airport' do
        expect{ subject.take_off(plane) }.to raise_error('Cannot allow take off; you are contacting the wrong control tower!')
    end
  end

    context 'Airport is full' do
      before do
        allow(subject).to receive(:full?).and_return(true)
      end

    describe 'Plane landing denied' do
      it 'Denies landing due to full airport' do
        expect{ subject.land(plane) }.to raise_error('Cannot land; the airport is full!')
      end
    end
  end
end

  context 'When weather is stormy' do
    before do
      allow(subject).to receive(:stormy?).and_return(true)
    end

    describe 'Plane take off denied' do
      it 'Denies take off in stormy weather' do
        expect{ subject.take_off(plane) }.to raise_error('Cannot take off in stormy weather!')
      end
    end

    describe 'Plane landing denied' do
      it 'Denies landing in stormy weather' do
        expect{ subject.land(plane) }.to raise_error('Cannot land in stormy weather!')
      end
    end
  end
end
