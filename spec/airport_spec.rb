require 'airport'

describe Airport do

  it { expect(subject.stormy?).to be(true).or be(false)}

  context 'When weather is sunny' do
    before do
      allow(subject).to receive(:stormy?).and_return(false)
    end
    it { expect(subject.land).to be_a Plane}
    it { expect(subject.take_off).to be_a Plane}

    context 'Airport is full' do
      before do
        allow(subject).to receive(:full?).and_return(true)
      end

    describe 'Plane landing denied' do
      it 'Denies landing due to full airport' do
        expect{ subject.land }.to raise_error('Cannot land; the airport is full!')
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
        expect{ subject.take_off }.to raise_error('Cannot take off in stormy weather!')
      end
    end

    describe 'Plane landing denied' do
      it 'Denies landing in stormy weather' do
        expect{ subject.land }.to raise_error('Cannot land in stormy weather!')
      end
    end
  end
end
