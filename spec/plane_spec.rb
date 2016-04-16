require 'plane'
describe Plane do
  describe '#take_off' do
    it 'expects false when a planes has taken off' do
      expect(Plane.new.take_off).to eq false
    end
  end
  describe '#land' do
    it {is_expected.to respond_to :land}
    it 'expects true when a plane has landed' do
      expect(Plane.new.land).to eq true
    end
  end

end
