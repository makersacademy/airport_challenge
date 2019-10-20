
describe Plane do

  describe '#landing?' do
    it 'gives plane status' do
      expect(subject.landing?).to eq subject.in_airport
    end
  end
  
end
