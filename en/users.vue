<template>
  <div class="">
    <UserSearch></UserSearch>
    <h1>should get the users</h1>
    <ul v-for=" user in users">
      <li> {{user.email}}</li>
    </ul>

  </div>
</template>

<script>
import UserSearch from '@/components/users-search.vue'

export default {
  components: {
    UserSearch
  },
  data: function() {
      return this.$store.state.UserStore
    },
  mounted: function(){
    this.$store.dispatch('UserStore/index')
  }
}


</script>
