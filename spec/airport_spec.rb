require 'airport'

describe Airport do

  subject(:airport) { Airport.new }

  let(:plane) { double('plane') }

  describe 'airport deals with landings' do
    it 'checks plane in after landing request' do
      airport.request("landing", plane)
      expect(airport.grounded_planes).to include plane
    end

    it 'confirms landing' do
      expect { airport.request("landing", plane) }.to output("Plane has landed.\n").to_stdout
    end
  end

  describe 'airport deals with take offs' do
    before do
      airport.request("landing", plane)
    end

    it 'checks plane in after landing request' do
      airport.request("take off", plane)
      expect(airport.grounded_planes).not_to include plane
    end

    it 'confirms landing' do
      expect { airport.request("take off", plane) }.to output("Plane has departed.\n").to_stdout
    end
  end  

  describe 'error messages' do
    it 'outputs failure to recognise request' do
      expect { airport.request("Save me!", plane) }.to output("That's a weird request. I'll abstain.\n").to_stdout
    end
  end

end
