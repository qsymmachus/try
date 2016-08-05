class Failure
  def initialize(error)
    @error = error
  end

  def get
    raise @error
  end

  def get_or_else(alternate)
    alternate
  end

  def is_success?
    false
  end
end
