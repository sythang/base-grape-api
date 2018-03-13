module Jinny::V1
  class MerchantsAPI < Grape::API
    helpers Jinny::Utils::Helpers::SharedParams
    
    resources :merchants do
      before { authenticate_user! }
      
      desc "Get list all merchants" do
        headers "Jinny-Http-Token": {
          description: 'Validates your identity',
          required: true
        }
      end
      params do
        use :pagination
      end
      get do
        merchants = Merchant.page(params[:page])
        # present :status, :OK
        present :results, merchants
      end
    end
  end
end