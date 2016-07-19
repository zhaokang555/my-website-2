CardComp = require './card-comp'
Vue.component 'card-comp', CardComp

OthersComp = Vue.extend 
  template: '<card-comp :prop="others"></card-comp>'
  data: ->
    others: null
  ready: ->
    me = @
    $.getJSON 'http://115.159.67.117:3000/others', (data) -> me.$data.others = data

module.exports = OthersComp