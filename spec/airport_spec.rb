require 'airport'

describe Airport do

  describe 'create'

  it 'has a default capacity when created' do
    expect(subject.capacity).to eq Airport::DEFAULT_CAPACITY
  end

  describe 'take off' do
    xit 'instructs a plane to take off'

    xit 'releases a plane'
  end

  describe 'landing' do
    let(:plane) {Plane.new}

    it 'a plane is able to land at a new airport if the weather is sunny' do
      expect(subject).to receive(:weather) {'sunny'}
      subject.landing(plane)
      expect(subject).not_to be_empty
    end


    it 'a plane should not be able to land when the airport is full' do
      expect(subject).to receive(:weather) {'sunny'}
      expect(subject).to receive(:full?) {true}
      expect{subject.landing(plane)}.to raise_error 'The airport is currently full'
    end

    it 'a plane should not be able to land when the weather is stormy' do
      expect(subject).to receive(:weather) {'stormy'}
      expect{subject.landing(plane)}.to raise_error 'The weather is too stormy to land'
  
    end

  end

  describe 'traffic control' do
    context 'when airport is full' do
      xit 'does not allow a plane to land'
    end

    context 'when weather conditions are stormy' do
      xit 'does not allow a plane to take off'

      xit 'does not allow a plane to land'
    end
  end
end
