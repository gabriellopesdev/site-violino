require 'swagger_helper'

RSpec.describe 'api/v1/materials', type: :request do

  path '/api/v1/materials' do

    get('list materials') do
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

    post('create material') do
      consumes 'application/json'
      parameter name: :material, in: :body, schema: {
        type: :object,
        properties: {
          name: { type: :string, example: 'Material Name' },
          description: { type: :string, example: 'Material Description' },
          price: { type: :number, format: :float, example: 19.99 }
        },
        required: ['name', 'description', 'price']
      }

      response(201, 'created') do
        let(:material) { { name: 'Material Name', description: 'Material Description', price: 19.99 } }

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

  path '/api/v1/materials/{id}' do
    parameter name: 'id', in: :path, type: :string, description: 'id'

    get('show material') do
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

    patch('update material') do
      consumes 'application/json'
      parameter name: :material, in: :body, schema: {
        type: :object,
        properties: {
          name: { type: :string, example: 'Updated Material Name' },
          description: { type: :string, example: 'Updated Material Description' },
          price: { type: :number, format: :float, example: 29.99 }
        },
        required: ['name', 'description', 'price']
      }

      response(200, 'successful') do
        let(:id) { '123' }
        let(:material) { { name: 'Updated Material Name', description: 'Updated Material Description', price: 29.99 } }

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

    put('update material') do
      consumes 'application/json'
      parameter name: :material, in: :body, schema: {
        type: :object,
        properties: {
          name: { type: :string, example: 'Updated Material Name' },
          description: { type: :string, example: 'Updated Material Description' },
          price: { type: :number, format: :float, example: 29.99 }
        },
        required: ['name', 'description', 'price']
      }

      response(200, 'successful') do
        let(:id) { '123' }
        let(:material) { { name: 'Updated Material Name', description: 'Updated Material Description', price: 29.99 } }

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

    delete('delete material') do
      response(204, 'no content') do
        let(:id) { '123' }

        run_test!
      end
    end
  end
end