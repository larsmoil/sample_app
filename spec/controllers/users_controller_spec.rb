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

  describe "follow pages" do

    describe "when not signed in" do

      before { session_sign_out }

      it "should protect 'following'" do
        get :following, id: user.id
        response.should redirect_to(signin_path)
      end

      it "should protect 'followers'" do
        get :followers, id: user.id
        response.should redirect_to(signin_path)
      end
    end

    describe "when signed in" do

      let(:other_user) { FactoryGirl.create(:user) }

      before do
        user.follow!(other_user)
      end

      it "should show the user following" do
        get :following, id: user
        response.should be_success
      end

      it "should show the user followers" do
        get :followers, id: other_user
        response.should be_success
      end
    end
  end
end
