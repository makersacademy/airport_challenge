require 'airport.rb'

describe Airport do

  it 'sets user capacity when creating an airport' do
    port = Airport.new(50)
    expect(port.capacity).to eq 50
  end

  it 'capacity is equal to Default Capacity if no argument is given' do
    expect(subject.capacity).to eq Airport::DEFAULT_CAPACITY
  end


  describe '#full?' do
    it 'checks if Airport is full' do
      port = Airport.new
      expect(port.send(:full?)).to eq false
    end
  end

 describe '#land' do
      it 'lands the plane' do
        expect(subject).to respond_to :land
      end
      it 'raises an error if hanger is full' do 
        subject.capacity.times {subject.land(Plane.new)}
        expect {subject.land Plane.new}.to raise_error 'Landing prevented; hanger is full'
      end
      # it 'refuses a plane landing if weather is stormy' do
      #   airport = Airport.new
      #   plane = Plane.new
      #   weather = airport.check_weather
      #   if weather == 'STORMY' then expect {airport.land(plane)}.to raise_error 'Landing denied; storms overhead'
      #   end
      #   end
    end

    it { is_expected.to respond_to(:land).with(1).argument }


  describe '#take_off' do
      it 'instructs plane to take off' do
        expect(subject).to respond_to :take_off
      end
      it 'takes off correct plane passed as argument' do
        airport = Airport.new
        plane = Plane.new
        airport.land(plane)
        3.times {airport.land(Plane.new)}
        expect(airport.take_off(plane)).to eq plane
      end
      it 'raises an error when hanger is empty' do
        plane = Plane.new
        expect {subject.take_off(plane)}.to raise_error 'No planes ready to take off'
      end

      it { is_expected.to respond_to(:take_off).with(1).argument }

      # it 'refuses a plane take off if weather is stormy' do
      #   airport = Airport.new
      #   plane = Plane.new
      #   weather = airport.check_weather
      #   if weather == 'STORMY' then expect {airport.take_off(plane)}.to raise_error 'Take off denied; storms incoming' 
      #   end
      #   end
      end

  describe '#check_hanger' do
      it 'returns hanger' do
        port = Airport.new
        plane = Plane.new
        port.land(plane)
        expect(port.check_hanger).to be_truthy
      end
    end

    describe '#check_weather' do
      it 'checks the weather' do
        airport = Airport.new
        expect(airport.check_weather).to eq('GOOD').or(eq('STORMY'))
      end
    end

    # describe '#weather_randomizer' do
    #   it 'returns a number from 1..20' do
    #     expect(subject.send(:weather_randomizer)).to be_between(1,20)
    #   end
    # end

  
end

describe Plane do

end