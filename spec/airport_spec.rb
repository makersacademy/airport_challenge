require 'airport'

describe Airport do

  let(:airport) { Airport.new}

  describe '#has_landed' do
    it "respond to has_landed" do
      expect(airport).to respond_to(:has_landed).with(1).argument
    end
  end


end
