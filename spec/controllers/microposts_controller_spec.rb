require 'spec_helper'

describe MicropostsController do

  describe "authorization" do

    let(:user) { FactoryGirl.create(:user) }

    describe "for non-signed-in users" do

      describe "submitting to the create action" do
        before { post :create }
        specify { response.should redirect_to(signin_path) }
      end

      describe "submitting to the destroy action" do
        before do
          micropost = FactoryGirl.create(:micropost)
          put :destroy, micropost.instance_values["attributes"]
        end
        specify { response.should redirect_to(signin_path) }
      end

      describe "for signed-in users" do
        before { session_sign_in(user) }

        describe "submitting to the destroy action" do

          describe "as wrong user" do
            let(:micropost) { FactoryGirl.create(:micropost) }
            before { put :destroy, micropost.instance_values }

            specify { Micropost.find_by_id(micropost.id).should_not be_nil }
            specify { response.should redirect_to(root_path) }
          end

          describe "as correct user" do
            let(:micropost) { FactoryGirl.create(:micropost, user: user) }
            before { put :destroy, micropost.instance_values["attributes"] }

            specify { Micropost.find_by_id(micropost.id).should be_nil }
          end
        end
      end
    end
  end
end