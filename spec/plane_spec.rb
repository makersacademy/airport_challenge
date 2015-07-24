require 'plane'


describe Plane do

  it 'is flying when created' do 
  	expect(subject).to be_flying
  end 

  it 'can land' do 
  	expect(subject).to respond_to :land
  end 

  it 'is landed after landing' do
  	subject.land
  	expect(subject).to be_landed
  end 

  xit 'can take off'

  xit 'is flying after take off'

end
