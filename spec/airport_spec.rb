require 'airport'

describe Airport do
  it { is_expected.to respond_to :hangar_capacity }
  it { is_expected.to respond_to :weather }
  it { is_expected.to respond_to :hangar }

  describe '#plane_landing' do
    it { is_expected.to respond_to :plane_landing }
    it 'adds plane to hangar' do
      # :hangar.should_include(subject.plane_landing)
    end
  end

  describe '#plane_takeoff' do
    it { is_expected.to respond_to :plane_takeoff }
    it 'adds removes plane from hangar' do
    end
  end
end
