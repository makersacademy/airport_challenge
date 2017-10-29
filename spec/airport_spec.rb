require 'airport'

describe Airport do

  subject(:airport) { Airport.new }
  subject(:stormy_airport) { Airport.new }
  
  let(:plane) { double('plane') }
  let(:another_plane) { double('another_plane') }

  before do
    allow(airport).to receive(:stormy?).and_return(false)
  end


  describe 'airport deals with landings' do
    it 'checks plane in after landing request' do
      airport.request(:landing, plane)
      expect(airport.grounded_planes).to include plane
    end

    it 'confirms landing' do
      message = "Plane has landed.\n"
      expect { airport.request(:landing, plane) }.to output(message).to_stdout
    end
  end


  describe 'airport deals with take offs' do
    before do
      airport.request(:landing, plane)
    end

    it 'checks plane out after take off request' do
      airport.request(:take_off, plane)
      expect(airport.grounded_planes).not_to include plane
    end

    it 'confirms take off' do
      message = "Plane has departed.\n"
      expect { airport.request(:take_off, plane) }.to output(message).to_stdout
    end
  end


  describe 'request error message' do
    it 'outputs failure to recognise request' do
      message = "Unrecognised request.\n"
      expect { airport.request("Save me!", plane) }.to output(message).to_stdout
    end
  end


  describe 'stormy weather' do
    before do
      stormy_airport.request(:landing, plane)
      allow(stormy_airport).to receive(:stormy?).and_return(true)
    end

    it 'rejects landing request when condition stormy' do
      stormy_airport.request(:landing, another_plane)
      expect(stormy_airport.grounded_planes).to_not include another_plane
    end

    it 'rejects take off request when stormy' do
      stormy_airport.request(:take_off, plane)
      expect(stormy_airport.grounded_planes).to include plane
    end
  end


  describe 'full capacity' do
    before do
       21.times { airport.request(:landing, plane) }
    end
    
    it 'rejects landing request when full' do
      airport.request(:landing, another_plane)
      expect(airport.grounded_planes).to_not include another_plane    
    end

    it 'prints full capacity message' do
      message = "Airport at full capacity.\n"
      expect { airport.request(:landing, plane) }.to output(message).to_stdout
    end
  end


  describe 'unrecognised plane' do
    it 'rejects take_off request if plane not at airport' do
      airport.request(:landing, plane)
      airport.request(:take_off, another_plane)
      expect(airport.grounded_planes.size).to eq 1
    end

    it 'prints not at airport message' do
      airport.request(:landing, plane)
      message = "Plane not at this airport.\n"
      expect { airport.request(:take_off, another_plane) }.to output(message).to_stdout
    end
  end
  

  describe 'capacity methods' do
    
    it 'initializes airport with default capacity set to 20' do
      expect(airport.capacity).to eq 20
    end

    it 'initializes airport with value given as argument' do
      expect(Airport.new(30).capacity).to eq 30
    end

    describe 'changing capacity methods' do

      it 'overrides current capacity' do
        airport.override_capacity(50)
        expect(airport.capacity).to eq 50
      end

      it 'increases current capacity' do
        airport.increase_capacity(10)
        expect(airport.capacity).to eq 30
      end

      it 'decreases current capacity' do
        airport.decrease_capacity(10)
        expect(airport.capacity).to eq 10
      end

      it 'rejects overriding when a negative value is provided' do
        airport.override_capacity(-1)
        expect(airport.capacity).to eq 20
      end

      it 'outputs error message for negative overriding attempt' do
        message = "Capacity can't be set to a negative value.\n"
        expect { airport.override_capacity(-1) }.to output(message).to_stdout
      end

      it 'outputs error message when decrease would make capacity negative' do
        message = "Capacity can't be set to a negative value.\n"
        expect { airport.decrease_capacity(21) }.to output(message).to_stdout
      end      

    end

  end

end
