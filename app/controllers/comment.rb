get '/comments/:id/edit' do
  @comment = Comment.find(params[:id])
  if @comment.commentable_type == "Question"
    @question_id = @comment.commentable_id
  elsif @comment.commentable_type == "Answer"
    @question_id = Answer.find(@comment.commentable_id).question.id
  end
  erb :"/comments/edit"
end

put '/comments/:id/edit' do
  @comment = Comment.find(params[:id])
  if @comment.commentable_type == "Question"
    question_id = @comment.commentable_id
  elsif @comment.commentable_type == "Answer"
    question_id = Answer.find(@comment.commentable_id).question.id
  end
  @comment.update(params[:comment])
  if @comment.save
    redirect "/questions/#{question_id}"
  else
    @errors = comments.errors.full_messages
    erb :"comments/edit"
  end
end

delete '/comments/:id' do
  comment = Comment.find(params[:id])
  comment.destroy
  redirect "/questions/#{params[:question_id]}"
end

