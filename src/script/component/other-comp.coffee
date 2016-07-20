CardComp = require './card-comp'
Vue.component 'card-comp', CardComp

OthersComp = Vue.extend 
  template: '<card-comp :prop="others"></card-comp>'
  data: ->
    others: null
  ready: ->
    me = @
    Vue.http.get('http://115.159.67.117:3000/others').then (res) ->
      console.log res
      me.others = res.json()
module.exports = OthersComp