# frozen_string_literal: true

require "yaml"

module MicroManager
  class Persistence
    private attr_reader :config

    def initialize(config)
      @config = config
    end

    def save(schedule, serializer: YAML, writer: File)
      file = config.save_location
      serialized_schedule = serializer.dump(schedule)
      writer.write(file, serialized_schedule)
    end

    def recover(serializer: YAML, reader: File)
      content = reader.read(config.save_location)
      serializer.load(content)
    end
  end
end
