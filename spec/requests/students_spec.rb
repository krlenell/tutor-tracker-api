require 'rails_helper'

RSpec.describe "Students", type: :request do
  describe "GET /index" do
    context 'there are no students' do
      it 'responds with 404 status' do
        get "/students"
        expect(response).to have_http_status(:not_found)
      end
      it 'returns json error message' do
        get '/students'
        expect(response.body).to eq('{"error":"no students"}')
      end
    end

  end
end
