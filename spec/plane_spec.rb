require 'plane'

describe Plane do

  subject(:plane) { described_class.new }
  let(:airport)   { double }

      describe "flying" do
        it 'returns true if the plane has taken off from the airport' do
          subject.flying
          expect(subject.flying).to eq true
        end
      end

      describe "landed" do
        it 'returns false if the plane has landed at the airport' do
          subject.landed
          expect(plane.landed).to eq false
        end
      end

end
