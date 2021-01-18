# frozen_string_literal: true

module MicroManager
  module CLI
    class ShowHelp
      def initialize(parser)
        @parser = parser
      end

      def run(schedule:)
        parser.banner = "Usage: just [task-description] [options]"

        parser.help
      end

      private

      attr_reader :parser
    end
  end
end
