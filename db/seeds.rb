users = [
  {username: "emiliajane", email: "emiliafriedberg@gmail.com", password: "password"}, {username: "iulliarules", email: "iloveiuliia@gmail.com", password: "iuliia"}, {username: "redpandasrule", email: "redpandasrule4ever@gmail.com", password: "redpandas"}, {username: "yossi", email: "yossi@netscape.net", password: "password"},   {username: "debbie5ever", email: "debbie@yay.wow", password: "123456"}
]

User.create!(users)

questions = [
  {title: "Flossing", body: "So for the past 30 years I haven't been flossing my teeth and now the plaque between my teeth has fused with my individual teeth to form one continious plaque-calcium hybrid. If I start flossing now can I keep this up?", user_id: 1}, {title: "Be less awesome", body: "It is very difficult to hone in my awesome. As my new years resolution I was hoping to practice awesome once a day. Does anyone have any tips to practice awesome?", user_id: 2}, {title: "To get better handwriting", body: "So my 3rd grade teacher told me that my handwriting looks like ancient egyptian hyroglyphics and I took it as a compliment and now I have illegiable handwriting. As my new years resolution I wanted to obtain actually decent handwriting but I'm lost on where to start. Does anybody know any great handwriting tips?", user_id: 4}, {title: "Red Pandas: Greatest Ever?", body: "I've been wondering for days but does anybody know how to find out the answer?", user_id: 3}
  ]

Question.create!(questions)

tags = [
  {name: "Flossing"}, {name: "Awesomeness"}, {name: "Handwriting"}
]

Tag.create!(tags)

question_tags = [
  {question_id: 1, tag_id: 1}, {question_id: 2, tag_id: 2}, {question_id: 4, tag_id: 2}, {question_id: 3, tag_id: 3}, {question_id: 1, tag_id: 2}
]

QuestionTag.create!(question_tags)

answers = [
  {question_id: 1, user_id: 4, text: "Well, what works for me... you gotta wait until your teeth are nice and dirty. Nothing like flossing after a good steak. And then I use my shoelaces."}, {question_id: 4, user_id: 5, text: "Look around and it will become apparent."}, {question_id: 4, user_id: 2, text: "Based on Sudoku and Flashcard completion rates, we could evaluate the Red Pandas in comparison to cohorts of similar demographics in the past three years and see where you rank up... all the best teams have me as a teacher ;)"}, {question_id: 3, user_id: 1, text: "Ask Gabe."}
]

Answer.create!(answers)

comments= [ {text: "Wow... I have no words", user_id: 2, commentable_type: "Question", commentable_id: 1}, {text: "Don't listen to this fool!", user_id: 2, commentable_type: "Answer", commentable_id: 1}, {text: "Why would you want to be less awesome. you should be more awesome like me!", user_id: 5, commentable_type: "Question", commentable_id: 2}, {text: "But Gabe was my 3rd grade teacher...", user_id: 4, commentable_type: "Answer", commentable_id: 4}
]

Comment.create!(comments)

votes= [ {value: 2, user_id: 1, votable_type: "Question", votable_id: 1}, {value: 20, user_id: 2, votable_type: "Answer", votable_id: 1}, {value: 16, user_id: 3, votable_type: "Question", votable_id: 3},
]

Vote.create!(votes)
