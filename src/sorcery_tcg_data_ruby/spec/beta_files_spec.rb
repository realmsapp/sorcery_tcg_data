# frozen_string_literal: true

RSpec.describe SorceryTcgData::BetaFiles do
  describe ".parse" do
    it "transforms TTS beta file to realms" do
      beta_file = SorceryTcgData::BetaFiles.fetch("Raal Dromedary")
      expect(beta_file.name).to eq("Raal Dromedary")
      expect(beta_file.rarity.name).to eq("Ordinary")
    end
  end
end
