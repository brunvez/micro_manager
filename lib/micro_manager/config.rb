# frozen_string_literal: true

module MicroManager
  class Config
    attr_reader :save_location

    def initialize(**opts)
      @save_location = opts[:save_location] || File.join(Dir.home, ".micro_manager", "schedule.yml")
    end
  end
end
