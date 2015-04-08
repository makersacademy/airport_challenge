require 'airport'

describe Airport do
  let(:airport) { Airport.new }
  let(:a) { Airport.new }

  it 'knows when a plane is in the air' do
    plane = double :plane, location: 'air'
    expect(airport.location_of plane).to eq('air')
  end

  it 'knows when a plane is in the airport' do
    plane = double :plane, location: 'airport'
    expect(airport.location_of plane).to eq('airport')
  end

  it 'can order a plane to take off' do
    expect(airport).to respond_to :order_plane_takeoff
  end

  it 'can respond to a plane wanting to land' do
    expect(airport).to respond_to :landing_permission
  end

  context 'traffic control' do
    it 'a plane cannot land if the airport is full' do
      Airport.any_instance.stub(:can_land?).and_return(false)
      # airport(:can_land?).and_return(true)
      # using 'a' and ':p' instead of 'airport' and ':plane' to please rubocop
      expect { (a.landing_permission :p) }.to raise_error 'permission denied'
    end
  end

  context 'weather conditions' do
    it 'can be both sunny and stormy' do
      weather_array = []
      100.times { weather_array << airport.weather }
      expect(weather_array.uniq).to contain_exactly('sunny', 'stormy')
    end

    it 'a plane cannot land when it is stormy' do
      Airport.any_instance.stub(:weather).and_return(:'stormy')
      # using 'a' and ':p' instead of 'airport' and ':plane' to please rubocop
      expect { (a.landing_permission :p) }.to raise_error 'permission denied'
    end

    it 'a plane cannot takeoff when it is stormy' do
      Airport.any_instance.stub(:weather).and_return(:'stormy')
      # using 'a' and ':p' instead of 'airport' and ':plane' to please rubocop
      expect { (a.order_plane_takeoff :p) }.to raise_error 'permission denied'
    end
  end
end
