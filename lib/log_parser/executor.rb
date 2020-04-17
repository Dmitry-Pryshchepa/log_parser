# frozen_string_literal: true

module LogParser
  class Executor
    PROCESSORS = [Processing::MostVisited, Processing::MostUniqueVisited].freeze

    def initialize(source)
      @source = source
    end

    def perform
      PROCESSORS.each(&method(:present))
    end

    private

    attr_reader :source

    def present(processor)
      ordered_data = sorter.perform(processor.perform(loaded_data))
      decorated_data = decorator.perform(ordered_data, processor.description)
      Printer.perform(decorated_data)
    end

    def sorter
      Processing::Sorter
    end

    def decorator
      Processing::Decorator
    end

    def loaded_data
      @loaded_data ||= LogParser::Loader.call(source)
    end
  end
end
