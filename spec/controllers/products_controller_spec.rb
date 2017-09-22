require 'spec_helper'



    
  describe ProductsController, type: :controller do
    context 'GET #index' do
      before do
        get :index
      end 
      
      it 'renders the index template' do
        expect(response).to render_template('index')
      end
      
      it 'a HTTP code of 200' do
        expect(response).to be_success
        expect(response).to have_http_status(200)
      end
    end
  
    context 'GET #show' do
      before do
        get :show, id: @product.id
      end 
      
      it 'a HTTP code of 200' do
        expect(response).to be_success
        expect(response).to have_http_status(200)
      end
    end  
  
    context 'POST #create' do
      it 'will not work without a name' do
        @product = FactoryGirl.build(:product, price:'5.00', name: '')
        expect(@product).not_to be_valid
      end
      
    
      it 'will not work without a price' do
        @product = FactoryGirl.build(:product, price:'', name: 'Monkey')
        expect(@product).not_to be_valid
      end
    end  
  
    context 'PUT #update' do
      before do
        @product = FactoryGirl.create(:product)
        @admin = FactoryGirl.build(:admin)
        sign_in @admin
      end
      
      it 'will update product price' do
        @attr = { :name => @product.name, :image_url => @product.image_url, :id => @product.id, :price => "5.00"}
        put :update, params: { :id => @product.id, :product => @attr }
        @product.reload
        expect(@product.price).to eq 5.00
      end
    end  
 
 
      context 'DELETE #destroy' do
        before do
          @product = FactoryGirl.create(:product)
          @admin = FactoryGirl.build(:admin)
          sign_in @admin
        end
      
        it 'will let admin delete product' do
          expect(delete :destroy, params: {:id => @product} ).to redirect_to(products_url)
        end
      end 
      
  end
end