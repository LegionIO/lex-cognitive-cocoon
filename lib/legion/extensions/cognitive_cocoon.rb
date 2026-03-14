# frozen_string_literal: true

require 'securerandom'

require_relative 'cognitive_cocoon/version'
require_relative 'cognitive_cocoon/helpers/constants'
require_relative 'cognitive_cocoon/helpers/cocoon'
require_relative 'cognitive_cocoon/helpers/incubator'
require_relative 'cognitive_cocoon/runners/cognitive_cocoon'
require_relative 'cognitive_cocoon/client'

module Legion
  module Extensions
    module CognitiveCocoon
    end
  end
end

Legion::Extensions.extend(Legion::Extensions::Core) if Legion::Extensions.const_defined?(:Core)
