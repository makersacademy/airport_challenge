require 'weather'

describe Weather do

  describe 'forecast' do
    it { is_expected.to respond_to :forecast }

# not sure how to check the random generator to make sure that
# it is randomly generating either 'Clear' or 'Stormy' unless I create
# a random method but that doesn't feel like it's part of the Weather class
    it "should randomly return 'Clear' or 'Stormy'" do
      expect(subject.forecast).to eq('Clear').or eq('Stormy')
    end
  end
end
