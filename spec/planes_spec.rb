require 'planes'
require 'airports'
require 'weather'

describe Planes do

  describe '#take_off' do

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
      expect { plane.land }.to output("#{plane.id} has landed\n").to_stdout
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

end
