CardComp = require './card-comp'
Vue.component 'card-comp', CardComp

RsumeComp = Vue.extend 
  template: '<card-comp :prop="resume"></card-comp>' 
  data: ->
    resume: null
  ready: ->
    me = @
    $.getJSON 'http://115.159.67.117:3000/resume', (data) -> me.$data.resume = data

module.exports = RsumeComp