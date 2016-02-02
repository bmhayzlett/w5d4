

RSpec.configure do |config|
  # rspec-expectations config goes here. You can use an alternate
  # assertion/expectation library such as wrong or the stdlib/minitest
  # assertions if you prefer.
  config.expect_with :rspec do |expectations|
    # This option will default to `true` in RSpec 4. It makes the `description`
    # and `failure_message` of custom matchers include text for helper methods
    # defined using `chain`, e.g.:
    #     be_bigger_than(2).and_smaller_than(4).description
    #     # => "be bigger than 2 and smaller than 4"
    # ...rather than:
    #     # => "be bigger than 2"
    expectations.include_chain_clauses_in_custom_matcher_descriptions = true
  end

  # rspec-mocks config goes here. You can use an alternate test double
  # library (such as bogus or mocha) by changing the `mock_with` option here.
  config.mock_with :rspec do |mocks|
    # Prevents you from mocking or stubbing a method that does not exist on
    # a real object. This is generally recommended, and will default to
    # `true` in RSpec 4.
    mocks.verify_partial_doubles = true
  end
end

def sign_up(username)
  visit new_user_url
  fill_in 'username', with: "#{username}"
  fill_in 'password', with: 'password'
  click_on 'Create User'
end

def log_in(username)
  visit new_session_url
  fill_in 'username', with: "#{username}"
  fill_in 'password', with: 'password'
  click_on 'Log In'
end

def log_out
  click_on 'Log Out'
end

def create_user(username)
  sign_up(username)
  log_out
end

def create_goal(title)
  visit new_goal_url
  fill_in 'title', with: "#{title}"
  fill_in 'target_date', with: '2017-01-01'
  find(:css, "#public").set(true)
  click_on 'Create Goal'
end

def edit_goal
  create_goal('test-goal')
  click_on "Edit Goal"
  fill_in 'title', with: "other_title"
  fill_in 'target_date', with: '2018-01-01'
  find(:css, "#public").set(false)
  find(:css, "#complete").set(true)
  click_on 'Edit Goal'
end
