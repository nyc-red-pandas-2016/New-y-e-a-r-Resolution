users = [
  {username: "emiliajane", email: "emiliafriedberg@gmail.com", password: "password"}, {username: "iulliarules", email: "iloveiuliia@gmail.com", password: "iuliia"}, {username: "redpandasrule", email: "redpandasrule4ever@gmail.com", password: "redpandas"}, {username: "yossi", email: "yossi@netscape.net", password: "password"}
]

User.create!(users)

questions = [
  {title: "Flossing", body: "How do I floss?", user_id: 1}, {title: "Be less awesome", body: "It is very difficult to hone in my awesome. Tips?", user_id: 2}, {title: "To get better handwriting", body: "Does anybody know any great handwriting tips?", user_id: 4}, {title: "Red Pandas: Greatest Ever?", body: "Does anybody know how to find out the answer?", user_id: 3}
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
  {question_id: 1, user_id: 4, text: "Well, what works for me... you gotta wait until your teeth are nice and dirty. Nothing like flossing after a good steak. And then I use my shoelaces."}, {question_id: 4, user_id: 1, text: "Look around and it will become apparent."}, {question_id: 4, user_id: 2, text: "Based on Sudoku and Flashcard completion rates, we could evaluate the Red Pandas in comparison to cohorts of similar demographics in the past three years and see where you rank up... all the best teams have me as a teacher ;)"}, {question_id: 3, user_id: 1, text: "Ask Gabe."}
]

Answer.create!(answers)
