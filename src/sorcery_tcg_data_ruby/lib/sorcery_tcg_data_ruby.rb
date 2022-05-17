# frozen_string_literal: true

require "yaml"
require "value_semantics"
require "active_support"
require "active_support/core_ext"
require "sorcery_tcg_data/version"
require "sorcery_tcg_data/slugify"
require "sorcery_tcg_data/lookup"
require "sorcery_tcg_data/artists"
require "sorcery_tcg_data/card_types"
require "sorcery_tcg_data/elements"
require "sorcery_tcg_data/formats"
require "sorcery_tcg_data/keywords"
require "sorcery_tcg_data/rarities"
require "sorcery_tcg_data/releases"
require "sorcery_tcg_data/beta_files"
require "sorcery_tcg_data/card"

module SorceryTcgData
  class Error < StandardError; end
  # Your code goes here...
end
