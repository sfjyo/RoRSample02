# RoRSample02
価格調査

- Rubyバージョン
3.1.2

- Railsバージョン
7.0.3

---
## 環境構築

```
rbenv local 3.1.2
bundle init
```

- Gemfile編集

```
gem "rails", "~> 7.0.3"
```

- ディレクトリ配下のvendor/bundleにgemを入れる

```
bundle install --path vendor/bundle
```

- bundle installしない

```
bundle exec rails new . --skip-bundle --skip-test --skip-coffee
bundle install
```

- Gemfile編集
  - 日本語化
  - パスワード暗号化用（ハッシュ関数）

```
gem 'rails-i18n'
gem 'bcrypt'
```

```
bundle install
```

- 日本語化
config/application.rb編集

```
    config.time_zone = 'Tokyo'
    config.active_record.default_timezone = :local
    config.i18n.default_locale = :ja
    config.i18n.load_path += Dir[Rails.root.join('config', 'locales', '**', '*.yml').to_s]
```


---
## 雛形作成

店舗 1 対 販売商品 多 対 商品 1の構成


- 店舗

```
bundle exec rails g resource Shop name:string store_name:string
```

- 商品

```
bundle exec rails g resource Product name:string
```

- 販売商品

```
bundle exec rails g resource Sale shop:references product:references price:float
```


- コントローラ編集

app/controllers/products_controller.rb
app/controllers/sales_controller.rb
app/controllers/shops_controller.rb

- モデル編集

app/models/product.rb
app/models/shop.rb

- ビュー作成

app/views/layouts/application.html.erb
app/views/products/_form.html.erb
app/views/products/edit.html.erb
app/views/products/index.html.erb
app/views/products/new.html.erb
app/views/products/show.html.erb
app/views/sales/_form.html.erb
app/views/sales/index.html.erb
app/views/shops/_form.html.erb
app/views/shops/edit.html.erb
app/views/shops/index.html.erb
app/views/shops/new.html.erb
app/views/shops/show.html.erb


- config/routes.rb編集

```
  get 'sales' => 'sales#index'
  post 'shops/:shop_id/sales/' => 'sales#update'
  resources :products do 
    resources :sales
  end
  resources :shops do
    resources :sales
  end
```
