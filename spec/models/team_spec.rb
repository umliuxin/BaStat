require 'rails_helper'

RSpec.describe Team, type: :model do
  context 'initialize' do
    subject do
      described_class.new()
    end
    it 'be_truthy' do
      expect(subject.results).to be_truthy
    end
  end

end
