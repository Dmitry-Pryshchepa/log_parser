# frozen_string_literal: true

RSpec.describe LogParser::Processing::Decorator do
  subject { described_class }

  let(:input_data) do
    [
      ['/home', 4],
      ['/about', 1]
    ]
  end
  let(:description) { 'most visited' }

  describe '.perform' do
    context 'with description' do
      it { expect(subject.perform(input_data, description)).to eq "#{description}\n\n/home 4\n/about 1\n\n" }
    end

    context 'without description' do
      it { expect(subject.perform(input_data)).to eq "\n\n/home 4\n/about 1\n\n" }
    end
  end
end
