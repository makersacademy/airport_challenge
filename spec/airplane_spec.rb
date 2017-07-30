require './lib/airplane'

describe Airplane do

  let(:airplane) {Airplane.new}
  it{ is_expected.to respond_to :in_flight? }

    describe 'airplane_status' do
      it 'should be in flight when a new plane is initialized' do
        expect(subject.in_flight?).to eq true
      end
    end


end
