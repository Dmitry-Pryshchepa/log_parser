# frozen_string_literal: true

module LogParser
  class Executor
    def initialize(source)
      @source = source
    end

    def perform
      LogParser::PROCESSORS.each(&method(:present))
    end

    private

    attr_reader :source

    def present(processor)
      Printer.perform(decorated_data(processor))
    end

    def decorated_data(processor)
      Processing::Decorator.perform(
        processed_data(processor), processor.description
      )
    end

    def processed_data(processor)
      Processing::Sorter.perform(processor.perform(loaded_data))
    end

    def loaded_data
      @loaded_data ||= LogParser::Loader.new(source).perform
    end
  end
end
