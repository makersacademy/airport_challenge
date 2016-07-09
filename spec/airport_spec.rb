require 'airport.rb'

describe Airport do

  let (:plane) { double :plane }

  context 'responds to' do
    it { is_expected.to respond_to :land_plane }
  end

  context '#land_plane' do
    it 'should accept a Plane object as an argument' do
      expect(subject).to respond_to(:land_plane)
    end

    it 'should confirm plan is landed' do
      expect(subject.land_plane(plane)).to eq true
    end
  end



end
