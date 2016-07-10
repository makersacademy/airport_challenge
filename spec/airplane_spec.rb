require './lib/airplane'

describe Airplane do

  let(:airplane) {Airplane.new}
  it{ is_expected.to respond_to :landed? }

    describe 'airplane_status' do
      it 'should be landed when a new plane is initialized' do
        expect(subject.landed?).to eq false
      end
    end


end
