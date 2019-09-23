require 'plane'
describe Plane do
  it { is_expected.to respond_to :flying? }

    it 'Confirm plane is no longer in the airport' do
      subject.in_air
      expect(subject).to be_flying
    end

    describe '#in_air' do
      it 'reports plane as in the air' do
        plane = Plane.new
        plane.in_air
        expect(plane.flying?).to eq true
      end
    end
end
