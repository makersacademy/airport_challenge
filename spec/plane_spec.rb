require 'plane'

## Note these are just some guidelines!
## Feel free to write more tests!!

# When we create a new plane, it should be "flying",
# thus planes can not be created in the airport.
#
# When we land a plane at the airport, the plane in question should
# be "landed"
#
# When the plane takes off from the airport, it should be "flying" again
#
# Think about your implementation - does it allow a plane to be "flying"
# and landed?
# Are you testing that?

describe Plane do

  xit 'is flying when created'
  describe '#initialize' do
  	it 'has a true value' do
  		expect(subject).to be_flying
  	end
  end

  #it { is_expected.to respond_to :flying? }
  xit 'can land'
  it { is_expected.to respond_to :flying? }

  xit 'is landed after landing'
  it 'is landed after landing' do
  		subject.report_landed
  		expect(subject).to be_landed
  end

  xit 'can take off'
  it { is_expected.to respond_to :landed? }

  xit 'is flying after take off'
  it 'is flying after take off' do
  	subject.report_flying
  	expect(subject).to be_flying
  end

end
