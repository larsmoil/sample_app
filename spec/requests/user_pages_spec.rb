require 'spec_helper'

describe "UserPages" do

	subject { page }

  describe "signup page" do
  	before { visit signup_path }

  	let(:heading)    { "Sign up" }
    let(:page_title) { "Sign up" }

    it { should have_selector('h1',    text: 'Sign up') }
    it { should have_selector('title', text: full_title(page_title)) }
  end
end
