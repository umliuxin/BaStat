require 'rails_helper'

RSpec.describe Admin::SeasonController, type: :controller do
  describe "GET #show" do
    it "returns http success" do
      get :show
      expect(response).to have_http_status(:success)
    end
  end

  describe "POST #create" do
    it 'read correct params'
    it 'should generate obj'
    it 'valid obj should be saved'
    it 'raise flash error when saving failed'
    it 'redirect to admin_index_path'
  end

  describe "POST #update" do
  end

  describe "DELETE #delete" do
  end

  describe "#season_params" do
  end

end
