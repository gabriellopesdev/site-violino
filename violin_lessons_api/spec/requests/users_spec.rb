require 'swagger_helper'

RSpec.describe 'api/v1/users', type: :request do
  path '/api/v1/users' do
    get('list users') do
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
    end

    post('create user') do
      consumes 'application/json'
      parameter name: :user, in: :body, schema: {
        type: :object,
        properties: {
          name: { type: :string, example: 'John Doe' },
          email: { type: :string, example: 'john.doe@example.com' },
          password: { type: :string, example: 'password123' }
        },
        required: [ 'name', 'email', 'password' ]
      }

      response(201, 'created') do
        let(:user) { { name: 'John Doe', email: 'john.doe@example.com', password: 'password123' } }

        after do |example|
          example.metadata[:response][:content] = {
            'application/json' => {
              example: JSON.parse(response.body, symbolize_names: true)
            }
          }
        end
        run_test!
      end
    end
  end

  path '/api/v1/users/{id}' do
    parameter name: 'id', in: :path, type: :string, description: 'id'

    get('show user') do
      response(200, 'successful') do
        let(:id) { '123' }

        after do |example|
          example.metadata[:response][:content] = {
            'application/json' => {
              example: JSON.parse(response.body, symbolize_names: true)
            }
          }
        end
        run_test!
      end
    end

    patch('update user') do
      consumes 'application/json'
      parameter name: :user, in: :body, schema: {
        type: :object,
        properties: {
          name: { type: :string, example: 'Updated Name' },
          email: { type: :string, example: 'updated.email@example.com' }
        },
        required: [ 'name', 'email' ]
      }

      response(200, 'successful') do
        let(:id) { '123' }
        let(:user) { { name: 'Updated Name', email: 'updated.email@example.com' } }

        after do |example|
          example.metadata[:response][:content] = {
            'application/json' => {
              example: JSON.parse(response.body, symbolize_names: true)
            }
          }
        end
        run_test!
      end
    end

    put('update user') do
      consumes 'application/json'
      parameter name: :user, in: :body, schema: {
        type: :object,
        properties: {
          name: { type: :string, example: 'Updated Name' },
          email: { type: :string, example: 'updated.email@example.com' },
          password: { type: :string, example: 'newpassword123' }
        },
        required: [ 'name', 'email', 'password' ]
      }

      response(200, 'successful') do
        let(:id) { '123' }
        let(:user) { { name: 'Updated Name', email: 'updated.email@example.com', password: 'newpassword123' } }

        after do |example|
          example.metadata[:response][:content] = {
            'application/json' => {
              example: JSON.parse(response.body, symbolize_names: true)
            }
          }
        end
        run_test!
      end
    end

    delete('delete user') do
      response(204, 'no content') do
        let(:id) { '123' }

        run_test!
      end
    end
  end
end
