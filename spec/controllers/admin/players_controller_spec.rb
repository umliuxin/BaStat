require 'rails_helper'

RSpec.describe Admin::PlayersController, type: :controller do

  describe "GET #index" do
    it "returns http success" do
      get :index
      expect(response).to have_http_status(:success)
    end
    it "should show all players"

  end

  describe "GET #new" do
    it "returns http success" do
      get :new
      expect(response).to have_http_status(:success)
    end
    it "show create new player form"
    it "show create button"
  end

  describe "POST #create" do
    it "validate params"
    it "save records"
    it "redirect to player page"
  end

  describe "GET #show" do
    it "return http sucess"
    it "show player info"
    it "have Edit link"
    it "have Delete link"
  end

  describe "GET #edit" do
    it "returns http success"
    it "show update new player form"
    it "show update button"
  end

  describe "UPDATE #update" do
    it "validate params"
    it "save records"
    it "redirect to player page"
  end

  describe "DELETE #destroy" do
    it "should raise confirmation"
    it "should destory player"
  end
end
