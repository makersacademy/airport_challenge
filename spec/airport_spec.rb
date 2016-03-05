require 'airport'

describe Airport do
    subject(:airport) { described_class.new}
    let(:plane) { :plane }

    describe '#arrive' do
      it 'instructs a plane to land' do
        expect(airport).to respond_to(:arrive).with(1).argument
      end

      
    end


end
