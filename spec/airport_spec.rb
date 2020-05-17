require 'airport'

describe Airport do
  it { is_expected.to respond_to(:land).with(1).argument }

  it '#lands the plane' do
    plane = @plane
    expect(subject.land(plane)).to match_array([@at_the_airport])
  end

  it { is_expected.to respond_to(:takeoff).with(1).argument }

  it 'allows the plane to takeoff' do
    @at_the_airport = []
    plane = @at_the_airport << @plane
    subject.land(plane)
    expect(subject.takeoff(plane)).not_to include(plane)
  end
  it 'announces which plane has taken off' do
    expect { subject.confirm_takeoff }.to output('plane has taken off').to_stdout
  end

  it 'creates a max capacity of 5' do
     expect(subject.instance_variable_get :@capacity).to eq(5)
   end

   it 'stops a plane from landing if airport is at max capacity' do
     plane = @plane
     5.times { subject.land(plane) }
     expect { subject.land plane }.to raise_error('airport full')
   end

   it 'allows the SD to set capacity of airport' do
    expect(Airport.new(10).instance_variable_get :@capacity).to eq(10)
   end

end
