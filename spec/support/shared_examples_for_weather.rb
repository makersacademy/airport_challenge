
shared_examples_for Weather do

  it {is_expected.to respond_to :stormy?}

  #inspired by Rufus

  def test_for_stormy_weather

      count = 0

      loop do
        break if subject.stormy?
        return 'failed to return true' if count > 10000
        count += 1
      end

      loop do
        break unless subject.stormy?
        return 'failed to return false' if count > 10000
        count += 1
      end

      'random weather is working'

  end

    it 'it returns both true and false' do
      expect(test_for_stormy_weather).to eq 'random weather is working'
    end

end
