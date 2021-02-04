require 'rest-client'
require 'pry'
require 'json'
#Park Codes for NPS API:
# acad,npsa,arch,badl,bibe,bisc,blca,brca,cany,care,cave,chis,cong,crla,cuva,deva,dena,drto,ever,gaar,jeff,glba,glac,grca,grte,grsa,grsm,gumo,hale,havo,hosp,indu,isro,jotr,seki,lavo,pinn,redw,yose,katm,kefj,kova,lacl,wrst,maca,meve,romo,pefo,sagu,mora,noca,olym,neri,shen,thro,viis,voya,whsa,wica,yell,zion

# park_data1['entranceFees'][0]['cost'] + " " +  park_data1['entranceFees'][0]['description']
# park_data1['addresses'][0]['city'] + ", " + park_data1['addresses'][0]['stateCode']
# park_data1['images'][0]['url']
# park_data1['latitude'].to_f
# park_data1['longitude'].to_f



User.destroy_all
Trip.destroy_all
Park.destroy_all

api_key = ENV['API_KEY']

#first 50 parks
api_resp1 = RestClient.get("https://developer.nps.gov/api/v1/parks?parkCode=acad,npsa,arch,badl,bibe,bisc,blca,brca,cany,care,cave,chis,cong,crla,cuva,deva,dena,drto,ever,gaar,jeff,glba,glac,grca,grte,grsa,grsm,gumo,hale,havo,hosp,indu,isro,jotr,seki,lavo,pinn,redw,sagu,mora,pefo,romo,maca,lacl,wrst,katm,kefj,meve,kova&limit=50&start=0&api_key=#{api_key}")
api_data1 = JSON.parse(api_resp1)

#last 11 parks 
api_resp2 = RestClient.get("https://developer.nps.gov/api/v1/parks?parkCode=noca,olym,neri,shen,thro,viis,voya,whsa,wica,yell,zion&limit=50&start=0&api_key=#{api_key}")
api_data2 = JSON.parse(api_resp2)

park_info1 = api_data1['data']

park_info2 = api_data2['data']


park_info1.each {|park_data| Park.create(name: park_data['fullName'], description: park_data['description'], location:park_data['addresses'][0]['city'] + ", " + park_data['addresses'][0]['stateCode'], lat: park_data['latitude'].to_f, long: park_data['longitude'].to_f, entrance_fees: park_data['entranceFees'][0]['cost'] + " " +  park_data['entranceFees'][0]['description'], img_url: park_data['images'][0]['url'] ) }

park_info2.each {|park_data| Park.create(name: park_data['fullName'], description: park_data['description'], location:park_data['addresses'][0]['city'] + ", " + park_data['addresses'][0]['stateCode'], lat: park_data['latitude'].to_f, long: park_data['longitude'].to_f, entrance_fees: park_data['entranceFees'][0]['cost'] + " " +  park_data['entranceFees'][0]['description'], img_url: park_data['images'][0]['url'] ) }
#dumb yosemite
yose = Park.create(name:"Yosemite National Park", description:"Not just a great valley, but a shrine to human foresight, the strength of granite, the power of glaciers, the persistence of life, and the tranquility of the High Sierra. First protected in 1864, Yosemite National Park is best known for its waterfalls, but within its nearly 1,200 square miles, you can find deep valleys, grand meadows, ancient giant sequoias, a vast wilderness area, and much more.", location:"CA", lat:37.84883288, long:-119.5571873, entrance_fees:"35.00 This fee is valid for seven days.", img_url: "https://www.nps.gov/common/uploads/structured_data/3C84CC4C-1DD8-B71B-0BE967E5E5D93F25.jpg")








User.create(email:"test@test.com", name:'test', password: '123', bio:'testing', fav_park:'test park')