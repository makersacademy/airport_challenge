require 'plane'

## Note these are just some guidelines!
## Feel free to write more tests!!

# When we create a new plane, it should be "flying",
# thus planes can not be created in the airport.
#
# When we land a plane at the airport, the plane in question should
# be "landed"
#
# When the plane takes of from the airport, it should be "flying" again
#
# Think about your implementation - does it allow a plane to be "flying" and landed?
# Are you testing that?

describe Plane do

  #it 'is flying when created'
  it { is_expected.to respond_to :flying? }

  it 'is flying when created' do
    expect(subject).to be_flying
  end

  # it 'is instructed to land by the airport' do
  #   expect(subject).to receive(:receives_plane)
  # end
  # NEED A TEST TO CHECK THAT CALLING AIRPORT.RECEIVE_PLANE TRIGGERS PLANE.LAND
  # CANT FIGURE OUT HOW TO WRITE THE TEST BUT THE CODE IS WORKING IN IRB.

  it { is_expected.to respond_to :landed? }

  it { is_expected.to respond_to :land }

  it 'is landed after landing' do
    subject.land
    expect(subject).to be_landed
  end

  # describe 'land' do
    
  # end

  # xit 'is landed after landing'

  #xit 'can take off'
  it { is_expected.to respond_to :takeoff }

  #xit 'is flying after take off'
  it 'is flying after take off' do
    subject.takeoff
    expect(subject).to be_flying
  end

  # describe 'land' do
  #   it 'raises an error when airport is full' do
  #     airport = Airport.new
  #     airport.full?
  #     expect { subject.land }.to raise_error 'Airport is full'
  #   end
  # end


end
