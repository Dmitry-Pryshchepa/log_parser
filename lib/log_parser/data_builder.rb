# frozen_string_literal: true

module LogParser
  class DataBuilder
    private_class_method :new

    def self.call(source, line_builder: LogLine)
      new(source, line_builder).perform
    end

    def initialize(source, line_builder)
      @source = source
      @line_builder = line_builder
    end

    def perform
      source.map(&method(:create_line))
    end

    private

    attr_reader :source, :line_builder

    def create_line(file_line)
      line_builder.call(file_line)
    end
  end
end
