require 'rails_helper'

RSpec.describe 'Students', type: :request do
  describe 'GET /index' do
    context 'when there are no students' do
      it 'responds with 200 status' do
        get '/students'
        expect(response).to have_http_status(:ok)
      end

      it 'returns json error message' do
        get '/students'
        expect(JSON.parse(response.body)).to be_empty
      end
    end

    context 'when there are students' do
      it 'responds with ok status' do
        create(:student)
        get '/students'
        expect(response).to have_http_status(:ok)
      end

      it 'response body is not empty' do
        create(:student)
        get '/students'
        expect(JSON.parse(response.body)).not_to be_empty
      end
    end
  end
end
