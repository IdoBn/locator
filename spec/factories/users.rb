# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :user do
    provider "facebook"
    oauth_expires_at Time.now + 1.hour

    factory :user1 do
    	uid "100008268030218"
    	name "Sandra Amhbfhjcjbah Fallerman"
    	oauth_token "CAAHZCkZAW3QYwBAJH2kNMfKQgGFnFlqGXgk8LjU27kSO2bZCygv5gjAiC9wvjs1vZBr8NGLP7m3PZBF057csvtK90UypSZCMa1HZBOnkAaiZA4BgjWn9egWcAbKRfycDQ8EmtbqLu5LLujyXR6z9ZAf9fkSPDRug3JLOd0io7zi3uKE8ej5lsEwi5e4wTqe3SP3EZD"
    end

    factory :user2 do
    	uid "100008158123658"
    	name "Betty Amhaehabcfeh Zamorewitz"
    	oauth_token "CAAHZCkZAW3QYwBAJDLJYDFuPLzRttWlaU5j6x3AgFdWorSYXypYE7h3JuA03jdGbEk4ccQ8EYOPISGUIS1SOAGG3qHhCetlTlUlvmRS7tvaMP1NRqcSAY3dCBuc22g075qFZCLvrTKB1eerZATBYIqEM02QOKhkuTQPxbrsZCornncIGW6UWHeg25T64Id1wZD"
    end

		factory :user3 do
    	uid "100008147564561"
    	name "Bob Amhadgefdefa Riceescu"
    	oauth_token "CAAHZCkZAW3QYwBAGhxBoQJDVO03E8ZBIa1H7YonOZCZCyQTvQMplaHasUkbdKoz8IlbjZCRDPvtd9ahoVedBIEJ1ewVcOpcUqyLMUZAxplm9nefZBPqkNZCCjKcVO46v48WmpQa4htrxkXCbIGpyZAUpw94uZCUm3Rb7ZA2TuBse5tld2o63jjdWNhJqtxrSvvZCYAbQZD"
    end    
  end
end
