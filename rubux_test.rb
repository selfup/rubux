require './rubux.rb'
require 'minitest/autorun'
require 'minitest/pride'

class RubuxTest < Minitest::Test
  describe 'users can see what it stores' do
    it 'can initialize with empty stores' do
      store = Rubux.new

      assert(store)
      assert_equal(store.state, {})
    end

    it 'can initialize with user given state and actions' do
      app_state = {body: ''}

      app_actions = {
        update_body: -> (string) {
          {body: string}
        }
      }

      store = Rubux.new(app_state, app_actions)

      assert_equal(store.state, app_state)
    end

    describe 'users can update app state' do
      it 'updates internal given state through user defined pure functions' do
        app_state = {title: ''}

        app_actions = {
          update_title: -> (string) {
            {title: string}
          }
        }

        store = Rubux.new(app_state, app_actions)

        assert_equal(store.state, app_state)
        assert_equal(store.state[:title], '')

        store.dispatch(:update_title, 'wow')
        assert_equal(store.state[:title], 'wow')
      end
    end
  end
end
