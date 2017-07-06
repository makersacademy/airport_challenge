require 'airport'
describe Airport do
    it {is_expected.to respond_to(:landing)}
    
    it 'allow a plane to land' do
        boeing = 20
        expect(subject.landing(boeing)).to eq 20
    end
  
    
end