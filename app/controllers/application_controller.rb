class ApplicationController < Sinatra::Base
  set :default_content_type, 'application/json'

  get "/bakeries" do
    bakeries = Bakery.all

    bakeries.to_json
  end

  get '/bakeries/:id' do
    bakery = Bakery.find params[:id]

    bakery.to_json(include: :baked_goods)
  end

  def baked_goods_by_price
    BakedGood.all.order(price: :desc)
  end

  get '/baked_goods/by_price' do
    baked_goods_by_price.to_json
  end

  get '/baked_goods/most_expensive' do
    baked_goods_by_price.first.to_json
  end

end
