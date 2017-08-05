require 'plane'

describe Plane do
  it { is_expected.to respond_to(:permission?) }

  describe '#permission?' do
    it 'plane receives permission from traffic controler' do
      expect(subject.permission?).to eq true
    end
  end

end