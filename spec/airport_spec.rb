require 'airport.rb'

describe Airport do

  describe '#full?' do
    it 'checks if Airport is full' do
      port = Airport.new
      expect(port).to respond_to :full?
    end
  end


end

describe Plane do

 describe '#land' do
      it 'lands the plane' do
        expect(subject).to respond_to :land
      end
    end

  describe '#take_off' do
      it 'instructs plane to take off' do
        expect(subject).to respond_to :take_off
      end
    end
end