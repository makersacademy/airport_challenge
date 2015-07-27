require 'plane'
describe Plane do

  it 'is expected to be flying when created' do
    expect(subject).to be_flying
  end

  it 'can land' do
    expect(subject).to respond_to :land
  end

  it 'is landed after landing' do
    expect(subject).to be_landed
  end
  
  it 'cannot be flying and landed' do
    expect(subject).to be_landed
    expect(subject).to_not be_flying
  end

  it 'can take off' do
    expect(subject).to respond_to :take_off
  end
    
  it 'is flying after take off' do
    subject.take_off
    expect(subject).to be_flying
  end
end