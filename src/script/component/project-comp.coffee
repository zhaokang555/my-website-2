CardComp = require './card-comp'
Vue.component 'card-comp', CardComp

ProjectComp = Vue.extend  
  template: '<card-comp :prop="project"></card-comp>'
  data: -> 
    project: null
  ready: ->
    me = @
    $.getJSON 'http://115.159.67.117:3000/project', (data) -> me.$data.project = data

module.exports = ProjectComp