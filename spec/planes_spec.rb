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
      expect { plane.take_off }.to raise_error("Error: #{plane.id} is already in the air...")
    end

    it 'fails Warning: stormy' do
      allow_any_instance_of(Weather).to receive(:rand).and_return(95)
      @airport = Airports.new
      plane = Planes.new(@airport)
      expect { plane.take_off }.to raise_error("Warning: Cannot take-off in stormy weather!")
    end

  end

  describe '#land' do

    it 'prints <plane> has landed' do
      allow_any_instance_of(Weather).to receive(:rand).and_return(50)
      @airport = Airports.new
      plane = Planes.new(@airport, 'in air')
      expect { plane.land }.to output("#{plane.id} has landed\n").to_stdout
    end


    it 'raises error for already landed plane' do
      allow_any_instance_of(Weather).to receive(:rand).and_return(50)
      @airport = Airports.new
      plane = Planes.new(@airport)
      expect { plane.land}.to raise_error("Error: #{plane.id} has already landed...")
    end

    it 'fails Warning: stormy' do
      allow_any_instance_of(Weather).to receive(:rand).and_return(95)
      @airport = Airports.new
      plane = Planes.new(@airport)
      expect { plane.land }.to raise_error("Warning: Cannot land in stormy weather!")
    end

    it 'prints Warning: airport full' do
      allow_any_instance_of(Weather).to receive(:rand).and_return(50)
      @airport = Airports.new
      20.times { Planes.new(@airport)}
      plane = Planes.new(@airport, 'landed')
      expect { plane.land }.to raise_error("Warning: Airport is full!")
    end

  end

end
