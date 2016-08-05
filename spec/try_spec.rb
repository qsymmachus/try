require 'spec_helper'

describe Try do
  it 'has a version number' do
    expect(Try::VERSION).not_to be nil
  end

  describe "try" do
    context "the block passed to try raises an exception" do
      it "returns an instance of Failure containing that exception" do
        @error = Exception.new("whoops!")
        @result = try { raise @error }
        expect(@result).to be_a Failure
        expect{ @result.get }.to raise_error Exception
      end
    end

    context "the block passed to try returns a value" do
      it "returns an instance of Success containing that value" do
        @value = "success!"
        @result = try { @value }
        expect(@result).to be_a Success
        expect(@result.get).to equal @value
      end
    end
  end
end
