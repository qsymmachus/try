require "try/version"
require "try/success"
require "try/failure"

def try
  begin
    Success.new(yield)
  rescue Exception => e
    Failure.new(e)
  end
end
