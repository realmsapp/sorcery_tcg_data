# frozen_string_literal: true

module SorceryTcgData
  module Slugify
    extend ActiveSupport::Concern

    # single quote go away
    # everything else that isn't a character gets turned into an underscore
    # or at least that's the intent -- probably need more kinds of apostrophes.
    def to_slug(text)
      text.delete("'").gsub(/[^\p{L}]|[1-9]|['"]/, " ").squish.gsub(/\s/, "_").downcase
    end
  end
end