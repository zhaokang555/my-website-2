CardComp = require './card-comp'

Vue.component 'card-comp', CardComp

RsumeComp = Vue.extend 
  template: '<card-comp :prop="resume"></card-comp>' 
  data: ->
    resume: null
  ready: ->
    me = @
    Vue.http.get('http://115.159.67.117:3000/resume').then (res) ->
      console.log res
      me.resume = res.json()

module.exports = RsumeComp