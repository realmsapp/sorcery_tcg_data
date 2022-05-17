# frozen_string_literal: true

require "date"

module SorceryTcgData
  class Lookup
    def self.root_path
      @root_path ||= Gem::Specification.find_by_name("sorcery_tcg_data_ruby").gem_dir
    end

    def self.load(glob, locale: "en", &)
      Dir[File.join(root_path, "data/#{locale}/", glob)].each_with_object({}) do |path, memo|
        items = case File.extname(path)
                when ".json"
                  JSON.load(File.read(path))
                else
                  YAML.safe_load(File.read(path))
                end
        items.each do |attributes|
          item = yield(attributes.transform_keys(&:to_sym))
          memo[item.key] = item
        end
      end
    end
  end
end
