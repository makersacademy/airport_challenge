require 'airport'

describe Airport do

  let(:boeing) { Plane.new }
  let(:learjet) { Plane.new }
  let(:airbus) { Plane.new }
  
  context "in sunny weather" do
    before { allow(subject).to receive(:stormy?).and_return(false) }
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
        Airport::DEFAULT_CAPACITY.times { subject.land(Plane.new) }
        expect { subject.land(boeing) }.to raise_error 'Hangar full.'
      end
      it 'marks the plane as not in flight' do
        subject.land(boeing)
        expect(boeing).to_not be_flying
      end
      it 'planes not in flight cannot be landed, raises error' do
        subject.land(boeing)
        expect { subject.land(boeing) }.to raise_error 'Cannot land planes that are not in flight.'
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
        subject.land(boeing)
        expect(subject.take_off(boeing)).to be_instance_of(Plane)
      end
      it 'returns the same Plane object that was passed in to confirm take off' do
        subject.land(boeing)
        expect(subject.take_off(boeing)).to be boeing
      end
      it 'marks the plane as flying' do
        subject.land(boeing)
        subject.take_off(boeing)
        expect(boeing).to be_flying
      end
      it 'removes the taken off plane from @hangar' do
        subject.land(boeing)
        subject.land(learjet)
        subject.take_off(boeing)
        expect(subject.hangar).to_not include boeing
      end
      it 'planes already in flight cannot take off, raises error' do
        expect { subject.take_off(boeing) }.to raise_error 'Cannot take off planes that are already in flight.'
      end
      it 'plane must exist in @hanger to take off' do
        learjet.lands
        expect { subject.take_off(learjet) }.to raise_error 'This plane is not in the hangar.'
      end
    end
    
    context '@hangar' do
      it 'responds' do
        expect(subject).to respond_to :hangar
      end
      it 'returns landed planes' do
        subject.land(boeing)
        subject.land(learjet)
        subject.land(airbus)
        expect(subject.hangar).to include(boeing, learjet, airbus)
      end
    end
    
    context '@capacity' do
      it 'when not set, DEFAULT_CAPACITY is used, landing more than DEFAULT_CAPACITY will raise error' do
        Airport::DEFAULT_CAPACITY.times { subject.land(Plane.new) }
        expect { subject.land(learjet) }.to raise_error 'Hangar full.'
      end
      it 'when set to 15, landing more than 15 will raise error' do
        15.times { large_airport.land(Plane.new) }
        expect { large_airport.land(learjet) }.to raise_error 'Hangar full.'
      end
    end
    
  end
  
  context 'in stormy weather' do
    it '#land will raise error' do
      allow(subject).to receive(:stormy?).and_return(true)
      expect { subject.land(boeing) }.to raise_error 'Cannot land. Weather is stormy.'
    end
    it '#take_off will raise error' do
      allow(subject).to receive(:stormy?).and_return(false)
      subject.land(boeing)
      allow(subject).to receive(:stormy?).and_return(true)
      expect { subject.take_off(boeing) }.to raise_error 'Cannot take off. Weather is stormy.'
    end
  end
  
  let(:random_weather_airport) { Airport.new }

  context 'random nature of #stormy?' do
    it 'returns true when over 0.8' do
      allow_any_instance_of(Object).to receive(:rand).and_return(0.9)
      expect(random_weather_airport.stormy?).to be
    end
    it 'returns false when under 0.8' do
      allow_any_instance_of(Object).to receive(:rand).and_return(0.5)
      expect(random_weather_airport.stormy?).to be_falsey
    end
  end

  context 'Feature test:' do
    it 'Land 3 planes, learjet takes off, boeing takes off to another airport, learjet returns but storm prevents landing' do
      allow(subject).to receive(:stormy?).and_return(false)
      subject.land(boeing)
      subject.land(learjet)
      subject.land(airbus)
      subject.take_off(boeing)
      subject.take_off(learjet)
      allow(subject).to receive(:stormy?).and_return(true)
      expect { subject.land(learjet) }.to raise_error 'Cannot land. Weather is stormy.'
      expect(subject.hangar).to include(airbus)
    end
  end
end
