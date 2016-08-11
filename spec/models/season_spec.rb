require 'rails_helper'

RSpec.describe Season, type: :model do
  context 'initialize' do
    subject do
      described_class.new()
    end
    it 'be_truthy' do
      expect(subject.results).to be_truthy
    end
  end

  context 'validate' do
    it 'name should not be nil'
    it 'name should be unique'
    it 'start_date should not be nil'
    it 'end_date should be later than start_date'
    it 'is_current_season should be false by default'
    
  end
end
