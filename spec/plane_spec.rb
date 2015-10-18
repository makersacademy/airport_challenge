require 'plane'

describe Plane do 

  describe '#take_off' do
    it { is_expected.to respond_to (:take_off) } 
    
    it 'will not take off while the weather is stormy' do
      airport=double(:airport, name: 'airport', planes: [subject], full: false, weather: 'Stormy')
      subject.flying=false
      expect(subject.take_off(airport)).to eq 'Cannot take off while weather is stormy.'
    end

    it 'cannot take off from an airport where it is not located' do
      airport=double(:airport, name: 'airport', planes: [], full: false, weather: 'Sunny')
      subject.flying=false
      expect(subject.take_off(airport)).to eq 'The plane is not at this airport.'
    end

    it 'cannot take off if it is already flying' do
    airport=double(:airport, name: 'airport', planes: [], full: false, weather: 'Sunny')  
    expect(subject.take_off(airport)).to eq 'The plane is already flying'
    end
  end

  describe '#land' do
    it { is_expected.to respond_to (:land) } 
  
    it 'cannot land if it is not flying' do
      airport=double(:airport, name: 'airport', planes: [], full: false, weather: 'Sunny')
      subject.land(airport)
      expect(subject.land(airport)).to eq 'This plane is already on the ground.'
    end

    it 'will not land while the airport is full' do
      airport=double(:airport, name: 'airport', planes: [subject], full: true, weather: 'Sunny')
      subject.take_off(airport)
      expect(subject.land(airport)).to eq 'Cannot land while airport is full'
    end

    it 'will not land while the weather is stormy' do
      airport=double(:airport, name: 'airport', planes: [subject], full: false, weather: 'Stormy')
      subject.flying=true
      expect(subject.land(airport)).to eq 'Cannot land while weather is stormy.'
    end
  end

  describe '#location' do
    it 'should know its location once it has landed' do
      airport=double(:airport, name: 'airport', planes: [], full: false, weather: 'Sunny')
      subject.flying=true
      subject.land(airport)
      expect(subject.location).to eq airport.name
    end
  end

end