# frozen_string_literal: true

module Legion
  module Extensions
    module CognitiveCocoon
      class Client
        include Runners::CognitiveCocoon

        def initialize
          @default_engine = Helpers::Incubator.new
        end
      end
    end
  end
end
