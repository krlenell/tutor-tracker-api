require 'rails_helper'

RSpec.describe 'Students', type: :request do
  describe 'GET /index' do
    it 'successfully responds with json' do
      get students_path
      expect(response.content_type).to include('application/json')
      expect(response).to have_http_status(:ok)
    end

    context 'when there are no students' do
      it 'responds with 200 status' do
        get students_path
        expect(response).to have_http_status(:ok)
      end

      it 'returns empty array' do
        get students_path
        expect(JSON.parse(response.body)).to be_empty
      end
    end

    context 'when there are students' do
      it 'responds with ok status' do
        create(:student)
        get students_path
        expect(response).to have_http_status(:ok)
      end

      it 'response body is not empty' do
        student = create(:student)
        get students_path
        res_body = JSON.parse(response.body)
        expect(res_body).not_to be_empty
        expect(res_body.first).to match(hash_including(student.attributes.except('created_at', 'updated_at')))
      end
    end
  end

  describe 'GET /show' do
    context 'when student is not found' do
      it 'responds with a 404 response' do
        get student_path('garbage')
        expect(response).to have_http_status(:not_found)
      end

      it 'responds with error json' do
        get student_path('garbage')
        expect(JSON.parse(response.body)).to eq({ 'error' => 'student not found' })
      end
    end

    context 'when a student is found' do
      it 'reponds with 200 response' do
        student = create(:student)
        get student_path(student[:id])
        expect(response).to have_http_status(:ok)
      end

      it 'responds with object containing student' do
        student = create(:student)
        get student_path(student[:id])
        res_body = JSON.parse(response.body)
        # expect(res_body).to include('name' => student[:name])
        expect(res_body).to match(hash_including(student.attributes.except('created_at', 'updated_at')))
      end
    end
  end
end
