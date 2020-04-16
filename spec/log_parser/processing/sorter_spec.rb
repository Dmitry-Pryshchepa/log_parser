# frozen_string_literal: true

RSpec.describe LogParser::Processing::Sorter do
  subject { described_class }

  let(:input_data) do
    [
      ['/home', 1],
      ['/about', 4],
      ['/index', 9]
    ]
  end
  let(:expected_output) do
    [
      ['/index', 9],
      ['/about', 4],
      ['/home', 1]
    ]
  end

  describe '.perform' do
    it 'returns sorted data in descending order' do
      expect(subject.perform(input_data)).to eq(expected_output)
    end
  end
end
