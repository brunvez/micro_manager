# frozen_string_literal: true

module MicroManager
  module CLI
    class Result
      private attr_reader :render_block

      def initialize(&block)
        raise ArgumentError, "A block is required" unless block_given?

        @render_block = block
      end

      def render
        @render_block.call
      end
    end
  end
end
