require 'pilot'

describe Pilot do

  let( :take_off ) { :afirmative }
  let( :landing )  { :afirmative }
  let( :airport )  { double 'airport' }
  let( :plane )    { double 'plane' }
  
  let :air_traffic_controller do
    double 'air_traffic_controller', :request_taking_off_permission => take_off,
                                     :request_landing_permission    => landing,
                                     :airport                       => airport
  end


  before do
    allow( AirTrafficController ).to receive( :new ).and_return air_traffic_controller
    allow( Plane                ).to receive( :new ).and_return plane
  end

  describe '#send_taking_off_permission' do
    context 'with taking off permission' do
      it 'takes off' do
        expect( plane ).to receive( :take_off ).with( airport )

        subject.send_taking_off_permission
      end
    end

    context 'with no taking off permission' do
      let( :take_off ) { :negative }

      it 'puts a message' do
        expect( subject ).to receive( :puts ).with( "Make another request later" )

        subject.send_taking_off_permission
      end
    end
  end

  describe '#send_landing_permission' do
    context 'with landing permission' do
      it 'takes off' do
        expect( plane ).to receive( :land ).with( airport )

        subject.send_landing_permission
      end
    end

    context 'with no landing permission' do
      let( :landing ) { :negative }

      it 'puts a message' do
        expect( subject ).to receive( :puts ).with( "Make another request later" )

        subject.send_landing_permission
      end
    end
  end

  describe '#airport' do
    it 'delegates to air_traffic_controller' do
      expect( air_traffic_controller ).to receive( :airport ).
        and_return airport

      expect( subject.airport ).to eq airport
    end
  end

end
