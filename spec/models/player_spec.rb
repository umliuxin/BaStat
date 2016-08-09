require 'rails_helper'

RSpec.describe Player, type: :model do

  let :player_params do
    {
      "name"=>"Xin Liu", "position"=>"Center", "number"=>"5", "image_url"=>"https://gitlab.com/uploads/user/avatar/76795/Slam-Dunk.jpg", "height"=>"180", "weight"=>"90", "bio"=>"ABC"
    }
  end
  context 'initialize' do
    subject do
      described_class.new()
    end
  end

  context 'validate' do
    before {  @player = described_class.new(player_params)}
    it 'name should not be longer than 55 chars'
    it 'name should be unique'
    it 'number should be integer and greater than 0'
    it 'number should be unique'
    it 'image_url should return 200 code'
    it 'height should be integer'
    it 'weight should be integer'
    it 'position should be Center,Forward or Guard'
  end
  # pending "add some examples to (or delete) #{__FILE__}"
end
