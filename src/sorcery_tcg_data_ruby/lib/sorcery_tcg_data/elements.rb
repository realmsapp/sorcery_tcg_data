# frozen_string_literal: true

module SorceryTcgData
  module Elements
    class Element
      include ValueSemantics.for_attributes {
        key String
        name String
        description String
      }
    end

    ALL = Lookup.load("elements.yaml") { |item| Elements::Element.new(**item) }.freeze

    def self.fetch(key, *args)
      compat = { "wind" => "air" }
      ALL.fetch(compat.fetch(key, key), *args)
    end
  end
end
