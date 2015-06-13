require 'airport'

describe Airport do

  describe 'create'

  it 'has a default capacity when created' do
    expect(subject.capacity).to eq Airport::DEFAULT_CAPACITY
  end

  describe 'take off' do
    let(:plane) {Plane.new}
    it 'a plane should be able to take off when the weather is sunny' do
      expect(subject).to receive(:weather) {'sunny'}
      subject.landing(plane)
      expect(subject).to receive(:weather) {'sunny'}
      subject.take_off
      expect(subject).to be_empty
    end

    it 'a plane is actually released when its sunny' do
      expect(subject).to receive(:weather) {'sunny'}
      subject.landing(plane)
      expect(subject).to receive(:weather) {'sunny'}
      expect(subject.take_off).to be_an_instance_of(Plane)
    end
  end

  describe 'landing' do
    let(:plane) {Plane.new}

    it 'a plane is able to land at a new airport if the weather is sunny' do
      expect(subject).to receive(:weather) {'sunny'}
      subject.landing(plane)
      expect(subject).not_to be_empty
    end

  end

  describe 'traffic control' do
    let(:plane) {Plane.new}
    context 'when airport is full' do
      it 'a plane should not be able to land' do
        expect(subject).to receive(:weather) {'sunny'}
        expect(subject).to receive(:full?) {true}
        expect{subject.landing(plane)}.to raise_error 'The airport is currently full'
      end
    end

    context 'when weather conditions are stormy' do
      it 'a plane should not be able to take off' do
        expect(subject).to receive(:weather) {'sunny'}
        subject.landing(plane)
        expect(subject).to receive(:weather) {'stormy'}
        expect{subject.take_off}.to raise_error 'The weather is too stormy to take-off'
      end

      it 'a plane should not be able to land' do
        expect(subject).to receive(:weather) {'stormy'}
        expect{subject.landing(plane)}.to raise_error 'The weather is too stormy to land'

      end
    end
  end
end
