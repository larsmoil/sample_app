require 'spec_helper'

describe UsersController do

  let(:user) { FactoryGirl.create(:user) }
  let(:wrong_user) { FactoryGirl.create(:user, email: "wrong@example.com") }

  before do
    session_sign_in user
  end

  describe "submitting a PUT request to the wrong Users#update action" do
    before { put :update, wrong_user.instance_values["attributes"] }
    specify { response.should redirect_to(root_path) }
  end

  describe "submitting a PUT request to the correct Users#update action" do
    before { put :update, user.instance_values["attributes"] }
    specify { response.should be_success }
  end
end
