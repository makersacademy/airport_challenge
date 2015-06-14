require 'plane'



describe Plane do 
  let :airport do
    double 'airport', :notified_take_off => "take_off",
                      :notified_landing  => "landing"
  end

  it "#takes off" do
    expect( subject ).to receive( :puts ).with( "Plane on air!" )
    subject.take_off airport
  end

  it "#lands" do
    expect( subject ).to receive( :puts ).with( "Plane on land!" )
    subject.land airport
  end
end

