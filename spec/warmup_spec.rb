require 'warmup'

describe Warmup do
  let(:warmup) {Warmup.new}
  describe '#gets_shout' do

    it 'returns input in upcase' do
      allow(warmup).to receive(:gets).and_return('hello')
      expect(warmup.gets_shout).to eq("HELLO")
    end

    it 'outputs the upcased value to the command line' do
      allow(warmup).to receive(:gets).and_return('hello')
      warmup.gets_shout
      expect{warmup.gets_shout}.to output(/HELLO/).to_stdout
    end
  end

  describe '#triple_size' do
    it 'returns three times the siz of the input length' do
      array_double = double(:size => 4)
      expect(warmup.triple_size(array_double)).to eq(12)
    end
  end

  describe '#calls_some_methods' do

    let(:other_string_double) {double(:reverse! => "gnirts")}
    let(:string_double) {double(:upcase! => other_string_double, :empty? => false)}

    it 'the input receives the upcase! method call' do
      expect(string_double).to receive("upcase!")
      warmup.calls_some_methods(string_double)
    end

    it 'raises error if string empty' do
      string_double = double(:empty? => true)
      expect{warmup.calls_some_methods(string_double)}.to raise_error("Hey, give me a string!")
    end

    it 'receives the reverse! method call' do
      expect(other_string_double).to receive("reverse!")
      warmup.calls_some_methods(string_double)
    end

    it 'returns a new object than the one that was passed in' do
      expect(warmup.calls_some_methods(string_double)).to_not eq(string_double)
    end
  end
end
