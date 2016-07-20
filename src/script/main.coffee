VueRouter = require 'vue-router'
VueResource = require 'vue-resource'
ProjectComp = require './component/project-comp'
RsumeComp = require './component/resume-comp'
OthersComp = require './component/other-comp'

Vue.use VueResource

# 创建一个路由器实例
router = new VueRouter
  # 配置：

  # default: true
  hashbang: false 

  # default: "v-link-active"
  linkActiveClass: 'active' 

# 定义路由规则
router.map
  '/project': 
    component: ProjectComp
  '/resume': 
    component: RsumeComp
  '/others':
    component: OthersComp

App = Vue.extend
  el: ->
    '#app'
  data: ->
    title: 'Zhao Kang\'s'
  ready: ->
    console.log 'v6'

    # 默认跳转到project
    router.go
      path: '/project'

# 路由器会创建一个 App 实例，并且挂载到选择符 #app 匹配的元素上。
router.start(App, '#app')

