require 'swagger_helper'

RSpec.describe 'api/v1/forum_topics', type: :request do

  path '/api/v1/forum_topics' do

    get('list forum_topics') do
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

    post('create forum_topic') do
      consumes 'application/json'
      parameter name: :forum_topic, in: :body, schema: {
        type: :object,
        properties: {
          title: { type: :string, example: 'My Forum Topic' },
          content: { type: :string, example: 'This is the content of the forum topic.' }
        },
        required: ['title', 'content']
      }

      response(201, 'created') do
        let(:forum_topic) { { title: 'My Forum Topic', content: 'This is the content of the forum topic.' } }

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

  path '/api/v1/forum_topics/{id}' do
    parameter name: 'id', in: :path, type: :string, description: 'id'

    get('show forum_topic') do
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

    patch('update forum_topic') do
      consumes 'application/json'
      parameter name: :forum_topic, in: :body, schema: {
        type: :object,
        properties: {
          title: { type: :string, example: 'Updated Title' },
          content: { type: :string, example: 'Updated content of the forum topic.' }
        },
        required: ['title', 'content']
      }

      response(200, 'successful') do
        let(:id) { '123' }
        let(:forum_topic) { { title: 'Updated Title', content: 'Updated content of the forum topic.' } }

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

    put('update forum_topic') do
      consumes 'application/json'
      parameter name: :forum_topic, in: :body, schema: {
        type: :object,
        properties: {
          title: { type: :string, example: 'Updated Title' },
          content: { type: :string, example: 'Updated content of the forum topic.' }
        },
        required: ['title', 'content']
      }

      response(200, 'successful') do
        let(:id) { '123' }
        let(:forum_topic) { { title: 'Updated Title', content: 'Updated content of the forum topic.' } }

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

    delete('delete forum_topic') do
      response(204, 'no content') do
        let(:id) { '123' }

        run_test!
      end
    end
  end
end