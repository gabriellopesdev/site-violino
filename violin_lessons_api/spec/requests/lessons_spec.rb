require 'swagger_helper'

RSpec.describe 'api/v1/lessons', type: :request do
  path '/api/v1/lessons' do
    get('list lessons') do
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

    post('create lesson') do
      consumes 'application/json'
      parameter name: :lesson, in: :body, schema: {
        type: :object,
        properties: {
          title: { type: :string, example: 'Lesson Title' },
          description: { type: :string, example: 'Lesson Description' },
          duration: { type: :integer, example: 60 }
        },
        required: [ 'title', 'description', 'duration' ]
      }

      response(201, 'created') do
        let(:lesson) { { title: 'Lesson Title', description: 'Lesson Description', duration: 60 } }

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

  path '/api/v1/lessons/{id}' do
    parameter name: 'id', in: :path, type: :string, description: 'id'

    get('show lesson') do
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

    patch('update lesson') do
      consumes 'application/json'
      parameter name: :lesson, in: :body, schema: {
        type: :object,
        properties: {
          title: { type: :string, example: 'Updated Title' },
          description: { type: :string, example: 'Updated Description' },
          duration: { type: :integer, example: 90 }
        },
        required: [ 'title', 'description', 'duration' ]
      }

      response(200, 'successful') do
        let(:id) { '123' }
        let(:lesson) { { title: 'Updated Title', description: 'Updated Description', duration: 90 } }

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

    put('update lesson') do
      consumes 'application/json'
      parameter name: :lesson, in: :body, schema: {
        type: :object,
        properties: {
          title: { type: :string, example: 'Updated Title' },
          description: { type: :string, example: 'Updated Description' },
          duration: { type: :integer, example: 90 }
        },
        required: [ 'title', 'description', 'duration' ]
      }

      response(200, 'successful') do
        let(:id) { '123' }
        let(:lesson) { { title: 'Updated Title', description: 'Updated Description', duration: 90 } }

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

    delete('delete lesson') do
      response(204, 'no content') do
        let(:id) { '123' }

        run_test!
      end
    end
  end
end
