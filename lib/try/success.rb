class Success
  def initialize(value)
    @value = value
  end

  def get
    @value
  end

  def get_or_else(alternate)
    @value
  end

  def is_success?
    true
  end

  def map
    Success.new(yield(@value))
  end
end
