<template>
  <div id="app">
    <b-navbar toggleable="lg" type="dark" variant="dark">
      <b-navbar-brand href="#">Crypto Currency Portfolio</b-navbar-brand>
      <b-navbar-nav>
        <router-link to="/">Home</router-link> |
        <router-link to="/edit">New Currency</router-link>
      </b-navbar-nav>
      <b-navbar-nav class="ml-auto">
        <b-nav-item>
          <b-button
            v-if="!isLoggedIn()"
            @click="handleLogin"
            variant="primary"
            class="my-2 my-sm-0"
            type="submit"
          >
            Sign In
          </b-button>
        </b-nav-item>
        <b-nav-item>
          <b-button
            v-if="isLoggedIn()"
            @click="handleLogout"
            variant="primary"
            class="my-2 my-sm-0"
            type="submit"
          >
            Sign Out
          </b-button>
        </b-nav-item>
      </b-navbar-nav>
    </b-navbar>
    <router-view />
  </div>
</template>

<script>
import { mapActions } from "vuex";
import { isLoggedIn, login, logout } from "@/utils/auth-service";
export default {
  name: "App",
  methods: {
    ...mapActions(["load_currencies"]),
    handleLogin() {
      login();
    },
    handleLogout() {
      logout();
    },
    isLoggedIn() {
      return isLoggedIn();
    },
  },
  mounted: function () {
    this.load_currencies();
  },
};
</script>

<style>
#app {
  font-family: "Avenir", Helvetica, Arial, sans-serif;
  -webkit-font-smoothing: antialiased;
  -moz-osx-font-smoothing: grayscale;
  text-align: center;
  color: #2c3e50;
}

#nav {
  padding: 30px;
}

#nav a {
  font-weight: bold;
  color: #2c3e50;
}

#nav a.router-link-exact-active {
  color: #42b983;
}
</style>
