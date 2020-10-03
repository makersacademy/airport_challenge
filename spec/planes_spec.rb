require 'planes'
require 'airports'

describe Planes do

  describe '#take_off' do
    it 'responds when called' do
      @airport = Airports.new
      plane = Planes.new(@airport)
      expect(plane).to respond_to :take_off
    end

    it 'updates status when called' do
      @airport = Airports.new
      plane = Planes.new(@airport)
      plane.take_off
      expect(plane.status).to eq 'in air'
    end

    it 'prints <plane> has taken off' do
      @airport = Airports.new
      plane = Planes.new(@airport)
      expect { plane.take_off }.to output("#{plane.id} has taken off\n").to_stdout
    end

    it 'prints Error: <plane> already in air' do
      @airport = Airports.new
      plane = Planes.new(@airport, 'in air')
      expect { plane.take_off }.to output("Error: #{plane.id} is already in the air...\n").to_stdout
    end

  end

  describe '#land' do

    it 'prints <plane> has landed' do
      @airport = Airports.new
      plane = Planes.new(@airport, 'in air')
      expect{ plane.land }.to output("#{plane.id} has landed\n").to_stdout
    end

    it 'updates status when called' do
      @airport = Airports.new
      plane = Planes.new(@airport)
      plane.land
      expect(plane.status).to eq 'landed'
    end

    it 'prints Error: <plane> already landed' do
      @airport = Airports.new
      plane = Planes.new(@airport)
      expect{ plane.land }.to output("Error: #{plane.id} has already landed...\n").to_stdout
    end
  end

  describe '#confirm_status' do
    it 'responds when called' do
      @airport = Airports.new
      plane = Planes.new(@airport)
      expect(plane).to respond_to :confirm_status
    end
    # Other tests are included in #take_off and #land as auto called in these functions
  end

  describe '#incorp multi files' do

    it 'adds plane to @on_ground as plan default init as on ground' do
      @airport = Airports.new
      plane1 = Planes.new(@airport)

      expect { @airport.status }.to output("On Ground:\n[\"#{plane1.id}\"]\n----------\nIn Air\n[]").to_stdout
    end
  end
end
