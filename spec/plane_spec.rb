require 'plane'

describe Plane do 

  describe '#land' do
    it { is_expected.to respond_to (:land)} 
  
    it 'will not land while the airport is full' do
      airport = double(:airport, full: true)
      expect(subject.land(airport)).to eq 'Cannot land while airport is full'
    end
  end

  it { is_expected.to respond_to (:take_off)} 

end