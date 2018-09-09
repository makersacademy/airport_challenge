require 'plane'

describe Plane do
  it { expect(subject).to respond_to(:landed) }

  describe '#landed?' do
    it { should respond_to(:landed?) }
    it 'plane is by default not landed' do
      expect(Plane.new.landed?).to eq false
    end
  end

end
