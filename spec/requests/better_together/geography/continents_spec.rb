require 'rails_helper'

# This spec was generated by rspec-rails when you ran the scaffold generator.
# It demonstrates how one might use RSpec to test the controller code that
# was generated by Rails when you ran the scaffold generator.
#
# It assumes that the implementation code is generated by the rails scaffold
# generator. If you are using any extension libraries to generate different
# controller code, this generated spec may or may not pass.
#
# It only uses APIs available in rails and/or rspec-rails. There are a number
# of tools you can use to make these specs even more expressive, but we're
# sticking to rails and rspec-rails APIs to keep things simple and stable.

module BetterTogether
  RSpec.describe '/geography/continents', type: :request do
    include Engine.routes.url_helpers

    # This should return the minimal set of attributes required to create a valid
    # ::BetterTogether::Geography::Continent. As you add validations to::BetterTogether::Geography::Continent, be sure to
    # adjust the attributes here as well.
    let(:valid_attributes) do
      skip('Add a hash of attributes valid for your model')
    end

    let(:invalid_attributes) do
      skip('Add a hash of attributes invalid for your model')
    end

    describe 'GET /index' do
      it 'renders a successful response' do
        ::BetterTogether::Geography::Continent.create! valid_attributes
        get geography_continents_url
        # expect(response).to be_successful
      end
    end

    describe 'GET /show' do
      it 'renders a successful response' do
        continent = ::BetterTogether::Geography::Continent.create! valid_attributes
        get geography_continent_url(continent)
        # expect(response).to be_successful
      end
    end

    describe 'GET /edit' do
      it 'renders a successful response' do
        continent = ::BetterTogether::Geography::Continent.create! valid_attributes
        get edit_geography_continent_url(continent)
        # expect(response).to be_successful
      end
    end

    describe 'POST /create' do
      context 'with valid parameters' do
        it 'creates a new::BetterTogether::Geography::Continent' do
          expect do
            post geography_continents_url, params: { geography_continent: valid_attributes }
          end.to change(Geography::Continent, :count).by(1)
        end

        it 'redirects to the created geography_continent' do
          post geography_continents_url, params: { geography_continent: valid_attributes }
          # expect(response).to redirect_to(geography_continent_url(Geography::Continent.last))
        end
      end

      context 'with invalid parameters' do
        it 'does not create a new::BetterTogether::Geography::Continent' do
          expect do
            post geography_continents_url, params: { geography_continent: invalid_attributes }
          end.to change(Geography::Continent, :count).by(0)
        end

        it "renders a response with 422 status (i.e. to display the 'new' template)" do
          post geography_continents_url, params: { geography_continent: invalid_attributes }
          # expect(response).to have_http_status(:unprocessable_entity)
        end
      end
    end

    describe 'PATCH /update' do
      context 'with valid parameters' do
        let(:new_attributes) do
          skip('Add a hash of attributes valid for your model')
        end

        it 'updates the requested geography_continent' do
          continent = ::BetterTogether::Geography::Continent.create! valid_attributes
          patch geography_continent_url(continent), params: { geography_continent: new_attributes }
          continent.reload
          skip('Add assertions for updated state')
        end

        it 'redirects to the geography_continent' do
          continent = ::BetterTogether::Geography::Continent.create! valid_attributes
          patch geography_continent_url(continent), params: { geography_continent: new_attributes }
          continent.reload
          # expect(response).to redirect_to(geography_continent_url(continent))
        end
      end

      context 'with invalid parameters' do
        it "renders a response with 422 status (i.e. to display the 'edit' template)" do
          continent = ::BetterTogether::Geography::Continent.create! valid_attributes
          patch geography_continent_url(continent), params: { geography_continent: invalid_attributes }
          # expect(response).to have_http_status(:unprocessable_entity)
        end
      end
    end

    describe 'DELETE /destroy' do
      it 'destroys the requested geography_continent' do
        continent = ::BetterTogether::Geography::Continent.create! valid_attributes
        expect do
          delete geography_continent_url(continent)
        end.to change(Geography::Continent, :count).by(-1)
      end

      it 'redirects to the geography_continents list' do
        continent = ::BetterTogether::Geography::Continent.create! valid_attributes
        delete geography_continent_url(continent)
        # expect(response).to redirect_to(geography_continents_url)
      end
    end
  end
end
