require 'plane.rb'

describe Plane do
  it { is_expected.to respond_to :landed? }

  #describe '#landed?' do
    it 'it returns whether the plane has landed' do
      expect(subject.landed?).to eq true
    end

end
