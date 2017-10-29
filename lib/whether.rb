class Whether
  attr_reader :random_number

  def initialize
    @random_number = rand(4)
  end

  def there_a_storm?(random = @random_number)
    answer = true if random.zero?
    answer = false if random != 0
    answer
  end
end
