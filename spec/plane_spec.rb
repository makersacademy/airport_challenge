require 'plane'

describe Plane do
  context 'confirms plane status' do
    it { is_expected.to respond_to :landed? }
    describe "plane to land" do
      it 'lands plane' do
        subject.landed?
        expect(subject).to be_truthy
      end
      it { is_expected.to respond_to :departed? }
      describe "plane to depart" do
        it 'plane departs' do
          subject.departed?
          expect(subject).to be_truthy
        end
      end
    end
  end
end
