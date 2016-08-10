get '/questions/:id' do
  @question = Question.find(params[:id])

  "here in qiestion"
end
