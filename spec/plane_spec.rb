require 'plane'

describe Plane do 

  describe '#take_off' do
    it { is_expected.to respond_to (:take_off)} 

    it 'will not take off while the weather is stormy' do
      airport=double(:airport, name: 'airport', full: false, weather: 'Stormy')
      expect(subject.take_off(airport)).to eq 'Cannot take off while weather is stormy.'
    end
  end

  describe '#land' do
    it { is_expected.to respond_to (:land)} 
  
    it 'will not land while the airport is full' do
      airport=double(:airport, name: 'airport', full: true, weather: 'Sunny')
      expect(subject.land(airport)).to eq 'Cannot land while airport is full'
    end

    it 'will not land while the weather is stormy' do
      airport=double(:airport, name: 'airport', full: false, weather: 'Stormy')
      expect(subject.land(airport)).to eq 'Cannot land while weather is stormy.'
    end
  end

  describe '#location' do
    it 'should know its location once it has landed' do
      airport=double(:airport, name: 'airport', full: false, weather: 'Sunny')
      subject.land(airport)
      expect(subject.location).to eq airport
    end
  end

end