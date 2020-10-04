require 'planes'
require 'airports'
require 'weather'

describe Planes do

  describe '#take_off' do
    it 'responds when called' do
      @airport = Airports.new
      plane = Planes.new(@airport)
      expect(plane).to respond_to :take_off
    end

    it 'updates status when called' do
      allow_any_instance_of(Weather).to receive(:rand).and_return(50)
      @airport = Airports.new
      plane = Planes.new(@airport)

      plane.take_off
      expect(plane.status).to eq 'in air'
    end

    it 'prints <plane> has taken off' do
      allow_any_instance_of(Weather).to receive(:rand).and_return(50)
      @airport = Airports.new
      plane = Planes.new(@airport)
      expect { plane.take_off }.to output("#{plane.id} has taken off\n").to_stdout
    end

    it 'prints Error: <plane> already in air' do
      allow_any_instance_of(Weather).to receive(:rand).and_return(50)
      @airport = Airports.new
      plane = Planes.new(@airport, 'in air')
      expect { plane.take_off }.to output("Error: #{plane.id} is already in the air...\n").to_stdout
    end

    it 'prints Warning: stormy' do
      allow_any_instance_of(Weather).to receive(:rand).and_return(95)
      @airport = Airports.new
      plane = Planes.new(@airport)
      expect { plane.take_off }.to output("Warning: Cannot take-off in stormy weather!\n").to_stdout
    end

  end

  describe '#land' do

    it 'prints <plane> has landed' do
      allow_any_instance_of(Weather).to receive(:rand).and_return(50)
      @airport = Airports.new
      plane = Planes.new(@airport, 'in air')
      expect{ plane.land }.to output("#{plane.id} has landed\n").to_stdout
    end

    it 'updates status when called' do
      allow_any_instance_of(Weather).to receive(:rand).and_return(50)
      @airport = Airports.new
      plane = Planes.new(@airport)
      plane.land
      expect(plane.status).to eq 'landed'
    end

    it 'prints Error: <plane> already landed' do
      allow_any_instance_of(Weather).to receive(:rand).and_return(50)
      @airport = Airports.new
      plane = Planes.new(@airport)
      expect { plane.land }.to output("Error: #{plane.id} has already landed...\n").to_stdout
    end

    it 'prints Warning: stormy' do
      allow_any_instance_of(Weather).to receive(:rand).and_return(95)
      @airport = Airports.new
      plane = Planes.new(@airport)
      expect { plane.land }.to output("Warning: Cannot land in stormy weather!\n").to_stdout
    end

  end

  describe '#confirm_status' do
    it 'responds when called' do
      @airport = Airports.new
      plane = Planes.new(@airport)
      expect(plane).to respond_to :confirm_status
    end
    # Other tests are included in #take_off and #land as auto called in these functions

    it 'puts error if trying to land a landed plane' do
      allow_any_instance_of(Weather).to receive(:rand).and_return(50)
      @airport = Airports.new
      plane = Planes.new(@airport, 'landed')
      expect { plane.land }.to output("Error: #{plane.id} has already landed...\n").to_stdout
    end

    it 'puts error if trying to take off and in-air plane' do
      allow_any_instance_of(Weather).to receive(:rand).and_return(50)
      @airport = Airports.new
      plane = Planes.new(@airport, 'in air')
      expect { plane.take_off }.to output("Error: #{plane.id} is already in the air...\n").to_stdout
    end
  end

  describe '#incorp multi files' do

    it 'adds plane to @on_ground as plan default init as on ground' do
      allow_any_instance_of(Weather).to receive(:rand).and_return(50)
      @airport = Airports.new
      plane = Planes.new(@airport)
      expect { @airport.status }.to output("On Ground:\n[\"#{plane.id}\"]\n----------\nIn Air\n[]").to_stdout
    end
  end

  describe '#error_status' do

    it 'puts error if trying to land a landed plane' do
      allow_any_instance_of(Weather).to receive(:rand).and_return(50)
      @airport = Airports.new
      plane = Planes.new(@airport)
      expect { plane.error_status('land') }.to output("Error: #{plane.id} has already landed...\n").to_stdout
    end

    it 'puts error if trying to take off and in-air plane' do
      allow_any_instance_of(Weather).to receive(:rand).and_return(50)
      @airport = Airports.new
      plane = Planes.new(@airport)
      expect { plane.error_status('take off') }.to output("Error: #{plane.id} is already in the air...\n").to_stdout
    end
  end
end
