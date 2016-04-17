require_relative '../lib/airport'

gatwick = Airport.new(30)
heathrow = Airport.new(20)

easyjet = Plane.new
ryanair = Plane.new

describe 'Feature tests' do

  context 'User Story: 1' do
    it 'instructs a plane to land' do

    end

    it 'confirms plane has landed' do

    end
  end

  context 'User Story: 2' do
    it 'instructs a plane to take off' do

    end

    it 'confirms plane is no longer in the airport' do

    end
  end

  context 'User Story: 3' do
    it 'prevents take off when weather is stormy' do

    end
  end

  context 'User Story: 3' do
    it 'prevnets landing when weather is stormy' do

    end
  end

  context 'User Story: 4' do
    it 'prevents landing when airport is full' do

    end
  end

  context 'User Story: 5' do
    it 'airport has a default capacity' do

    end

    it 'default capacity can be overriden as appropriate' do

    end
  end

end
