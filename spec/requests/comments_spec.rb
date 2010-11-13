require 'spec_helper'

describe "Comments" do

  let(:post) { Factory(:post) }

  describe "GET /posts/1/comments" do
    it 'is successful' do
      post.comments << Factory.build(:comment)
      post.save!
      get "/posts/#{post.id}/comments"
      response.should be_successful
    end
  end

  describe "GET /posts/1/comments/new" do
    it 'is successful' do
      get "/posts/#{post.id}/comments/new"
      response.should be_successful
    end
  end

  describe "POST /posts/1/comments" do
    def create_post
      get "/posts/#{post.id}/comments", { :post_id => post.id, :comment => Factory.attributes_for(:comment) }
    end
    
    it 'redirects to index' do
      create_post
      response.should redirect_to post
    end
    it 'creates a comment' do
      expect {
        create_post
      }.to change { post.comments.count }.by 1
    end
  end
end
