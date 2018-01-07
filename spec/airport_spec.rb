require 'airport.rb'

describe Airport do
  subject(:airport) { described_class.new }
  let(:plane) { double :plane }
  let(:weather) { double :weather }
  let(:capacity) { double :capcity }

  it 'airport responds to land' do
     expect(airport).to respond_to(:land)
   end
   it 'airport responds to take off' do
     expect(airport).to respond_to(:take_off)
   end

   describe '#land' do
   it 'a plane lands in the airport when clear' do
    allow(airport.weather).to receive(:stormy?).and_return false
    expect(airport.land(plane)).to eq [plane]
  end


    it 'a plane wont land if its stormy' do
      allow(airport.weather).to receive(:stormy?).and_return true
      expect{airport.land(plane)}.to raise_error 'Planes cant land as the weather is too stormy'
    end
  end

  describe '#take_off' do
    it 'a plane wont take off when stormy' do
      allow(airport.weather).to receive(:stormy?).and_return true
      expect{airport.take_off}.to raise_error 'Planes cant take off as the weather is too stormy'
    end
  end

  it 'a plane wont land if the airport is full' do
    airport.capacity.times {airport.land(plane)}
    expect{airport.land(plane)}.to raise_error 'This airport is full'
  end




  # it 'a plane takes off from the airport' do
  #   plane = Plane.new
  #   subject.land(plane)
  #   expect(subject.take_off).to eq plane
  # end
  #
  # it 'planes cant take off when stormy' do
  #   airport = Airport.new('stormy')
  #   plane = Plane.new
  #   expect { airport.take_off }.to raise_error 'the weather is too stormy'
  # end
  #
  # it 'planes cant land when stormy' do
  #   airport = Airport.new('stormy')
  #   plane = Plane.new
  #   expect { airport.land(plane) }.to raise_error 'Planes cant land as the weather is too stormy'
  # end
end
