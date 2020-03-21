require 'airport'

describe Airport do

  before { allow(subject).to receive(:stormy?).and_return(false) }
  
  let(:boeing) { Plane.new }
  let(:learjet) { Plane.new }
  
  let(:random_weather_airport) {Airport.new}

  let(:large_airport) { Airport.new(15) }
  before { allow(large_airport).to receive(:stormy?).and_return(false) }

  context '#land' do
    it 'responds' do
      expect(subject).to respond_to :land
    end
    it 'expects one argument' do
      expect(subject).to respond_to(:land).with(1).argument
    end
    it 'returns a Plane object' do
      expect(subject.land(boeing)).to be_instance_of(Plane)
    end
    it 'returns the same Plane object that was passed in' do
      expect(subject.land(boeing)).to be boeing
    end
    it 'stores the landed plane in the hangar' do
      subject.land(boeing)
      expect(subject.hangar).to include boeing
    end
    it 'raises error if @hanger is full' do
      5.times {subject.land(Plane.new)}
      expect { subject.land(learjet) }.to raise_error 'Hangar full.'
    end
    it 'marks the plane as not flying' do
      subject.land(boeing)
      expect(boeing).to_not be_flying?
    end
  end

  context '#take_off' do
    it 'responds' do
      expect(subject).to respond_to :take_off
    end
    it 'expects one argument' do
      expect(subject).to respond_to(:take_off).with(1).argument
    end
    it 'returns a Plane object' do
      expect(subject.take_off(boeing)).to be_instance_of(Plane)
    end
    it 'returns the same Plane object that was passed in to confirm take off' do
      expect(subject.take_off(boeing)).to be boeing
    end
  end

  context '@hangar' do
    it 'responds' do
      expect(subject).to respond_to :hangar
    end
    it 'returns landed planes' do
      subject.land(boeing)
      subject.land(learjet)
      expect(subject.hangar).to include(boeing, learjet)
    end
  end

  context '@capacity' do
    it 'when not set, default is 5, landing more than 5 will raise error' do
      Airport::DEFAULT_CAPACITY.times { subject.land(Plane.new) }
      expect { subject.land(learjet) }.to raise_error 'Hangar full.'
    end
    it 'when set to 15, landing more than 15 will raise error' do
      large_airport.capacity.times { large_airport.land(Plane.new) }
      expect { large_airport.land(learjet) }.to raise_error 'Hangar full.'
    end
  end

  context 'stormy weather' do
    it '#land will raise error' do
      allow(subject).to receive(:stormy?).and_return(true)
      expect { subject.land(learjet) }.to raise_error 'Cannot land. Weather is stormy.'
    end
    it '#take_off will raise error' do
      subject.land(boeing)
      allow(subject).to receive(:stormy?).and_return(true)
      expect { subject.take_off(boeing) }.to raise_error 'Cannot take off. Weather is stormy.'
    end
  end

  context '#stormy?' do
    it 'returns true when over 0.8' do
      allow_any_instance_of(Object).to receive(:rand).and_return(0.9)
      expect(random_weather_airport.stormy?).to be
    end
    it 'returns false when under 0.8' do
      allow_any_instance_of(Object).to receive(:rand).and_return(0.5)
      expect(random_weather_airport.stormy?).to be_falsey
    end
  end

end
