require 'airport'

describe Airport do
  let(:airport) { Airport.new }

  describe '#close' do
    it 'ATC can close an airport' do
      expect { airport.close }.to change { airport.status }.from("open").to("closed")
    end
  end

  describe '#status' do
    it 'ATC can check the status of an airport' do
      expect(airport.status).to eq("open")
    end
  end
end
