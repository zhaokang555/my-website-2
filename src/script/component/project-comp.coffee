CardComp = require './card-comp'
Vue.component 'card-comp', CardComp

ProjectComp = Vue.extend  
  template: '<card-comp :prop="project"></card-comp>'
  data: -> 
    project: null
  ready: ->
    me = @
    Vue.http.get('http://115.159.67.117:3000/project').then (res) ->
      console.log res
      me.project = res.json()
module.exports = ProjectComp