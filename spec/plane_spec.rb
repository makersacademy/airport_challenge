require 'plane'

describe Plane do
  # it 'responds to take_off' do
  #   expect(subject).to respond_to :take_off
  # end
  it { is_expected.to respond_to :flying? }
  it { is_expected.to respond_to :landed? }

  describe '#flying?' do
    it 'tests a flying plane is flying' do
      expect(Plane.new.flying?).to eq(true)
    end
  end

  describe '#landed?' do
    it 'tests a landed plane is landed' do
      expect(Plane.new.landed?).to eq(true)
    end
  end

end
