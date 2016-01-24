
class Security

  attr_reader :name, :passport
  def initialize(name,passport)
    @person = name
    @passport = passport
  end

  def securitypassed
  end

  def securityfailed

  end
end
