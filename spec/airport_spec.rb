require 'airport'

describe Airport do

  let(:plane) {double(:plane)}

  context '<> Landing handling <>' do
    it 'should add the landed plane' do
      subject.planes << plane
      expect(subject.planes.include?(plane)).to eq true
    end

    it 'should prevent landing if the weather at airport is bad' do
      subject.check_weather.stub(:check_weather).and_return(true)
      expect{subject.approve_landing?(plane)}.to raise_error "Bad weather, try again later"
    end

    it 'should prevent landing if the airport is full' do
      subject.max_capacity.times { subject.planes << plane }
      expect{subject.approve_landing?(plane)}.to raise_error "#{subject.name} is full"
    end
  end

  context '<> Take off handling <>' do
    it 'should prevent take off if the weather is bad' do
      subject.planes << plane
      expect{subject.approve_takeoff?(plane)}.to raise_error "Bad weather, try again later"
    end

    it 'should remove the plane from the airport after take off' do
      plane = Plane.new
      plane.land(subject)
      plane.take_off(subject)
      expect(subject.planes.include?(subject)).to eq false
    end
  end

end
