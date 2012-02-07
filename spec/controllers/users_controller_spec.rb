require 'spec_helper'

describe UsersController do

  let(:user) { FactoryGirl.create(:user) }
  let(:wrong_user) { FactoryGirl.create(:user, email: "wrong@example.com") }

  before { session_sign_in user }

  describe "submitting a PUT request to the wrong Users#update action" do
    before { put :update, wrong_user.instance_values["attributes"] }
    specify { response.should redirect_to(root_path) }
  end

  describe "submitting a PUT request to the correct Users#update action" do
    before { put :update, user.instance_values["attributes"] }
    specify { response.should be_success }
  end

  describe "as non-admin user" do
    describe "submitting a DELETE request to the Users#destroy action" do
      it "should not delete the user" do
        expect do
          put :destroy, user.instance_values["attributes"]
          response.should redirect_to(root_path)
        end.not_to change(User, :count)
      end
    end
  end

  describe "as admin user" do
    let(:admin_user) { FactoryGirl.create(:admin) }
    before { session_sign_in admin_user }

    describe "submitting a DELETE request to the Users#destroy action" do
      it "should delete the user" do
        expect do
          put :destroy, user.instance_values["attributes"]
          response.should redirect_to(users_path)
        end.to change(User, :count).by(-1)
      end
    end
  end
end
