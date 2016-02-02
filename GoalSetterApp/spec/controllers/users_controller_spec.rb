require 'rails_helper'
require 'spec_helper'

RSpec.describe UsersController, type: :controller do

  describe 'POST #create' do

    context 'create action' do

      it 'redirects to user show page' do
        params = {user: {username: 'test', password: 'password'}}
        post :create, params
        expect(response).to route_to('users#show')
      end

    end
  end

end
