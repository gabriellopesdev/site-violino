require 'swagger_helper'

RSpec.describe 'api/v1/auth', type: :request do
  path '/api/v1/login' do
    post('login auth') do
      consumes 'application/json'
      parameter name: :login_params, in: :body, schema: {
        type: :object,
        properties: {
          email: { type: :string, example: 'user@example.com' },
          password: { type: :string, example: 'password123' }
        },
        required: [ 'email', 'password' ]
      }

      response(200, 'successful') do
        after do |example|
          example.metadata[:response][:content] = {
            'application/json' => {
              example: JSON.parse(response.body, symbolize_names: true)
            }
          }
        end
        run_test!
      end

      response(401, 'unauthorized') do
        let(:login_params) { { email: 'wrong@example.com', password: 'wrongpassword' } }
        run_test!
      end
    end
  end

  path '/api/v1/profile' do
    get('profile auth') do
      produces 'application/json'
      response(200, 'successful') do
        after do |example|
          example.metadata[:response][:content] = {
            'application/json' => {
              example: JSON.parse(response.body, symbolize_names: true)
            }
          }
        end
        run_test!
      end

      response(401, 'unauthorized') do
        run_test!
      end
    end
  end
end
