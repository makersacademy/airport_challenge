require 'plane'


describe Plane do
  it 'plane expected to be flying when created' do
    expect(subject).to respond_to :flying
  end

  it 'plane approved to can land?' do
    expect(subject).to respond_to :landing_approved?
  end

  it 'when landed, plane not flying' do
    expect(subject).to_not eq :flying
  end   
end   
  # xit 'is flying when created'

  # xit 'can land'

  # xit 'is landed after landing'

  # xit 'can take off'

  # xit 'is flying after take off'

