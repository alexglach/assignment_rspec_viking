require 'warmup'

describe Warmup do
  let(:warmup) {Warmup.new}
  describe '#gets_shout' do

    it 'returns input in upcase' do
      allow(warmup).to receive(:gets).and_return('hello')
      expect(warmup.gets_shout).to eq("HELLO")
    end

    # # it 'outputs the upcased value to the command line' do
    #   allow(warmup).to receive(:gets).and_return('hello')
    #   warmup.gets_shout
    #   expect(STDOUT).should_receive(:puts).with("HELLO")
    # end
  end

  describe '#triple_size' do
    it 'returns three times the siz of the input length' do
      array_double = double(:size => 4)
      expect(warmup.triple_size(array_double)).to eq(12)
    end
  end

  describe '#calls_some_methods' do
    it 'the input receives the upcase! method call' do
      string_double = double(:upcase! => "STRING")
      expect(string_double).to_receive("upcase!")
    end
  end
end
