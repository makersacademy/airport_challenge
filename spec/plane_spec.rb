require 'plane'
require 'airport'

describe Plane do

  it { is_expected.to respond_to(:confirm_landing)}

  it { is_expected.to respond_to(:confirm_takeoff)}

  describe '#confirm_landing' do
    it 'should confirm landing' do
      expect(subject.confirm_landing).to eq 'The plane has landed'
    end
  end

  describe '#confirm_takeoff' do
    it 'should confirm landing' do
      expect(subject.confirm_takeoff).to eq 'The plane has taken off'
    end
  end

end
