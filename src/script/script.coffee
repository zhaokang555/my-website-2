UlComp = Vue.extend 
  props: ['msg']
  template: 
    '<ul v-if="msg" class="nav nav-pills nav-stacked">
      <li class="active">
        <a style="cursor:default">{{msg.title}}</a>
      </li>
      <li v-for="row in msg.contentArr">
        <a href={{row.url}} target="_blank">
          {{row.title}}
          <template v-if="row.memo">
            <br>
            {{row.memo}}
          </template>
        </a>
      </li>
    </ul>
    <p v-else>loading....</p>'
Vue.component 'ul-comp', UlComp

CardComp = Vue.extend
  props: ['msg']
  template: '
    <div>
      <div v-if="msg" class="ui cards">
        <div v-for="row in msg.contentArr" class="card">
          <div class="content">
            <div class="header">{{row.title}}</div>
            <div class="description">{{row.memo}}</div>
          </div>
          <a href="{{row.url}}" target="_blank" class="ui bottom attached button orange">
            <i class="share icon"></i>
            查看
          </a>
        </div>
      </div>
      <p v-else>loading....</p>
    </div>'
Vue.component 'card-comp', CardComp

ProjectComp = Vue.extend  
  # template: '<ul-comp :msg="project"></ul-comp>'
  template: '<card-comp :msg="project"></card-comp>'
  data: -> 
    project: null
  ready: ->
    me = @
    $.getJSON 'http://115.28.21.133:3000/project', (data) -> me.$data.project = data


RsumeComp = Vue.extend 
  template: '<card-comp :msg="resume"></card-comp>' 
  data: ->
    resume: null
  ready: ->
    me = @
    $.getJSON 'http://115.28.21.133:3000/resume', (data) -> me.$data.resume = data

OthersComp = Vue.extend 
  template: '<card-comp :msg="others"></card-comp>'
  data: ->
    others: null
  ready: ->
    me = @
    $.getJSON 'http://115.28.21.133:3000/others', (data) -> me.$data.others = data


# 创建一个路由器实例
router = new VueRouter
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
    title: 'Welcome'
  ready: ->
    console.log 'v4'

    # 默认跳转到project
    router.go
      path: '/project'

# 路由器会创建一个 App 实例，并且挂载到选择符 #app 匹配的元素上。
router.start(App, '#app')

