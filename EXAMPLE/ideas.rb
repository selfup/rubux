require './rubux'

app_state = {
  ideas: [],
  title: '',
  body: ''
}

app_actions = {
  add_idea: -> (hash) {
    new_ideas = hash[:ideas].dup
    new_ideas.unshift({title: hash[:title], body: hash[:body]})
    {ideas: new_ideas}
  },
  update_title: -> (string) {{title: string}},
  update_body: -> (string) {{body: string}}
}

store = Rubux.new(app_state, app_actions)
puts store.state

store.dispatch(:update_title, 'wow')
puts store.state

store.dispatch(:update_body, 'ok')
puts store.state

state = store.state
add_idea_hash = {ideas: state[:ideas], title: state[:title], body: state[:body]}
store.dispatch(:add_idea, add_idea_hash)
puts store.state
