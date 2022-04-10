# frozen_string_literal: true

module SorceryTcgData
  module Formats
    class Format
      include ValueSemantics.for_attributes {
        key
        name
      }
    end
  end
end
