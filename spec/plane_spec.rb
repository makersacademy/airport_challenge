require 'plane'

describe Plane do

  describe '#initialize' do

    it {is_expected.to respond_to(:airborne)}

    let(:airport) { double(:airport)}

    it 'should initialize as airborne' do
      expect(subject.airborne).to be true
    end

  end

  describe '#takeoff' do

    it {is_expected.to respond_to(:airborne)}

    let(:airport) { double(:airport, :planes => []) }

    it 'should be able to be airborne' do
      expect(subject.takeoff(airport)).to be_truthy
    end

    it 'should no longer be in the airport once it has taken off' do
      allow(airport).to receive(:at_capacity?).and_return(false)
      allow(airport).to receive(:weather_conditions).and_return(50)
      subject.land(airport)
      subject.takeoff(airport)
      expect(airport.planes).not_to include subject
    end

  end

  describe '#land' do

    it {is_expected.to respond_to(:airborne)}

    let(:airport) { double(:airport, :planes => []) }

    it 'should be able to land' do
      allow(airport).to receive(:at_capacity?).and_return(false)
      allow(airport).to receive(:weather_conditions).and_return(50)
      subject.takeoff(airport)
      expect(subject.land(airport)).to be false
    end

    it 'should be in the airport it landed in' do
      allow(airport).to receive(:at_capacity?).and_return(false)
      allow(airport).to receive(:weather_conditions).and_return(50)
      subject.land(airport)
      expect(airport.planes).to include subject
    end

    it 'should not be able to land if the airport is at capacity' do
      allow(airport).to receive(:at_capacity?).and_return(true)
      allow(airport).to receive(:weather_conditions).and_return(50)
      expect{subject.land(airport)}.to raise_error(RuntimeError)
    end

    it 'should not be able to land if the weather is stormy' do
      allow(airport).to receive(:at_capacity?).and_return(false)
      allow(airport).to receive(:weather_conditions).and_return(99)
      expect{subject.land(airport)}.to raise_error(RuntimeError)
    end

    let(:airport) { double(:airport, :planes => [subject]) }

    it 'should not be able to land if it\'s already in an airport' do
      allow(airport).to receive(:at_capacity?).and_return(false)
      allow(airport).to receive(:weather_conditions).and_return(99)
      expect{subject.land(airport)}.to raise_error(RuntimeError)
    end

  end

  describe '#landed?' do

    let(:airport) { double(:airport, :planes => []) }

    it 'should check whether the plane is on the ground or not' do
      allow(airport).to receive(:at_capacity?).and_return(false)
      allow(airport).to receive(:weather_conditions).and_return(50)
      subject.land(airport)
      subject.takeoff(airport)
      expect(subject.landed?).to be false
    end

  end

end
