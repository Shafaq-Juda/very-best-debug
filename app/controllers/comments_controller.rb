class CommentsController < ApplicationController
  def create
    #query_venue_id=28&query_author_id=me&query_body=wow.+
    
    comment = Comment.new
    comment.author_id = params.fetch("query_author_id")
    comment.venue_id = params.fetch("query_venue_id")
    comment.body = params.fetch("query_body")
    comment.save
    
    redirect_to("/venues/#{comment.venue_id}")
  end
end
