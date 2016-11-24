class Rubux
  attr_reader :state

  def initialize(state = {}, actions = {})
    @state = state
    @actions = actions
  end

  def dispatch(key, value)
    if @actions[key]
      @state = @state.merge(@actions[key].(value))
    else
      raise 'no action with that key name is defined'
    end
  end
end
