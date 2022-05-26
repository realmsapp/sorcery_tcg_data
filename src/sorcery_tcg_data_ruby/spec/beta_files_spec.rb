# frozen_string_literal: true

RSpec.describe SorceryTcgData::BetaFiles do
  describe ".parse" do
    it "transforms TTS beta file to realms" do
      beta_file = SorceryTcgData::BetaFiles.fetch("Raal Dromedary")
      expect(beta_file.name).to eq("Raal Dromedary")
      expect(beta_file.rarity.name).to eq("Ordinary")
    end

    it "transforms" do
      beta_file = SorceryTcgData::BetaFiles.fetch("All-terrain Vestments")
      expect(beta_file.rules_box).not_to be_empty
      expect(beta_file.keywords.map(&:key)).to contain_exactly
    end
  end
end
