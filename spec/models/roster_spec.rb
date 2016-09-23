require 'rails_helper'

RSpec.describe Roster, type: :model do
  context 'initialize' do
    subject do
      described_class.new()
    end
  end

  context 'validates' do
    it 'player_id shoule not be null'
    it 'season_id should not be null'
  end
end
