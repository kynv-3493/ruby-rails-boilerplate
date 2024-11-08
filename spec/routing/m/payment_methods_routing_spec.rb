require "rails_helper"

RSpec.describe M::PaymentMethodsController, type: :routing do
  describe "routing" do
    it "routes to #index" do
      expect(get: "/m/payment_methods").to route_to("m/payment_methods#index")
    end

    it "routes to #new" do
      expect(get: "/m/payment_methods/new").to route_to("m/payment_methods#new")
    end

    it "routes to #show" do
      expect(get: "/m/payment_methods/1").to route_to("m/payment_methods#show", id: "1")
    end

    it "routes to #edit" do
      expect(get: "/m/payment_methods/1/edit").to route_to("m/payment_methods#edit", id: "1")
    end


    it "routes to #create" do
      expect(post: "/m/payment_methods").to route_to("m/payment_methods#create")
    end

    it "routes to #update via PUT" do
      expect(put: "/m/payment_methods/1").to route_to("m/payment_methods#update", id: "1")
    end

    it "routes to #update via PATCH" do
      expect(patch: "/m/payment_methods/1").to route_to("m/payment_methods#update", id: "1")
    end

    it "routes to #destroy" do
      expect(delete: "/m/payment_methods/1").to route_to("m/payment_methods#destroy", id: "1")
    end
  end
end
