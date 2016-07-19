CardComp = Vue.extend
  props: ['prop']
  template: '
    <div>
      <div v-if="prop" class="ui cards">
        <div v-for="row in prop.contentArr" class="card">
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
      <div v-else class="ui active text loader">Loading...</div>
    </div>'
    
module.exports = CardComp