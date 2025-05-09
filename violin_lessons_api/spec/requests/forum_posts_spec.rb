require 'swagger_helper'

RSpec.describe 'api/v1/forum_posts', type: :request do
  path '/api/v1/forum_posts' do
    get('list forum_posts') do
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

    post('create forum_post') do
      consumes 'application/json'
      parameter name: :forum_post, in: :body, schema: {
        type: :object,
        properties: {
          title: { type: :string, example: 'My Forum Post' },
          content: { type: :string, example: 'This is the content of the forum post.' },
          author_id: { type: :integer, example: 1 }
        },
        required: [ 'title', 'content', 'author_id' ]
      }

      response(201, 'created') do
        let(:forum_post) { { title: 'My Forum Post', content: 'This is the content of the forum post.', author_id: 1 } }

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

  path '/api/v1/forum_posts/{id}' do
    parameter name: 'id', in: :path, type: :string, description: 'id'

    get('show forum_post') do
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

    patch('update forum_post') do
      consumes 'application/json'
      parameter name: :forum_post, in: :body, schema: {
        type: :object,
        properties: {
          title: { type: :string, example: 'Updated Title' },
          content: { type: :string, example: 'Updated content of the forum post.' }
        },
        required: [ 'title', 'content' ]
      }

      response(200, 'successful') do
        let(:id) { '123' }
        let(:forum_post) { { title: 'Updated Title', content: 'Updated content of the forum post.' } }

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

    put('update forum_post') do
      consumes 'application/json'
      parameter name: :forum_post, in: :body, schema: {
        type: :object,
        properties: {
          title: { type: :string, example: 'Updated Title' },
          content: { type: :string, example: 'Updated content of the forum post.' }
        },
        required: [ 'title', 'content' ]
      }

      response(200, 'successful') do
        let(:id) { '123' }
        let(:forum_post) { { title: 'Updated Title', content: 'Updated content of the forum post.' } }

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

    delete('delete forum_post') do
      response(204, 'no content') do
        let(:id) { '123' }

        run_test!
      end
    end
  end
end
