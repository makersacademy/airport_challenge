require 'plane'

describe Plane do
  describe '#working?' do
    it 'confirms that the plane is working fine' do
      expect(subject.working?).to eq true
    end
  end

  it { is_expected.to respond_to :working? }
end
