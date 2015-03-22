require 'airport'

describe Airport do
  context 'can order a plane to take off' do
    it { is_expected.to respond_to :order_plane_to_takeoff }
  end

  context 'can respond to a plane wanting to land' do
    it { is_expected.to respond_to :landing_permission }
  end

  context 'traffic control' do
    it 'a plane cannot land if the airport is full' do
      Airport.any_instance.stub(:can_land).and_return(false)
      a = Airport.new
      plane = double :plane, land: nil
      expect { (a.landing_permission plane) }.to raise_error 'permission denied'
    end
  end

  context 'weather conditions' do
    it 'a plane cannot land when it is stormy' do
      Airport.any_instance.stub(:weather).and_return(:'stormy')
      a = Airport.new
      p = Plane.new
      expect { (a.landing_permission p) }.to raise_error 'permission denied'
    end

    it 'a plane cannot takeoff when it is stormy' do
      Airport.any_instance.stub(:weather).and_return(:'stormy')
      a = Airport.new
      p = Plane.new
      expect { (a.order_plane_to_takeoff p) }.to raise_error 'permission denied'
    end
  end
end
