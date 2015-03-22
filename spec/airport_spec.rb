require 'airport'

describe Airport do
  it 'knows when a plane is in the air' do
    plane = double :plane, location: 'air'
    expect(subject.locate_plane plane).to eq('air')
  end

  it 'knows when a plane is in the airport' do
    plane = double :plane, location: 'airport'
    expect(subject.locate_plane plane).to eq('airport')
  end

  context 'can order a plane to take off' do
    it { is_expected.to respond_to :order_plane_takeoff }
  end

  context 'can respond to a plane wanting to land' do
    it { is_expected.to respond_to :landing_permission }
  end

  context 'traffic control' do
    it 'a plane cannot land if the airport is full' do
      Airport.any_instance.stub(:can_land).and_return(false)
      a = Airport.new
      expect { (a.landing_permission :p) }.to raise_error 'permission denied'
    end
  end

  context 'weather conditions' do
    it 'can be both sunny and stormy' do
      airport = Airport.new
      weather_array = []
      100.times { weather_array << airport.weather }
      expect(weather_array.uniq).to contain_exactly('sunny', 'stormy')
    end

    it 'a plane cannot land when it is stormy' do
      Airport.any_instance.stub(:weather).and_return(:'stormy')
      a = Airport.new
      expect { (a.landing_permission :p) }.to raise_error 'permission denied'
    end

    it 'a plane cannot takeoff when it is stormy' do
      Airport.any_instance.stub(:weather).and_return(:'stormy')
      a = Airport.new
      expect { (a.order_plane_takeoff :p) }.to raise_error 'permission denied'
    end
  end
end
