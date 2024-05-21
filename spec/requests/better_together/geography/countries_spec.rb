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
  RSpec.describe "/geography/countries", type: :request do
        include Engine.routes.url_helpers
  
    # This should return the minimal set of attributes required to create a valid
    # Geography::Country. As you add validations to Geography::Country, be sure to
    # adjust the attributes here as well.
    let(:valid_attributes) {
      skip("Add a hash of attributes valid for your model")
    }

    let(:invalid_attributes) {
      skip("Add a hash of attributes invalid for your model")
    }

    describe "GET /index" do
      it "renders a successful response" do
        Geography::Country.create! valid_attributes
        get geography_countries_url
        expect(response).to be_successful
      end
    end

    describe "GET /show" do
      it "renders a successful response" do
        country = Geography::Country.create! valid_attributes
        get geography_country_url(country)
        expect(response).to be_successful
      end
    end

    describe "GET /new" do
      it "renders a successful response" do
        get new_geography_country_url
        expect(response).to be_successful
      end
    end

    describe "GET /edit" do
      it "renders a successful response" do
        country = Geography::Country.create! valid_attributes
        get edit_geography_country_url(country)
        expect(response).to be_successful
      end
    end

    describe "POST /create" do
      context "with valid parameters" do
        it "creates a new Geography::Country" do
          expect {
            post geography_countries_url, params: { geography_country: valid_attributes }
          }.to change(Geography::Country, :count).by(1)
        end

        it "redirects to the created geography_country" do
          post geography_countries_url, params: { geography_country: valid_attributes }
          expect(response).to redirect_to(geography_country_url(Geography::Country.last))
        end
      end

      context "with invalid parameters" do
        it "does not create a new Geography::Country" do
          expect {
            post geography_countries_url, params: { geography_country: invalid_attributes }
          }.to change(Geography::Country, :count).by(0)
        end

    
        it "renders a response with 422 status (i.e. to display the 'new' template)" do
          post geography_countries_url, params: { geography_country: invalid_attributes }
          expect(response).to have_http_status(:unprocessable_entity)
        end
    
      end
    end

    describe "PATCH /update" do
      context "with valid parameters" do
        let(:new_attributes) {
          skip("Add a hash of attributes valid for your model")
        }

        it "updates the requested geography_country" do
          country = Geography::Country.create! valid_attributes
          patch geography_country_url(country), params: { geography_country: new_attributes }
          country.reload
          skip("Add assertions for updated state")
        end

        it "redirects to the geography_country" do
          country = Geography::Country.create! valid_attributes
          patch geography_country_url(country), params: { geography_country: new_attributes }
          country.reload
          expect(response).to redirect_to(geography_country_url(country))
        end
      end

      context "with invalid parameters" do
    
        it "renders a response with 422 status (i.e. to display the 'edit' template)" do
          country = Geography::Country.create! valid_attributes
          patch geography_country_url(country), params: { geography_country: invalid_attributes }
          expect(response).to have_http_status(:unprocessable_entity)
        end
    
      end
    end

    describe "DELETE /destroy" do
      it "destroys the requested geography_country" do
        country = Geography::Country.create! valid_attributes
        expect {
          delete geography_country_url(country)
        }.to change(Geography::Country, :count).by(-1)
      end

      it "redirects to the geography_countries list" do
        country = Geography::Country.create! valid_attributes
        delete geography_country_url(country)
        expect(response).to redirect_to(geography_countries_url)
      end
    end
  end
end
